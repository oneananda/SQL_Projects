/*

UPDATE STATISTICS: Performance tuning

A command used to update the information about the distribution of data in the tables and indexes, 
which the query optimizer uses to generate efficient execution plans.

Purpose:

The data in the table is changing over the time by insert / update / delete operations, 
the statistical data is outdated once that is happening,
This can lead to sub-optimal performance as the the optimizer relies on these statistics 
to estimate the number of rows affected by 
queries and to choose the most efficient execution plan

By updating statistics, you provide the query optimizer with accurate 
information about the distribution of data values in columns, enabling it to make 
better decisions when generating query execution plans. 
This, in turn, can lead to faster query performance.

*/

-- SQL Server syntax
UPDATE STATISTICS table_or_indexed_view_name [ WITH [ FULLSCAN | SAMPLE number { PERCENT | ROWS } ] ]

GO;

-- Update statistics for the Users table in SQL Server
UPDATE STATISTICS Users; -- updates the statistics for the entire Users table.

GO;

-- Update statistics using sampling 
UPDATE STATISTICS Users WITH SAMPLE 50 PERCENT; -- Statistics should be updated using a sample comprising 50% of the rows in the Users table

GO;

-- Update statistics using ROWS option 
UPDATE STATISTICS Users WITH SAMPLE 100 ROWS; -- Statistics should be updated using a sample of 100 rows from the Users table

GO;

-- Update statistics with a full scan 
UPDATE STATISTICS Users WITH FULLSCAN; -- Statistics should be updated by scanning all rows in the Users table.

GO;

/*

Please note : If you are not specifying the WITH FULLSCAN, then the oquery engine will decide 
wheather it will go for full table scan or not based on the data present

SQL Server's auto-update statistics feature will automatically update statistics based on changes in data,

We can still apply the command whenever it is needed

*/

