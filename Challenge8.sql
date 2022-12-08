/*
Pivot the Occupation column in OCCUPATIONS so that each Name is sorted 
alphabetically and displayed underneath its corresponding Occupation. 
The output column headers should be Doctor, Professor, Singer, and Actor, 
respectively.

Note: Print NULL when there are no more names corresponding to an occupation.
*/

SELECT Doctor, Professor, Singer, Actor
FROM(
    SELECT NameOrder, 
        max(case Occupation when 'Doctor' then Name end) as Doctor,
        max(case Occupation when 'Professor' then Name end) as Professor,
        max(case Occupation when 'Singer' then Name end) as Singer,
        max(case Occupation when 'Actor' then Name end) as Actor
    From(
        Select
            Occupation, Name, row_number() over(partition by Occupation order by Name asc) as NameOrder
        From Occupations
    ) as NameLists
    Group By NameOrder
) as Names



/*
You are given a table, BST, containing two columns: N and P, 
where N represents the value of a node in Binary Tree, and P is the parent of N.

Write a query to find the node type of Binary Tree ordered by the value of the node. 
Output one of the following for each node:

Root: If node is root node.
Leaf: If node is leaf node.
Inner: If node is neither root nor leaf node.
*/

SELECT N,
CASE 
    WHEN P IS NULL THEN 'Root'
    WHEN (SELECT COUNT(*) FROM BST WHERE B.N=P)>0 THEN 'Inner'
    ELSE 'Leaf'
END AS PLACE
FROM BST B
ORDER BY N



/*
Samantha was tasked with calculating the average monthly salaries for all employees 
in the EMPLOYEES table, but did not realize her keyboard's  key was broken until after 
completing the calculation. She wants your help finding the difference between her 
miscalculation (using salaries with any zeros removed), and the actual average salary.

Write a query calculating the amount of error (i.e.:ACTUAL - MISCALCULATED  average monthly salaries), 
and round it up to the next integer.
*/

Select CEILING(AVG(SALARY) - AVG(CAST(REPLACE(SALARY, '0', '')AS INT))) + 1 
FROM EMPLOYEES



/*
We define an employee's total earnings to be their monthly salary*months worked, and the maximum total 
earnings to be the maximum total earnings for any employee in the Employee table. Write a query to find 
the maximum total earnings for all employees as well as the total number of employees who have maximum 
total earnings. Then print these values as 2 space-separated integers.
*/

Select top(1) months*salary, count(*)
from Employee
Group by months*salary
Order by months*salary desc



/*
Query the following two values from the STATION table:
The sum of all values in LAT_N rounded to a scale of 2 decimal places.
The sum of all values in LONG_W rounded to a scale of 2 decimal places.
*/

Select CAST(ROUND(SUM(LAT_N),2) AS DECIMAL(7,2)), CAST(ROUND(SUM(LONG_W),4) AS DECIMAL(7,2))
FROM STATION



/*
Query the sum of Northern Latitudes (LAT_N) from STATION having values greater 
than 38.7880 and less than 137.2345. Truncate your answer to  decimal places.
*/

SELECT CAST(ROUND(SUM(LAT_N), 4) AS DECIMAL(9,4))
FROM STATION
WHERE LAT_N >38.7880 and LAT_N <137.2345



/*
Query the greatest value of the Northern Latitudes (LAT_N) from STATION that 
is less than 137.2345. Truncate your answer to 4 decimal places.
*/

Select cast(max(LAT_N) AS DECIMAL(9,4))
FROM STATION
WHERE LAT_N < 137.2345



/*
Consider P1(a,b) and P2(c,d) to be two points on a 2D plane.

a happens to equal the minimum value in Northern Latitude (LAT_N in STATION).
b happens to equal the minimum value in Western Longitude (LONG_W in STATION).
c happens to equal the maximum value in Northern Latitude (LAT_N in STATION).
d happens to equal the maximum value in Western Longitude (LONG_W in STATION).
Query the Manhattan Distance between points P1 and P2 and round it to a scale of 4 decimal places.
*/

SELECT CAST(ABS(min(LAT_N)-max(LAT_N)) + ABS(min(LONG_W)-max(LONG_W)) AS DECIMAL(9,4))
FROM STATION

/*
Consider  and  to be two points on a 2D plane where  are the respective minimum 
and maximum values of Northern Latitude (LAT_N) and  are the respective minimum 
and maximum values of Western Longitude (LONG_W) in STATION.

Query the Euclidean Distance between points  and  and format your answer to display  decimal digits.
*/
Select cast(SQRT(SQUARE(min(LAT_N)-MAX(LAT_N))+SQUARE(MIN(LONG_W)-max(LONG_W))) AS DECIMAL(9,4))
FROM STATION



/*
A median is defined as a number separating the higher half of a data set from 
the lower half. Query the median of the Northern Latitudes (LAT_N) from STATION
and round your answer to  decimal places.
*/

DECLARE @c BIGINT = (SELECT COUNT(*) FROM STATION);

SELECT CAST (AVG(1.0 * LAT_N) AS DECIMAL(9,4))
FROM (
    SELECT LAT_N FROM STATION
     ORDER BY LAT_N
     OFFSET (@c - 1) / 2 ROWS
     FETCH NEXT 1 + (1 - @c % 2) ROWS ONLY
) AS x;



/*
Given the CITY and COUNTRY tables, query the sum of the populations of all 
cities where the CONTINENT is 'Asia'.

Note: CITY.CountryCode and COUNTRY.Code are matching key columns.
*/

SELECT sum(CITY.POPULATION)
from CITY
FULL OUTER JOIN COUNTRY ON CITY.COUNTRYCODE = COUNTRY.CODE
Where COUNTRY.CONTINENT = "Asia"




/*
Given the CITY and COUNTRY tables, query the names of all cities 
where the CONTINENT is 'Africa'.

Note: CITY.CountryCode and COUNTRY.Code are matching key columns.
*/

SELECT CITY.NAME
from CITY
FULL OUTER JOIN COUNTRY ON CITY.COUNTRYCODE = COUNTRY.CODE
Where COUNTRY.CONTINENT = "Africa" and CITY.NAME IS NOT NULL

/*
Amber's conglomerate corporation just acquired some new companies. Each of the companies follows this hierarchy: 

FOUNDER => LEAD MANAGER => SENIOR MANAGER => MANAGER => EMPLOYEE

Given the table schemas below, write a query to print the company_code, founder name, total number of lead managers, 
total number of senior managers, total number of managers, and total number of employees. Order your output by ascending company_code.

Note:

The tables may contain duplicate records.
The company_code is string, so the sorting should not be numeric. 
For example, if the company_codes are C_1, C_2, and C_10, then the ascending company_codes will be C_1, C_10, and C_2.
*/

SELECT c.Company_Code, c.founder, count(Distinct e.Lead_Manager_Code), 
count(distinct e.Senior_Manager_Code), count(distinct e.Manager_Code), 
count(distinct e.employee_Code) 
FROM Company c 
JOIN Employee e ON c.Company_Code = e.Company_Code GROUP BY c.Company_Code, c.Founder ORDER BY c.Company_Code
