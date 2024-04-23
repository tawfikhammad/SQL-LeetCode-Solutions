select customer_id from Customer c
group by customer_id
having count(distinct product_key) = (select count(*) from Product )
