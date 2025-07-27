-- 1.
-- BULK INSERT is a Transact-SQL (T-SQL) command in SQL Server used to quickly import large amounts of data from a text file (like .txt or .csv) into a SQL Server table.

-- 2.
-- csv, txt, json, xml

-- 3.
create table products (
    productId int primary key,
    productName varchar(50),
    price decimal(10, 2)
);

-- 4.
insert into
    products
values
    (1, 'laptop', 1000),
    (2, 'iphone', 1000),
    (3, 'coffee', 1000);

-- 5.
-- NULL means a column can have no value (empty or unknown), while NOT NULL means the column must always have a value. NULL allows missing data; NOT NULL enforces required data

create table students (
    id INT,
    email VARCHAR(100) null
); -- the email can be empty or unknown

create table teachers (
    id INT,
    name VARCHAR(100) null
); -- name can't be empty

-- 6.
alter table
    products
add constraint
    uq_productName unique(productName);

-- 7.
-- This query selects the top 5 highest-paid employees from the Employees table
select top 2 
    productName
from 
    products
order by
    productId desc;

-- 8.
alter table
    products
add 
    categoryId int;

-- 9.
create table categories (
    categoryId int primary key,
    categoryName varchar(100) unique
);

-- 10.
-- The IDENTITY column in SQL Server is used to create an auto-incrementing numeric column, typically for primary keys.
create table users (
    userId int identity(1,1) primary key,
    userName varchar(100)
);

-- 11.
-- data format
-- 4,Keyboard,45.99,
-- 5,Mouse,25.50,
-- 6,Monitor,150.00,
-- 

bulk insert
    products
from 
    'C:\Users\shukh\Desktop\maab\lesson-3\product_data.txt'
with (
    fieldterminator = ',',
    rowterminator = '\n',
    firstrow = 0
);

-- 12.
alter table
    products
add constraint
    fk_products_categories
foreign key
    (categoryId)
references
    categories(categoryId);

-- 13.
-- A primary key uniquely identifies each row, doesn't allow NULL, and only one is allowed per table.
-- A unique key also enforces uniqueness but allows NULL values and you can have multiple unique keys in a table.

-- 14.
alter table
    products
add constraint
    chk_price_positive
check
    (price > 0);

-- 15.
alter table
    products
add 
    stock int not null default 0;

-- 16.
select 
    productName, isnull(price, 1) as price, categoryID
from 
    products;

-- 17.
-- A FOREIGN KEY constraint in SQL Server is used to enforce a relationship between two tables. It ensures that the value in one table (child) must match a value in another table (parent), maintaining referential integrity.

-- 18.
craete table customers (
    customerId int primary key,
    fullName varchar(100),
    age int,
    constraint chk_customer_age check (age >= 18)
);

-- 19.
create table orders (
    orderId int identity(100, 10) primary key,
    customerName varchar(100)
);

-- 20.
create table orderDetails (
    orderId int,
    productId int,
    quantity int,
    constraint pk_order_details primary key (orderId, productId)
);

-- 21.
-- ISNULL and COALESCE are used to handle NULL values in SQL Server.

-- ISNULL(expr, value): Replaces NULL with a given value.
-- Example: ISNULL(Phone, 'No phone')

-- COALESCE(expr1, expr2, ...): Returns the first non-NULL value from the list.
-- Example: COALESCE(Phone, Email, 'No contact')

-- Difference:

-- ISNULL takes 2 arguments.

-- COALESCE can take many and follows data type precedence.

-- Used to avoid displaying or working with NULLs in results.

-- 22.
create table employees (
    empId int primary key,
    fullName varchar(100),
    email varchar(100) unique
);

-- 23.
create table departments (
    deptId int primary key,
    deptName varchar(100)
);

alter table
    employees
add
    deptId int;

alter table 
    employees
add constraint
    fk_employees_departments
foreign key
    (deptId)
references
    departments(deptId)
on delete cascade
on update cascade;