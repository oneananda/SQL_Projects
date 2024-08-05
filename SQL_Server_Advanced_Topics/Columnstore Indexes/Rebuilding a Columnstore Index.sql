-- Rebuild a clustered columnstore index
ALTER INDEX IX_Sales
ON Sales
REBUILD;
