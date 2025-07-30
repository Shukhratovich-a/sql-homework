-- 1.
CREATE TABLE Employees (
    EmpID INT IDENTITY(1, 1) PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Position VARCHAR(100),
    Salary DECIMAL(10, 2),
    HireDate DATE
);

INSERT INTO 
    Employees (FirstName, LastName, Position, Salary, HireDate)
VALUES
    ('Alice', 'Johnson', 'Manager', 75000.00, '2020-03-15'),
    ('Bob', 'Smith', 'Developer', 60000.00, '2021-06-01'),
    ('Carol', 'Davis', 'Designer', 58000.00, '2019-11-23'),
    ('David', 'Wilson', 'Developer', 61000.00, '2022-01-10'),
    ('Eva', 'Brown', 'QA Engineer', 55000.00, '2020-09-30'),
    ('Frank', 'Miller', 'Support', 50000.00, '2021-04-05');

SELECT TOP 5 
    *
FROM
    Employees;

-- 2.
CREATE TABLE Products (
    ProductID INT IDENTITY(1, 1) PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10, 2)
);

INSERT INTO 
    Products (ProductName, Category, Price) 
VALUES
    ('Laptop', 'Electronics', 1200.00),
    ('Smartphone', 'Electronics', 800.00),
    ('Desk Chair', 'Furniture', 150.00),
    ('Coffee Table', 'Furniture', 200.00),
    ('Notebook', 'Stationery', 3.00),
    ('Pen', 'Stationery', 1.50),
    ('Headphones', 'Electronics', 100.00);

SELECT DISTINCT 
    Category
FROM
    Products;

-- 3.
SELECT 
    *
FROM
    Products
WHERE
    Price > 100;

-- 4.
CREATE TABLE Customers (
    CustomerID INT IDENTITY(1, 1) PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100)
);

INSERT INTO
    Customers (FirstName, LastName, Email)
VALUES
    ('Alice', 'Johnson', 'alice@example.com'),
    ('Bob', 'Smith', 'bob@example.com'),
    ('Amanda', 'Clark', 'amanda@example.com'),
    ('Daniel', 'Lee', 'daniel@example.com'),
    ('Andrew', 'Davis', 'andrew@example.com');

SELECT
    *
FROM
    Customers
WHERE
    FirstName LIKE 'A%';

-- 5.
SELECT 
    *
FROM
    Products
ORDER BY
    Price ASC;

-- 6.
SELECT
    *
FROM
    Employees
ORDER BY
    Salary >= 60000 and Department = 'HR';

-- 7.
ALTER TABLE
    Employees
ADD 
    Email VARCHAR(100);

UPDATE
    Employees
SET
    Email = NULL
WHERE
    EmpID IN (1, 2);

UPDATE
    Employees
SET
    Email = 'david@example.com'
WHERE EmpID = 4;

SELECT
    EmpID,
    FirstName,
    LastName,
    ISNULL(Email, 'noemail@example.com') AS Email
FROM
    Employees;

-- 8.
SELECT
    *
FROM
    Products
WHERE
    Price BETWEEN 50 AND 100;

-- 9.
SELECT DISTINCT
    Category, ProductName
FROM
    Products;

-- 10.
SELECT DISTINCT
    Category, ProductName
FROM
    Products
ORDER BY
    ProductName DESC;

-- 11.
SELECT TOP 10
    *
FROM
    Products
ORDER BY
    Price DESC;

-- 12.
SELECT 
    EmpID,
    COALESCE(FirstName, LastName) AS Name
FROM
    Employees;

-- 13.
SELECT DISTINCT
    Category, Price
FROM
    Products;

-- 14.
SELECT
    *
FROM
    Employees
WHERE
    (Age BETWEEN 30 AND 40) OR Department = 'Marketing';

-- 15.
SELECT
    *
FROM
    Employees
ORDER BY
    Salary DESC
OFFSET
    10 ROWS
FETCH NEXT
    10 ROWS ONLY;

-- 16.
SELECT
    *
FROM
    Products
WHERE
    Price <= 1000 AND Stock > 50
ORDER BY
    Stock ASC;

-- 17.
SELECT 
    *
FROM
    Products
WHERE
    ProductName LIKE '%e%';