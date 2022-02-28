Use Sql_Project
go

-- create first table
CREATE TABLE tblEmployee
(
EmployeeNumber INT NOT NULL PRIMARY KEY,
EmployeeFirstName VARCHAR(50) NOT NULL,
EmployeeMiddleName VARCHAR(50) NULL,
EmployeeLastName VARCHAR(50) NOT NULL,
EmployeeGovernmentID CHAR(10) NULL,
DateOfBirth DATE NOT NULL
)

--add, drop, alter column
ALTER TABLE tblEmployee
ADD Department VARCHAR(10)

ALTER TABLE tblEmployee
DROP COLUMN Department

ALTER TABLE tblEmployee
ADD Department VARCHAR(15)

ALTER TABLE tblEmployee
ALTER COLUMN Department VARCHAR(20)

-- insert values manually(rollback)
begin tran
insert into tblEmployee
values
(1, 'Dylan', 'A', 'Word', 'HN513777D', '19920914', 'Customer Relations'),
(2,'Jossef', 'H', 'Wright', 'TX593671R', '19711224', 'Litigation')

select * from tblEmployee
rollback tran

--create second table
create table tblTransaction (
Amount smallmoney not null,
DateOfTransaction smalldatetime null,
EmployeeNumber int not null)

select * from tblTransaction

--create third table (derived table)
select Department, NumberPerDepartment 
into tblDepartment
from
(select Department, count(*) as NumberPerDepartment
from tblEmployee
GROUP BY Department) as newTable

select* from tblDepartment

-- adding Primary Key constraint
alter table tblDepartment
alter column Department varchar(20) not null 

alter table tblDepartment
add constraint PK_tblDepartment Primary key (Department)