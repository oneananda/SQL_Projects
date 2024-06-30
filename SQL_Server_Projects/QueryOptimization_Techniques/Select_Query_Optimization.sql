/*

Select Query Optimization

Let's create the following tables Orders and Customers to demonsrtate SARGable (Search ARGument-able) implementation

We have created two tables: Orders and Customers.
The Orders table includes OrderID, OrderDate, and CustomerID.
The Customers table includes CustomerID, FirstName, and LastName.
Sample data has been inserted into both tables, with some CustomerID matching 
the last name 'Smith' in the Customers table.

Execute the SQL here : https://onecompiler.com/sqlserver/42hn5bdxm

*/

-- Create Orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    OrderDate DATE,
    CustomerID INT
);


-- Create Customers table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50)
);



-- Insert sample data into Orders table
INSERT INTO Orders (OrderID, OrderDate, CustomerID)
VALUES
(1, '2024-06-28', 1),
(2, '2024-06-27', 2),
(3, '2024-06-26', 3),
(4, '2024-06-25', 4),
(5, '2024-06-24', 5),
(6, '2024-06-23', 1),
(7, '2024-06-22', 2),
(8, '2024-06-21', 3),
(9, '2024-06-20', 4),
(10, '2024-06-19', 5);



-- Insert sample data into Customers table
INSERT INTO Customers (CustomerID, FirstName, LastName)
VALUES
(1, 'John', 'Smith'),
(2, 'Jane', 'Smith'),
(3, 'Michael', 'Jane'),
(4, 'Emily', 'Jane'),
(5, 'David', 'Smith');


-- Non-optimized query example
SELECT *
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
WHERE c.LastName LIKE '%Smith%';


/*

Reason 1 : SELECT * should not be in the query, fetch only what is needed
Selecting Unnecessary Columns: Using SELECT * fetches all columns from both the Orders and Customers tables, even if they are not needed. 
This increases the amount of data transferred and processed unnecessarily.

Reason 2 : c.LastName LIKE '%Smith%' - Like is applied to search all the contents, this may prove costlier if more records are available
Non-SARGable LIKE Clause: The LIKE '%Smith%' clause is not SARGable (Search ARGument-able), meaning it cannot fully utilize indexes efficiently. 
This can result in a table scan rather than an index seek or scan, impacting performance

*/

-- Optimized query example
SELECT o.OrderID, o.OrderDate, c.FirstName, c.LastName
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
WHERE c.LastName LIKE 'Smith%';






