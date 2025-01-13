/*
	SQL Queries
Basically they are commands that enable users to interact with
databases; hence allowing extraction of valuable insights from data
by filtering, aggregating, and manipulation information.ALTER

They employ statements like SELECT, INSERT, UPDATE, DELETE to perform 
operations on database tables. 

In this file you're going to get hand's on experience on handling 
all of that the Rick way !).

*/
-- Let's first drop the table if one exists
DROP TABLE Customer;

-- Then create a table which we'll use in the examples
CREATE TABLE Customer(
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    LastName VARCHAR(50),
    Country VARCHAR(50),
    Age INT,
  Phone INT
);
-- Insert some sample data into the Customers table
INSERT INTO Customer (CustomerID, CustomerName, LastName, Country, Age, Phone)
VALUES (1, 'Richard', 'Muchoki', 'Pakistan','23','1234567'),
       (2, 'Aman ', 'Chopra', 'Australia','21','2345678'),
       (3, 'Naveen', 'Tulasi', 'Sri lanka','24','9876543'),
       (4, 'Aditya', 'Arpan', 'Austria','21','4567890'),
       (5, 'Nishant', 'Jain', 'Spain','22','0987654');

-- Return the inserted data 
SELECT * FROM Customer;

-- 1. SELECT statement - used to fetch or retrieve data
SELECT CustomerName, LastName
FROM Customer; -- fetched the CustomerName and LastName form the table

SELECT CustomerName
FROM Customer
WHERE Age = "21"; -- used WHERE Clause to filter results

SELECT CustomerName, Age, Country
FROM Customer
ORDER BY Age DESC, Country ASC; -- used ORDER BY Clause to sort results.

/*
	RANDOM () Function
It's used to generate random values and can be used to return random 
rows or records from a table. (MySQL)

	Example of Use Case:
1. In an organization with many employees, and the event manager wants to
mail invites to random employees.
2. Can be used to display random questions in an online examination.

PS: In PostgreSQL and SQLite it's slightly different 
you'll use RANDOM()

*/

SELECT CustomerName, Country
FROM Customer
ORDER BY rand()  -- It will return different values everytime you execute this query
LIMIT 3; -- restricts the number of rows returned; essential for large datasets


