--reconstruct database
\i movies-part-1.sql

--create table with attributes
CREATE TABLE movies(
  id SERIAL PRIMARY KEY,
  movie_title VARCHAR(255) NOT NULL,
  year INTEGER,
  actor VARCHAR(255),
  character VARCHAR(255),
  genre VARCHAR(255),
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);

--look at table structure
\d movies

--list all records from table
SELECT * FROM movies;

--add records
INSERT INTO movies(movie_title, year, actor, character, genre)
VALUES
  ('Aliens', 1986, 'Sigourney Weaver', 'Ellen Ripley', 'Action', NOW(), NOW()),
  ('Annie Hall', 1977, 'diane keaton', 'Annie Hall', 'Comedy', NOW(), NOW());

--select record with specific attribute
SELECT * FROM movies WHERE id = 1;

--choose columns from record with specific attribute
SELECT movie_title, year FROM movies WHERE actor = 'Sigourney Weaver'

--update record
UPDATE movies
SET actor = 'Diane Keaton', updated_at = NOW()
WHERE actor = 'diane keaton';

--delete record
DELETE FROM movies
WHERE id = 1;

--select unique values for an attribute
SELECT DISTINCT genre FROM movies;

--set foreign key to a table
ALTER TABLE movies
  ADD genre_id INTEGER REFERENCES genre(id)
;

--create join table
CREATE TABLE cast_members(
  movie_id INT REFERENCES movies(id),
  actor_id INT REFERENCES actors(id),
  character VARCHAR(255)
);

--count records
SELECT count(*) FROM movies;

--limit query
SELECT * FROM movies LIMIT 10;

--JOIN operation
SELECT movies.title AS movie, movies.genre_id, genres.name AS genre
FROM movies
  JOIN genres ON movies.genre_id = genres.id
WHERE movies.title = 'Annie Hall';
--'%' is wildcard
--only records that meet the requirements (i.e. NOT NULL) get listed = INNER JOIN

--LEFT OUTER JOIN (list all in first table with specific attribute regardless if they have a relationship with the second table)
SELECT movies.title, movies.studio_id, studios.id, studios.name
FROM movies LEFT OUTER JOIN studios ON movies.studio_id = studios.id
WHERE movies.title LIKE 'Rocky%'
ORDER BY movies.title DESC;

--SQL is Structured Query Language for managing data in a relational database
--Postgres is a specific relational database management system
--We need databases for data persistance since HTTP is a stateless protocol and concurrency (multiple users performing CRUD actions at the same time)
--aggregate query COUNT, AVG, SUM, FIRST, LAST, MAX, MIN returns single value based on Query
