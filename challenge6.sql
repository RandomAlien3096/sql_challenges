/*
Query the Name of any student in STUDENTS who scored higher than  Marks. 
Order your output by the last three characters of each name. If two or 
more students both have names ending in the same last three characters 
(i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.
*/

SELECT Name FROM STUDENTS
WHERE Marks > 75
ORDER BY RIGHT(Name, 3), ID asc

/*
Write a query that prints a list of employee names (i.e.: the name attribute) 
from the Employee table in alphabetical order.
*/

Select name from Employee
Order by name asc

/*
Write a query that prints a list of employee names (i.e.: the name attribute) 
for employees in Employee having a salary greater than $2,000.00 per month who have been 
employees for less than 10 months. Sort your result by ascending employee_id.
*/

Select name from Employee
Where salary > 2000 and months < 10
