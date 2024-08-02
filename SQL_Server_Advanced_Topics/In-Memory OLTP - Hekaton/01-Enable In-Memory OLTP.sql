USE master;
GO

-- Create a new database
CREATE DATABASE InMemoryDb;
GO

-- Enable In-Memory OLTP
ALTER DATABASE InMemoryDb
ADD FILEGROUP InMemoryFileGroup CONTAINS MEMORY_OPTIMIZED_DATA;
GO

-- Add a file to the memory-optimized filegroup
ALTER DATABASE InMemoryDb
ADD FILE (NAME='InMemoryFile', FILENAME='C:\Data\InMemoryFile')
TO FILEGROUP InMemoryFileGroup;
GO
