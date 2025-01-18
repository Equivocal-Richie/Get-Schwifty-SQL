/*
	Common Table Expression (CTE)
It's an essential tool that defines temporary results sets that can be referenced 
multiple times and allows break-down of complex logic to manageable parts

They help with hierarchical data representation, code reusability and simple maintenance

	Syntax:
WITH cte_name AS -- cte_name is a unique name for your CTE
(
SELECT query -- returns results that can be treated as a virtual table in the main query
) -- end of CTE
SELECT * FROM cte_name; -- main query that references the CTE

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
	3. Simple (Non-Recursive) CTE:
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

/*
	4. Recursive CTE
It's useful for querying hierarchial data such as organizational databases
where multiple employees report to one manager.

*/
WITH RECURSIVE employee_hierarchy_table AS
(
-- Anchor query; selects the starting point for the records being fetched
	SELECT employee_id, first_name, last_name, manager_id
    FROM employees
    WHERE employee_id = 1
    UNION ALL

-- Recursive query; joins itself with the 'employees' table to get employees reporting to each manager
    SELECT e.employee_id, e.first_name, e.last_name, e.manager_id 
    FROM employees e
	INNER JOIN employee_hierarchy_table r
	ON e.manager_id = r.employee_id
)
SELECT * FROM employee_hierarchy_table; -- returns all employee records of who answer to John Doe directly or indirectly


-- 5. Using aggregate function (COUNT) in CTEs
-- Let's count the number of employees per department and display the records
WITH employee_department_number AS
(
	SELECT department, COUNT(*) AS employee_number -- Count calculates the number of employees
    FROM employees
    GROUP BY department -- Group By Clause organizes and summarizes records based on the listed column
)
SELECT * FROM employee_department_number
ORDER BY employee_number DESC; -- Order By Clause orders results in descending order


-- 6. Using aggregate function (AVERAGE) in CTEs
-- Let's find the average salary per department
WITH average_department_salary AS
(
	SELECT department, AVG(salary) AS averaged_salary -- AVG finds the average salaries
    FROM employees
    GROUP BY department -- Summarize and organize data based on the department
)
SELECT * FROM average_department_salary
ORDER BY averaged_salary ASC; -- Order By Clause orders results in ascending order


