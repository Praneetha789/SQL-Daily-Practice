-- Day 5 SQL Practice

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

-- Show employees with salary greater than 50000
SELECT * FROM Employees
WHERE salary > 50000;

-- Show employees from IT department
SELECT * FROM Employees
WHERE department = 'IT';

-- Use AND condition
SELECT * FROM Employees
WHERE department = 'IT' AND salary > 50000;

-- Use OR condition
SELECT * FROM Employees
WHERE department = 'HR' OR salary > 55000;

-- Use BETWEEN
SELECT * FROM Employees
WHERE salary BETWEEN 45000 AND 55000;

-- Use LIKE (names starting with 'A')
SELECT * FROM Employees
WHERE name LIKE 'A%';