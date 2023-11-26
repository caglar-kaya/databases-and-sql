-- Problem 1
-- Find the total number of crimes recorded in the CRIME table.
SELECT COUNT(*) AS TOTAL_CRIMES 
FROM CHICAGO_CRIME_DATA

-- Problem 2
-- List community areas with per capita income less than 11000.
SELECT COMMUNITY_AREA_NAME 
FROM CENSUS_DATA 
WHERE PER_CAPITA_INCOME < 11000

-- Problem 3
-- List all case numbers for crimes involving minors?(children are not considered minors for the purposes of crime analysis)
SELECT DISTINCT CASE_NUMBER 
FROM CHICAGO_CRIME_DATA 
WHERE DESCRIPTION LIKE '%MINOR%'

-- Problem 4
-- List all kidnapping crimes involving a child?
SELECT DISTINCT CASE_NUMBER, PRIMARY_TYPE, DATE, DESCRIPTION 
FROM CHICAGO_CRIME_DATA 
WHERE PRIMARY_TYPE='KIDNAPPING'

-- Problem 5
-- What kinds of crimes were recorded at schools?
SELECT DISTINCT(PRIMARY_TYPE), LOCATION_DESCRIPTION 
FROM CHICAGO_CRIME_DATA 
WHERE LOCATION_DESCRIPTION LIKE '%SCHOOL%'

-- Problem 6
-- List the average safety score for each type of school.
SELECT ELEMENTARY__MIDDLE__OR_HIGH_SCHOOL, AVG(SAFETY_SCORE) AS AVERAGE_SAFETY_SCORE 
FROM CHICAGO_PUBLIC_SCHOOLS 
GROUP BY ELEMENTARY__MIDDLE__OR_HIGH_SCHOOL

-- Problem 7
-- List 5 community areas with highest % of households below poverty line
SELECT COMMUNITY_AREA_NAME, PERCENT_HOUSEHOLDS_BELOW_POVERTY 
FROM CENSUS_DATA 
ORDER BY PERCENT_HOUSEHOLDS_BELOW_POVERTY DESC 
LIMIT 5

-- Problem 8
-- Which community area is most crime prone?
SELECT COMMUNITY_AREA_NUMBER ,COUNT(COMMUNITY_AREA_NUMBER) AS FREQUENCY
FROM CHICAGO_CRIME_DATA 
GROUP BY COMMUNITY_AREA_NUMBER
ORDER BY COUNT(COMMUNITY_AREA_NUMBER) DESC
LIMIT 1

-- Problem 9
-- Use a sub-query to find the name of the community area with highest hardship index
SELECT COMMUNITY_AREA_NAME 
FROM  CENSUS_DATA 
WHERE HARDSHIP_INDEX = (SELECT MAX(HARDSHIP_INDEX) FROM CENSUS_DATA)

-- Problem 10
-- Use a sub-query to determine the Community Area Name with most number of crimes?
SELECT community_area_name 
FROM CENSUS_DATA 
WHERE COMMUNITY_AREA_NUMBER = (SELECT COMMUNITY_AREA_NUMBER FROM CHICAGO_CRIME_DATA 
    GROUP BY COMMUNITY_AREA_NUMBER
    ORDER BY COUNT(COMMUNITY_AREA_NUMBER) DESC
    LIMIT 1)
LIMIT 1
