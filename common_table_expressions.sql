/*
	Common Table Expression (CTE)
It's an essential tool that defines temporary results sets that can be referenced 
multiple times and allows break-down of complex logic to manageable parts

They help with hierachical data representation, code reusability and simpe maintenance

	Syntax:
WITH cte_name AS -- cte_name is a unique name for your cte
(
SELECT query -- returns results that can be treated as a virtual table in the main query
) -- end of etc
SELECT * FROM cte_name; -- main query that references the cte

Types of CTEs:
1. Simple (Non Recursive) CTE
2. Recursive CTE

I'll explain below using examples
*/

-- 1. First let's create a table that we'll use for this tutorial
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50),
    manager_id INT,
    salary DECIMAL(10, 2)
);

-- 2. Insert 10 unique records
INSERT INTO employees (employee_id, first_name, last_name, department, manager_id, salary) VALUES
(1, 'John', 'Doe', 'Engineering', NULL, 90000.00),
(2, 'Jane', 'Smith', 'Marketing', 1, 75000.00),
(3, 'Michael', 'Johnson', 'Engineering', 1, 80000.00),
(4, 'Emily', 'Davis', 'HR', 2, 65000.00),
(5, 'Chris', 'Miller', 'Marketing', 2, 62000.00),
(6, 'Anna', 'Brown', 'Engineering', 3, 70000.00),
(7, 'David', 'Wilson', 'HR', 4, 55000.00),
(8, 'Sophia', 'Moore', 'Sales', 5, 48000.00),
(9, 'James', 'Taylor', 'Sales', 5, 52000.00),
(10, 'Olivia', 'Anderson', 'Engineering', 3, 73000.00);

/*
	3. Simple (Non Recursive) CTE:
In order to explain this we are going to use the CTE to filter out results
from the 'employees' table and temporarily store them in a CTE;
It will be used in the main query to perform certain operations

*/
WITH marketing_team AS -- CTE that stores the filtered marketing team from the table
( -- inner CTE query that filters the marketing team
	SELECT employee_id, first_name, last_name, salary
    FROM employees
    WHERE department = "Marketing"
)
SELECT * FROM marketing_team -- main query that display the team records stored in the CTE
ORDER BY salary DESC;