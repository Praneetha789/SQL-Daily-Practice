-- Day 30 SQL Practice (Final Challenge)

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
(7, 'Meena', 103, 65000),
(8, 'Ravi', 101, 70000);

-- 1. Find top 2 salaries overall using window function
SELECT name, salary
FROM (
    SELECT name, salary,
    DENSE_RANK() OVER (ORDER BY salary DESC) AS rnk
    FROM Employees
) t
WHERE rnk <= 2;

-- 2. Find employees with duplicate salaries
SELECT name, salary
FROM Employees
WHERE salary IN (
    SELECT salary
    FROM Employees
    GROUP BY salary
    HAVING COUNT(*) > 1
);

-- 3. Find department-wise average salary and filter > 50000
SELECT dept_id, AVG(salary) AS avg_salary
FROM Employees
GROUP BY dept_id
HAVING AVG(salary) > 50000;

-- 4. Find employees earning more than department average
SELECT e.name, e.salary, e.dept_id
FROM Employees e
WHERE e.salary > (
    SELECT AVG(salary)
    FROM Employees
    WHERE dept_id = e.dept_id
);

-- 5. Rank employees within department
SELECT name, dept_id, salary,
RANK() OVER (PARTITION BY dept_id ORDER BY salary DESC) AS dept_rank
FROM Employees;

-- 6. Running total of salaries
SELECT name, salary,
SUM(salary) OVER (ORDER BY emp_id) AS running_total
FROM Employees;

-- 7. Find second highest salary
SELECT MAX(salary) AS second_highest
FROM Employees
WHERE salary < (SELECT MAX(salary) FROM Employees);

-- 8. Categorize employees using CASE
SELECT name, salary,
CASE
    WHEN salary >= 60000 THEN 'High'
    WHEN salary >= 45000 THEN 'Medium'
    ELSE 'Low'
END AS category
FROM Employees;