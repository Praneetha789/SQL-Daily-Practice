-- Day 38 SQL Practice (Views + Security)

-- Create Employees table
CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    dept_id INT,
    salary INT,
    email VARCHAR(100)
);

-- Insert sample data
INSERT INTO Employees VALUES
(1, 'Rahul', 101, 50000, 'rahul@gmail.com'),
(2, 'Anita', 102, 45000, 'anita@gmail.com'),
(3, 'Vikram', 103, 60000, 'vikram@gmail.com'),
(4, 'Sneha', 101, 55000, 'sneha@gmail.com');

--------------------------------------------------
-- 1. Create View for public employee details

CREATE VIEW Employee_Public_View AS
SELECT emp_id, name, dept_id
FROM Employees;

--------------------------------------------------
-- 2. View public data

SELECT * FROM Employee_Public_View;

--------------------------------------------------
-- 3. Create High Salary View

CREATE VIEW HighSalaryEmployees AS
SELECT name, salary
FROM Employees
WHERE salary > 50000;

--------------------------------------------------
-- 4. View high salary employees

SELECT * FROM HighSalaryEmployees;

--------------------------------------------------
-- 5. Update data through VIEW

UPDATE Employee_Public_View
SET dept_id = 104
WHERE emp_id = 1;

--------------------------------------------------
-- 6. Drop a VIEW

DROP VIEW HighSalaryEmployees;

--------------------------------------------------
-- 7. Simulated access control examples

-- Grant SELECT permission
-- GRANT SELECT ON Employees TO 'user1';

-- Grant INSERT permission
-- GRANT INSERT ON Employees TO 'user1';

-- Revoke permission
-- REVOKE INSERT ON Employees FROM 'user1';

--------------------------------------------------
-- 8. Secure sensitive columns using VIEW

CREATE VIEW Employee_Secure_View AS
SELECT emp_id, name, dept_id
FROM Employees;

SELECT * FROM Employee_Secure_View;