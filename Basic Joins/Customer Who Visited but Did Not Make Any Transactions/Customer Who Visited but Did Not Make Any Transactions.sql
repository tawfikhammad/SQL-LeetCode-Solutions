select customer_id 
from Visits left join Transactions 
using(visit_id)
