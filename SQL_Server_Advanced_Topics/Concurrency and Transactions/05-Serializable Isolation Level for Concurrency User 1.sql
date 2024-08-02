--To ensure no other transactions can read or write to the data being processed, you use the SERIALIZABLE isolation level.


SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
BEGIN TRANSACTION;

-- Read the balance
SELECT Balance FROM Accounts
WHERE AccountNumber = 'A123';

-- Deduct amount from Account A
UPDATE Accounts
SET Balance = Balance - 100
WHERE AccountNumber = 'A123';

-- Simulate a delay to increase the chance of a concurrency issue
WAITFOR DELAY '00:00:05';

-- Commit the transaction
COMMIT;
