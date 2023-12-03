-- Exercise 1: Using Joins

-- Question 1.1: Write and execute a SQL query to list the school names, community names and average attendance for communities with a hardship index of 98.
SELECT CPS.NAME_OF_SCHOOL, CD.COMMUNITY_AREA_NAME, CPS.AVERAGE_STUDENT_ATTENDANCE
FROM CHICAGO_PUBLIC_SCHOOLS CPS
JOIN CENSUS_DATA CD ON CPS.COMMUNITY_AREA_NUMBER = CD.COMMUNITY_AREA_NUMBER
WHERE CD.HARDSHIP_INDEX = 98;

-- Question 1.2: Write and execute a SQL query to list all crimes that took place at a school. Include case number, crime type and community name.
SELECT CCD.CASE_NUMBER, CCD.PRIMARY_TYPE, CD.COMMUNITY_AREA_NAME, CCD.LOCATION_DESCRIPTION
FROM CHICAGO_CRIME_DATA CCD
LEFT JOIN CENSUS_DATA CD ON CCD.COMMUNITY_AREA_NUMBER = CD.COMMUNITY_AREA_NUMBER
WHERE CCD.LOCATION_DESCRIPTION LIKE '%SCHOOL%';

-- Exercise 2: Creating a View

-- Question 2.1: Write and execute a SQL statement to create a view showing the columns listed in the following table, with new column names as shown in the second column.
CREATE VIEW FROM_CPS AS
SELECT 
"NAME_OF_SCHOOL" AS School_Name,
"SAFETY_ICON" AS Safety_Rating,
"FAMILY_INVOLVEMENT_ICON" AS Family_Rating,
"ENVIRONMENT_ICON" AS Environment_Rating,
"INSTRUCTION_ICON" AS Instruction_Rating,
"LEADERS_ICON" AS Leaders_Rating,
"TEACHERS_ICON" AS Teachers_Rating
FROM CHICAGO_PUBLIC_SCHOOLS;

-- Question 2.2: Write and execute a SQL statement that returns all of the columns from the view.
SELECT * FROM FROM_CPS;

-- Question 2.3: Write and execute a SQL statement that returns just the school name and leaders rating from the view.
SELECT School_Name, Leaders_Rating FROM FROM_CPS;

-- Exercise 3: Creating a Stored Procedure

-- Question 3.1: Write the structure of a query to create or replace a stored procedure called UPDATE_LEADERS_SCORE that takes a in_School_ID parameter as an integer and a in_Leader_Score parameter as an integer. 
-- Don’t forget to use the #SET TERMINATOR statement to use the @ for the CREATE statement terminator.

--#SET TERMINATOR @
CREATE OR REPLACE PROCEDURE UPDATE_LEADERS_SCORE_EXAMPLE       -- Name of this stored procedure routine

LANGUAGE SQL                        -- Language used in this routine 
READS SQL DATA                      -- This routine will only read data from the table

DYNAMIC RESULT SETS 1               -- Maximum possible number of result-sets to be returned to the caller query

BEGIN 

    DECLARE C1 CURSOR               -- CURSOR C1 will handle the result-set by retrieving records row by row from the table
    WITH RETURN FOR                 -- This routine will return retrieved records as a result-set to the caller query
    
    SELECT "SCHOOL_ID", "LEADERS_SCORE" FROM CHICAGO_PUBLIC_SCHOOLS;          -- Query to retrieve all the records from the table
    
    OPEN C1;                        -- Keeping the CURSOR C1 open so that result-set can be returned to the caller query

END
@                                   -- Routine termination character

-- Question 3.2: Inside your stored procedure, write a SQL statement to update the Leaders_Score field in the CHICAGO_PUBLIC_SCHOOLS table 
-- for the school identified by in_School_ID to the value in the in_Leader_Score parameter.

--#SET TERMINATOR @
CREATE OR REPLACE PROCEDURE UPDATE_LEADERS_SCORE(IN in_School_ID INTEGER, IN in_Leaders_Score INTEGER)       -- Name of this stored procedure routine
LANGUAGE SQL                        -- Language used in this routine
MODIFIES SQL DATA                      -- This routine can modify data from the table

BEGIN 

	UPDATE CHICAGO_PUBLIC_SCHOOLS
	SET "LEADERS_SCORE" = in_Leaders_Score
	WHERE "SCHOOL_ID" = in_School_ID;

    DECLARE C1 CURSOR               -- CURSOR C1 will handle the result-set by retrieving records row by row from the table
    WITH RETURN FOR                 -- This routine will return retrieved records as a result-set to the caller query
    
    SELECT "SCHOOL_ID", "LEADERS_SCORE" FROM CHICAGO_PUBLIC_SCHOOLS;          -- Query to retrieve all the records from the table
    
    OPEN C1;                        -- Keeping the CURSOR C1 open so that result-set can be returned to the caller query

END
@                                   -- Routine termination character

-- Question 3.3: Inside your stored procedure, write a SQL IF statement to update the Leaders_Icon field in the CHICAGO_PUBLIC_SCHOOLS table for the school identified by in_School_ID using the following information.

--#SET TERMINATOR @
CREATE OR REPLACE PROCEDURE UPDATE_LEADERS_SCORE(IN in_School_ID INTEGER, IN in_Leaders_Score INTEGER)

LANGUAGE SQL
MODIFIES SQL DATA

BEGIN

    UPDATE CHICAGO_PUBLIC_SCHOOLS
    SET "LEADERS_SCORE" = in_Leaders_Score
    WHERE "SCHOOL_ID" = in_School_ID;

    IF in_Leaders_Score > 0 AND in_Leaders_Score < 20 THEN
        UPDATE CHICAGO_PUBLIC_SCHOOLS
        SET "LEADERS_ICON" = 'Very_weak'
        WHERE "SCHOOL_ID" = in_School_ID;

    ELSEIF in_Leaders_Score < 40 THEN
        UPDATE CHICAGO_PUBLIC_SCHOOLS
        SET "LEADERS_ICON" = 'Weak'
        WHERE "SCHOOL_ID" = in_School_ID;

    ELSEIF in_Leaders_Score < 60 THEN
        UPDATE CHICAGO_PUBLIC_SCHOOLS
        SET "LEADERS_ICON" = 'Average'
        WHERE "SCHOOL_ID" = in_School_ID;

    ELSEIF in_Leaders_Score < 80 THEN
        UPDATE CHICAGO_PUBLIC_SCHOOLS
        SET "LEADERS_ICON" = 'Strong'
        WHERE "SCHOOL_ID" = in_School_ID;

    ELSEIF in_Leaders_Score < 100 THEN
        UPDATE CHICAGO_PUBLIC_SCHOOLS
        SET "LEADERS_ICON" = 'Very_strong'
        WHERE "SCHOOL_ID" = in_School_ID;

    ELSE ROLLBACK WORK;

    END IF;

    COMMIT WORK;

END@
