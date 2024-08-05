CREATE TABLE Sales (
    SalesID int,
    ProductID int,
    SalesAmount money,
    SalesDate datetime
);

-- Create a clustered columnstore index
CREATE CLUSTERED COLUMNSTORE INDEX IX_Sales
ON Sales;
