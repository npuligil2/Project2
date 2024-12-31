with payment_details as (
    select * from 
    {{ ref("stg_stripe__payments") }}
),

pivoted_payments as (
select order_id,
{% set payment_gateway = ['credit_card', 'coupon', 'bank_transfer', 'gift_card'] %}
{% for pmt in payment_gateway%}
sum( case when payment_method='{{pmt}}' then amount else 0 end ) as {{pmt}}_amount
{% if not loop.last %}
,
{% endif %}
{% endfor %}

from payment_details
where status='success'
group by order_id
)
select * from pivoted_payments