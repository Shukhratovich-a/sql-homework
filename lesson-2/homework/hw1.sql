-- 1.
create table employees (
    empId int,
    name varchar(50),
    salary decimal(10, 2)
);

-- 2.
insert into 
    employees
values
    (1, 'John', 1200);

insert into
    employees
values
    (2, 'Snow', 1300),
    (3, 'Hodor', 1400);

-- 3.
update
    employees
set
    salary = 7000
where
    empId = 1;

-- 4.
delete from
    employees
where
    empId = 2;

-- 5.
-- DELETE - removes records from a table;
-- TRUNCATE - removes all records from a table;
-- DROP - completely removes a table from database with related objects (indexes, constraints).

-- 6.
alter table
    employees
alter column
    name varchar(100);

-- 7.
alter table
    employees
add
    department varchar(50);

-- 8.
alter table
    employees
alter column
    salary float;

-- 9.
create table departments (
    departmentId int primary key,
    departmentName varchar(50)
);

-- 10.
truncate table employees;

-- 11.
insert into 
    departments
select
    1, 'front'
union all select
    2, 'back'
union all select
    3, 'dev'
union all select
    4, 'prod'
union all select
    5, 'hr';

-- 12.
update
    employees
set
    department = 'Management'
where
    salary > 5000;

-- 13.
truncate table employees;

-- 14.
alter table
    employees
drop column
    department;

-- 15.
exec sp_rename employees, StaffMembers;

-- 16.
drop table departments;

-- 17.
create table products (
    productId int primary key,
    productName varchar(256) not null,
    category varchar(64),
    price decimal (10,2) not null,
    manufacturer varchar(64)
);

-- 18.
alter table
    products
add constraint
    chk_price check (price > 0);

-- 19.
alter table
    products
add
    stockQuantity int default(50);

--20.
exec sp_rename 'products.category', 'productCategory';

-- 21.
insert into
    products
values
    (1, 'laptop', 'computers', 1100, 'asus', 15),
    (2, 'iphone', 'phones', 1200, 'asus', 12),
    (3, 'pc', 'computers', 1500, 'asus', 2),
    (4, 'airpods', 'headphones', 200, 'asus', 30),
    (5, 'rtx 4080', 'computers', 1000, 'asus', 5);

-- 22.
select 
    *
into
    products_backup 
from 
    products;

-- 23.
exec sp_rename products, inventory;

-- 24.
alter table
    inventory
drop constraint
    chk_price;

alter table
    inventory
alter column
    price float;

alter table
    inventory
add constraint
    chk_price check (price > 0);

-- 25.
alter table
    inventory
add
    productCode int identity(1000, 5);