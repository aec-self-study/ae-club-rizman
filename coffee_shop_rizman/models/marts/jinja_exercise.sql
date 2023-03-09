{{config (materialized = 'table')}}
{% set product_categories = product_categories_list () %}

select
cast(date_trunc(order_created_at, month) as date) as date_month

{% for product_category in product_categories %}
, sum(case when product_category = '{{product_category}}' then product_price end) 
  as {{product_category | replace (' ' , '_') }}_amount
{% endfor %}

, sum(product_price) as total_amount

from {{ ref ('order_items_mart')}}
group by 1
order by 1