select e.employee_id, department_id
from Employee e join (select employee_id, count(*) dep_n from Employee group by employee_id) grouped_table
on e.employee_id = grouped_table.employee_id
where dep_n = 1 or primary_flag = 'Y'
