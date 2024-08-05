-- Consider a table Sales with millions of rows. 
-- The following query calculates the total sales amount by product:

-- Query using a rowstore index
SELECT ProductID, SUM(SalesAmount)
FROM Sales
GROUP BY ProductID;