SELECT column1, column2, ...
FROM table_name
WHERE condition;

SELECT [column1],[column2]
FROM table_name;

SELECT Locations, FunFacts
FROM FilmLocations;

SELECT [column1],[column2], [column3]
FROM table_name
WHERE [specifiedcolumn] <= 2000;

SELECT Title, ReleaseYear, Locations
FROM FilmLocations
WHERE ReleaseYear <= 2000;

SELECT [column1], [column2], [column3], [column4]
FROM table_name
WHERE [specifiedcolumnname] <> "James Cameron";

SELECT Title, ProductionCompany, Locations, ReleaseYear
FROM FilmLocations
WHERE Writer <> "James Cameron";
