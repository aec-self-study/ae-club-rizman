{{ config(materialized='table') }}

with order_items_stg as (
select *
from {{ ref ('order_items_stg')}}
),

orders_stg as (
select *
from {{ ref ('orders_stg')}}
),

products_stg as (
select *
from {{ ref ('products_stg')}}
),

product_prices_stg as (
select *
from {{ ref ('product_prices_stg')}}
),

orders_mart as (
select *
from {{ ref ('orders_mart')}}
),

order_items as (
select
order_items_stg.order_item_id
, order_items_stg.order_id
, order_items_stg.product_id
, products_stg.product_category
, orders_mart.new_or_returning_customer_order
, orders_stg.order_created_at as order_created_at
, product_prices_stg.price as product_price


from orders_stg
left join order_items_stg
  on orders_stg.order_id = order_items_stg.order_id
left join products_stg 
  on order_items_stg.product_id = products_stg.product_id
left join product_prices_stg 
  on orders_stg.order_created_at between product_prices_stg.product_price_created_at and product_prices_stg.product_price_ended_at
  and products_stg.product_id = product_prices_stg.product_id
left join orders_mart
  on orders_stg.order_id = orders_mart.order_id

)

select * 
from order_items