-- Reorganizing an index defragments the leaf level of the index.
-- Reorganize an index on the 'LastName' column
ALTER INDEX IX_Employees_LastName
ON Employees
REORGANIZE;
