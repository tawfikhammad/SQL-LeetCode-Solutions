with cte1 as (
    select product_id, year first_year, quantity, price, rank() over(partition by product_id order by product_id, year) ranked
    from Sales
),
cte2 as (
    select product_id, first_year, quantity, price from cte1
    where ranked = 1
)
select c2.product_id, c2.first_year, c2.quantity, c2.price 
from cte2 c2 join Product p
on c2.product_id = p.product_id;
