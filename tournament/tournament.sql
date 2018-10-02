-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.


CREATE TABLE players (
  id SERIAL PRIMARY KEY,
  name TEXT
);


CREATE TABLE matches (
  id SERIAL PRIMARY KEY,
  player1 INTEGER REFERENCES players(id) ON DELETE CASCADE,
  player2 INTEGER REFERENCES players(id) ON DELETE CASCADE
);


-- players_matches: number of matches played by each player

CREATE VIEW players_matches AS
  SELECT players.id as id, players.name as name, COUNT(matches) as matches
  FROM players LEFT OUTER JOIN matches
  ON players.id = matches.player1 OR players.id = matches.player2
  GROUP BY players.id;


-- players_wins: number of wins for each player

CREATE VIEW players_wins AS
  SELECT players.id as id, players.name as name, COUNT(matches) as wins
  FROM players LEFT OUTER JOIN matches
  ON players.id = matches.player1
  GROUP BY players.id
  ORDER BY wins DESC;


-- players_standings: number of wins and matches played for each player

CREATE VIEW players_standings AS
  SELECT players.id as id, players.name as name, players_wins.wins as wins, players_matches.matches as matches
  FROM players, players_wins, players_matches
  WHERE players.id = players_wins.id and players_wins.id = players_matches.id;