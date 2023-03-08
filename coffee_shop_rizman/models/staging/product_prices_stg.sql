{{ config(materialized='table') }}

with source as (

select *
from {{ source ('coffee_shop', 'product_prices')}}
),

staged as (
select
cast (id as string) as product_price_id
, cast (product_id as string) as product_id
, created_at as product_price_created_at
, ended_at as product_price_ended_at
, price

from source
)

select * from staged