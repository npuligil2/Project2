select
    id as payment_id,
    orderid as order_id,
    paymentmethod as payment_method,
    status,
    amount,
    -- amount is stored in cents, convert it to dollars
    {{ cents_to_dollars('amount',3) }} as dollar_amount,
    created as created_at

from  {{  source("stripe_payments",'payment')   }}