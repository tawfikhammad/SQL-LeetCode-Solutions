with a as
(
	select player_id,
		First_value(event_date )OVER (Partition BY player_id order by event_date) as first_log,
		Lead(event_date )OVER (Partition BY player_id order by event_date) as second_log
	from Activity
)
Select round(cast(count(case when second_log = dateadd(day,1,first_log) THEN player_id END) as float)/count(distinct player_id),2) as fraction
from a
