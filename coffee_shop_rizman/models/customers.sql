{{ config(materialized='table') }}

with customers as (
SELECT

Customers.id
, Customers.Name
, COUNT(DISTINCT(Orders.Id)) AS Total_Orders
, MIN(Orders.Created_At) AS First_Order_Timestamp
, MAX(Orders.Created_At) AS Last_Order_Timestamp
 
 FROM
 {{source ( 'coffee_shop', 'customers' ) }} as customers
 LEFT JOIN {{ source ('coffee_shop', 'orders')}} as Orders
 ON Customers.id = Orders.customer_id

 GROUP BY 1,2
 ORDER BY 4
)

select * 
from customers 