-- Day 10 SQL Practice (Advanced JOINS)

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

-- 1. FULL OUTER JOIN (all records from both tables)
SELECT e.name, d.dept_name
FROM Employees e
LEFT JOIN Departments d ON e.dept_id = d.dept_id

UNION

SELECT e.name, d.dept_name
FROM Employees e
RIGHT JOIN Departments d ON e.dept_id = d.dept_id;

-- 2. Employees with no department (NULL values)
SELECT name
FROM Employees
WHERE dept_id IS NULL;

-- 3. Departments with no employees
SELECT d.dept_name
FROM Departments d
LEFT JOIN Employees e ON d.dept_id = e.dept_id
WHERE e.emp_id IS NULL;

-- 4. Self JOIN (compare employees in same department)
SELECT e1.name AS Employee1, e2.name AS Employee2, e1.dept_id
FROM Employees e1
JOIN Employees e2
ON e1.dept_id = e2.dept_id
AND e1.emp_id <> e2.emp_id;

-- 5. Highest salary in each department
SELECT d.dept_name, MAX(e.salary) AS highest_salary
FROM Employees e
JOIN Departments d ON e.dept_id = d.dept_id
GROUP BY d.dept_name;