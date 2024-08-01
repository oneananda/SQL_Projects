USE InMemoryDb;
GO

-- Create a memory-optimized table
CREATE TABLE dbo.MemoryOptimizedTable
(
    Id INT NOT NULL PRIMARY KEY NONCLUSTERED,
    Name NVARCHAR(50) NOT NULL,
    Quantity INT NOT NULL,
    Price DECIMAL(10, 2) NOT NULL
) WITH (MEMORY_OPTIMIZED = ON, DURABILITY = SCHEMA_AND_DATA);
GO
