-- Day 17 SQL Practice (Triggers)

-- Create Employees table
CREATE TABLE Employees (
    emp_id INT,
    name VARCHAR(50),
    dept_id INT,
    salary INT
);

-- Create Audit table (to store logs)
CREATE TABLE Employee_Audit (
    audit_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_id INT,
    action_type VARCHAR(50),
    action_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert sample data
INSERT INTO Employees VALUES
(1, 'Rahul', 101, 50000),
(2, 'Anita', 102, 45000);

-- 1. AFTER INSERT TRIGGER
DELIMITER //

CREATE TRIGGER after_employee_insert
AFTER INSERT ON Employees
FOR EACH ROW
BEGIN
    INSERT INTO Employee_Audit(emp_id, action_type)
    VALUES (NEW.emp_id, 'INSERT');
END //

DELIMITER ;

-- Test INSERT trigger
INSERT INTO Employees VALUES (3, 'Vikram', 103, 60000);

-- 2. AFTER DELETE TRIGGER
DELIMITER //

CREATE TRIGGER after_employee_delete
AFTER DELETE ON Employees
FOR EACH ROW
BEGIN
    INSERT INTO Employee_Audit(emp_id, action_type)
    VALUES (OLD.emp_id, 'DELETE');
END //

DELIMITER ;

-- Test DELETE trigger
DELETE FROM Employees WHERE emp_id = 2;

-- 3. BEFORE UPDATE TRIGGER (salary check)
DELIMITER //

CREATE TRIGGER before_salary_update
BEFORE UPDATE ON Employees
FOR EACH ROW
BEGIN
    IF NEW.salary < 0 THEN
        SET NEW.salary = 0;
    END IF;
END //

DELIMITER ;

-- Test UPDATE trigger
UPDATE Employees
SET salary = -1000
WHERE emp_id = 1;

-- View audit logs
SELECT * FROM Employee_Audit;