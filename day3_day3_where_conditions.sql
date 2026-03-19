-- Create table
CREATE TABLE Employees (
  id INT,
  name VARCHAR(50),
  department VARCHAR(50),
  salary INT
);

-- Insert data
INSERT INTO Employees VALUES (1, 'Rahul', 'IT', 50000);
INSERT INTO Employees VALUES (2, 'Anita', 'HR', 45000);
INSERT INTO Employees VALUES (3, 'Vikram', 'Finance', 60000);
INSERT INTO Employees VALUES (4, 'Sneha', 'IT', 55000);
INSERT INTO Employees VALUES (5, 'Arjun', 'HR', 40000);

-- Display all employees
SELECT * FROM Employees;

-- Employees with salary greater than 50000
SELECT * FROM Employees
WHERE salary > 50000;

-- Employees in IT department
SELECT * FROM Employees
WHERE department = 'IT';

-- Employees in IT department with salary greater than 50000
SELECT * FROM Employees
WHERE department = 'IT' AND salary > 50000;

-- Employees in HR or Finance department
SELECT * FROM Employees
WHERE department = 'HR' OR department = 'Finance';

-- Employees with salary less than 50000
SELECT * FROM Employees
WHERE salary < 50000;