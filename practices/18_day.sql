--1.Show each customer's  name and the total amount they spent, biggest spender first.
SELECT
    CONCAT(customers.first_name, ' ', customers.last_name) AS customer_name,
    COALESCE(SUM(orders.total_amount), 0) AS total_amount
FROM customers
LEFT JOIN orders
    ON customers.customer_id = orders.customer_id
GROUP BY
    customers.customer_id,
    customers.first_name,
    customers.last_name
ORDER BY
    total_amount DESC;

--2.Show each employee's first name and how many orders they handled, most first
SELECT
    CONCAT(employees.first_name, ' ', employees.last_name) AS employee_name,
    COALESCE(COUNT(*), 0) AS order_count
FROM
    employees
LEFT JOIN orders
    ON employees.employee_id = orders.employee_id
GROUP BY
    employees.employee_id,
    employees.first_name,
    employees.last_name
ORDER BY
    order_count DESC

--3.Find the top 5 best-selling products by total quantity sold (order_items and products)
SELECT
    products.product_name,
    COALESCE(SUM(order_items.quantity),0) AS total_quantity
from
    products
left JOIN
    order_items on
    products.product_id=order_items.order_id
GROUP BY
    products.product_name,
    products.product_id
ORDER BY
    total_quantity DESC

--4.Find the total revenue per customer city, highest first (customers and orders).

SELECT customers.city,
       SUM(orders.total_amount) AS total_revenue
FROM orders
INNER JOIN customers
    ON orders.customer_id = customers.customer_id
GROUP BY customers.city
       
ORDER BY total_revenue DESC;

---5.Find the revenue per category name using SUM(quantity * unit_price) (order_items, products, categories).
SELECT
    categories.category_name,
    COALESCE(SUM(order_items.quantity*order_items.unit_price),0) As total_revenue
FROM
    products
left JOIN
    categories ON
    products.category_id=categories.category_id
left JOIN
    order_items ON
    products.product_id=order_items.product_id
GROUP BY
    categories.category_name,
    categories.category_id
ORDER BY
    total_revenue DESC