{{ config(materialized='table') }}

with source as (

select *
from {{ source ('web_tracking', 'pageviews')}}
),

staged as (
select
id as pageview_id
, visitor_id
, customer_id
, device_type
, page
, timestamp

from source
)

select * from staged