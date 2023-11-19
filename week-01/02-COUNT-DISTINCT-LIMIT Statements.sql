SELECT COUNT(*)
FROM FilmLocations;

SELECT COUNT(Locations) 
FROM FilmLocations 
WHERE Writer = "James Cameron";

SELECT DISTINCT Title 
FROM FilmLocations;

SELECT COUNT(DISTINCT ReleaseYear) 
FROM FilmLocations 
WHERE ProductionCompany = "Warner Bros. Pictures";

SELECT DISTINCT Title, ReleaseYear 
FROM FilmLocations 
WHERE ReleaseYear >= 2001;

SELECT * 
FROM FilmLocations 
LIMIT 25;

SELECT * 
FROM FilmLocations 
LIMIT 15 
OFFSET 10;

SELECT DISTINCT Title 
FROM FilmLocations 
LIMIT 50;

SELECT DISTINCT Title 
FROM FilmLocations 
WHERE ReleaseYear = 2015 
LIMIT 10;

SELECT DISTINCT Title 
FROM FilmLocations 
WHERE ReleaseYear = 2015 
LIMIT 3 
OFFSET 5;

-- To retrieve the last 50 rows from the FilmLocations table
SELECT DISTINCT Title
FROM FilmLocations
ORDER BY id DESC
LIMIT 50;
