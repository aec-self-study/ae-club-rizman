SELECT
Customers.id
, Customers.Name
, COUNT(DISTINCT(Orders.Id)) AS Total_Orders
, MIN(Orders.Created_At) AS First_Order_Timestamp
 
 FROM
 analytics-engineers-club.coffee_shop.customers Customers
 LEFT JOIN analytics-engineers-club.coffee_shop.orders Orders
 ON C.id = O.customer_id

 GROUP BY 1,2
 ORDER BY 4
