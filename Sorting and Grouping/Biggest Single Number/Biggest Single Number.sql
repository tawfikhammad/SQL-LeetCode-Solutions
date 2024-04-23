/* Write your T-SQL query statement below */
with cte as(
    select num
    from MyNumbers 
    group by num 
    having count(*) = 1
)
select max(num) num from cte