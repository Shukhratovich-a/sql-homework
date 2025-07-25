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

-- 6.
alter table
    products
add constraint
    uq_productName unique(productName);