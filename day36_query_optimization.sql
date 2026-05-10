-- Day 36 SQL Practice (Query Optimization)

-- Create Employees table
CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    dept_id INT,
    salary INT
);

-- Insert sample data
INSERT INTO Employees VALUES
(1, 'Rahul', 101, 50000),
(2, 'Anita', 102, 45000),
(3, 'Vikram', 103, 60000),
(4, 'Sneha', 101, 55000),
(5, 'Arjun', 102, 40000),
(6, 'Kiran', 101, 70000);

--------------------------------------------------
-- 1. Analyze Query Performance

EXPLAIN
SELECT * FROM Employees
WHERE dept_id = 101;

--------------------------------------------------
-- 2. Create Index for faster searching

CREATE INDEX idx_dept
ON Employees(dept_id);

--------------------------------------------------
-- 3. Query using indexed column

SELECT * FROM Employees
WHERE dept_id = 101;

--------------------------------------------------
-- 4. Composite Index

CREATE INDEX idx_dept_salary
ON Employees(dept_id, salary);

--------------------------------------------------
-- 5. Optimized filtering

EXPLAIN
SELECT * FROM Employees
WHERE dept_id = 101
AND salary > 50000;

--------------------------------------------------
-- 6. Avoid SELECT *

SELECT name, salary
FROM Employees
WHERE dept_id = 101;

--------------------------------------------------
-- 7. Pagination (efficient LIMIT)

SELECT *
FROM Employees
ORDER BY emp_id
LIMIT 3 OFFSET 0;

--------------------------------------------------
-- 8. Aggregate optimization

SELECT dept_id, AVG(salary) AS avg_salary
FROM Employees
GROUP BY dept_id;

--------------------------------------------------
-- 9. Drop unnecessary index

DROP INDEX idx_dept
ON Employees;