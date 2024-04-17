/* Write your T-SQL query statement below */
select name 
from Employee
where id = any (select managerId from Employee group by managerId having count(*)>=5)
