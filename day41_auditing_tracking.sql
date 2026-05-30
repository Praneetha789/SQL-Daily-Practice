-- Day 41 SQL Practice (Auditing + Activity Tracking)

-- Create Employees table
CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    salary INT
);

-- Insert sample data
INSERT INTO Employees VALUES
(1, 'Rahul', 50000),
(2, 'Anita', 45000),
(3, 'Vikram', 60000);

--------------------------------------------------
-- Create Audit Log table

CREATE TABLE Audit_Log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_id INT,
    action_type VARCHAR(20),
    old_salary INT,
    new_salary INT,
    action_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

--------------------------------------------------
-- 1. AFTER UPDATE Trigger

DELIMITER //

CREATE TRIGGER after_salary_update
AFTER UPDATE ON Employees
FOR EACH ROW
BEGIN

    INSERT INTO Audit_Log(
        emp_id,
        action_type,
        old_salary,
        new_salary
    )
    VALUES (
        OLD.emp_id,
        'UPDATE',
        OLD.salary,
        NEW.salary
    );

END //

DELIMITER ;

--------------------------------------------------
-- 2. AFTER DELETE Trigger

DELIMITER //

CREATE TRIGGER after_employee_delete
AFTER DELETE ON Employees
FOR EACH ROW
BEGIN

    INSERT INTO Audit_Log(
        emp_id,
        action_type,
        old_salary,
        new_salary
    )
    VALUES (
        OLD.emp_id,
        'DELETE',
        OLD.salary,
        NULL
    );

END //

DELIMITER ;

--------------------------------------------------
-- 3. Test UPDATE

UPDATE Employees
SET salary = 70000
WHERE emp_id = 1;

--------------------------------------------------
-- 4. Test DELETE

DELETE FROM Employees
WHERE emp_id = 2;

--------------------------------------------------
-- 5. View Audit Logs

SELECT * FROM Audit_Log;

--------------------------------------------------
-- 6. View Remaining Employees

SELECT * FROM Employees;