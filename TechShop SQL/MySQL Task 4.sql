USE Techshop;

-- Q1: Customers who haven't placed an order
SELECT CustomerID, FirstName, LastName, Phone, Email
FROM Customers
WHERE CustomerID NOT IN (SELECT CustomerID FROM Orders);


-- Q2: Total Number of Products currently for sale
SELECT P.ProductName, SUM(I.QuantityInStock) AS TotalQuantity
FROM Inventory AS I
INNER JOIN Products AS P ON I.ProductID = P.ProductID
GROUP BY P.ProductName;


-- Q3: Total Revenue Generated by Techshop
SELECT SUM(TotalAmount) AS Revenue
FROM Orders;


-- Q4: Schema Inconsistency - Category column not mentioned in schema


-- Q5: Revenue from a certain Customer
SELECT SUM(TotalAmount) AS Revenue
FROM Orders
WHERE CustomerID = 3;


-- Q6: Most orders Placed
SELECT FirstName, LastName, COUNT(O.OrderID) AS OrderQty
FROM Customers AS C 
JOIN Orders AS O ON C.CustomerID = O.CustomerID
GROUP BY C.FirstName, C.LastName
ORDER BY OrderQty DESC;


-- Q7: Product with the most Quantity Ordered
SELECT P.ProductName, SUM(OD.Quantity) AS TotalQuantityOrdered
FROM OrderDetails OD
JOIN Products P ON OD.ProductID = P.ProductID
GROUP BY P.ProductName
ORDER BY TotalQuantityOrdered DESC
LIMIT 1;


-- Q8: Find the Customer with the highest spend
SELECT C.FirstName, C.LastName, SUM(O.TotalAmount) AS Spend
FROM Customers AS C 
JOIN Orders AS O ON C.CustomerID = O.CustomerID
GROUP BY C.FirstName, C.LastName
ORDER BY Spend DESC
LIMIT 1;


-- Q9: Average Order Value from each Customer
SELECT CustomerID, AVG(TotalAmount) AS AverageOrderValue
FROM Orders
GROUP BY CustomerID
ORDER BY AverageOrderValue DESC;


-- Q10: Count all Orders placed by each Customer
SELECT C.FirstName, 
       C.LastName, 
       COUNT(O.OrderID) AS OrderCount
FROM Customers C
LEFT JOIN Orders O ON C.CustomerID = O.CustomerID
GROUP BY C.FirstName, C.LastName
ORDER BY OrderCount DESC;
