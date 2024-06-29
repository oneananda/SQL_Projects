/*

This script will mainly used when Query Optimization is required

*/

-- Enable execution plans to be shown
SET SHOWPLAN_TEXT ON;


-- Query to view with execution plan
SELECT * FROM Sales.Orders
WHERE OrderDate = '2023-01-01';


-- Disable the display of execution plans
SET SHOWPLAN_TEXT OFF;