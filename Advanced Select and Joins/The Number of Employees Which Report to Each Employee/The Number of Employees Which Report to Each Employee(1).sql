/* Write your T-SQL query statement below */
SELECT e1.employee_id, e1.name, count(*) reports_count, round(avg(cast(e2.age as float)),0) average_age 
from Employees e1 join Employees e2
on e1.employee_id = e2.reports_to
group by e1.employee_id, e1.name
order by e1.employee_id;
