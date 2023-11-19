INSERT INTO table_name (column1, column2, ... )
VALUES (value1, value2, ... )
;

UPDATE table_name
SET column1 = value1, column2 = value2, ...
WHERE condition
;

DELETE FROM table_name
WHERE condition
;

INSERT INTO Instructor(ins_id, lastname, firstname, city, country)
VALUES(4, 'Saha', 'Sandip', 'Edmonton', 'CA');

INSERT INTO Instructor(ins_id, lastname, firstname, city, country)
VALUES
(5, 'Doe', 'John', 'Sydney', 'AU'), 
(6, 'Doe', 'Jane', 'Dhaka', 'BD');

UPDATE Instructor 
SET city = 'Toronto' 
WHERE firstname = "Sandip";

UPDATE Instructor 
SET city = 'Dubai', country = 'AE' 
WHERE ins_id = 5;

DELETE FROM instructor
WHERE ins_id = 6;

DELETE FROM instructor
WHERE firstname = 'Hima';

DELETE FROM instructor
WHERE ins_id IN (7, 8);
