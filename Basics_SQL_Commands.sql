
/*
Basic Commands in SQL ( Structure Query Language ).
We'll create a small database to store data for a library.
*/

-- Create a simple library database
CREATE DATABASE library;


-- 1. Create a Table for the entity 'books' and add columns.
CREATE TABLE books(
	id integer,
    book_name text,
    author text,
    price integer
);

-- 2.  Insert values to the created table 
INSERT INTO books (id,book_name,author,price)
VALUES
(1, 'A-STAR', 'Rick Sanchez', 56000),
(2, 'B-STAR', 'Tengen Sama', 10000),
(3, 'C-STAR', 'Yuji Itadori', 82000);


-- 3. Select or query data from my table
SELECT book_name FROM books; -- Returns all data from the 'book_name' column

SELECT * FROM books; -- Returns all data in the table 

SELECT id, book_name, price 
FROM books; -- Querying multiple columns at the same time


-- 4. Alter statement can be used to add new columns to tables
ALTER TABLE books
ADD COLUMN editor TEXT;


-- 5. Update statement can be used to modify row contents
UPDATE books
SET book_name = "Rick and Morty Schwifts"
WHERE id = 1;

SELECT book_name FROM books; -- Returns all the updated values in book_name column


-- 6. Delete statement deletes all rows applied in the statement
DELETE FROM books
WHERE author IS NULL; -- removes all rows with Null Values in the 'author' column

DELETE FROM books
WHERE price > 60000; 
SELECT * FROM books; -- row with id=3 will be deleted since it met the condition

-- If you want to delete a specific number of rows you use LIMIT
DELETE FROM books
WHERE price > 5000
LIMIT 1;

SELECT * FROM books; -- only the first row was deleted due to the use of Limit


/*
	Finally the last trick of the day; using 'AS' keyword.
    It renames the selected column ONLY in the output not from the Table itself.
    
*/
SELECT book_name AS 'premiers'
FROM books;
