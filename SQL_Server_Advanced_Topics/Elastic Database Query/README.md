# Elastic Database Query in Azure SQL Databases

## Overview
Elastic Database Query is an Azure SQL Database feature that allows you to query and join data from multiple databases. Rather than using the traditional three-part naming convention (i.e., `Server.Database.Schema.Object`) that is common in on-premises SQL Server environments, Elastic Database Query provides a data virtualization layer that enables you to work with external tables.

## Key Benefits
- **Cross-Database Querying:** Enables running queries that combine data from multiple Azure SQL Databases.
- **Data Virtualization:** External tables make remote data appear as if it were part of the local database.
- **Read-Only Operations:** Primarily designed for reporting and analytical queries where data modifications are not required.
  
