-- Day 18 SQL Practice (Joins + Interview Questions)

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
(5, 'Arjun', NULL, 40000);

-- Insert data into Departments
INSERT INTO Departments VALUES
(101, 'IT'),
(102, 'HR'),
(103, 'Finance'),
(104, 'Marketing');

-- 1. Get employee names with department names
SELECT e.name, d.dept_name
FROM Employees e
INNER JOIN Departments d
ON e.dept_id = d.dept_id;

-- 2. Get all employees even if they don’t have department
SELECT e.name, d.dept_name
FROM Employees e
LEFT JOIN Departments d
ON e.dept_id = d.dept_id;

-- 3. Get all departments even if no employees
SELECT e.name, d.dept_name
FROM Employees e
RIGHT JOIN Departments d
ON e.dept_id = d.dept_id;

-- 4. Employees without department
SELECT name
FROM Employees
WHERE dept_id IS NULL;

-- 5. Departments without employees
SELECT d.dept_name
FROM Departments d
LEFT JOIN Employees e
ON d.dept_id = e.dept_id
WHERE e.emp_id IS NULL;

-- 6. Highest salary employee in each department
SELECT d.dept_name, MAX(e.salary) AS highest_salary
FROM Employees e
JOIN Departments d
ON e.dept_id = d.dept_id
GROUP BY d.dept_name;

-- 7. Count employees in each department
SELECT d.dept_name, COUNT(e.emp_id) AS total_employees
FROM Departments d
LEFT JOIN Employees e
ON d.dept_id = e.dept_id
GROUP BY d.dept_name;

-- 8. Employees earning more than department average
SELECT e.name, e.salary, e.dept_id
FROM Employees e
WHERE e.salary > (
    SELECT AVG(salary)
    FROM Employees
    WHERE dept_id = e.dept_id
);