-- Day 7 SQL Practice

-- Create Employees table
CREATE TABLE Employees (
    id INT,
    name VARCHAR(50),
    department VARCHAR(50),
    salary INT
);

-- Insert records
INSERT INTO Employees VALUES
(1, 'Rahul', 'IT', 50000),
(2, 'Anita', 'HR', 45000),
(3, 'Vikram', 'Finance', 60000),
(4, 'Sneha', 'IT', 55000),
(5, 'Arjun', 'HR', 40000),
(6, 'Kiran', 'IT', 50000);

-- Count total employees
SELECT COUNT(*) AS total_employees
FROM Employees;

-- Find average salary
SELECT AVG(salary) AS average_salary
FROM Employees;

-- Find total salary paid
SELECT SUM(salary) AS total_salary
FROM Employees;

-- Find highest salary
SELECT MAX(salary) AS highest_salary
FROM Employees;

-- Find lowest salary
SELECT MIN(salary) AS lowest_salary
FROM Employees;

-- Count employees in each department
SELECT department, COUNT(*) AS employee_count
FROM Employees
GROUP BY department;

-- Average salary in each department
SELECT department, AVG(salary) AS avg_salary
FROM Employees
GROUP BY department;
