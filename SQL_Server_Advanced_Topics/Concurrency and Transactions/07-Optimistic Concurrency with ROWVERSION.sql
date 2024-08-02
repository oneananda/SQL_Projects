/*
Use ROWVERSION to handle concurrency by ensuring that updates only occur if the row hasn’t been changed by another transaction.
*/

CREATE TABLE Accounts (
    AccountNumber VARCHAR(10) PRIMARY KEY,
    Balance DECIMAL(18, 2),
    RowVersion ROWVERSION
);


DECLARE @CurrentRowVersion VARBINARY(8);

-- Read the current row version
SELECT @CurrentRowVersion = RowVersion
FROM Accounts
WHERE AccountNumber = 'A123';

BEGIN TRANSACTION;

-- Update the balance only if the row version matches
UPDATE Accounts
SET Balance = Balance - 100
WHERE AccountNumber = 'A123'
AND RowVersion = @CurrentRowVersion;

-- Check if the update was successful
IF @@ROWCOUNT = 0
BEGIN
    ROLLBACK;
    PRINT 'Concurrency conflict. Transaction rolled back.';
END
ELSE
BEGIN
    COMMIT;
    PRINT 'Transaction committed.';
END
