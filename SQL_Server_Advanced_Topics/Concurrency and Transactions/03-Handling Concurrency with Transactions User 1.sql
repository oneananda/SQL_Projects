BEGIN TRANSACTION;

-- Read the balance
SELECT Balance FROM Accounts
WHERE AccountNumber = 'A123';

-- Deduct amount from Account A
UPDATE Accounts
SET Balance = Balance - 100
WHERE AccountNumber = 'A123';

-- Simulate a delay to increase the chance of a concurrency issue
WAITFOR DELAY '00:00:20';

-- Commit the transaction
COMMIT;
