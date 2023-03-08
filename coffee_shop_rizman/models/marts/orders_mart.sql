{{ config(materialized='table') }}

with source as (

select *
from {{ ref ('orders_stg')}}
),

staged as (
select
source.*
, count(*) over (partition by customer_id order by order_created_at) as customer_order_number
, case
    when count(*) over (partition by customer_id order by order_created_at) = 1 THEN 'new customer'
    else 'repeat customer'
    end as new_repeat_customer

from source
)

select * from staged