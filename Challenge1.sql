/*

File name: Challenge1.sql

From the following tables, write a SQL query to find the information on each 
salesperson of ABC Company. Return name, city, country and state of each salesperson. 

Input:

table: salespersons

salesperson_id|first_name|last_name|
--------------|----------|---------|
             1|Green     |Wright   |
             2|Jones     |Collins  |
             3|Bryant    |Davis    |
table: address

address_id|salesperson_id|city       |state     |country|
----------|--------------|-----------|----------|-------|
         1|             2|Los Angeles|California|USA    |
         2|             3|Denver     |Colorado  |USA    |
         3|             4|Atlanta    |Georgia   |USA    |

*/

Use Challenges
Go


--- Creating the tables needed
If not exists (Select * From sysobjects
Where name = 'dbo.salespersons' and xtype = 'U')
	Create Table salespersons (
	salesperson_id int, first_name varchar(255), last_name varchar(255))

If not exists (Select * From sysobjects
Where name = 'dbo.address' and xtype = 'U')
	Create table address(
	address_id int, salesperson_id int, 
	city varchar(255), state varchar(255), country varchar(255))
Go


--- Populating the tables
Truncate Table salespersons
Insert into salespersons(salesperson_id, first_name, last_name)
Values('1', 'Green', 'Wright')

Insert into salespersons(salesperson_id, first_name, last_name)
Values('2', 'Jones', 'Collins')

Insert into salespersons(salesperson_id, first_name, last_name)
Values('3', 'Bryant', 'Davis')

Select * from salespersons


Truncate Table address
Insert into address(address_id, salesperson_id, city, state, country)
Values('1', '2' , 'Los Angeles', 'California', 'United States')

Insert into address(address_id, salesperson_id, city, state, country)
Values('2', '3' , 'Denver', 'Colorado', 'United States')

Insert into address(address_id, salesperson_id, city, state, country)
Values('3', '4' , 'Atlanta', 'Georgia', 'United States')

Select * from address



--- Left join 
Select salespersons.first_name, salespersons.last_name
, address.city, address.state, address.country 
From salespersons
Left Join address 
On salespersons.salesperson_id = address.salesperson_id
