SELECT
Customer.id
, Customer.Name
, COUNT(DISTINCT(Orders.Id)) AS Total_Orders
, MIN(Orders.Created_At) AS First_Order_Timestamp
, NULL AS test_field
 
 FROM
 analytics-engineers-club.coffee_shop.customers customer
 LEFT JOIN analytics-engineers-club.coffee_shop.orders Orders
 ON Customer.id = Orders.customer_id

 GROUP BY 1,2
 ORDER BY 4
