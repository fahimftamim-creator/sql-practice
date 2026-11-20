--1.Find the top 3 departments by average salary —  average salary, highest first.

------join problem for week 3

--2.Find customers who spent more than 500 total across all orders — show customer ID, order count, and total spent.
SELECT
    Count (* )as order_count,
    sum(total_amount) as total_spent,
    customer_id
FROM orders    
GROUP BY
    customer_id
having
    sum(total_amount) > 500
order BY
    order_count

--3.List each category with its product count and average price, sorted by average price descending.

----join problem for week 3

--4.Find the busiest order month in 2024 — the month with the most orders. Show month, order count, and revenue

SELECT
    EXTRACT(MONTH FROM order_date) AS month,
    COUNT(*)                       AS order_count,
    SUM(total_amount)              AS revenue
FROM orders
WHERE order_date >= '2024-01-01'
  AND order_date <  '2025-01-01'
GROUP BY month
ORDER BY order_count DESC, revenue DESC

--5.Count distinct customers who bought from each product category — show category name and unique customer count.

------join problem for week 3

    