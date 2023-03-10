 {{ config(materialized='table') }}
 {{config (schema = 'test')}}
 
 select
  date_trunc(first_order_timestamp, month) AS month
  , count(distinct(id)) as monthly_customers

  from {{ref ('customers')}}
  group by 1