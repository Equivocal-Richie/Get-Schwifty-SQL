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
CREATE TABLE patients_table 
(
	id INT,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    city VARCHAR(50),
    birth_date DATETIME
);

-- Insert values into the table 
INSERT INTO patients_table (id, first_name, last_name, city, birth_date) VALUES
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
FROM patients_table
WHERE city = "XYZ"; -- filters only the ones living in 'XYZ' city


/*
	-- 5. EXTRACT() Function
Extracts a specific part from a DATE, TIMESTAMP OR DATETIME value such as the day, year, second etc

		SYNTAX:
	SELECT EXTRACT(unit FROM date)
    FROM table_name;
    
^^ 'unit' used include MICROSECOND, SECOND, MINUTE, HOUR, DAY, WEEK, MONTH, QUARTER, YEAR etc ^^
^^ 'date' is a valid date expression in formats including YYYY-MM-DD etc ^^

*/
WITH patients_birthday AS  -- CTE to temporarily store the extracted parts for the patients
(
	-- Inner CTE query that extracts the specified parts from the 'birth_date' expression
	SELECT CONCAT(first_name, ' ',last_name) AS Full_Name, -- performs concatenation and returns the full name
    EXTRACT(YEAR FROM birth_date) AS Birth_Year, -- extracts the year of birth from 'birth_date' date expression
	EXTRACT(MONTH FROM birth_date) AS Birth_Month, -- extracts the month of birth from 'birth_date' date expression
    EXTRACT(DAY FROM birth_date) AS Birth_Day -- extracts the day of birth from 'birth_date' date expression
	FROM patients_table
    GROUP BY Full_Name
)
-- Main query that displays all that is stored in the CTE 
SELECT * FROM patients_birthday
ORDER BY Birth_Year DESC; 


/*
	-- 6. DATE_ADD () Function
Allows one to add a specified time interval to a date

		SYNTAX:
	SELECT DATE_ADD(date, INTERVAL expr type)
	FROM table_name;
    
^^ 'date' is a valid date expression ^^
^^ 'expr' is the number of intervals to add ^^
^^ 'type' can be one of the following: MICROSECOND, SECOND, MINUTE, DAY, MONTH, SECOND etc ^^

*/
-- Let's add an date and time interval to the patient with id = 003
WITH interval_table AS  -- CTE to temporarily store the calculated time for the patient
(
	-- Inner CTE query that extracts the specified parts from the 'birth_date' expression
	SELECT CONCAT(first_name, ' ',last_name) AS Full_Name, -- performs concatenation and returns the full name
    DATE_ADD(birth_date, INTERVAL 1 YEAR) AS Birth_Year_Modified, -- modifies the year of birth from 'birth_date' date expression
	DATE_ADD(birth_date, INTERVAL 2 MONTH) AS Birth_Month_Modified, --  modifies the month of birth from 'birth_date' date expression
    DATE_ADD(birth_date, INTERVAL 20 MINUTE) AS Birth_Minute_Modified --  modifies the minute of birth from 'birth_date' date expression
	FROM patients_table
    WHERE id = 003 -- filters the patient with id = 003
    GROUP BY Full_Name
)
-- Main query that displays all that is stored in the CTE 
SELECT * FROM interval_table;


/*
	-- 7. DATEDIFF() Function
Returns the date/time between two expressions.

		SYNTAX:
	SELECT DATEDIFF(interval, date/time1, date/time2)
	FROM table_name;

^^ 'interval' - minute/hour/month/year etc ^^
^^ 'date/time1 & date/time2' - date/time expression ^^

*/
SELECT DATEDIFF(day, '2025-01-20', '2025-01-22') AS number_of_days;

