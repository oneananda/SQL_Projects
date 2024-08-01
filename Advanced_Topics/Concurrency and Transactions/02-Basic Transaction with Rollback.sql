/*
Similar to the previous example, but this time an error occurs during the transaction, 
and you want to roll back all changes.
*/
BEGIN TRANSACTION;

BEGIN TRY
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
END TRY
BEGIN CATCH
    -- Rollback the transaction if any error occurs
    ROLLBACK;
    
    -- Handle the error
    PRINT ERROR_MESSAGE();
END CATCH;
