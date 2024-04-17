with etc as
(
    select machine_id, activity_type,
     timestamp, lead(timestamp,1) over (order by machine_id, process_id, activity_type desc) leaded
    from Activity
) 
select machine_id, round(avg(leaded-timestamp),3) processing_time
from etc
where activity_type = 'start'
group by machine_id
