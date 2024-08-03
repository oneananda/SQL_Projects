# Advanced Indexing Strategies

Delve into advanced indexing strategies to enhance query performance and manage large datasets efficiently.

## Table of Contents

- [Clustered vs. Non-Clustered Indexes](#clustered-vs-non-clustered-indexes)
- [Covering Indexes](#covering-indexes)
- [Filtered Indexes](#filtered-indexes)
- [Columnstore Indexes](#columnstore-indexes)
- [Index Maintenance](#index-maintenance)

## Clustered vs. Non-Clustered Indexes

### Clustered Index

A clustered index determines the physical order of data in a table. There can be only one clustered index per table because the data rows themselves can be sorted in only one order.

```sql
-- Create a clustered index on the 'EmployeeID' column
CREATE CLUSTERED INDEX IX_Employees_EmployeeID
ON Employees(EmployeeID);
```

### Non-Clustered Index

A non-clustered index, on the other hand, does not alter the physical order of the data. Instead, it creates a separate structure within the table that points back to the original data.

```
-- Create a non-clustered index on the 'LastName' column
CREATE NONCLUSTERED INDEX IX_Employees_LastName
ON Employees(LastName);
```




