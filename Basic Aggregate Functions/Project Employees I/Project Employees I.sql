select project_id, round(sum(experience_years)/count(*),2) average_years 
from Project left join Employee 
using(employee_id)
where experience_years is not null
group by project_id
