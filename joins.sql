/*
	**| SQL JOINS |**
SQL Join clauses establish logic relationship between tables; useful when querying 
data from multiple tables

By completing this section, you will be able to:
 * - Understand the purpose of SQL JOINs.
 * - Write queries using INNER JOIN, LEFT (OUTER) JOIN, RIGHT (OUTER) JOIN, FULL (OUTER) JOIN, and NATURAL JOIN.
 * - Determine which JOIN type is appropriate for a given scenario.
 
 This section includes explanations, syntax, and practical examples for each JOIN type.

*/

-- For this one we are going to turn it up a notch with our SQL journey
-- Let's first create three tables: Planets, Explorers, and Missions

CREATE TABLE Planets (
    PlanetID INT AUTO_INCREMENT PRIMARY KEY,
    PlanetName VARCHAR(50) NOT NULL,
    DistanceFromSun FLOAT NOT NULL, -- in million km
    NumberOfMoons INT NOT NULL
);

CREATE TABLE Explorers (
    ExplorerID INT AUTO_INCREMENT PRIMARY KEY,
    ExplorerName VARCHAR(50) NOT NULL,
    Expertise VARCHAR(50) NOT NULL
);

CREATE TABLE Missions (
    MissionID INT AUTO_INCREMENT PRIMARY KEY,
    MissionName VARCHAR(50) NOT NULL,
    PlanetID INT NOT NULL,
    ExplorerID INT NOT NULL,
    LaunchYear INT NOT NULL,
    FOREIGN KEY (PlanetID) REFERENCES Planets(PlanetID),
    FOREIGN KEY (ExplorerID) REFERENCES Explorers(ExplorerID)
);

-- Inserting records into Planets table
INSERT INTO Planets (PlanetName, DistanceFromSun, NumberOfMoons) VALUES
('Mercury', 57.9, 0),
('Venus', 108.2, 0),
('Mars', 227.9, 2),
('Jupiter', 778.3, 79),
('Saturn', 1427, 83);

-- Inserting records into Explorers table
INSERT INTO Explorers (ExplorerName, Expertise) VALUES
('Alice Carter', 'Geology'),
('Bob Martinez', 'Astrophysics'),
('Chloe Singh', 'Robotics'),
('Daniel Kim', 'Biology'),
('Emma Chen', 'Atmospheric Science');

-- Inserting records into Missions table
INSERT INTO Missions (MissionName, PlanetID, ExplorerID, LaunchYear) VALUES
('Red Horizon', 3, 1, 2022),
('Gas Giant Quest', 4, 2, 2021),
('Ringed Wonder', 5, 3, 2023),
('Solar Flare', 1, 4, 2020),
('Venusian Skies', 2, 5, 2024);

/*
	-- 1. INNER JOIN
Select all rows from both the tables as long as a condition is satisfied 

	Think of it as saying: "I want data from both tables, 
	but only if they match on something we agree upon!"

		-- Syntax:
	SELECT columns_you_want
	FROM table1
	INNER JOIN table2
	ON table1.column_name = table2.column_name;

*/

/*
	Example Query
Let's use our Planets, Explorers, and Missions tables. 
Suppose you want to find all missions with the explorer's name and the planet they were assigned to. 
Here's how you'd write it:
*/
SELECT
	M.MissionName,
	E.ExplorerName,
    P.PlanetName, 
    M.LaunchYear
FROM Missions M -- Starts with missions, all missions are included no matter what
INNER JOIN Explorers E ON E.ExplorerID = M.ExplorerID -- Finds matching 'ExplorerID' in Explorers and Missions tables
INNER JOIN Planets P ON P.PlanetID = M.PlanetID -- Finds matching 'PlanetID' in Explorers and Missions tables
-- Suppose we wanted to narrow down the missions launched 2022 or later AND Planets with more than 0 moons
WHERE m.LaunchYear >= 2022 AND p.NumberOfMoons > 0 
ORDER BY m.LaunchYear DESC; -- orders them from recent launch year to the oldest


/*
	-- 2. LEFT JOIN
Imagine Rick hosting a party and inviting explorers to missions on planets. 
However, some planets or explorers might not show up. 
Rick still keeps track of all planets—even if they didn’t have any missions. 
This is a LEFT JOIN! 

It ensures that you get all the rows from the left table (the main guest list, or Planets) 
and matches from the right table (Missions) wherever possible.

If there’s no match, you’ll see NULL in the columns from the right table.

		-- Syntax:
	SELECT columns_you_want
	FROM left_table
	LEFT JOIN right_table
	ON left_table.column_name = right_table.column_name;
    
*/

/*
	Example Query:
Suppose Rick wants to know all the planets, 
including those that haven’t been assigned to a mission yet.
*/
SELECT 
	p.PlanetName, 
    m.MissionName, 
    e.ExplorerName, 
    m.LaunchYear
FROM Planets p -- Starts with planets, all are included no matter what
LEFT JOIN Missions m ON p.PlanetID = m.PlanetID -- Looks for missions linked to the planets; if no mission is found then it shows NULL
LEFT JOIN Explorers e ON m.ExplorerID = e.ExplorerID; -- matches with explorers; if a mission is found then the explorer will be displayed otherwise NULL


/*	
-- && Side Quest &&
*/
-- Query to find planets that have no missions and no explorers assigned to them
-- Results are sorted alphabetically by PlanetName
WITH missions_table AS(
  SELECT m.MissionName, p.PlanetName, e.ExplorerName, m.LaunchYear
  FROM Missions m
  LEFT JOIN Planets p ON m.PlanetID = p.PlanetID
  LEFT JOIN Explorers e ON m.ExplorerID = e.ExplorerID
)
SELECT PlanetName
FROM missions_table
WHERE MissionName IS NULL AND ExplorerName IS NULL
ORDER BY PlanetName; -- Luckily our tables have none; hence no output



/*
	-- 3. CROSS JOIN
A CROSS JOIN takes two tables and matches every row in the first table with every row in the second table, 
creating all possible combinations. 
It’s like chaos in the SQL universe—useful chaos, though. 


		-- Syntax:
	SELECT columns_you_want
	FROM table1
	CROSS JOIN table2;

*/

/*
	Example Query:
Suppose Rick wants to see every possible combination of planets and explorers, 
regardless of whether a mission exists or not.
*/
SELECT P.PlanetName, E.ExplorerName
FROM Planets P -- Lists every planet
CROSS JOIN Explorers E; -- combines each planet with explorers ie if there are 5 planets and 2 explorers, you'll get 5 * 2 com


/*
	-- 4. FULL JOIN
It's a technique used to combine records from 2 or more tables.

Unlike INNER Join which only returns rows where there are matches in both tables,
FULL Join retrieves all rows from both tables, filling NULL values where there are no matches.

		-- Syntax:
	SELECT columns_you_want
	FROM table1
	FULL JOIN table2;
    ON table1.column = table2.column;

*/

/*
	Example Query:
Suppose Rick wants a complete overview of all planets and missions, including:

    - Planets without missions.
    - Missions without assigned planets.
*/

SELECT p.PlanetName, m.MissionName, m.LaunchYear  
FROM Planets p 
FULL JOIN Missions m 
ON p.PlanetID = m.PlanetID;
