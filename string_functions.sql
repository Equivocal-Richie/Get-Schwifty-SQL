/*
	**| String Functions |**
They allow one to manipulate, format and extract specific parts of text data in your database.

These functions are essential for tasks like cleaning up data, comparing strings, and 
combining text fields. Essential when working with names, addresses, or any form of textual data.

Follow along to understand the concepts by working through examples.

*/


/*
	1. CONCAT() Function
It's used to concatenate two or more strings into one string.

*/
SELECT CONCAT('Richard',' ','Muchoki',' ','Schwifty') AS Fullname;


/*
	2. CHAR_LENGTH() / CHARACTER_LENGTH() Function
It's used to return the length of a string in characters and is essential for validating or
manipulating text data.

*/
SELECT CHAR_LENGTH("Wapalangaz") AS length_of_string;


/*
	3. UPPER() and LOWER() Functions
They convert text to uppercase or lowercase respectively and are essential when normalizing 
text cases in a database.
*/
SELECT UPPER("richard") AS UpperCase; -- returns text in uppercase

SELECT LOWER("RICHARD") AS LowerCase; -- returns text in lowercase


/*
	4. LENGTH() Function
Returns the length of string in bytes and is useful when working with multi-byte character sets.

*/
SELECT LENGTH("Peekabo") AS length_in_bytes;


/*
	5. REPLACE() Function
Replaces the occurences of a substring within a string with another substring.

Useful for data cleaning eg replacing invalid characters or formatting errors.

*/ 
SELECT REPLACE("Hello World", "Hello", "Schwifty SQL") AS
updated_string;


/*
	6. SUBSTRING() / SUBSTR() Function
Extracts a substring from a string starting from a specified position.

*/ 
SELECT SUBSTRING("Get Schwifty SQL", 13) AS topic; -- reurns "SQL"

SELECT SUBSTRING("Get Schwifty SQL", 4, 10) AS sub_string; -- returns "Schwifty"


/*
	7. INSTR() Function
Finds the position of the first occurrence of a substring in a string.

*/ 
SELECT INSTR("Get Schwifty SQL", "SQL") AS string_position;


/*
	8. TRIM() Function
Replaces leading and trailing spaces in a string.

*/ 
SELECT TRIM(" " FROM " Hello World ") AS trimmed_string;


/*
	9. REVERSE() Function
Reverses the characters in a string and is used where you need to process data backwards,
such as password validation or pattern matching.

*/ 
SELECT REVERSE("Hello") AS reversed_string;


/*
	10. ASCII() Function
Finds the ASCII value of a character.

*/ 
SELECT ASCII("R") AS ASCII;


/*
	11. FORMAT() Function
Displays a number in the given format.

*/ 
SELECT FORMAT(0.21 * 100, 'Work') + '%' AS percentage_output;
