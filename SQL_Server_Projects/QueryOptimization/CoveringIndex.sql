/*
Covering Index : If all the column mentioned in the index is satisfying the search query, then the query engine will not search further
This will increase the performance 
https://stackoverflow.com/questions/609343/what-are-covering-indexes-and-covered-queries-in-sql-server
*/

-- Simple index

CREATE INDEX idx_customer_lastname ON Customers (LastName);


-- Covering Index

CREATE INDEX idx_order_covering ON Orders (CustomerId, OrderDate) INCLUDE (OrderAmount);
