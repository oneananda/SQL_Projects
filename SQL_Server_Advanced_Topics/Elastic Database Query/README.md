# Elastic Database Query in Azure SQL Databases

## Overview
Elastic Database Query is an Azure SQL Database feature that allows you to query and join data from multiple databases. Rather than using the traditional three-part naming convention (i.e., `Server.Database.Schema.Object`) that is common in on-premises SQL Server environments, Elastic Database Query provides a data virtualization layer that enables you to work with external tables.

## Key Benefits
- **Cross-Database Querying:** Enables running queries that combine data from multiple Azure SQL Databases.
- **Data Virtualization:** External tables make remote data appear as if it were part of the local database.
- **Read-Only Operations:** Primarily designed for reporting and analytical queries where data modifications are not required.
  
## Prerequisites
Before setting up Elastic Database Query, ensure that:
- You have an Azure SQL Database account.
- Necessary firewall rules and network security configurations are in place.
- A MASTER KEY is created on your database (if not already present).

## Setup Steps

### 1. Create a MASTER KEY
A master key is required to secure sensitive credential data:
```sql
CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'YourStrongPassword!';
```

### 2. Create a Database-Scoped Credential
This credential is used to authenticate against the remote database:
```sql
CREATE DATABASE SCOPED CREDENTIAL ElasticDBQueryCred
WITH IDENTITY = 'db_user',  -- Replace with the remote database username
     SECRET = 'UserPassword!';  -- Replace with the remote database password
```

### 3. Create an External Data Source
Define an external data source pointing to the remote database:
```sql
CREATE EXTERNAL DATA SOURCE RemoteDBSource
WITH (
    TYPE = RDBMS,
    LOCATION = 'yourserver.database.windows.net',  -- The remote server name
    DATABASE_NAME = 'RemoteDatabase',                -- The remote database name
    CREDENTIAL = ElasticDBQueryCred
);
```

### 4. Create an External Table
Map a table from the remote database into your local database:
```sql
CREATE EXTERNAL TABLE dbo.ExternalTable
(
    Id INT,
    Name NVARCHAR(100),
    CreatedDate DATETIME
)
WITH (
    DATA_SOURCE = RemoteDBSource,
    SCHEMA_NAME = 'dbo',         -- The schema on the remote database
    OBJECT_NAME = 'RemoteTable'  -- The table name on the remote database
);
```

### 5. Querying the Data
Once the external table is created, you can write T-SQL queries that join data from your local tables with the external table:
```sql
SELECT l.Id, l.LocalColumn, r.Name
FROM LocalTable l
JOIN dbo.ExternalTable r ON l.Id = r.Id;
```

## Considerations and Limitations
- **Read-Only Data Access:** External tables accessed via Elastic Database Query are primarily read-only. For scenarios that require data modifications, consider alternative approaches like data integration services.
- **Performance:** Distributed queries can have different performance characteristics compared to local queries, so testing and query optimization are important.
- **Transactional Support:** Elastic Database Query is best suited for analytics and reporting, as distributed transactions have some limitations.
- **Security:** Ensure secure handling of credentials, and maintain proper configurations for firewall and network settings.

## Alternatives
- **Azure SQL Managed Instance:** If your environment supports it, cross-database queries on an Azure SQL Managed Instance can be performed using traditional three-part naming, without requiring Elastic Database Query.

## Conclusion

Elastic Database Query offers a flexible, read-only approach to combining data across multiple Azure SQL Databases. It's an effective solution for environments needing to integrate and analyze data distributed across various databases while maintaining security and manageability in the cloud.

For more detailed documentation and the latest best practices, refer to the official Microsoft documentation on [Elastic Database Query](https://learn.microsoft.com/en-us/azure/azure-sql/database/elastic-query-overview).

---
