# SQL Server Partitioning

Partitioning in SQL Server is the methodology which divides larger tables to smaller logical ones.

Each partition can be managed and queried independently, which can improve performance, simplify maintenance, and optimize storage.

## How Partitioning Works

### Partition Function: 

Defines how the rows of a table or index are mapped to partitions based on the values of a specified column (often a date or a range of values). For example, you can create partitions based on yearly data.

### Partition Scheme: 

Maps the partitions defined by the partition function to filegroups. Each filegroup can be stored on different physical disks, allowing for better I/O performance.

### Creating a Partitioned Table or Index: 

When creating a table or index, you can specify the partition scheme to use. SQL Server will then store data according to the partitions defined by the partition function and scheme.

