# Advanced Indexing Strategies

Delve into advanced indexing strategies to enhance query performance and manage large datasets efficiently.

## Table of Contents

- [Clustered vs. Non-Clustered Indexes](#clustered-vs-non-clustered-indexes)
- [Covering Indexes](#covering-indexes)
- [Filtered Indexes](#filtered-indexes)
- [Columnstore Indexes](#columnstore-indexes)
- [Index Maintenance](#index-maintenance)
- [Automate Index Maintenance](#automate-index-maintenance)

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

### Covering Indexes

A covering index includes all the columns needed to satisfy a query, meaning the query can be answered entirely using the index without accessing the table.

```
-- Create a covering index that includes 'FirstName' and 'LastName' columns
CREATE NONCLUSTERED INDEX IX_Employees_FirstName_LastName
ON Employees(FirstName, LastName);
```

Covering indexes can significantly improve performance for read-heavy workloads by reducing the need to access the table data.

### Filtered Indexes

Filtered indexes are non-clustered indexes that include only a subset of the rows in the table, based on a filter predicate. They are useful for improving query performance and reducing index maintenance costs.

```
-- Create a filtered index for active employees only
CREATE NONCLUSTERED INDEX IX_Employees_Active
ON Employees(EmployeeID)
WHERE IsActive = 1;
```

### Columnstore Indexes

Columnstore indexes store data in a columnar format, which can improve performance for read-heavy and analytic queries. They are ideal for data warehousing and business intelligence applications.

```
-- Create a columnstore index on the 'Sales' table
CREATE CLUSTERED COLUMNSTORE INDEX IX_Sales
ON Sales;
```

Columnstore indexes provide high data compression and can speed up query performance for large datasets.

### Rebuild Index

Rebuilding an index drops and re-creates it, which can be more resource-intensive but is necessary for heavily fragmented indexes.

```
-- Rebuild the 'IX_Employees_LastName' index
ALTER INDEX IX_Employees_LastName
ON Employees
REBUILD;
```

### Reorganize Index

Reorganizing an index defragments it without rebuilding it, which can be done online and is less resource-intensive.

```
-- Reorganize the 'IX_Employees_LastName' index
ALTER INDEX IX_Employees_LastName
ON Employees
REORGANIZE;
```

### Automate Index Maintenance

Automating index maintenance tasks can help ensure that indexes are regularly optimized without manual intervention.

### Step 1: Create the SQL Server Agent Job

Run the following command to create a new SQL Server Agent job named 'Index Maintenance':

```
EXEC sp_add_job @job_name = 'Index Maintenance';
```


### Step 2: Add a Job Step

Add a job step that rebuilds all indexes using the following command:

```
EXEC sp_add_jobstep @job_name = 'Index Maintenance',
                    @step_name = 'Rebuild Indexes',
                    @subsystem = 'TSQL',
                    @command = 'EXEC sp_msforeachtable ''ALTER INDEX ALL ON ? REBUILD''';
```

### Step 3: Create a Schedule

Create a schedule for the job to run daily at 2:00 AM:

Remember : We are yet to attach this schedule to the actual job

```
EXEC sp_add_schedule @job_name = 'Index Maintenance',
                     @schedule_name = 'Daily Index Maintenance',
                     @freq_type = 4, -- Daily
                     @freq_interval = 1,
                     @active_start_time = 020000; -- 2:00 AM
```

### Step 4: Attach the Schedule to the Job

Attach the created schedule to the job:

```
EXEC sp_attach_schedule @job_name = 'Index Maintenance',
                        @schedule_name = 'Daily Index Maintenance';
```

### Step 5: Add the Job to the SQL Server Agent

Finally, add the job to the SQL Server Agent:

```
EXEC sp_add_jobserver @job_name = 'Index Maintenance';
```