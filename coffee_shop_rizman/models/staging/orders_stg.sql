{{ config(materialized='table') }}

with source as (

select *
from {{ source ('coffee_shop', 'orders')}}
),

staged as (
select
cast (id as string) as order_id
, cast (customer_id as string) as customer_id			
, address as order_address
, state as order_state
, zip as order_zip
--date fields
, created_at	as order_created_at
-- , count(*) over (partition by customer_id order by created_at) as customer_order_number	
-- removed fields	
--total				

from source
)

select * from staged