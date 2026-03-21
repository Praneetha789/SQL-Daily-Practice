-- Day 12 SQL Practice (Nested Subqueries)

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
(6, 'Kiran', 101, 50000),
(7, 'Meena', 103, 65000);

-- 1. Find employees earning more than average salary of their department
SELECT name, salary, dept_id
FROM Employees e1
WHERE salary > (
    SELECT AVG(salary)
    FROM Employees e2
    WHERE e1.dept_id = e2.dept_id
);

-- 2. Find second highest salary
SELECT MAX(salary) AS second_highest_salary
FROM Employees
WHERE salary < (
    SELECT MAX(salary) FROM Employees
);

-- 3. Find employees who earn highest salary in each department
SELECT name, salary, dept_id
FROM Employees e1
WHERE salary = (
    SELECT MAX(salary)
    FROM Employees e2
    WHERE e1.dept_id = e2.dept_id
);

-- 4. Find departments having more than 1 employee
SELECT dept_id
FROM Employees
GROUP BY dept_id
HAVING COUNT(*) > 1;

-- 5. Find employees who belong to departments having more than 1 employee
SELECT name, dept_id
FROM Employees
WHERE dept_id IN (
    SELECT dept_id
    FROM Employees
    GROUP BY dept_id
    HAVING COUNT(*) > 1
);

-- 6. Find employees whose salary is greater than overall average but less than max salary
SELECT name, salary
FROM Employees
WHERE salary > (
    SELECT AVG(salary) FROM Employees
)
AND salary < (
    SELECT MAX(salary) FROM Employees
);