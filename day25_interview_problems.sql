-- Day 25 SQL Practice (Interview-Level Questions)

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

-- 1. Find 3rd highest salary
SELECT DISTINCT salary
FROM Employees
ORDER BY salary DESC
LIMIT 1 OFFSET 2;

-- 2. Find employees with duplicate salaries
SELECT name, salary
FROM Employees
WHERE salary IN (
    SELECT salary
    FROM Employees
    GROUP BY salary
    HAVING COUNT(*) > 1
);

-- 3. Find department with highest average salary
SELECT dept_id, AVG(salary) AS avg_salary
FROM Employees
GROUP BY dept_id
ORDER BY avg_salary DESC
LIMIT 1;

-- 4. Find employees earning above overall average
SELECT name, salary
FROM Employees
WHERE salary > (
    SELECT AVG(salary) FROM Employees
);

-- 5. Find employees who are top earners in their department
SELECT name, dept_id, salary
FROM Employees e1
WHERE salary = (
    SELECT MAX(salary)
    FROM Employees e2
    WHERE e1.dept_id = e2.dept_id
);

-- 6. Find employees with salary greater than previous employee (using window function)
SELECT name, salary,
LAG(salary) OVER (ORDER BY salary) AS prev_salary
FROM Employees;

-- 7. Find running total of salaries
SELECT name, salary,
SUM(salary) OVER (ORDER BY emp_id) AS running_total
FROM Employees;