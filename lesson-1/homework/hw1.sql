-- EASY
-- 1. 
-- Data: Raw facts or values without context. For example, numbers, names, or dates. When organized, data becomes useful information.

-- Database: A structured collection of data stored electronically. It allows efficient storage, retrieval, and management of data.

-- Relational Database: A type of database where data is stored in tables with rows and columns. Relationships between tables are managed using primary and foreign keys.

-- Table: A basic structure in a relational database. It contains rows (records) and columns (fields). Each table stores data about one type of item (e.g., users, orders).

-- 2.
-- Data Management – Stores and manages large volumes of structured data.

-- Security – Supports authentication, encryption, and user roles to protect data.

-- Backup and Recovery – Allows regular backups and recovery of data in case of failure.

-- Performance Optimization – Offers indexing, query optimization, and caching to improve speed.

-- Integration Tools – Includes tools like SSIS, SSRS, and SSAS for ETL, reporting, and analytics.

-- 3.
-- Windows Authentication – Uses the Windows operating system credentials. It is integrated, secure, and doesn’t require separate login management.

-- SQL Server Authentication – Requires a separate username and password defined inside SQL Server. Useful for mixed environments or external applications.



-- MEDIUM
-- 4. 
create database SchoolDB;

-- 5. 
use SchoolDB;

create table Students (
    studentID int primary key,
    name varchar(50),
    age int
);

-- 6. 
-- Sql Server - a database engine, similar to postgresql, mysql, mongodb. It is used to run, manage and control database, handling tasks like data storage, queriying, securty and transactions.

-- SSMS - a graphical user interface (databases can also be control via terminal) purposed to connect and manage Sql server databases. With SSMS user can write and run queries, view database schemas.

-- SQL (structured query language) - a domain-specific language is used to manage and manupulate relational databases. It allows users to create, read, update, and delete data (CRUD operations), as well as define schemas and control access

-- SQL Server is the database engine that stores and manages data. SSMS (SQL Server Management Studio) is a graphical tool used to connect to and work with SQL Server. SQL (Structured Query Language) is the language used to communicate with the database—whether through SSMS or other tools—to create, query, and manage data.



-- HARD
-- 7.
-- * DQL (Data Query Language) - Used to retrieve data from the database. F.e:
SELECT * FROM Students;

-- * DML (Data Manipulation Language) - Used to manipulate data in existing tables:
-- Insert a new student
INSERT INTO Students (studentID, name, age) VALUES (1, 'James', 22);

-- Update a student's age
UPDATE Students SET age = 23 WHERE studentID = 1;

-- Delete a student
DELETE FROM Students WHERE studentID = 1

-- * DDL (Data Definition Language) - Used to define or modify the structure of database objects (tables, schemas, etc.):
-- Add a new column
ALTER TABLE Students ADD Email VARCHAR(100);

-- Delete the table
DROP TABLE Students;

-- * DCL (Data Control Language) - Used to control access to data:
-- Grant permission
GRANT SELECT, INSERT ON Students TO user1;

-- Revoke permission
REVOKE INSERT ON Students FROM user1;

-- * TCL (Transaction Control Language) - Used to manage transactions in a database.
BEGIN TRANSACTION;

INSERT INTO Students (studentID, name, age, email) VALUES (2, 'Bond', 24, 'jamesbond@gmail.com');

-- Commit the transaction
COMMIT;

-- Or roll it back if there's an error
ROLLBACK;

-- 8.
INSERT INTO
    Students (studentID, name, age, email) 
VALUES
    (4, 'John', 32, 'john@mail.com'),
    (5, 'Snow', 33, 'snow@mail.com'),
    (6, 'Sam', 32, 'sam@mail.com');

-- 9.
-- In SSMS, right-click on the "Databases" folder in Object Explorer.

-- Choose "Restore Database..."

-- Device → Click the "..." button → Click Add

-- Browse to the location of AdventureWorksDW2022.bak

-- Click OK

-- The destination database name will default to AdventureWorksDW2022, or you can change it.

-- Go to the "Files" page (on the left) to verify the restore paths if needed.

-- "Restore" is selected in the "Backup sets to restore" section.

-- Click OK.