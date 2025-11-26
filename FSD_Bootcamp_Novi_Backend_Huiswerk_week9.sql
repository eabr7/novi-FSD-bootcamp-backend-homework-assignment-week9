DROP TABLE IF EXISTS TelevisionWallbrackets CASCADE;
DROP TABLE IF EXISTS Televisions CASCADE;
DROP TABLE IF EXISTS RemoteControllers;
DROP TABLE IF EXISTS CIModules;
DROP TABLE IF EXISTS WallBrackets;
DROP TABLE IF EXISTS Users;


CREATE TABLE Users (
userID SERIAL PRIMARY KEY,
userName VARCHAR (100) NOT NULL,
password VARCHAR (100) NOT NULL,
address VARCHAR (250),
workFunction VARCHAR (100) NOT NULL,
salary INT NOT NULL CHECK (salary >= 0),
holidays INT DEFAULT 20);

CREATE TABLE Wallbrackets (
wallbracketID SERIAL PRIMARY KEY,
name VARCHAR(250) NOT NULL,
brand VARCHAR(250) NOT NULL,
price DOUBLE PRECISION NOT NULL CHECK (price >=0),
currentStock INT NOT NULL DEFAULT 0 CHECK (currentStock >= 0),
sold INT NOT NULL DEFAULT 0 CHECK (sold >= 0),
dateSold TIMESTAMP,
type VARCHAR(250) NOT NULL,
adjustable BOOLEAN,
height DOUBLE PRECISION,
width DOUBLE PRECISION);

CREATE TABLE CIModules (
CIModuleID SERIAL PRIMARY KEY,
name VARCHAR(250) NOT NULL,
brand VARCHAR(250) NOT NULL,
price DOUBLE PRECISION NOT NULL CHECK (price >=0),
currentStock INT NOT NULL DEFAULT 0 CHECK (currentStock >= 0),
sold INT NOT NULL DEFAULT 0 CHECK (sold >= 0),
dateSold TIMESTAMP,
type VARCHAR(250) NOT NULL,
provider VARCHAR(250),
encoding VARCHAR(500));

CREATE TABLE RemoteControllers (
remoteControllerID SERIAL PRIMARY KEY,
name VARCHAR(250) NOT NULL,
brand VARCHAR(250) NOT NULL,
price DOUBLE PRECISION NOT NULL CHECK (price >=0),
currentStock INT NOT NULL DEFAULT 0 CHECK (currentStock >= 0),
sold INT NOT NULL DEFAULT 0 CHECK (sold >= 0),
dateSold TIMESTAMP,
type VARCHAR(250) NOT NULL,
smart BOOLEAN,
batteryType VARCHAR(100));

CREATE TABLE Televisions (
televisionID SERIAL PRIMARY KEY,
name VARCHAR(250) NOT NULL,
brand VARCHAR(250) NOT NULL,
price DOUBLE PRECISION NOT NULL CHECK (price >=0),
currentStock INT NOT NULL DEFAULT 0 CHECK (currentStock >= 0),
sold INT NOT NULL DEFAULT 0 CHECK (sold >= 0),
dateSold TIMESTAMP,
type VARCHAR(250) NOT NULL,
height DOUBLE PRECISION,
width DOUBLE PRECISION,
screenQuality VARCHAR(250) NOT NULL,
screenType VARCHAR(250) NOT NULL,
wifi BOOLEAN,
smartTV BOOLEAN,
voiceControl BOOLEAN,
HDR BOOLEAN,
CIModuleID INT,
FOREIGN KEY (CIModuleID) REFERENCES CIModules(CIModuleID)  ON DELETE SET NULL,
remoteControllerID INT UNIQUE,
FOREIGN KEY (remoteControllerID) REFERENCES RemoteControllers(remoteControllerID) ON DELETE SET NULL);

CREATE TABLE TelevisionWallbrackets (
televisionID INT NOT NULL,
wallbracketID INT NOT NULL,
FOREIGN KEY (televisionID) REFERENCES Televisions(televisionID) ON DELETE CASCADE,
FOREIGN KEY (wallbracketID) REFERENCES Wallbrackets(wallbracketID) ON DELETE CASCADE,
PRIMARY KEY (televisionID, wallbracketID));


INSERT INTO Users (userName, password, address, workFunction, salary, holidays) 
VALUES (‘piett3’, ‘dlfkj3’, ‘Jansenlaan 21’, ‘Manager’, 3600, 12),
(‘Marieke22’, ‘dsf34fk’, ‘Maanenstraat 1’, ‘Directeur’, 6600, 23);

INSERT INTO Wallbrackets (name, brand, price, currentStock, sold, dateSold, type, adjustable, height, width)
VALUES (‘Korte haak’, ‘Xenos’, 10, 300, 700, ‘2025-09-15’, ‘Ophangsysteem’, TRUE, 0.10, 0.08),
(‘Lange haak’, ‘Xenos’, 15, 200, 500, ‘2025-09-15’, ‘Ophangsysteem’, TRUE, 0.20, 0.08);

INSERT INTO CIModules (name, brand, price, currentStock, sold, dateSold, type, provider, encoding)
VALUES (‘SoftwareBS’, ‘Microsoft’, 120, 2000, 1000, ‘2025-01-05’, ‘CI Module’, ‘KPN’, ‘efsjdflksdfjz’),
(‘SoftwareBSOSM’, ‘Microsoft’, 120, 340, 1500, ‘2025-01-09’, ‘CI Module’, ‘KPN’, ‘fsjddsflkr3’);

INSERT INTO RemoteControllers (name, brand, price, currentStock, sold, dateSold, type, smart, batteryType)
VALUES (‘Super Remote’, ‘LG’, 15, 400, 1000, ‘2025-10-22’, ‘afstandsbediening’, TRUE, ‘AA’),
(‘Small Remote’, ‘LG’, 10, 500, 3000, ‘2025-10-25’, ‘afstandsbediening’, FALSE, ‘AAA’);

INSERT INTO Televisions (name, brand, price, currentStock, sold, dateSold, type, height, width, screenQuality, screenType, wifi, smartTV, voiceControl, HDR, CIModuleID, remoteControllerID)
VALUES (‘Mega Mega TV’, ‘LG’, 2000, 150, 2000, ‘2025-11-01’, ‘televisie’, 0.60, 1.80, ‘Delux’, ‘LED’, TRUE, TRUE, FALSE, TRUE, 1, 2),
(‘Mega Supreme TV’, ‘LG’, 3000, 100, 1000, ‘2025-11-20’, ‘televisie’, 0.50, 2.00, ‘Delux Super’, ‘LED’, TRUE, TRUE, TRUE, TRUE, 2, 1);

INSERT INTO TelevisionWallbrackets (televisionID, wallbracketID)
VALUES (1, 2),
(2, 1);


SELECT * 
FROM Users;

SELECT tv.name, tv.price, tv.televisionID, wb.wallbracketID, wb.name
FROM Televisions AS tv
JOIN TelevisionWallbrackets AS twb ON twb.televisionID = tv.televisionID
JOIN Wallbrackets AS wb ON wb.wallbracketID = twb.wallbracketID;






