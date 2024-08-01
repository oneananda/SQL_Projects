BEGIN TRANSACTION;

-- Deduct amount from Account A
UPDATE Accounts
SET Balance = Balance - 100
WHERE AccountNumber = 'A123';

-- Add amount to Account B
UPDATE Accounts
SET Balance = Balance + 100
WHERE AccountNumber = 'B456';

-- Commit the transaction
COMMIT;
