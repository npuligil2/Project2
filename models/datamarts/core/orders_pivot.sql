with payment_details as (
    select * from 
    {{ ref("stg_stripe__payments") }}
),

pivoted_payments as (
select order_id,
sum( case when payment_method='credit_card' then amount else 0 end ) as credit_card_amount,
sum( case when payment_method='coupon' then amount else 0 end) as coupon_amount,
sum( case when payment_method='bank_transfer' then amount else 0 end) as bank_transfer_amount,
sum( case when payment_method='gift_card' then amount else 0 end) as gift_card_amount
from payment_details
where status='success'
group by order_id
)

select * from pivoted_payments
