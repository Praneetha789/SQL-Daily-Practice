-- Day 9 SQL Practice (JOINS)

-- Create Employees table
CREATE TABLE Employees (
    emp_id INT,
    name VARCHAR(50),
    dept_id INT,
    salary INT
);

-- Create Departments table
CREATE TABLE Departments (
    dept_id INT,
    dept_name VARCHAR(50)
);

-- Insert data into Employees
INSERT INTO Employees VALUES
(1, 'Rahul', 101, 50000),
(2, 'Anita', 102, 45000),
(3, 'Vikram', 103, 60000),
(4, 'Sneha', 101, 55000),
(5, 'Arjun', 102, 40000);

-- Insert data into Departments
INSERT INTO Departments VALUES
(101, 'IT'),
(102, 'HR'),
(103, 'Finance'),
(104, 'Marketing');

-- INNER JOIN (only matching records)
SELECT e.name, d.dept_name, e.salary
FROM Employees e
INNER JOIN Departments d
ON e.dept_id = d.dept_id;

-- LEFT JOIN (all employees + matching departments)
SELECT e.name, d.dept_name
FROM Employees e
LEFT JOIN Departments d
ON e.dept_id = d.dept_id;

-- RIGHT JOIN (all departments + matching employees)
SELECT e.name, d.dept_name
FROM Employees e
RIGHT JOIN Departments d
ON e.dept_id = d.dept_id;

-- Show employees working in IT department
SELECT e.name, d.dept_name
FROM Employees e
INNER JOIN Departments d
ON e.dept_id = d.dept_id
WHERE d.dept_name = 'IT';