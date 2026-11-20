--1.Find the top 3 customers by total order value. Show their  name and total
SELECT
    CONCAT(Customers.first_name,'_',Customers.last_name) as customers_name,
    COALESCE(SUM(orders.total_amount),0) AS total_order_value
FROM
    customers
left JOIN
    orders ON
    customers.customer_id=orders.customer_id
GROUP BY
    customers.first_name,
    customers.last_name,
    customers.customer_id

order BY
    total_order_value DESC

--2.List all products that have never been ordered, with their category name.
SELECT
    categories.category_name,
    products.product_name,
    order_items.order_id
FROM
    products
left JOIN 
    categories ON
    categories.category_id=products.category_id
left JOIN
    order_items ON
    products.product_id=order_items.product_id
WHERE
    order_items.order_id IS NULL

--3.how each department's name, employee count, and average salary.
SELECT
    departments.department_name,
    CONCAT(employees.first_name,'_',employees.last_name) AS employee_name,
    COALESCE(ROUND(AVG(employees.salary)),0) AS average_salary
FROM
    departments
left JOIN
    employees ON
    departments.department_id=employees.department_id
GROUP BY
    departments.department_name,
    employees.first_name,
    employees.last_name
order BY
    average_salary DESC

--4.Find the employees who have handled orders from customers who live in Dhaka (each employee once).
-- Employees who handled orders from Dhaka customers, each listed once
SELECT DISTINCT
    employees.employee_id,
    CONCAT(employees.first_name, '_', employees.last_name) AS employee_name
FROM orders
INNER JOIN employees
    ON orders.employee_id = employees.employee_id
INNER JOIN customers
    ON orders.customer_id = customers.customer_id
WHERE customers.city = 'Dhaka'
ORDER BY employees.employee_id;

