--1.Find customers who have never placed an order.
SELECT
    CONCAT(Customers.first_name,'_',Customers.last_name),
    orders.order_id
FROM
    customers
left JOIN
    orders ON
    customers.customer_id=orders.customer_id
WHERE
    orders.order_id IS NULL

--2.Find products that have never been ordered
SELECT
    products.product_name,
    order_items.order_item_id
FROM
    products
left JOIN
    order_items on
    products.product_id=order_items.product_id
WHERE
    order_items.order_item_id IS NULL

--3.Find employees who have never handled an order.
SELECT
    CONCAT(employees.first_name,'_',employees.last_name),
    orders.order_id
FROM
    employees
left JOIN
    orders ON
    employees.employee_id=orders.employee_id
WHERE
    orders.order_id IS NULL

--4.Find customers who did not place any order in 2024
SELECT
    CONCAT(Customers.first_name,'_',Customers.last_name),
    orders.order_id,
    orders.order_date
FROM
    customers
left JOIN
    orders ON
    customers.customer_id=orders.customer_id
WHERE
    orders.order_id IS NULL and
    orders.order_date >= '2024-01-01' and
    orders.order_date <= '2024-12-31'

--5.Find employees in the Sales department who have never handled an order (join departments, then left join orders)
SELECT
    departments.department_name,
    CONCAT(employees.first_name,'_',employees.last_name),
    orders.order_id
FROM departments
left JOIN
    employees on
    departments.department_id=employees.department_id
left JOIN
    orders on
    employees.employee_id=orders.employee_id
WHERE
orders.order_id IS NULL
