with cte as (select customer_id, order_date, customer_pref_delivery_date, ROW_NUMBER() over(partition by customer_id order by customer_id, order_date) rowed
from Delivery)
 
select round(cast(sum(case when order_date = customer_pref_delivery_date then 1 else 0 end) as float)/count(*)*100,2) immediate_percentage
from cte
where rowed = 1 
