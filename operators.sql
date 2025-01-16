-- Let's create a table to practice operators on
CREATE TABLE EmployeeRecords (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Age INT,
    Department VARCHAR(100),
    HireDate DATE,
    Salary DECIMAL(10, 2),
    IsActive BOOLEAN,
    Email VARCHAR(100),
    PhoneNumber VARCHAR(15)
);

-- Insert 10 unique records into the table
INSERT INTO EmployeeRecords (EmployeeID, FirstName, LastName, Age, Department, HireDate, Salary, IsActive, Email, PhoneNumber)
VALUES
(1, 'John', 'Doe', 28, 'Sales', '2020-01-15', 55000.00, TRUE, 'john.doe@example.com', '555-1234'),
(2, 'Jane', 'Smith', 34, 'Marketing', '2018-04-22', 65000.00, TRUE, 'jane.smith@example.com', '555-5678'),
(3, 'Emily', 'Johnson', 25, 'Engineering', '2021-11-05', 72000.00, TRUE, 'emily.johnson@example.com', '555-8765'),
(4, 'Michael', 'Brown', 40, 'HR', '2015-07-18', 80000.00, TRUE, 'michael.brown@example.com', '555-4321'),
(5, 'Sarah', 'Davis', 45, 'IT', '2010-09-12', 95000.00, TRUE, 'sarah.davis@example.com', '555-9876'),
(6, 'David', 'Miller', 30, 'Sales', '2022-02-25', 50000.00, TRUE, 'david.miller@example.com', '555-1357'),
(7, 'Laura', 'Wilson', 29, 'Marketing', '2019-06-10', 60000.00, TRUE, 'laura.wilson@example.com', '555-2468'),
(8, 'James', 'Taylor', 38, 'Engineering', '2017-03-30', 77000.00, FALSE, 'james.taylor@example.com', '555-3690'),
(9, 'Olivia', 'Anderson', 33, 'HR', '2020-08-14', 70000.00, TRUE, 'olivia.anderson@example.com', '555-4810'),
(10, 'Matthew', 'Thomas', 27, 'IT', '2023-12-01', 60000.00, TRUE, 'matthew.thomas@example.com', '555-8520');

-- View the created table and it's records
SELECT * FROM EmployeeRecords;

/*
	1. AND and OR operators
They are both used to filter data based on certain conditions
	
    ** AND OPERATOR **
    Allows you to filter based on multiple conditions all of which must be true
    for the record to be included in the result set
    
		Syntax:
	SELECT * FROM table_name
    WHERE condition_1 AND condition_2 AND ...condition_N;
    
    
    ** OR OPERATOR **
    Allows you to filter records where any one condition is true
    
		Syntax:
	SELECT * FROM table_name
    WHERE condition_1 OR condition_2 OR ...condition_N;
*/
-- 1.1 Example usage for AND operator