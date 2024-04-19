select Date_format(trans_date, '%Y-%m') month, country,
    count(*) trans_count,
    sum(state = 'approved') approved_count, 
    sum(amount) trans_total_amount,
    sum(if(state = 'approved', amount, 0)) approved_total_amount 
from Transactions
group by Date_format(trans_date, '%Y-%m'), country
