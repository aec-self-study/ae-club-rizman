with date_spine as (
SELECT * 
FROM {{ ref ('date_spine')}}
),

orders_mart as (
SELECT * 
FROM {{ref ('orders_mart')}}
),

customer_first_order as (
SELECT
customer_id
, min(order_created_at) as customer_first_order_at

FROM orders_mart
GROUP BY 1
),

with_customer_first_order as (
SELECT
date_trunc(orders_mart.order_created_at, week) as order_week
, date_trunc(customer_first_order.customer_first_order_at, week) as customer_first_order_week
, date_diff (cast(date_trunc(orders_mart.order_created_at, week) as datetime), 
    cast(date_trunc(customer_first_order.customer_first_order_at, week) as datetime), week) as weeks_since_first_order
, count(distinct(order_id)) as orders

FROM 

orders_mart
LEFT JOIN customer_first_order on orders_mart.customer_id = customer_first_order.customer_id
GROUP BY 1,2,3
ORDER BY 2,3
)

select * from with_customer_first_order
