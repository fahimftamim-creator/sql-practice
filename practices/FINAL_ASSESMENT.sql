--1.Monthly report for 2024: for each month show the number of orders and the total revenue.
-- Monthly report for 2024
WITH monthly_revenue AS (
    SELECT EXTRACT(MONTH FROM order_date) AS month,
           COUNT(*)                       AS order_count,
           SUM(total_amount)              AS total_revenue
    FROM orders
    WHERE order_date >= '2024-01-01'
      AND order_date <  '2025-01-01'
    GROUP BY EXTRACT(MONTH FROM order_date)
)
SELECT month, order_count, total_revenue
FROM monthly_revenue
ORDER BY month

--- 2.Find customers at risk of leaving: those who ordered in 2023 but not in 2024
WITH customer_2023 AS (
    SELECT 
        DISTINCT customer_id
    FROM
        Orders
    WHERE
        order_date >= '2023-01-01' and
        order_date < '2024-01-01'
),
 customer_2024 AS (
    SELECT
        DISTINCT customer_id
    FROM
        Orders
    WHERE
        order_date>='2024-01-01' AND
        order_date < '2025-01-01'
)
SELECT
    customers.customer_id,
    CONCAT(customers.first_name,' ','customers.last_name') AS customers_name
FROM
    customer_2023
left JOIN
    customer_2024 ON
    customer_2023.customer_id=customer_2024.customer_id
inner JOIN
    Customers ON
    customer_2023.customer_id=customers.customer_id
WHERE
    customer_2024.customer_id is null

--3.Show each employee's salary, their department's average salary, and a label (Above average, Below average or At average)
WITH employees_with_average AS (
    SELECT
        CONCAT(employees.first_name, ' ', employees.last_name) AS employee_name,
        employees.employee_id,
        departments.department_name,
        employees.salary,
        AVG(employees.salary) OVER (
            PARTITION BY employees.department_id
        ) AS department_average
    FROM employees
    LEFT JOIN departments
        ON employees.department_id = departments.department_id
)
SELECT
    employee_name,
    employee_id,
    department_name,
    salary,
    ROUND(department_average, 2) AS department_average,
    CASE
        WHEN salary > department_average THEN 'Above Average'
        WHEN salary < department_average THEN 'Below Average'
        ELSE 'At Average'
    END AS comparison
FROM employees_with_average
ORDER BY salary DESC;


--4.Product performance report: product name, category name, units sold, revenue, and rank within its category.

WITH product_performance_report AS (
    SELECT
        categories.category_id,
        categories.category_name,
        products.product_name,
        SUM(order_items.quantity * order_items.unit_price) AS product_revenue
    FROM products
    LEFT JOIN categories
        ON products.category_id = categories.category_id
    LEFT JOIN order_items
        ON products.product_id = order_items.product_id
    GROUP BY
        categories.category_id,
        categories.category_name,
        products.product_id,
        products.product_name
)
SELECT
    category_name,
    product_name,
    product_revenue,
    SUM(product_revenue) OVER (
        PARTITION BY category_id
    ) AS category_revenue
FROM product_performance_report

-- 5.Group customers by number of orders (1 order, 2 to 3 orders, 4 or more) and show how many customers and the average total spent per group
-- Product performance: units sold, revenue, and rank within each category
WITH product_sales AS (
    SELECT products.product_id,
           products.product_name,
           products.category_id,
           SUM(order_items.quantity)                          AS units_sold,
           SUM(order_items.quantity * order_items.unit_price) AS revenue
    FROM order_items
    INNER JOIN products
        ON order_items.product_id = products.product_id
    GROUP BY products.product_id, products.product_name, products.category_id
)
SELECT categories.category_name,
       product_sales.product_name,
       product_sales.units_sold,
       product_sales.revenue,
       RANK() OVER (
           PARTITION BY categories.category_name
           ORDER BY product_sales.revenue DESC
       ) AS revenue_rank
FROM product_sales
INNER JOIN categories
    ON product_sales.category_id = categories.category_id
ORDER BY categories.category_name, revenue_rank;