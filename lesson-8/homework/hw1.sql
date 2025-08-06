-- 1.
SELECT
	Category,
	COUNT(*) AS Available
FROM
	Products
GROUP BY
	Category;

-- 2.
SELECT
	AVG(Price) AS AveragePrice
FROM
	Products
WHERE
	Category = 'Electronics';

-- 3.
SELECT
	*
FROM
	Customers
WHERE
	City LIKE('L%');

-- 4.
SELECT
	*
FROM
	Products
WHERE
	ProductName LIKE('%er');

-- 5.
SELECT
	*
FROM
	Customers
WHERE
	Country LIKE('%a');

-- 6.
SELECT
	MAX(Price) AS MaxPrice
FROM
	Products;

-- 7.
SELECT
	*,
	IIF(StockQuantity < 30, 'Low Stock', 'Sufficient') AS Status
FROM
	Products;

-- 8.
SELECT
	Country,
	COUNT(*) AS Total
FROM
	Customers
GROUP BY
	Country;

-- 9.
SELECT
	MIN(Quantity) AS MinQuantity,
	MAX(Quantity) AS MaxQuantity
FROM
	Orders;

-- 10.
SELECT DISTINCT
	o.CustomerID
FROM
	Orders o
LEFT JOIN
	Invoices i
ON
	o.CustomerID = i.CustomerID AND i.InvoiceDate BETWEEN '2023-01-01' AND '2023-01-31'
WHERE 
	o.OrderDate BETWEEN '2023-01-01' AND '2023-01-31' AND i.InvoiceID IS NULL;

-- 11.
SELECT 
	ProductName
FROM
	Products
UNION ALL SELECT
	ProductName
FROM
	Products_Discounted;

-- 12.
SELECT 
	ProductName
FROM
	Products
UNION SELECT
	ProductName
FROM
	Products_Discounted;

-- 13.
SELECT 
    YEAR(OrderDate) AS OrderYear,
    AVG(TotalAmount) AS AvgOrderAmount
FROM
	Orders
GROUP BY
	YEAR(OrderDate)
ORDER BY
	OrderYear;

-- 14.
SELECT 
    ProductName,
    CASE 
        WHEN Price < 100 THEN 'Low'
        WHEN Price BETWEEN 100 AND 500 THEN 'Mid'
        ELSE 'High'
    END AS PriceGroup
FROM
	Products;

-- 15.
SELECT 
	district_id,
	district_name,
	[2012] AS Population_2012,
	[2013] AS Population_2013
INTO 
	Population_Each_Year
FROM 
	(
		SELECT 
			district_id,
			district_name,
			year,
			population
		FROM
			city_population
	) AS SourceTable
PIVOT 
	(
		SUM(population)
			FOR year IN ([2012], [2013])
	) AS PivotResult;

-- 16.
SELECT 
    ProductID,
    SUM(SaleAmount) AS TotalSales
FROM
	Sales
GROUP BY
	ProductID
ORDER BY
	ProductID;

-- 17.
SELECT
	ProductName
FROM
	Products
WHERE
	ProductName LIKE '%oo%';

-- 18.
SELECT 
    year,
    [Bektemir],
    [Chilonzor],
    [Yakkasaroy]
INTO
	Population_Each_City
FROM
	(
		SELECT
			district_name, year, population
		FROM
			city_population
		WHERE 
			district_name IN ('Bektemir', 'Chilonzor', 'Yakkasaroy')
	) AS SourceTable
PIVOT
	(
		SUM(population) FOR district_name IN ([Bektemir], [Chilonzor], [Yakkasaroy])
	) AS PivotCity;

-- 19.
SELECT TOP 3
    CustomerID,
    SUM(TotalAmount) AS TotalSpent
FROM 
	Invoices
GROUP BY
	CustomerID
ORDER BY
	TotalSpent DESC;

-- 20.
SELECT 
    district_id,
    district_name,
    RIGHT(year, 4) AS year,
    population
FROM 
    Population_Each_Year
UNPIVOT
	(
		population FOR year IN ([Population_2012], [Population_2013])
	) AS UnpivotedResult;

-- 21.
SELECT 
    p.ProductName,
    COUNT(s.SaleID) AS TimesSold
FROM
	Sales s
JOIN
	Products p
ON
	s.ProductID = p.ProductID
GROUP BY
	p.ProductName
ORDER BY
	TimesSold DESC;

-- 22.
SELECT 
    district_name,
    year,
    population
FROM 
    Population_Each_City
UNPIVOT
	(
		population FOR district_name IN ([Bektemir], [Chilonzor], [Yakkasaroy])
	) AS UnpivotedResult;