with cte as
(
    select p.product_id, units, price*units as total_price
    from Prices p left join UnitsSold u
    on p.product_id = u.product_id and purchase_date between start_date and end_date
)

select product_id, ifnull(round(sum(total_price)/sum(units),2),0) average_price 
from cte
group by product_idv
