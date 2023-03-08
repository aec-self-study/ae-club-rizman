 {{ config(materialized='table') }}
 
with pageviews_stg as (

    select * from {{ ref ('pageviews_stg')}}
),

first_visitor_id as (

    select
    customer_id
    , visitor_id

    from pageviews_stg
)

select
pageviews_stg.*
, coalesce(first_visitor_id.visitor_id, pageviews_stg.visitor_id) as cleaned_visitor_id

from pageviews_stg
left join first_visitor_id on pageviews_stg.customer_id = first_visitor_id.customer_id
  