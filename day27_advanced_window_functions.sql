-- Day 27 SQL Practice (Advanced Window Functions)

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

-- 1. ROW_NUMBER within each department
SELECT name, dept_id, salary,
ROW_NUMBER() OVER (PARTITION BY dept_id ORDER BY salary DESC) AS row_num
FROM Employees;

-- 2. RANK within each department
SELECT name, dept_id, salary,
RANK() OVER (PARTITION BY dept_id ORDER BY salary DESC) AS rank_num
FROM Employees;

-- 3. DENSE_RANK within each department
SELECT name, dept_id, salary,
DENSE_RANK() OVER (PARTITION BY dept_id ORDER BY salary DESC) AS dense_rank
FROM Employees;

-- 4. LEAD (next salary)
SELECT name, salary,
LEAD(salary) OVER (ORDER BY salary) AS next_salary
FROM Employees;

-- 5. LAG (previous salary)
SELECT name, salary,
LAG(salary) OVER (ORDER BY salary) AS prev_salary
FROM Employees;

-- 6. Running total of salary
SELECT name, salary,
SUM(salary) OVER (ORDER BY emp_id) AS running_total
FROM Employees;

-- 7. Moving average (window frame)
SELECT name, salary,
AVG(salary) OVER (
    ORDER BY emp_id
    ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING
) AS moving_avg
FROM Employees;