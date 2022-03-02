Use Sql_Project

--statements: select, limit
select  * 
from tblEmployee

select * 
from tblDepartment

select top(10) *  
from tblTransaction

-- statements: distinct, aliasing, where, comment out, order by
select distinct Department as Sector
from tblEmployee

select * 
from tblEmployee
where Department= 'HR' -- or Department='Commercial'
order by DateOfBirth desc --asc


--agrregations:  max, min, avg, sum, count(*), count(distinct),group by,having
select Year(DateOfTransaction) as Year, 
max(Amount) as Max_Amount, 
min(Amount) as Min_Amount,
avg(Amount) as Average_Amount,
sum(Amount) as Total_Amount,
count(*) as Total_Transactions,
count(distinct EmployeeNumber) as Total_Participants
from tblTransaction
--where Month(DateOfTransaction)=2 or Month(DateOfTransaction) between 6 and 8
group by Year(DateOfTransaction)
order by Year

select Month(DateOfTransaction) as Month,
avg(Amount) as Average,
count(*) as Total_Transactions
from tblTransaction
group by Month(DateOfTransaction)
having count(*)>200
order by Month











