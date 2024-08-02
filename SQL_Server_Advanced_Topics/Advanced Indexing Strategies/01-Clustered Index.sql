/*
A clustered index determines the physical order of data in a table. 
There can be only one clustered index per table because the data rows themselves 
can be sorted in only one order.
*/

-- Create a clustered index on the 'EmployeeID' column
CREATE CLUSTERED INDEX IX_Employees_EmployeeID
ON Employees(EmployeeID);
