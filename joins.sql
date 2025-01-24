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
