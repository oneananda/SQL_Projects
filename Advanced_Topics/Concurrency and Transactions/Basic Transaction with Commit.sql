/*
Scenario: You want to transfer money between two bank accounts. 
You need to ensure that both accounts are updated properly, 
and if any part of the process fails, 
you want to roll back the entire transaction.
*/

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
