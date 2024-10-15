/* This query aims to fetch the list of customers, their respective 
orders as well as the total quanity of items purchased
using the Inner Join with SUM */

SELECT Orders.OrderID, Customers.CustomerID, SUM(OrderDetails.Quantity) AS TotalQuantity FROM Orders
INNER JOIN Customers
ON Orders.CustomerID = Customers.CustomerID
INNER JOIN OrderDetails
ON Orders.OrderID = OrderDetails.OrderID
GROUP BY Orders.OrderID, Customers.CustomerID
LIMIT 20;


/* 2. This query list our all the product name
from the prodcut with their repective company name production
 and its maximum quantity using Left Join with MAX */
SELECT Products.ProductName, Suppliers.CompanyName, MAX(OrderDetails.Quantity) AS MaxQuantity
FROM Products 
LEFT JOIN Suppliers 
ON Products.SupplierID = Suppliers.SupplierID 
LEFT JOIN OrderDetails 
ON Products.ProductID = OrderDetails.ProductID 
GROUP BY Products.ProductName, Suppliers.CompanyName 
LIMIT 20;

/* 3. This query show's the employee last name and the minimum unit price for each order
handled by each employee and also the order date */

SELECT Employees.LastName, Orders.OrderDate, MIN(OrderDetails.UnitPrice) AS MinPrice FROM Orders
RIGHT JOIN Employees
ON Orders.EmployeeID = Employees.EmployeeID
RIGHT JOIN OrderDetails
ON Orders.OrderID = OrderDetails.OrderID
GROUP BY Employees.LastName, Orders.OrderDate
LIMIT 20;


/* 4. This query shows the number of products based on the category */
SELECT Categories.CategoryName, COUNT(Products.ProductID) AS NumberOfProducts
FROM Categories
INNER JOIN Products
ON Categories.CategoryID = Products.CategoryID
GROUP BY Categories.CategoryName
LIMIT 20;

/* 5. This query calculate the total sales order value for each order
as per the company name irrespective of the products ordered*/
SELECT Orders.OrderID,Customers.CompanyName,SUM(OrderDetails.UnitPrice*OrderDetails.Quantity)AS TotalOrderValue
FROM Orders
LEFT JOIN Customers
ON Orders.CustomerID = Customers.CustomerID
LEFT JOIN OrderDetails
ON Orders.OrderID = OrderDetails.OrderID
GROUP BY Orders.OrderID, Customers.CompanyName
LIMIT 20;

/* 6. This query shows the avergae price for each product name */
SELECT Products.ProductName, AVG(OrderDetails.UnitPrice) AS AveragePrice
FROM Products
INNER JOIN OrderDetails
ON Products.ProductID = OrderDetails.ProductID
GROUP BY Products.ProductName
LIMIT 20;

/* 7. The aim of this query was to show the names of customers that made orders
between 1997/01/01 and 1997/12/31 which basically for the whole year of 1997*/

SELECT Orders.OrderID, Orders.OrderDate, Customers.customerName
FROM Orders
INNER JOIN Customers
ON Orders.CustomerID = Customers.CustomerID
WHERE Orders.OrderDate BETWEEN '1997-01-01' AND '1997-12-31'
LIMIT 20;


/* 8. This query calculates the number of orders by each
employee alongside the total quantity of order*/
SELECT Employees.LastName, COUNT(Orders.OrderID) AS NumberOfOrders,SUM(OrderDetails.Quantity) AS TotalQuantity
FROM Employees
LEFT JOIN Orders
ON Employees.EmployeeID = Orders.EmployeeID
LEFT JOIN OrderDetails
ON Orders.OrderID = OrderDetails.OrderID
GROUP BY Employees.LastName
LIMIT 20;

/* 9. This query shows product that do not have categories assigned
showing the product name and category name as NULL*/
SELECT Products.ProductName, Categories.CategoryName
FROM Products
RIGHT JOIN Categories
ON Products.CategoryID = Categories.CategoryID
WHERE Products.ProductID IS NULL
LIMIT 20;

/* 10. This query shows presents the total sales for each order 
where the quantity of each order is greater than 10*/
SELECT Orders.OrderID, SUM(OrderDetails.Quantity * OrderDetails.UnitPrice) AS TotalSales FROM Orders
INNER JOIN OrderDetails
ON Orders.OrderID = OrderDetails.OrderID
WHERE OrderDetails.Quantity > 10
GROUP BY Orders.OrderID
LIMIT 20;

/* 11. This query calculates and presents both the maximum and minimum unit prices
for each products as supplied by each supplier and having the supplier name displayed. */
SELECT Suppliers.CompanyName, MAX(Products.UnitPrice) AS MaxPrice, MIN(Products.UnitPrice) AS MinPrice 
FROM Suppliers
LEFT JOIN Products
ON Suppliers.SupplierID = Products.SupplierID
GROUP BY Suppliers.CompanyName
LIMIT 20;

/* 12. TThis query counts the number of product
and sums of the total units in stock for each category while displaying the category name. */
SELECT Categories.CategoryName, COUNT(Products.ProductID) AS NumberOfProducts, SUM(Products.UnitsInStock) AS TotalStock
FROM Categories
RIGHT JOIN Products
ON Categories.CategoryID = Products.CategoryID
GROUP BY Categories.CategoryName
LIMIT 20;

/* 13. This query fetches unique combinations of country
and OrderID from customers who have placed orders respectively. */
SELECT DISTINCT Customers.Country, Orders.OrderID
FROM Customers
INNER JOIN Orders 
ON Customers.CustomerID = Orders.CustomerID
LIMIT 20;

/* 14. This query allow us to calculates the total quantity ordered and the average unit price for each order,
while displaying the OrderID and ContactName of the customer */
SELECT Orders.OrderID, Customers.customerName, SUM(OrderDetails.Quantity) AS TotalQuantity, AVG(OrderDetails.UnitPrice) AS AveragePrice
FROM Orders
LEFT JOIN Customers 
ON Orders.CustomerID = Customers.CustomerID 
LEFT JOIN OrderDetails 
ON Orders.OrderID = OrderDetails.OrderID
GROUP BY Orders.OrderID, Customers.customerName
LIMIT 20;

/* 15. This query aims to counts the number of orders handled by each employee
 and calculates the total sales value for orders placed after January 1, 1998, 
 displaying the employee's first and last names.*/
SELECT Employees.FirstName, Employees.LastName, COUNT(Orders.OrderID) AS OrdersHandled, SUM(OrderDetails.Quantity * OrderDetails.UnitPrice) AS SalesValue
FROM Employees 
INNER JOIN Orders 
ON Employees.EmployeeID = Orders.EmployeeID
INNER JOIN OrderDetails
ON Orders.OrderID = OrderDetails.OrderID
WHERE Orders.OrderDate >= '1998-01-01'
GROUP BY Employees.FirstName, Employees.LastName
LIMIT 20;

/* 16. This query calculates the total quantity ordered by each customer
and filters to show only those who ordered more than 100 units in total. */
SELECT Customers.CustomerID, SUM(OrderDetails.Quantity) AS TotalQuantityOrdered
FROM Customers
RIGHT JOIN Orders
ON Customers.CustomerID = Orders.CustomerID
RIGHT JOIN OrderDetails
ON Orders.OrderID = OrderDetails.OrderID
GROUP BY Customers.CustomerID
HAVING TotalQuantityOrdered > 100
LIMIT 20;

/* 17. This query fetches the product name, supplier company name, and category name for each product,
linking products to their suppliers and categories.*/
SELECT Products.ProductName, Suppliers.CompanyName, Categories.CategoryName FROM Products
INNER JOIN Suppliers
ON Products.SupplierID = Suppliers.SupplierID
INNER JOIN Categories
ON Products.CategoryID = Categories.CategoryID 
LIMIT 20;

/* 18. This query retrieves the count number of products and sums the total units
on order for each category where there are units on order greater than 0*/
SELECT Categories.CategoryName, COUNT(Products.ProductID) AS NumberOfProducts, SUM(Products.UnitsOnOrder) AS TotalUnitsOnOrder
FROM Categories
LEFT JOIN Products
ON Categories.CategoryID = Products.CategoryID
WHERE Products.UnitsOnOrder > 0
GROUP BY Categories.CategoryName
LIMIT 20;

/* 19.This query counts the number of orders and calculates the total order blue 
for each customer from the USA, showing the customer’s name.*/
SELECT Customers.CustomerName, COUNT(Orders.OrderID) AS OrdersCount, SUM(OrderDetails.Quantity * OrderDetails.UnitPrice) AS TotalValue
FROM Customers INNER JOIN Orders 
ON Customers.CustomerID = Orders.CustomerID
INNER JOIN OrderDetails
ON Orders.OrderID = OrderDetails.OrderID
WHERE Orders.ShipCountry = 'USA'
GROUP BY Customers.Customername LIMIT 20;

/* 20. This query calculates the subtotal (which is the quantity * unit price) for each order,
displaying the orderID,companyname of the customer and the subtotal.*/
SELECT Orders.OrderID, Customers.CompanyName, SUM(OrderDetails.Quantity * OrderDetails.UnitPrice) AS Subtotal
FROM Orders RIGHT JOIN Customers
ON Orders.CustomerID = Customers.CustomerID
RIGHT JOIN OrderDetails
ON Orders.OrderID = OrderDetails.OrderID
GROUP BY Orders.OrderID, Customers.CompanyName
LIMIT 20;

