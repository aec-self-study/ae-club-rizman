{{ config(materialized='table') }}

with source as (

select *
from {{ source ('web_tracking', 'pageviews')}}
),

staged as (
select
id as pageview_id
, visitor_id
, device_type
, timestamp
, page
, customer_id

from source
)

select * from staged