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
