# Task 1: Import the `ibm_db` Python library
import ibm_db

# Task 2: Identify the database connection credentials
dsn_hostname = "1234-bla-1234-bla-1234-bla.databases.appdomain.cloud"
dsn_uid = "username"
dsn_pwd = "password"

dsn_driver = "{IBM DB2 ODBC DRIVER}"
dsn_database = "bludb"
dsn_port = "30120"
dsn_protocol = "TCPIP"
dsn_security = "ssl"

# Task 3: Create the database connection
dsn = (
    "DRIVER={0};"
    "DATABASE={1};"
    "HOSTNAME={2};"
    "PORT={3};"
    "PROTOCOL={4};"
    "UID={5};"
    "PWD={6};"
    "SECURITY={7};").format(dsn_driver, dsn_database, dsn_hostname, dsn_port, dsn_protocol, dsn_uid, dsn_pwd,dsn_security)

try:
    conn = ibm_db.connect(dsn, "", "")
    print ("Connected to database: ", dsn_database, "as user: ", dsn_uid, "on host: ", dsn_hostname)

except:
    print ("Unable to connect: ", ibm_db.conn_errormsg() )

# Task 4: Create a table in the database
dropQuery = "drop table INSTRUCTOR"

dropStmt = ibm_db.exec_immediate(conn, dropQuery)

createQuery = "create table INSTRUCTOR(ID INTEGER PRIMARY KEY NOT NULL, FNAME VARCHAR(20), LNAME VARCHAR(20), CITY VARCHAR(20), CCODE CHAR(2))"

createStmt = ibm_db.exec_immediate(conn,createQuery)

# Task 5: Insert data into the table
insertQuery = "insert into INSTRUCTOR values (1, 'Rav', 'Ahuja', 'TORONTO', 'CA')"

insertStmt = ibm_db.exec_immediate(conn, insertQuery)

insertQuery2 = "insert into INSTRUCTOR values (2, 'Raul', 'Chong', 'Markham', 'CA'), (3, 'Hima', 'Vasudevan', 'Chicago', 'US')"

insertStmt2 = ibm_db.exec_immediate(conn, insertQuery2)

# Task 6: Query data in the table
selectQuery = "select * from INSTRUCTOR"

selectStmt = ibm_db.exec_immediate(conn, selectQuery)

#Fetch the Dictionary (for the first row only)
ibm_db.fetch_both(selectStmt)

#Fetch the rest of the rows and print the ID and FNAME for those rows
while ibm_db.fetch_row(selectStmt) != False:
   print (" ID:",  ibm_db.result(selectStmt, 0), " FNAME:",  ibm_db.result(selectStmt, "FNAME"))

updateQuery = "update INSTRUCTOR set CITY='MOOSETOWN' where FNAME='Rav'"

updateStmt = ibm_db.exec_immediate(conn, updateQuery)

# Task 7: Retrieve data into Pandas
import pandas
import ibm_db_dbi

#connection for pandas
pconn = ibm_db_dbi.Connection(conn)

selectQuery = "select * from INSTRUCTOR"

pdf = pandas.read_sql(selectQuery, pconn)

print(pdf.LNAME[0])

print(pdf)

print(pdf.shape)

# Task 8: Close the Connection
ibm_db.close(conn)
