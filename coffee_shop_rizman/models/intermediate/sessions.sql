{{ config(materialized='table') }}

with pageviews as (
    select * from {{ ref ('pageviews_stg')}}
),

with_previous_pageview as (
select
*,
lag(timestamp) over (partition by visitor_id order by timestamp) as previous_pageview_at

from pageviews
),

with_pageview_delta as (
select
*,
date_diff(timestamp, previous_pageview_at, minute) as minutes_since_previous_pageview

from with_previous_pageview
),

with_session_marker as (
select
*,
cast(coalesce(minutes_since_previous_pageview > 30, true) as integer) as is_new_session
from with_pageview_delta
),

with_session_number as (
select
*,
sum(is_new_session) over (partition by visitor_id order by timestamp rows between unbounded preceding and current row) as session_number

from with_session_marker
)

select
pageview_id
, visitor_id
, timestamp
, is_new_session
, session_number
 
 from with_session_number