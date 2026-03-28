-- Day 15 SQL Practice (Views and Indexes)

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
(5, 'Arjun', 102, 40000);

-- 1. Create a VIEW for high salary employees
CREATE VIEW HighSalaryEmployees AS
SELECT name, salary
FROM Employees
WHERE salary > 50000;

-- View the data from VIEW
SELECT * FROM HighSalaryEmployees;

-- 2. Create another VIEW for department-wise employees
CREATE VIEW DeptEmployees AS
SELECT dept_id, COUNT(*) AS total_employees
FROM Employees
GROUP BY dept_id;

-- View department data
SELECT * FROM DeptEmployees;

-- 3. Create INDEX on salary column
CREATE INDEX idx_salary
ON Employees(salary);

-- 4. Create INDEX on department column
CREATE INDEX idx_dept
ON Employees(dept_id);