-- Day 29 SQL Practice (Real Interview Questions)

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
(6, 'Kiran', 101, 70000),
(7, 'Meena', 103, 65000);

-- 1. Find Nth highest salary (example: 3rd highest)
SELECT DISTINCT salary
FROM Employees
ORDER BY salary DESC
LIMIT 1 OFFSET 2;

-- 2. Find employees who earn more than their manager (simulate manager using emp_id)
SELECT e1.name, e1.salary
FROM Employees e1
JOIN Employees e2
ON e1.emp_id > e2.emp_id
WHERE e1.salary > e2.salary;

-- 3. Find consecutive duplicate salaries
SELECT salary, COUNT(*) AS cnt
FROM Employees
GROUP BY salary
HAVING COUNT(*) > 1;

-- 4. Find employees whose salary is greater than average of their department
SELECT name, dept_id, salary
FROM Employees e
WHERE salary > (
    SELECT AVG(salary)
    FROM Employees
    WHERE dept_id = e.dept_id
);

-- 5. Find department-wise top salary using window function
SELECT name, dept_id, salary
FROM (
    SELECT name, dept_id, salary,
    RANK() OVER (PARTITION BY dept_id ORDER BY salary DESC) AS rnk
    FROM Employees
) t
WHERE rnk = 1;

-- 6. Find employees with second highest salary in each department
SELECT name, dept_id, salary
FROM (
    SELECT name, dept_id, salary,
    DENSE_RANK() OVER (PARTITION BY dept_id ORDER BY salary DESC) AS rnk
    FROM Employees
) t
WHERE rnk = 2;

-- 7. Find employees who have same salary as someone else
SELECT name, salary
FROM Employees
WHERE salary IN (
    SELECT salary
    FROM Employees
    GROUP BY salary
    HAVING COUNT(*) > 1
);