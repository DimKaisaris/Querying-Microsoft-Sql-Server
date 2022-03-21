--create table and insert values
create table tblDepartment2
(
Department varchar(20),
NumberPerDepartment int
)

insert into tblDepartment2
values
('Research',56)

select * 
from tblDepartment2

--union tables(extra rows), 'union all' will allow duplicate values
select * 
from tblDepartment
union 
select *
from tblDepartment2

--left join, adding culumns,comment out having statement
select tblEmployee.EmployeeNumber, EmployeeFirstName, EmployeeLastName, sum(Amount) as SumOfAmount
from tblEmployee left join tblTransaction
on tblEmployee.EmployeeNumber = tblTransaction.EmployeeNumber
GROUP BY tblEmployee.EmployeeNumber, EmployeeFirstName, EmployeeLastName
--having Sum(Amount) is null
ORDER BY EmployeeNumber


--Joining three table, aliasing
select d.Department, sum(Amount) as SumOfAmount
from tblDepartment as d
left join tblEmployee
on d.Department = tblEmployee.Department
left join tblTransaction
on tblEmployee.EmployeeNumber = tblTransaction.EmployeeNumber
group by d.Department
order by Department


