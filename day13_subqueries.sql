-- ============================================
-- DAY 13: SQL SUBQUERIES PRACTICE
-- ============================================

-- STEP 1: Create Tables
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    location VARCHAR(50)
);

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    salary INT,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

-- STEP 2: Insert Data into departments
INSERT INTO departments VALUES
(1, 'HR', 'Bangalore'),
(2, 'IT', 'Mumbai'),
(3, 'Finance', 'Delhi'),
(4, 'Marketing', 'Bangalore');

-- STEP 3: Insert Data into employees
INSERT INTO employees VALUES
(101, 'Amit', 50000, 1),
(102, 'Neha', 60000, 2),
(103, 'Raj', 70000, 2),
(104, 'Priya', 55000, 3),
(105, 'Karan', 80000, 4),
(106, 'Sneha', 75000, 4),
(107, 'Arjun', 65000, 1);

-- ============================================
-- QUERY 1: Employees earning more than average salary
-- ============================================
SELECT name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

-- ============================================
-- QUERY 2: Employees in Bangalore departments
-- ============================================
SELECT name
FROM employees
WHERE dept_id IN (
    SELECT dept_id
    FROM departments
    WHERE location = 'Bangalore'
);

-- ============================================
-- QUERY 3: Departments having employees
-- ============================================
SELECT dept_name
FROM departments d
WHERE EXISTS (
    SELECT *
    FROM employees e
    WHERE e.dept_id = d.dept_id
);

-- ============================================
-- QUERY 4: Employees earning more than their dept average
-- ============================================
SELECT name, salary, dept_id
FROM employees e1
WHERE salary > (
    SELECT AVG(salary)
    FROM employees e2
    WHERE e1.dept_id = e2.dept_id
);

-- ============================================
-- QUERY 5: Show employee with department average salary
-- ============================================
SELECT name,
       (SELECT AVG(salary)
        FROM employees e2
        WHERE e1.dept_id = e2.dept_id) AS dept_avg
FROM employees e1;

-- ============================================
-- QUERY 6: Second highest salary
-- ============================================
SELECT MAX(salary) AS second_highest
FROM employees
WHERE salary < (
    SELECT MAX(salary)
    FROM employees
);

-- ============================================
-- QUERY 7: Employees with highest salary in their department
-- ============================================
SELECT name, salary, dept_id
FROM employees e1
WHERE salary = (
    SELECT MAX(salary)
    FROM employees e2
    WHERE e1.dept_id = e2.dept_id
);

-- ============================================
-- END OF DAY 13
-- ============================================