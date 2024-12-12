{{
config(materialized='view')    
}}
select * from 
{{ ref('stg_jaffle_shop__customers') }}