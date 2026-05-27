-- Day 39 SQL Practice (Events + Scheduling)

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
-- Create Salary Log table

CREATE TABLE Salary_Log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_id INT,
    old_salary INT,
    updated_salary INT,
    log_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

--------------------------------------------------
-- 1. Create EVENT to increase salary automatically

SET GLOBAL event_scheduler = ON;

DELIMITER //

CREATE EVENT yearly_bonus_event
ON SCHEDULE EVERY 1 YEAR
DO
BEGIN

    -- Store old salaries in log
    INSERT INTO Salary_Log(emp_id, old_salary, updated_salary)
    SELECT emp_id, salary, salary + 5000
    FROM Employees;

    -- Update salary
    UPDATE Employees
    SET salary = salary + 5000;

END //

DELIMITER ;

--------------------------------------------------
-- 2. View updated employees

SELECT * FROM Employees;

--------------------------------------------------
-- 3. View salary logs

SELECT * FROM Salary_Log;

--------------------------------------------------
-- 4. Show all events

SHOW EVENTS;

--------------------------------------------------
-- 5. Drop event

DROP EVENT yearly_bonus_event;