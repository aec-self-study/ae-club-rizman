{{ config(materialized='table') }}

with source as (

select *
from {{ source ('coffee_shop', 'products')}}
),

staged as (
select
cast (id as string) as product_id
, name as product_name
, category as product_category
, created_at as product_created_at

from source
)

select * from staged