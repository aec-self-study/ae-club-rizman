{{ config(materialized='table') }}

with source as (

select *
from {{ source ('coffee_shop', 'order_items')}}
),

staged as (
select
cast (id as string) as order_item_id
, cast (order_id as string) as order_id
, cast (product_id as string) as product_id

from source
)

select * from staged