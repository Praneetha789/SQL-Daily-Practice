-- Day 14 SQL Practice (Window Functions)

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
(6, 'Kiran', 101, 50000),
(7, 'Meena', 103, 65000);

-- 1. ROW_NUMBER (unique ranking)
SELECT name, dept_id, salary,
ROW_NUMBER() OVER (ORDER BY salary DESC) AS row_num
FROM Employees;

-- 2. RANK (same rank for same salary, skips numbers)
SELECT name, salary,
RANK() OVER (ORDER BY salary DESC) AS rank_num
FROM Employees;

-- 3. DENSE_RANK (no skipping ranks)
SELECT name, salary,
DENSE_RANK() OVER (ORDER BY salary DESC) AS dense_rank
FROM Employees;

-- 4. Partition by department (ranking inside each department)
SELECT name, dept_id, salary,
RANK() OVER (PARTITION BY dept_id ORDER BY salary DESC) AS dept_rank
FROM Employees;

-- 5. Find top 2 highest salary in each department
SELECT *
FROM (
    SELECT name, dept_id, salary,
    DENSE_RANK() OVER (PARTITION BY dept_id ORDER BY salary DESC) AS rnk
    FROM Employees
) t
WHERE rnk <= 2;