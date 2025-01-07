/*
Basic Commands in SQL ( Structure Query Language ).
We'll create a small database to store data for books.
*/
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
(1, 'A-STAR', 'Rick Sanchez', 5000),
(2, 'B-STAR', 'Tengen Sama', 10000),
(3, 'C-STAR', 'Yuji Itadori', 5000);

-- 3. Select or query data from my table
SELECT book_name FROM books; -- Returns all data from the 'book_name' column

SELECT * FROM books; -- Returns all data in the table 

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
WHERE author IS NULL;