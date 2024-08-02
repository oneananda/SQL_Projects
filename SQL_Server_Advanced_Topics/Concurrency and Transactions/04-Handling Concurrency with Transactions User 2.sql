
-- Run this script as another user while the script 1 
-- "03-Handling Concurrency with Transactions User 1.sql" is being executed

BEGIN TRANSACTION;

-- Read the balance
SELECT Balance FROM Accounts
WHERE AccountNumber = 'A123';

-- Add amount to Account A
UPDATE Accounts
SET Balance = Balance + 200
WHERE AccountNumber = 'A123';

-- Commit the transaction
COMMIT;
