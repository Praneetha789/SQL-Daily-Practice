-- Day 42 SQL Practice (Mock Interview Test)

-- Create Employees table
CREATE TABLE Employees (
    emp_id INT,
    name VARCHAR(50),
    dept_id INT,
    salary INT
);

-- Insert data
INSERT INTO Employees VALUES
(1, 'Rahul', 101, 50000),
(2, 'Anita', 102, 45000),
(3, 'Vikram', 103, 60000),
(4, 'Sneha', 101, 55000),
(5, 'Arjun', 102, 40000),
(6, 'Kiran', 101, 70000),
(7, 'Meena', 103, 65000);

--------------------------------------------------
-- 1. Second highest salary

SELECT MAX(salary) AS second_highest
FROM Employees
WHERE salary < (SELECT MAX(salary) FROM Employees);

--------------------------------------------------
-- 2. Top 2 salaries in each department

SELECT *
FROM (
    SELECT emp_id, name, dept_id, salary,
    DENSE_RANK() OVER (PARTITION BY dept_id ORDER BY salary DESC) AS rnk
    FROM Employees
) t
WHERE rnk <= 2;

--------------------------------------------------
-- 3. Employees earning above department average

SELECT e.name, e.salary, e.dept_id
FROM Employees e
WHERE e.salary > (
    SELECT AVG(salary)
    FROM Employees
    WHERE dept_id = e.dept_id
);

--------------------------------------------------
-- 4. Find duplicate salaries

SELECT salary, COUNT(*) AS cnt
FROM Employees
GROUP BY salary
HAVING COUNT(*) > 1;

--------------------------------------------------
-- 5. Running total of salary

SELECT name, salary,
SUM(salary) OVER (ORDER BY emp_id) AS running_total
FROM Employees;

--------------------------------------------------
-- 6. Rank employees by salary

SELECT name, salary,
RANK() OVER (ORDER BY salary DESC) AS salary_rank
FROM Employees;

--------------------------------------------------
-- 7. Department-wise highest salary

SELECT dept_id, MAX(salary) AS max_salary
FROM Employees
GROUP BY dept_id;

--------------------------------------------------
-- 8. Employees with salary gap

SELECT name, salary,
salary - LAG(salary) OVER (ORDER BY salary) AS salary_gap
FROM Employees;