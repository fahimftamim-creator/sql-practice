--1.Show each employee's first name, last name, and department name.
SELECT
    employees.first_name,
    employees.last_name,
    departments.department_name
FROM employees
INNER JOIN
    departments ON
    employees.department_id=departments.department_id

--2.Show each order's order_id and order_date together with the customer's first name and city
SELECT
    orders.order_id,
    orders.order_date,
    customers.city,
    customers.first_name
FROM
    orders
INNER JOIN
     customers ON
     orders.customer_id=customers.customer_id

--3.Show each product's name and price together with its category name.
SELECT
    products.product_name,
    products.price,
    categories.category_name
FROM
    products
INNER JOIN
    categories ON
    products.category_id=categories.category_id

--4.Show each order's order_id and order_date together with the first name of the employee who handled it.
SELECT
    orders.order_id,
    orders.order_date,
    employees.first_name
FROM
    orders
INNER JOIN
    employees ON
    orders.employee_id=employees.employee_id

--5.Show each row of order_items with the product name and the quantity ordered.
SELECT
    order_items.quantity,
    products.product_name
FROM
    order_items
INNER JOIN
    products ON
    order_items.product_id=products.product_id
ORDER BY
    order_items.quantity ASC