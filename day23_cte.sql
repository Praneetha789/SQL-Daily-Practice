-- Day 23 SQL Practice (CTE - Common Table Expressions)

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
(6, 'Kiran', 101, 70000);

-- 1. Basic CTE (temporary result set)
WITH HighSalary AS (
    SELECT * FROM Employees
    WHERE salary > 50000
)
SELECT * FROM HighSalary;

-- 2. CTE with aggregation
WITH DeptAvg AS (
    SELECT dept_id, AVG(salary) AS avg_salary
    FROM Employees
    GROUP BY dept_id
)
SELECT * FROM DeptAvg;

-- 3. Use CTE with JOIN
WITH DeptAvg AS (
    SELECT dept_id, AVG(salary) AS avg_salary
    FROM Employees
    GROUP BY dept_id
)
SELECT e.name, e.salary, d.avg_salary
FROM Employees e
JOIN DeptAvg d
ON e.dept_id = d.dept_id;

-- 4. Find employees earning more than department average using CTE
WITH DeptAvg AS (
    SELECT dept_id, AVG(salary) AS avg_salary
    FROM Employees
    GROUP BY dept_id
)
SELECT e.name, e.salary, e.dept_id
FROM Employees e
JOIN DeptAvg d
ON e.dept_id = d.dept_id
WHERE e.salary > d.avg_salary;

-- 5. Multiple CTEs
WITH HighSalary AS (
    SELECT * FROM Employees WHERE salary > 50000
),
LowSalary AS (
    SELECT * FROM Employees WHERE salary <= 50000
)
SELECT * FROM HighSalary
UNION
SELECT * FROM LowSalary;