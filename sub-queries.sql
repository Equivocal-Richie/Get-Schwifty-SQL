/*
	Subqueries
Can be defined as nested queries basically queries within queries

It is often used in the WHERE, HAVING, or FROM clauses of a statement 
Subqueries are commonly used with SELECT, UPDATE, INSERT, and DELETE statements 
to achieve complex filtering and data manipulation.

I'll explain below with examples.

*/
-- Let's first create two tables that we'll use

-- 1. Create the Student_Database_Table
CREATE TABLE Student_Database_Table (
    student_id INT PRIMARY KEY,   -- Unique identifier for each student
    first_name VARCHAR(50),        -- Student's first name
    last_name VARCHAR(50),         -- Student's last name
    date_of_birth DATE,            -- Student's date of birth
    enrollment_date DATE,          -- Date when the student enrolled
    email VARCHAR(100)             -- Student's email address
);

-- 1. Create the Student_Details table
CREATE TABLE Student_Details (
    student_id INT,                -- Foreign key to the Student_Database_Table
    address VARCHAR(255),          -- Student's home address
    phone_number VARCHAR(15),      -- Student's phone number
    gender VARCHAR(10),            -- Student's gender
    nationality VARCHAR(50),       -- Student's nationality
    major VARCHAR(50),             -- Student's major field of study
    FOREIGN KEY (student_id) REFERENCES Student_Database_Table(student_id) -- Ensuring relational integrity
);

-- 2. Insert random sample records into Student_Database_Table (limit 10 records)
INSERT INTO Student_Database_Table (student_id, first_name, last_name, date_of_birth, enrollment_date, email)
VALUES 
(1, 'John', 'Doe', '2000-01-15', '2022-08-23', 'john.doe@example.com'),
(2, 'Jane', 'Smith', '1999-05-24', '2021-09-15', 'jane.smith@example.com'),
(3, 'Emily', 'Johnson', '2001-11-05', '2020-01-10', 'emily.johnson@example.com'),
(4, 'Michael', 'Brown', '1998-08-12', '2023-02-21', 'michael.brown@example.com'),
(5, 'Emma', 'Davis', '2002-03-30', '2022-12-01', 'emma.davis@example.com'),
(6, 'Daniel', 'Miller', '2001-07-07', '2021-06-15', 'daniel.miller@example.com'),
(7, 'Sophia', 'Wilson', '1999-09-22', '2022-05-14', 'sophia.wilson@example.com'),
(8, 'Lucas', 'Moore', '2000-12-11', '2023-01-10', 'lucas.moore@example.com'),
(9, 'Olivia', 'Taylor', '2001-02-18', '2020-10-23', 'olivia.taylor@example.com'),
(10, 'James', 'Anderson', '1998-04-20', '2021-07-17', 'james.anderson@example.com');

-- 2. Insert random sample records into Student_Details (limit 10 records)
INSERT INTO Student_Details (student_id, address, phone_number, gender, nationality, major)
VALUES
(1, '123 Elm St, Springfield, IL', '555-1234', 'Male', 'American', 'Computer Science'),
(2, '456 Oak Ave, Chicago, IL', '555-5678', 'Female', 'American', 'Business Administration'),
(3, '789 Pine Rd, Houston, TX', '555-9876', 'Female', 'American', 'Mathematics'),
(4, '101 Maple Dr, Austin, TX', '555-6543', 'Male', 'American', 'Engineering'),
(5, '202 Birch Ln, Denver, CO', '555-3210', 'Female', 'American', 'Psychology'),
(6, '303 Cedar Blvd, Dallas, TX', '555-4321', 'Male', 'American', 'Physics'),
(7, '404 Walnut St, San Francisco, CA', '555-8765', 'Female', 'American', 'Literature'),
(8, '505 Redwood Ave, Los Angeles, CA', '555-2345', 'Male', 'American', 'Business Management'),
(9, '606 Palm Rd, Miami, FL', '555-8766', 'Female', 'American', 'History'),
(10, '707 Cedar Ln, Phoenix, AZ', '555-1122', 'Male', 'American', 'Economics');

-- 3. Let's fetch data using subquery from the tables created.
-- Let's get all the male student's details
SELECT student_id, first_name, last_name, email
FROM Student_Database_Table 
WHERE student_id IN 
( -- Beginning of sub-query
SELECT student_id 
FROM Student_Details
WHERE gender = "Male"
);

-- 3. Using subquery with INSERT
-- Let's add all records from 'Student_Details' be inserted into a new table 
CREATE TABLE Details
(
	student_id INT,                -- Foreign key to the Student_Database_Table
    address VARCHAR(255),          -- Student's home address
    phone_number VARCHAR(15),      -- Student's phone number
    gender VARCHAR(10),            -- Student's gender
    nationality VARCHAR(50),       -- Student's nationality
    major VARCHAR(50),             -- Student's major field of study
    FOREIGN KEY (student_id) REFERENCES Student_Database_Table(student_id) -- Ensuring relational integrity
); -- new table to insert data
-- Insert data into the new table
INSERT INTO Details
SELECT * FROM Student_Details; 

SELECT * FROM Details; -- Check the newly inserted data


-- 4. Using Subquery with DELETE
-- Allows targeted deletion based on data from another table
DELETE FROM Details -- Deletes all records that match the subqueries condition
WHERE student_id IN 
( -- subquery retrieves students who major in literature in Student_Details table
SELECT student_id
FROM Student_Details
WHERE major = "Literature"
);

SELECT * FROM Details
ORDER BY gender; -- check the remaining data in order of gender

-- 5. Using Subquery with UPDATE
-- Allows updating of data in one table based on conditions from another table
UPDATE Details
SET  nationality = "Kenyan"
WHERE student_id IN 
(
SELECT student_id
FROM Student_Details
WHERE major IN ('Psycology', 'History')
);

SELECT * FROM Details; -- check the updated data
