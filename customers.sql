SELECT
Customers.id
, Customers.Name
, COUNT(DISTINCT(Cust_Orders.Id)) AS Total_Orders
, MIN(Cust_Orders.Created_At) AS First_Order_Timestamp
, MAX(Cust_Orders.Created_At) AS Last_Order_Timestamp
 
 FROM
 analytics-engineers-club.coffee_shop.customers customers
 LEFT JOIN analytics-engineers-club.coffee_shop.orders Cust_Orders
 ON Customers.id = Cust_Orders.customer_id

 GROUP BY 1,2
 ORDER BY 4
