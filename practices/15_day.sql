--1.Show each order's order_id and total_amount with the customer's first name, only for customers who live in Dhaka.
SELECT
    orders.order_id,
    orders.total_amount,
    customers.first_name,
    customers.city
FROM
    orders
INNER JOIN
    customers on
    orders.customer_id=customers.customer_id
WHERE
    customers.city='Dhaka'
ORDER BY
    orders.total_amount DESC

--2.Show the first name, last name, and salary of every employee in the Finance department, highest salary first.
SELECT
    employees.first_name,
    employees.last_name,
    employees.salary,
    departments.department_name
FROM
    employees
INNER JOIN
    departments ON
    employees.department_id=departments.department_id
WHERE
    departments.department_name='Finance'
ORDER BY
    employees.salary DESC

-- 3.Show the name and price of every product in the Electronics category that costs more than 100, cheapest first.
SELECT
    products.product_name,
    products.price,
    categories.category_name
FROM
    categories
INNER JOIN
    products ON
    categories.category_id=products.category_id
WHERE
    categories.category_name='Electronics' and
    products.price > 100
ORDER BY
    products.price DESC

--4.Show each order's order_id, the customer's first name, and the first name of the employee who handled it (three tables).
SELECT
    orders.order_id,
    customers.first_name AS customer_first_name,
    employees.first_name AS employee_first_name
FROM 
    orders 
INNER JOIN
    customers ON
    orders.customer_id=customers.customer_id 
INNER JOIN
    employees ON
    orders.employee_id=employees.employee_id

--5.Show each row of order_items with the product name and the first name of the customer who bought it (four tables: order_items, orders, customers, products).

SELECT order_items.order_item_id,
       order_items.order_id,
       products.product_name,
       order_items.quantity,
       customers.first_name AS customer_first_name
FROM order_items
INNER JOIN products
    ON order_items.product_id = products.product_id
INNER JOIN orders
    ON order_items.order_id = orders.order_id
INNER JOIN customers
    ON orders.customer_id = customers.customer_id
ORDER BY order_items.order_item_id;