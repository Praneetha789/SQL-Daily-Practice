-- Day 21 SQL Practice (Transactions)

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

-- 1. Start Transaction
START TRANSACTION;

-- Transfer 2000 from Rahul to Anita
UPDATE Accounts
SET balance = balance - 2000
WHERE acc_id = 1;

UPDATE Accounts
SET balance = balance + 2000
WHERE acc_id = 2;

-- Commit changes
COMMIT;

-- View updated balances
SELECT * FROM Accounts;

-- 2. Transaction with ROLLBACK
START TRANSACTION;

-- Try invalid operation (negative balance)
UPDATE Accounts
SET balance = balance - 15000
WHERE acc_id = 1;

-- Rollback changes
ROLLBACK;

-- Check balances remain unchanged
SELECT * FROM Accounts;

-- 3. Using SAVEPOINT
START TRANSACTION;

UPDATE Accounts SET balance = balance - 1000 WHERE acc_id = 1;

SAVEPOINT sp1;

UPDATE Accounts SET balance = balance - 500 WHERE acc_id = 1;

-- Rollback to savepoint
ROLLBACK TO sp1;

-- Commit remaining changes
COMMIT;

-- Final data
SELECT * FROM Accounts;