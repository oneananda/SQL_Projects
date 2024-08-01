# In-Memory OLTP (Hekaton) Example (Under development)

This repository contains an example of using In-Memory OLTP (Hekaton) in SQL Server to optimize transaction processing performance. It demonstrates how to enable In-Memory OLTP, create memory-optimized tables, and use natively compiled stored procedures.

## Prerequisites

- SQL Server 2014 or later
- SQL Server Management Studio (SSMS)

## Steps

### 1. Enable In-Memory OLTP

First, ensure your database is enabled for In-Memory OLTP by creating a new database and configuring it to use a memory-optimized filegroup.

### 2. Create a Memory-Optimized Table

Create a memory-optimized table in the newly created database. This table will be designed to take advantage of In-Memory OLTP features for high performance.

### 3. Insert Data into the Memory-Optimized Table

Insert sample data into the memory-optimized table to see how it performs with basic transaction operations.

### 4. Select Data from the Memory-Optimized Table

Query the memory-optimized table to verify that data has been correctly inserted and can be retrieved efficiently.

### 5. Create a Natively Compiled Stored Procedure

Create a stored procedure that is natively compiled to further optimize performance for transactional operations. This procedure will demonstrate how to insert data into the memory-optimized table.

### 6. Execute the Natively Compiled Stored Procedure

Run the stored procedure to insert new data into the memory-optimized table and verify that the operations are performed quickly and efficiently.

## Additional Information

In-Memory OLTP (Hekaton) is a feature in SQL Server designed to improve the performance of transaction processing workloads. It achieves this by keeping data in memory and using optimized data structures and algorithms. This example demonstrates the basic usage of In-Memory OLTP, but it can be extended to more complex scenarios.

For more details, please refer to the [official documentation](https://docs.microsoft.com/en-us/sql/relational-databases/in-memory-oltp/overview-and-usage-scenarios) for In-Memory OLTP.
