/* Write your T-SQL query statement below */
with cte as (select s.user_id , cast(case when action = 'confirmed' THEN 1 else 0 end as DEC(2,1)) as action
from Signups s left join Confirmations c on s.user_id = c.user_id )

select user_id, cast(avg(action) AS DEC(3,2)) confirmation_rate
from cte
group by user_id
