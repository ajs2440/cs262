--
-- This SQL script implements sample queries on the Monopoly database.
--
-- @author kvlinden
-- @version Summer, 2015
--

-- Get the number of Game records.
SELECT *
  FROM Game
  ;

-- Get the player records.
SELECT *
  FROM Player
  ;

-- Get all the users with Calvin email addresses.
SELECT *
  FROM Player
 WHERE emailAddress LIKE '%calvin%'
 ;

-- Get the highest score ever recorded.
  SELECT score
    FROM PlayerGame
ORDER BY score DESC
   LIMIT 1
   ;

-- Get the cross-product of all the tables.
SELECT *
  FROM Player, PlayerGame, Game
  ;

-------------------------------------- Exercise 8.1 --------------------------------------

-- Retrieve a list of all the games, ordered by date with the most recent game coming first.
SELECT *
  FROM Game
 ORDER BY time DESC
 ;

-- Retrieve all the games that occurred in the past week.
SELECT *
  FROM Game
 WHERE time >= NOW() - INTERVAL '7 days'
 ;

-- Retrieve a list of players who have (non-NULL) names.
SELECT *
  FROM Player
 WHERE name is not NULL
 ;

-- Retrieve a list of IDs for players who have some game score larger than 2000.
  SELECT score
    FROM PlayerGame
   WHERE score > 2000
   ;

-- Retrieve a list of players who have GMail accounts.
SELECT *
  FROM Player
 WHERE emailAddress LIKE '%gmail%'
 ;

-------------------------------------- Exercise 8.2 --------------------------------------


-- Retrieve all “The King”’s game scores in decreasing order.
 SELECT score
   FROM Player, PlayerGame
  WHERE Player.name = 'The King'
  ORDER BY score DESC;
  ;
-- Retrieve the name of the winner of the game played on 2006-06-28 13:20:00.
 SELECT Player.name
   FROM Player, PlayerGame, Game
  WHERE Game.time = '2006-06-28 13:20:00'
    AND PlayerGame.gameID = Game.ID
    AND PlayerGame.playerID = Player.ID
  ORDER BY score DESC
  LIMIT 1
  ;
-- Last example query:
SELECT P1.name
FROM Player AS P1, Player AS P2
WHERE P1.name = P2.name
  AND P1.ID < P2.ID;

-- So what does that P1.ID < P2.ID clause do in the last example query?

----------------- Ans -----------------
-- Two players can have the same name and this query retrieves the names of the players who share the same name.
-- So P1.ID < P2.ID compares those players with the same names and prevents it from selecting same named players
-- as it only selects the one with the lesser value for ID.



-- The query that joined the Player table to itself seems rather contrived. Can you think of a realistic
-- situation in which you’d want to join a table to itself?

----------------- Ans -----------------
-- It might be useful to compute player statistics somehow where we want to perhaps get a list of how many wins
-- and/or losses a player has had or to count some running total.