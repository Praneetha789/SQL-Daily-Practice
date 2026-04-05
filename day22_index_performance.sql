-- Day 22 SQL Practice (Index + Performance)

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

-- 1. Create index on salary
CREATE INDEX idx_salary
ON Employees(salary);

-- 2. Create composite index (dept_id + salary)
CREATE INDEX idx_dept_salary
ON Employees(dept_id, salary);

-- 3. Query using index (faster search)
SELECT * FROM Employees
WHERE salary > 50000;

-- 4. Query using composite index
SELECT * FROM Employees
WHERE dept_id = 101 AND salary > 50000;

-- 5. Use EXPLAIN to analyze query performance
EXPLAIN SELECT * FROM Employees
WHERE dept_id = 101 AND salary > 50000;

-- 6. Drop index (if not needed)
DROP INDEX idx_salary ON Employees;