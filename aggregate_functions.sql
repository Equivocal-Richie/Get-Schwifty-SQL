/*
	**| Aggregate Functions |**
They are essential to doing mathematical analysis on data in order to allow one to 
gather valuable insights from your database

Types of aggregate functions include: COUNT(), AVG(), SUM(), MIN(), & MAX()

I'll dive deeper into them by working through examples below
*/

-- 1. Let's create a table to use in the following examples
CREATE TABLE developers_table (
    Name VARCHAR(50),
    City VARCHAR(50),
    Salary INT,
    ID INT,
    DOJ VARCHAR(50)
);

-- 2. Insert data into the created table
INSERT INTO developers_table (Name, City, Salary, ID, DOJ) VALUES
('Abc', 'Delhi', 4500, 134, '6-Aug'),
('Dfe', 'Noida', 6500, 245, '4-March'),
('Def', 'Jaipur', 5400, 546, '2-July'),
('Mno', 'Noida', 7800, 432, '7-June'),
('Jkl', 'Jaipur', 5400, 768, '9-July'),
('Lmn', 'Delhi', 7800, 987, '8-June'),
('Ijk', 'Jaipur', 6700, 654, '5-June');

/*
	3. COUNT() Function:
It's used provide the number of rows that match the condition given

		Syntax:
	SELECT COUNT(column_name)
	FROM table_name
	WHERE condition;
*/
SELECT COUNT(City)
FROM developers_table; -- counts the number of cities in the table



/*
	4. AVG() Function:
It's used to provide the average value of a numeric column which helps to determine central tendencies 
one's data. It's also useful to understand the mean value of a set of numbers.

		Syntax:
	SELECT AVG(column_name)
	FROM table_name
	WHERE condition;
*/
SELECT AVG(Salary)
FROM developers_table; -- returns the average salary of the developers in the table



/*
	5. SUM() Function:
This function provides the total sum of a numeric column and is ideal for calculating 
totals such as sales, revenue and any other cumulative numeric value.

		Syntax:
	SELECT SUM(column_name)
	FROM table_name
	WHERE condition;
*/
SELECT SUM(Salary)
FROM developers_table
WHERE Salary >= 6000; -- returns the sum of the salaries above or equal to 6,000



/*
	6. MIN() Function:
Returns the smallest value in the column and can be used with various data types including
numbers, strings, and dates.

It can be used with the DISTINCT Keyword to return only the unique values in a column.

		Syntax:
	SELECT MIN(column_name)
	FROM table_name
	WHERE condition;
*/
SELECT MIN(DOJ)
FROM developers_table; -- returns the smallest date value from the table



/*
	7. MAX() Function:
Returns the largest value in the column and can be used with various data types including
numbers, strings, and dates.

It can be used in combinations with other SQL clauses and functions such as 
GROUP BY, HAVING and subqueries.

		Syntax:
	SELECT MAX(column_name)
	FROM table_name
	WHERE condition;
*/
SELECT MAX(DOJ)
FROM developers_table; -- returns the date with the largest value from the table

-- Using MIN() and MAX() with other columns
SELECT Name, MAX(Salary) AS max_salary
FROM developers_table
GROUP BY Name
HAVING MIN(DOJ) >= "7 June"; -- returns the name and maximum salary of the developer with DOJ above or equal to 7th June

