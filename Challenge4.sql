/*
CLUSTERED INDEX
A clustered index determines the physical order of data in a table. For this 
a table can have only one clustered index.
*/

Use Challenges
Go

CREATE TABLE [tblEmployee](
	[Id] int Primary Key,
	[Name] nvarchar(50),
	[Salary] int,
	[Gender] nvarchar(10),
	[City] nvarchar(50)
)

SELECT * FROM tblEmployee

Insert into tblEmployee Values(3, 'John', 4500, 'Male', 'New York')
Insert into tblEmployee Values(1, 'Sam', 2500, 'Male', 'London')
Insert into tblEmployee Values(4, 'Sarah', 5500, 'Female', 'Austin')
Insert into tblEmployee Values(5, 'Todd', 3100, 'Male', 'Toronto')
Insert into tblEmployee Values(2, 'Pam', 6500, 'Female', 'Sydney')
Insert into tblEmployee Values(6, 'Margarita', 7000, 'Female', 'Guatemala')

Execute sp_helpindex tblEmployee

Create Clustered Index IX_tblEmployee_Gender_Salary
ON tblEmployee(Gender Desc, Salary Asc)