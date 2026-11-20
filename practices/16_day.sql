-- 1.List every customer with the order_id of their orders, including customers who have never ordered.
SELECT
    CONCAT(customers.first_name,'',customers.last_name) AS customer_name,
    orders.order_id
FROM
    customers
left JOIN
    orders ON
    customers.customer_id=orders.order_id
ORDER BY
    orders.order_id

-- 2.List every product's name with the order_id from order_items, including products that were never ordered.
SELECT
order_items.order_item_id,
order_items.order_id,
products.product_name
FROM
    order_items
left JOIN
    products ON
    order_items.product_id=products.product_id
order BY
    order_id

--3.List every employee with the order_id of the orders they handled, including employees who handled none.
SELECT
    CONCAT(employees.first_name,'',employees.last_name)AS employee_name,
    orders.order_id
FROM
    employees
left JOIN
    orders ON
    employees.employee_id=orders.employee_id
ORDER BY
    orders.order_id

--4.List every customer with the order_id of their orders placed in 2024 only. Customers with no 2024 order must still appear (put the date condition in ON).
SELECT
    CONCAT(customers.first_name,'',customers.last_name) AS customer_name,
    orders.order_id,
    orders.order_date
FROM
    customers
left JOIN
    orders ON
    customers.customer_id=orders.order_id
where
    order_date >= '2024-01-01'and
    order_date <= '2024-12-31'
ORDER BY
    orders.order_id

--5.st every customer's first name and total_amount of their orders, showing 0 instead of NULL for customers with no orders (use COALESCE).
SELECT
    Customers.first_name,
    COALESCE((orders.total_amount),0) AS total_amount
from
    Customers
left JOIN
    orders on
    customers.customer_id = orders.customer_id
ORDER BY
    total_amount desc