-- Day 4 SQL Practice

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

-- Display all records
SELECT * FROM Employees;

-- Show unique departments
SELECT DISTINCT department 
FROM Employees;

-- Sort employees by salary (lowest to highest)
SELECT * FROM Employees
ORDER BY salary ASC;

-- Sort employees by salary (highest to lowest)
SELECT * FROM Employees
ORDER BY salary DESC;

-- Show top 3 highest paid employees
SELECT * FROM Employees
ORDER BY salary DESC
LIMIT 3;

-- Sort employees by name
SELECT * FROM Employees
ORDER BY name ASC;

-- Show employees with highest salary first and limit to 2
SELECT * FROM Employees
ORDER BY salary DESC
LIMIT 2;