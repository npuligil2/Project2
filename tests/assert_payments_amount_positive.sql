with payments1 as (
    select * from {{ ref('stg_stripe__payments') }}
    )
select * from payments1 where amount<0
