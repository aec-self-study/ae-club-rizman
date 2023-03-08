{{ config(materialized='table') }}

with orders_stg as (

select *
from {{ ref ('orders_stg')}}
),

staged as (
select
orders_stg.*
, count(*) over (partition by orders_stg.customer_id order by orders_stg.order_created_at) as customer_order_number
, case
    when count(*) over (partition by orders_stg.customer_id order by orders_stg.order_created_at) = 1 THEN 'new customer order'
    else 'returning customer order'
    end as new_or_returning_customer_order

from orders_stg
)

select * from staged