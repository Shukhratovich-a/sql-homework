-- 1.
SELECT
	p.ProductName, s.SupplierName
FROM
	Products p
CROSS JOIN
	Suppliers s;

-- 2.
SELECT
	d.DepartmentName, e.Name
FROM
	Departments d
CROSS JOIN
	Employees e;

-- 3.
SELECT
	s.SupplierName, p.ProductName
FROM
	Products p
JOIN
	Suppliers s
ON
	p.SupplierID = s.SupplierID;

-- 4.
SELECT
	c.FirstName, c.LastName, o.OrderID
FROM
	Customers c
JOIN
	Orders o
ON
	c.CustomerID = o.CustomerID;

-- 5.
SELECT
	s.Name, c.CourseName
FROM
	Students s
CROSS JOIN
	Courses c;

-- 6.
SELECT
	p.ProductName, o.OrderID
FROM
	Products p
JOIN
	Orders o
ON
	p.ProductID = o.ProductID;

-- 7.
SELECT
	e.Name, d.DepartmentName
FROM
	Employees e
JOIN
	Departments d
ON
	e.DepartmentID = d.DepartmentID;

-- 8.
SELECT
	s.Name, e.CourseID
FROM
	Students s
JOIN
	Enrollments e
ON
	s.StudentID = e.StudentID;

-- 9.
SELECT
	o.OrderID, p.PaymentID, p.Amount
FROM
	Orders o
JOIN
	Payments p
ON
	o.OrderID = p.OrderID;

-- 10.
SELECT
	o.OrderID, p.ProductName, p.Price
FROM
	Orders o
JOIN
	Products p
ON
	o.ProductID = p.ProductID
WHERE
	p.Price > 100;

-- 11.
SELECT
	e.Name, d.DepartmentName
FROM
	Employees e
CROSS JOIN
	Departments d
WHERE
	e.DepartmentID <> d.DepartmentID;

-- 12.
SELECT
	o.OrderID, p.ProductName, o.Quantity, p.StockQuantity
FROM
	Orders o
JOIN
	Products p
ON
	o.ProductID = p.ProductID
WHERE
	o.Quantity > p.StockQuantity;

-- 13.
SELECT
	c.FirstName, c.LastName, s.ProductID
FROM
	Customers c
JOIN
	Sales s
ON
	c.CustomerID = s.CustomerID
WHERE
	s.SaleAmount  >= 500;