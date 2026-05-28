-- Day 40 SQL Practice (Backup + Restore + Maintenance)

-- Create Employees table
CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    dept_id INT,
    salary INT
);

-- Insert sample data
INSERT INTO Employees VALUES
(1, 'Rahul', 101, 50000),
(2, 'Anita', 102, 45000),
(3, 'Vikram', 103, 60000);

--------------------------------------------------
-- 1. View data before backup

SELECT * FROM Employees;

--------------------------------------------------
-- 2. Backup table using CREATE TABLE AS

CREATE TABLE Employees_Backup AS
SELECT * FROM Employees;

--------------------------------------------------
-- 3. Verify backup table

SELECT * FROM Employees_Backup;

--------------------------------------------------
-- 4. Delete original data (simulate data loss)

DELETE FROM Employees;

--------------------------------------------------
-- 5. Verify original table is empty

SELECT * FROM Employees;

--------------------------------------------------
-- 6. Restore data from backup

INSERT INTO Employees
SELECT * FROM Employees_Backup;

--------------------------------------------------
-- 7. Verify restored data

SELECT * FROM Employees;

--------------------------------------------------
-- 8. Maintenance query (optimize table)

-- MySQL
OPTIMIZE TABLE Employees;

--------------------------------------------------
-- 9. Analyze table statistics

ANALYZE TABLE Employees;

--------------------------------------------------
-- 10. Check table structure

DESCRIBE Employees;