--
-- This SQL script builds a monopoly database, deleting any pre-existing version.
--
-- @author kvlinden
-- @version Summer, 2015
--

-- Drop previous versions of the tables if they they exist, in reverse order of foreign keys.
DROP TABLE IF EXISTS PlayerGame;
DROP TABLE IF EXISTS PlayerProperty;
DROP TABLE IF EXISTS Game;
DROP TABLE IF EXISTS Player;

-- Create the schema.
CREATE TABLE Game (
	ID integer PRIMARY KEY,
	time timestamp
	);

CREATE TABLE Player (
	ID integer PRIMARY KEY,
	emailAddress varchar(50) NOT NULL,
	name varchar(50)
	);

-- Updated PLayerGame table to reflect cash and pieceLocation
-- if the game is currently in progress:
--	cash is an integer value representing the amount of cash this player has in monopoly dollars
-- 	pieceLocation is a varchar text value noting down the name of the square the piece is currently on
CREATE TABLE PlayerGame (
	gameID integer REFERENCES Game(ID),
	playerID integer REFERENCES Player(ID),
	score integer,
	cash integer,
	pieceLocation varchar(50)
	);

-- Created PlayerProperty table to keep track of a list of properties each player has in each game
--
CREATE TABLE PlayerProperty (
	gameID integer REFERENCES Game(ID),
	playerID integer REFERENCES Player(ID),
	propertyName varchar(50),
	numberHouses integer,
	numberHotels integer
	);

-- Allow users to select data from the tables.
GRANT SELECT ON Game TO PUBLIC;
GRANT SELECT ON Player TO PUBLIC;
GRANT SELECT ON PlayerGame TO PUBLIC;

-- Grant selects on PlayerProperty table
GRANT SELECT ON PlayerProperty TO PUBLIC;

-- Add sample records.
INSERT INTO Game VALUES (1, '2006-06-27 08:00:00');
INSERT INTO Game VALUES (2, '2006-06-28 13:20:00');
INSERT INTO Game VALUES (3, '2006-06-29 18:41:00');
INSERT INTO Game VALUES (4, '2020-10-17 21:13:13');

INSERT INTO Player(ID, emailAddress) VALUES (1, 'me@calvin.edu');
INSERT INTO Player VALUES (2, 'king@gmail.edu', 'The King');
INSERT INTO Player VALUES (3, 'dog@gmail.edu', 'Dogbreath');
INSERT INTO Player VALUES (4, 'weh@gmail.edu', 'The Player');

INSERT INTO PlayerGame VALUES (1, 1, 0.00);
INSERT INTO PlayerGame VALUES (1, 2, 0.00);
INSERT INTO PlayerGame VALUES (1, 3, 2350.00);
INSERT INTO PlayerGame VALUES (2, 1, 1000.00);
INSERT INTO PlayerGame VALUES (2, 2, 0.00);
INSERT INTO PlayerGame VALUES (2, 3, 500.00);
INSERT INTO PlayerGame VALUES (3, 2, 0.00);
INSERT INTO PlayerGame VALUES (3, 3, 5500.00);
INSERT INTO PlayerGame VALUES (4, 1, 500.00, 800, 'Boardwalk');
INSERT INTO PlayerGame VALUES (4, 2, 100.00, 600, 'St. Charles Place');
INSERT INTO PlayerGame VALUES (4, 3, 2000.00, 1200, 'Virginia Avenue');
INSERT INTO PlayerGame VALUES (4, 4, 3000.00, 2000, 'New York Avenue');

INSERT INTO PlayerProperty VALUES (4, 1, 'Kentucky Avenue', 1, 0);
INSERT INTO PlayerProperty VALUES (4, 2, 'Illinois Avenue', 0, 0);
INSERT INTO PlayerProperty VALUES (4, 3, 'North Carolina Avenue', 2, 1);
INSERT INTO PlayerProperty VALUES (4, 3, 'Pacific Avenue', 2, 0);
INSERT INTO PlayerProperty VALUES (4, 4, 'Boardwalk', 3, 0);
INSERT INTO PlayerProperty VALUES (4, 4, 'Park Place', 3, 1);
INSERT INTO PlayerProperty VALUES (4, 4, 'Water Works', 0, 0);
INSERT INTO PlayerProperty VALUES (4, 4, 'Electric Company', 0, 0);
