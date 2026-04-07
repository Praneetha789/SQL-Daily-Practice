-- Day 24 SQL Practice (Final Revision + Interview Questions)

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

-- Insert data
INSERT INTO Employees VALUES
(1, 'Rahul', 101, 50000),
(2, 'Anita', 102, 45000),
(3, 'Vikram', 103, 60000),
(4, 'Sneha', 101, 55000),
(5, 'Arjun', 102, 40000),
(6, 'Kiran', 101, 70000);

INSERT INTO Departments VALUES
(101, 'IT'),
(102, 'HR'),
(103, 'Finance');

-- 1. Second highest salary (using subquery)
SELECT MAX(salary) AS second_highest
FROM Employees
WHERE salary < (SELECT MAX(salary) FROM Employees);

-- 2. Highest salary employee in each department
SELECT d.dept_name, MAX(e.salary) AS highest_salary
FROM Employees e
JOIN Departments d
ON e.dept_id = d.dept_id
GROUP BY d.dept_name;

-- 3. Employees earning more than average salary
SELECT name, salary
FROM Employees
WHERE salary > (SELECT AVG(salary) FROM Employees);

-- 4. Rank employees based on salary
SELECT name, salary,
RANK() OVER (ORDER BY salary DESC) AS rank_num
FROM Employees;

-- 5. Count employees in each department
SELECT d.dept_name, COUNT(e.emp_id) AS total_employees
FROM Departments d
LEFT JOIN Employees e
ON d.dept_id = e.dept_id
GROUP BY d.dept_name;

-- 6. Employees not assigned to any department
SELECT name
FROM Employees
WHERE dept_id IS NULL;

-- 7. Employees earning more than department average
SELECT e.name, e.salary, e.dept_id
FROM Employees e
WHERE e.salary > (
    SELECT AVG(salary)
    FROM Employees
    WHERE dept_id = e.dept_id
);

-- 8. Use CASE to categorize salaries
SELECT name, salary,
CASE
    WHEN salary >= 60000 THEN 'High'
    WHEN salary >= 45000 THEN 'Medium'
    ELSE 'Low'
END AS category
FROM Employees;