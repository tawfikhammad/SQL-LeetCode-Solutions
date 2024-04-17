with etc as
(select machine_id, process_id, max(timestamp)-min(timestamp) diff
from Activity
group by machine_id, process_id) 

select machine_id, round(avg(diff), 3) processing_time 
from  etc
group by machine_id;
