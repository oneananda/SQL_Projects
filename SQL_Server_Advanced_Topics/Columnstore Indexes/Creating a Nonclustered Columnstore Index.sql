-- Create a nonclustered columnstore index
CREATE NONCLUSTERED COLUMNSTORE INDEX IX_Sales_NonClustered
ON Sales (ProductID, SalesAmount);
