/*
A filtered index is a non-clustered index that includes only a subset of rows. 
It is particularly useful for indexing sparse columns.
*/

-- Create a filtered index on the 'IsActive' column for only active employees
CREATE NONCLUSTERED INDEX IX_Employees_IsActive
ON Employees(IsActive)
WHERE IsActive = 1;
