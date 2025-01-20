/*
	**| Date and Time Functions |**
SQL provides a variety of this functions to help users work with date values, perform calculations,
and format them as needed.

		Use Cases:
	1. Adding date intervals
	2. Extracting parts of dates
	3. Formatting the output
    
For storing a date or a date and time value in a database, SQL offers the following data types:
	1. DATE	format: YYYY-MM-DD
	2. DATETIME/TIMESTAMP	format: YYYY-MM-DD HH:MM:SS
	3. YEAR format: YYYY or YY

In this file I'm going to use examples to explain the various functions, buckle up!

*/


/*
	-- 1. NOW() Function
Retrieves current local date and time in YYYY-MM-DD HH:MM:SS format
*/
SELECT NOW();


/*
	-- 2. CURDATE() Function
Retrieves current local date in YYYY-MM-DD format
*/
SELECT CURDATE() AS CurrentDate;


/*
	-- 3. CURTIME() Function
Retrieves current local time in HH:MM:SS format
*/
SELECT CURTIME() AS CurrentTime;


-- Let's create a table to use to explain the following date & time functions
CREATE TABLE example_table 
(
	id INT,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    city VARCHAR(50),
    birth_date DATETIME
);

-- Insert values into the table 
INSERT INTO example_table (id, first_name, last_name, city, birth_date) VALUES
(
	(001, 'Richard', 'Muchoki', 'XYZ', 1830-11-12 12:30:20),
    (002, 'John', 'Musandu', 'ABC', '1820-01-13 11:43:21'),
    (003, 'Jane', 'Macharia', 'DCE', '1830-01-30 17:30:30'),
    (004, 'Mary', 'Magdalene', 'XYZ', '1823-07-12 12:26:20'),
    (005, 'Tomy', 'Wayler', 'FGH', '1830-11-12 19:25:33')
);

/*
	-- 4. DATE() Function
Extracts the date part of date/time expression
*/
SELECT CONCAT(first_name, ' ',last_name) AS Full_Name, -- performs concatenation and returns the full name
DATE(birth_date) AS Birth_Date -- extracts the date part from 'birth_date'
FROM example_table
WHERE city = "XYZ"; -- filters only the ones living in 'XYZ' city

