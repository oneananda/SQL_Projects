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

