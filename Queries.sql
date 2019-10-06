SELECT *
FROM Customers;
SELECT FirstName, LastName
FROM Customers;
SELECT FirstName, LastName
FROM Customers
WHERE CustomerID = 1;
UPDATE Customers
SET FirstName = 'Lerato', LastName = 'Mabitso'
WHERE CustomerID = 1;
DELETE FROM Customers
WHERE CustomerID = 2;
SELECT DISTINCT Status
FROM Orders;
SELECT COUNT(Status)
FROM Orders
WHERE Status = 'Not shipped' ;
SELECT COUNT(Status)
FROM Orders
WHERE Status = 'Shipped' ;
SELECT MAX(Amount) AS LargestPayment
FROM Payments;
SELECT *
FROM Customers
ORDER BY Country;
SELECT *
FROM Products
WHERE BuyPrice BETWEEN 100 AND 600;
SELECT *
FROM Customers
WHERE Country = 'Germany' AND City = 'Berlin';
SELECT *
FROM Customers
WHERE City = 'Durban' OR City = 'Cape Town';
SELECT *
FROM Products
WHERE BuyPrice > 500;
SELECT SUM(Amount)
FROM Payments;
SELECT COUNT(Status)
FROM Orders
WHERE Status = 'Shipped';
SELECT AVG(BuyPrice) 
FROM Products;
SELECT AVG(BuyPrice) / 12
FROM Products;
SELECT Payments.PaymentsID, Customers.FirstName,Customers.LastName
FROM Payments
INNER JOIN Customers ON Payments.CustomerID = Customers.CustomerID;
SELECT *
FROM Products
WHERE Description LIKE '%Turnable front wheel%';
