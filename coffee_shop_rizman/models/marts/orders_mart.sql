{{ config(materialized='table') }}

with orders_stg as (

select *
from {{ ref ('orders_stg')}}
),

customer_order_number as (
select 
orders_stg.order_id
, count(*) over (partition by orders_stg.customer_id order by orders_stg.order_created_at) as customer_order_number

from orders_stg
),

orders as (
select
orders_stg.*
, customer_order_number.customer_order_number
, case 
     when customer_order_number.customer_order_number = 1 THEN 'new customer order'
     when customer_order_number.customer_order_number > 1 THEN 'returning customer order'
     end as new_or_returning_customer_order

from orders_stg
left join customer_order_number on orders_stg.order_id = customer_order_number.order_id
)

select * 
from orders