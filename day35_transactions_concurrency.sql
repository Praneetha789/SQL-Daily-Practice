-- Day 35 SQL Practice (Transactions + Concurrency)

-- Create Accounts table
CREATE TABLE Accounts (
    acc_id INT PRIMARY KEY,
    name VARCHAR(50),
    balance INT
);

-- Insert data
INSERT INTO Accounts VALUES
(1, 'Rahul', 10000),
(2, 'Anita', 8000);

--------------------------------------------------
-- 1. Basic Transaction (Money Transfer)

START TRANSACTION;

UPDATE Accounts
SET balance = balance - 2000
WHERE acc_id = 1;

UPDATE Accounts
SET balance = balance + 2000
WHERE acc_id = 2;

COMMIT;

SELECT * FROM Accounts;

--------------------------------------------------
-- 2. Rollback Example (Error Handling)

START TRANSACTION;

UPDATE Accounts
SET balance = balance - 15000
WHERE acc_id = 1;

-- Something went wrong → Undo
ROLLBACK;

SELECT * FROM Accounts;

--------------------------------------------------
-- 3. Savepoint Example

START TRANSACTION;

UPDATE Accounts SET balance = balance - 1000 WHERE acc_id = 1;

SAVEPOINT sp1;

UPDATE Accounts SET balance = balance - 500 WHERE acc_id = 1;

-- Undo last step only
ROLLBACK TO sp1;

COMMIT;

SELECT * FROM Accounts;

--------------------------------------------------
-- 4. Prevent Negative Balance (Constraint Idea)

ALTER TABLE Accounts
ADD CONSTRAINT chk_balance CHECK (balance >= 0);

--------------------------------------------------
-- 5. Simulate Concurrent Update Problem (Concept)

-- Session 1:
-- START TRANSACTION;
-- UPDATE Accounts SET balance = balance - 500 WHERE acc_id = 1;

-- Session 2:
-- START TRANSACTION;
-- UPDATE Accounts SET balance = balance - 500 WHERE acc_id = 1;

-- Without proper control → incorrect balance

--------------------------------------------------
-- 6. Locking Example (for consistency)

SELECT * FROM Accounts
WHERE acc_id = 1
FOR UPDATE;