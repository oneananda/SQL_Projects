SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
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
