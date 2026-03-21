-- Day 11 SQL Practice (Subqueries)

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
(6, 'Kiran', 101, 50000);

-- 1. Find employees with salary greater than average salary
SELECT name, salary
FROM Employees
WHERE salary > (
    SELECT AVG(salary) FROM Employees
);

-- 2. Find employees with highest salary
SELECT name, salary
FROM Employees
WHERE salary = (
    SELECT MAX(salary) FROM Employees
);

-- 3. Find employees who work in same department as 'Rahul'
SELECT name
FROM Employees
WHERE dept_id = (
    SELECT dept_id FROM Employees WHERE name = 'Rahul'
);

-- 4. Find employees whose salary is greater than ANY employee in HR (dept_id = 102)
SELECT name, salary
FROM Employees
WHERE salary > ANY (
    SELECT salary FROM Employees WHERE dept_id = 102
);

-- 5. Find employees whose salary is greater than ALL employees in HR
SELECT name, salary
FROM Employees
WHERE salary > ALL (
    SELECT salary FROM Employees WHERE dept_id = 102
);

-- 6. Find employees who are not in HR department
SELECT name
FROM Employees
WHERE dept_id NOT IN (
    SELECT dept_id FROM Employees WHERE dept_id = 102
);