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
	SELECT COUNT (column_name)
	FROM table_name
	WHERE condition;
*/
SELECT COUNT(City)
FROM developers_table;