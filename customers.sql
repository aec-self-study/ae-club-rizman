SELECT
C.id
, C.Name
, COUNT(DISTINCT(Orders.Id)) AS Total_Orders
, MIN(Orders.Created_At) AS First_Order_Timestamp
, NULL AS test_field
 
 FROM
 analytics-engineers-club.coffee_shop.customers C
 LEFT JOIN analytics-engineers-club.coffee_shop.orders Orders
 ON C.id = Orders.customer_id

 GROUP BY 1,2
 ORDER BY 4
