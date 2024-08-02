-- Rebuilding an index creates a new index and drops the old one.
-- Rebuild an index on the 'LastName' column
ALTER INDEX IX_Employees_LastName
ON Employees
REBUILD;
