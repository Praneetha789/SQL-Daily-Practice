-- Day 37 SQL Practice (Stored Procedures + Error Handling)

-- Create Accounts table
CREATE TABLE Accounts (
    acc_id INT PRIMARY KEY,
    name VARCHAR(50),
    balance INT
);

-- Create Transaction Log table
CREATE TABLE Transaction_Log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    sender_id INT,
    receiver_id INT,
    amount INT,
    status VARCHAR(20),
    log_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert sample data
INSERT INTO Accounts VALUES
(1, 'Rahul', 10000),
(2, 'Anita', 8000);

--------------------------------------------------
-- Stored Procedure for Money Transfer

DELIMITER //

CREATE PROCEDURE TransferMoney(
    IN sender INT,
    IN receiver INT,
    IN transfer_amount INT
)
BEGIN

    DECLARE sender_balance INT;

    -- Get sender balance
    SELECT balance
    INTO sender_balance
    FROM Accounts
    WHERE acc_id = sender;

    -- Check sufficient balance
    IF sender_balance >= transfer_amount THEN

        START TRANSACTION;

        -- Deduct sender balance
        UPDATE Accounts
        SET balance = balance - transfer_amount
        WHERE acc_id = sender;

        -- Add receiver balance
        UPDATE Accounts
        SET balance = balance + transfer_amount
        WHERE acc_id = receiver;

        -- Log success
        INSERT INTO Transaction_Log(
            sender_id,
            receiver_id,
            amount,
            status
        )
        VALUES (
            sender,
            receiver,
            transfer_amount,
            'SUCCESS'
        );

        COMMIT;

    ELSE

        -- Log failure
        INSERT INTO Transaction_Log(
            sender_id,
            receiver_id,
            amount,
            status
        )
        VALUES (
            sender,
            receiver,
            transfer_amount,
            'FAILED'
        );

    END IF;

END //

DELIMITER ;

--------------------------------------------------
-- Execute Procedure

CALL TransferMoney(1, 2, 2000);

--------------------------------------------------
-- View Updated Accounts

SELECT * FROM Accounts;

--------------------------------------------------
-- View Transaction Logs

SELECT * FROM Transaction_Log;