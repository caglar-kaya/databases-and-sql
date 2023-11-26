# Task 1: Create database using SQLite
import sqlite3

conn = sqlite3.connect('INSTRUCTOR.db')

cursor_obj = conn.cursor()

# Task 2: Create a table in the database
cursor_obj.execute('DROP TABLE IF EXISTS INSTRUCTOR')

table = ''' create table IF NOT EXISTS 
            INSTRUCTOR (
                ID INTEGER PRIMARY KEY NOT NULL, 
                FNAME VARCHAR(20), 
                LNAME VARCHAR(20), 
                CITY VARCHAR(20), 
                CCODE CHAR(2)
            );
        '''
 
cursor_obj.execute(table)
print("Table is Ready")

# Task 3: Insert data into the table
data =  '''insert into INSTRUCTOR values 
            (1, 'Rav', 'Ahuja', 'TORONTO', 'CA'),
            (2, 'Raul', 'Chong', 'Markham', 'CA'), 
            (3, 'Hima', 'Vasudevan', 'Chicago', 'US')
        '''

cursor_obj.execute(data)

# Task 4: Query data in the table

# Task 4.a. Fetch all rows from the table
statement = '''SELECT * FROM INSTRUCTOR'''
cursor_obj.execute(statement)

print("All rows")
output_all = cursor_obj.fetchall()
for row_all in output_all:
  print(row_all)

# Task 4.b. Fetch few rows from the table
statement = '''SELECT * FROM INSTRUCTOR'''
cursor_obj.execute(statement)
  
print("First two rows")
output_many = cursor_obj.fetchmany(2) 
for row_many in output_many:
  print(row_many)

# Task 4.c. Fetch only FNAME from the table
statement = '''SELECT FNAME FROM INSTRUCTOR'''
cursor_obj.execute(statement)
  
print("All First Names")
output_column = cursor_obj.fetchall()
for fetch in output_column:
  print(fetch)

# Task 4.d. update some data
query_update =  ''' update INSTRUCTOR 
                    set CITY = 'MOOSETOWN' 
                    where FNAME = "Rav"
                '''
cursor_obj.execute(query_update)

statement = '''SELECT * FROM INSTRUCTOR'''
cursor_obj.execute(statement)
  
print("First two rows after update")
output1 = cursor_obj.fetchmany(2)
for row in output1:
  print(row)

# Task 5: Retrieve data into Pandas
import pandas as pd

df = pd.read_sql_query("select * from instructor;", conn)

print(df.head())

print(df.LNAME[0])

print(df.shape)

# Task 6: Close the Connection
conn.close()

print('Connection closed successfully')
