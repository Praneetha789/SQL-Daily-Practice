-- Day 16 SQL Practice (Stored Procedures & Functions)

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

-- 1. Create a Stored Procedure to get all employees
DELIMITER //

CREATE PROCEDURE GetAllEmployees()
BEGIN
    SELECT * FROM Employees;
END //

DELIMITER ;

-- Call the procedure
CALL GetAllEmployees();

-- 2. Stored Procedure with parameter (filter by department)
DELIMITER //

CREATE PROCEDURE GetEmployeesByDept(IN dept INT)
BEGIN
    SELECT * FROM Employees
    WHERE dept_id = dept;
END //

DELIMITER ;

-- Call procedure
CALL GetEmployeesByDept(101);

-- 3. Create a Function to calculate bonus (10% of salary)
DELIMITER //

CREATE FUNCTION CalculateBonus(sal INT)
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN sal * 0.10;
END //

DELIMITER ;

-- Use the function
SELECT name, salary, CalculateBonus(salary) AS bonus
FROM Employees;