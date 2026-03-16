-- Day 8 SQL Practice

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
(6, 'Kiran', 'IT', 50000),
(7, 'Meena', 'Finance', 65000);

-- Count employees in each department
SELECT department, COUNT(*) AS total_employees
FROM Employees
GROUP BY department;

-- Show departments having more than 2 employees
SELECT department, COUNT(*) AS total_employees
FROM Employees
GROUP BY department
HAVING COUNT(*) > 2;

-- Show departments where average salary is greater than 50000
SELECT department, AVG(salary) AS avg_salary
FROM Employees
GROUP BY department
HAVING AVG(salary) > 50000;

-- Show departments where total salary is greater than 100000
SELECT department, SUM(salary) AS total_salary
FROM Employees
GROUP BY department
HAVING SUM(salary) > 100000;