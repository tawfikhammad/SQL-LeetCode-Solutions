with cte1 as(
    select query_name, count(*) countcond from Queries 
    where rating < 3
    group by query_name 
),
cte2 as (
    select query_name, round(avg(rating / position), 2) as quality, count(*) countall
    from Queries 
    group by query_name
    having query_name is not null
)

select cte2.query_name, quality , round((ifnull(countcond,0)/countall)*100, 2) as poor_query_percentage 
from cte2 left join cte1 using(query_name)
