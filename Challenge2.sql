/*
File name: Challenge2.sql
 From the following table, write a SQL query to find the third highest sale. 
 Return sale amount.

Input:

table: salemast

sale_id|employee_id|sale_date |sale_amt|
-------|-----------|----------|--------|
      1|       1000|2012-03-08|    4500|
      2|       1001|2012-03-09|    5500|
      3|       1003|2012-04-10|    3500|
      4|       1003|2012-04-10|    2500|
*/

Use Challenges
Go

If not exists (Select * From sysobjects Where name = 'dbo.salemast' and xtype = 'U')
	Create Table salemast (
	sale_id int, employee_id int, sale_date datetime, sale_amt int)

---Populating Table
Truncate Table salemast
Insert Into salemast(sale_id, employee_id, sale_date, sale_amt)
Values('1', '1000', '2012-03-08', '4500')
Insert Into salemast(sale_id, employee_id, sale_date, sale_amt)
Values('2', '1001', '2012-03-09', '5500')
Insert Into salemast(sale_id, employee_id, sale_date, sale_amt)
Values('3', '1003', '2012-04-10', '3500')
Insert Into salemast(sale_id, employee_id, sale_date, sale_amt)
Values('4', '1003', '2012-04-10', '2500')
Go

Select * from salemast
Order by sale_amt desc
Offset 2 rows		---n-1 nth largest sale amount sold
Fetch next 1 row only


