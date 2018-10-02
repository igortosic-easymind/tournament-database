# tournament-database

## Project overview:

In this project, you have a Python module that uses the PostgreSQL database to keep track of players and matches in a game tournament.

The game tournament will use the Swiss system for pairing up players in each round: players are not eliminated, and each player should be paired with another player with the same number of wins, or as close as possible.

This project has two parts: defining the database schema (SQL table definitions), and writing the code that will use it.

### Code Templates:

The template file tournament.sql is where has the database schema, in the form of SQL create table commands. The template file tournament.py contains the code of your module. Finally, the file tournament_test.py contains unit tests that will test the functions that are written in tournament.py. You can run the tests from the command line, using the command python tournament_test.py.

### How to run:

- Launch the psql console from the command line by typing: psql
- Create database by typing: CREATE DATABASE tournament;
- Connect to the tournament database by typing: \c tournament
- Import the schema for the tournament database by typing: \i tournament.sql

> To run project use: python tournament_test.py
