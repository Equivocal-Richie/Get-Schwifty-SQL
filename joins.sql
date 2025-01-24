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
FROM Missions M
INNER JOIN Explorers E ON E.ExplorerID = M.ExplorerID -- Finds matching 'ExplorerID' in Explorers and Missions tables
INNER JOIN Planets P ON P.PlanetID = M.PlanetID -- Finds matching 'PlanetID' in Explorers and Missions tables
-- Suppose we wanted to narrow down the missions launched 2022 or later AND Planets with more than 0 moons
WHERE m.LaunchYear >= 2022 AND p.NumberOfMoons > 0 
ORDER BY m.LaunchYear DESC; -- orders them from recent launch year to the oldest

