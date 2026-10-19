-- Databricks notebook source
USE CATALOG ecommerce;
USE SCHEMA retail;

-- COMMAND ----------

-- Question: How many customers are registered?
select count(*) as Total_Customers from users

-- COMMAND ----------

-- Question: How many products are available?
select count(*) as Total_Product from products 

-- COMMAND ----------

-- Question: Show all completed orders.
select * from orders 
where order_status = "completed"

-- COMMAND ----------

-- Question: Find products costing more than 1000.
select * from products where price>1000

-- COMMAND ----------

-- Question: Sort orders by amount.
select * from orders order by total_amount desc

-- COMMAND ----------

-- Question: Count customers in each city.
select city, count(city) as Total_city from users
group by city


-- COMMAND ----------

-- Question: Count products per category.
select category, count(*) as Total_Count from products
group by category

-- COMMAND ----------

-- Question: Revenue for each order status.
select order_status , round(sum(total_amount),2) as Revenue from orders
group by order_status

-- COMMAND ----------

-- Question: Find frequent customers.Customers with More Than 5 Orders
select user_id, count(*) as total_orders from orders
group by user_id
having count(*) >5


-- COMMAND ----------

-- Categories Generating Revenue Above 50000
select p.category, round(sum(oi.item_total),2) as Revenue from order_items oi
join products p
on p.product_id = oi.product_id
group by p.category
having sum(oi.item_total)>50000


-- COMMAND ----------

-- Show customer names with order IDs.
select u.name , o.order_id from orders o 
join users u
on u.user_id = o.user_id


-- COMMAND ----------

-- 12. Products Purchased in Orders
select * from users where user_id not in (select user_id from orders)

-- COMMAND ----------

-- Q13. Find 10 customers who placed the highest number of orders
select u.name,  count(orders.user_id) as total_orders from orders
join users u
on u.user_id = orders.user_id
group by u.name
order by count(orders.user_id) desc
limit 10

-- COMMAND ----------

-- Q14. Find average order value for each customer
select user_id, round(avg(total_amount),2) as avg_amount from orders
group by user_id

-- COMMAND ----------

-- 16. Top 10 Customers by Revenue
select u.user_id, u.name, round(sum(o.total_amount),0) revenue
from users u
join orders o
on u.user_id = o.user_id
group by u.user_id, u.name
order by revenue desc
limit 10

-- COMMAND ----------

-- 17.Which products have sold the most units?
select p.product_name, round(sum(quantity),2) as total_quantity
from order_items oi
join products p
on p.product_id = oi.product_id
group by p.product_name
order by total_quantity desc
limit 10

-- COMMAND ----------

-- Write an SQL query to find the highest revenue-generating product in each category.
with product_sales as
(select p.category,
        p.product_name,
        round(sum(oi.item_total),2) as revenue,
        row_number() over(partition by p.category order by sum(oi.item_total) desc) as rnk
    from products p
    join order_items oi
    on p.product_id = oi.product_id
    group by p.category, p.product_name
)
select *
from product_sales
where rnk = 1;
