select A1.machine_id, round(avg(A1.timestamp-A2.timestamp),3) processing_time
from Activity A1, Activity A2
where A1.machine_id = A2.machine_id and A1.process_id = A2.process_id
and A1.activity_type != A2.activity_type and A1.activity_type = 'end'
group by A1.machine_id
