 {{ config(materialized='table') }}
 
 select
  date_trunc(first_order_timestamp, month) AS month
  , count(distinct(customer_id) as monthly_customers

  from {{ref (customers)}}
  group by 1