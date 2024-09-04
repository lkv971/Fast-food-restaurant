CREATE SCHEMA Sales;
GO

SELECT Category, SUM(Price) AS TotalRevenue
FROM Sales.SalesDetails
GROUP BY Category
ORDER BY TotalRevenue DESC;


SELECT MenuItem, SUM(Price) AS TotalRevenue
FROM Sales.SalesDetails
GROUP BY MenuItem
ORDER BY TotalRevenue DESC;

SELECT MONTH(date) AS Month, SUM(Price) AS TotalRevenue
FROM Sales.SalesDetails
GROUP BY MONTH(date)
ORDER BY TotalRevenue DESC;
