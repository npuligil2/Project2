with total_payment as (
select * from {{ ref("stg_stripe__payments")  }}
)
select 
order_id, sum(amount) as total_amount
from total_payment
group by order_id
having total_amount<0
