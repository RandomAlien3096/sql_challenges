/*
Challenege: Revising the Select Query
Query all columns for all American cities in CITY with populations larger than 100,000. The CountryCode for America is USA.
Input Format
The CITY table is described as follows:
+-------------+--------------+
| Field       | Type         |
+-------------+--------------+
| ID          | NUMBER       |
| NAME        | VARCHAR2(17) |
| COUNTRYCODE | VARCHAR2(3)  |
| DISTRICT    | VARCHAR2(20) |
| POPULATION  | NUMBER       |
+-------------+--------------+

 */
 use Challenges
 go
 Create table [CITY] (
	[ID] int,
	[NAME] varchar(17),
	[COUNTRYCODE] varchar(3),
	[DISTRICT] varchar(20),
	[POPULATION] int
 )

 Insert into CITY Values(1, 'United States', 'USA', 'AUSTIN', '8000000')
 Insert into CITY Values(6, 'Rotterdam', 'NLD', 'Zuid-Holland', 593321) 
Insert into CITY Values(3878, 'Scottsdale', 'USA', 'Arizona', 202705)
Insert into CITY Values(3965, 'Corona', 'USA', 'California', 124966)
Insert into CITY Values(3973, 'Concord', 'USA', 'California', 121780)
Insert into CITY Values(3977, 'Cedar Rapids', 'USA', 'Iowa', 120758)
Insert into CITY Values(3982, 'Coral Springs', 'USA', 'Florida', 117549) 
Insert into CITY Values(4054, 'Fairfield', 'USA', 'California', 92256)
Insert into CITY Values(4058, 'Boulder', 'USA', 'Colorado', 91238)
Insert into CITY Values(4061, 'Fall River', 'USA', 'Massachusetts', 90555) 

 Select * From CITY
 Where POPULATION > 100000 AND COUNTRYCODE = 'USA';

 /*
 Query the NAME field for all American cities in the CITY table with 
 populations larger than 120000. The CountryCode for America is USA.
 */

 Select NAME from CITY
 Where POPULATION > 120000 and COUNTRYCODE = 'USA'

 /*
 Query all columns for a city in CITY with the ID 1661.
 */

 Select * from CITY
 Where ID = 1661

 /*
 Query all attributes of every Japanese city in the CITY 
 table. The COUNTRYCODE for Japan is JPN.
 */

 Select * from CITY
 Where COUNTRYCODE = 'JPN'

 /*
 Query the names of all the Japanese cities in the CITY table. 
 The COUNTRYCODE for Japan is JPN.
 */

 Select NAME from CITY
 WHERE COUNTRYCODE = 'JPN'

 /*
 Query a list of CITY and STATE from the STATION table.
 */

 Create Table [STATION](
	[ID] int,
	[CITY] varchar(21),
	[STATE] varchar(2),
	[LAT_N] int,
	[LONG_W] int
 )

 Select CITY, STATE FROM STATION

 /*
 Query a list of CITY names from STATION for cities that have an 
 even ID number. Print the results in any order, but exclude duplicates 
 from the answer.
 */

 Select DISTINCT CITY FROM STATION
 Where ID %2 = 0