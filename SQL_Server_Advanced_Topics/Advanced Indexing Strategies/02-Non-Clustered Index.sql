/*
A non-clustered index, unlike clustered index, does not alter the physical order of the data. 
It creates a separate structure within the table with pointers back to the original data.
*/

-- Create a non-clustered index on the 'LastName' column
CREATE NONCLUSTERED INDEX IX_Employees_LastName
ON Employees(LastName);
