-- 1. Adding a column to a table
ALTER TABLE PETSALE
ADD COLUMN QUANTITY INTEGER;

-- 2. Deleting a column of a table
ALTER TABLE PETSALE
DROP COLUMN PROFIT;

-- 3. Modifying a column of a table
ALTER TABLE PETSALE
MODIFY PET VARCHAR(20);

-- 4. Rename a column of a table
ALTER TABLE `PETSALE` 
CHANGE `PET` `ANIMAL` varchar(20);
