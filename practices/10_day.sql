--1.Find departments with more than 2 employees.
SELECT
    COUNT(*) AS employee_count,
    department_id
FROM employees
GROUP BY
    department_id
HAVING
    COUNT(*) > 2;

--2.Find customers who have placed more than 1 order.
SELECT
    sum(total_amount) as total_orders,
    customer_id
FROM orders
GROUP BY
    customer_id
HAVING
    sum(total_amount)>1

--3.Find categories where the average product price is above 40.
SELECT
    ROUND(AVG(price),2) as avg_price,
    category_id
FROM products
GROUP BY   
    category_id
HAVING
    ROUND(AVG(price),2) > 40

--4.Find order dates where total sales exceeded 500.
SELECT
    sum(total_amount) AS total_sales,
    order_date
FROM orders
GROUP by
    order_date
HAVING
sum(total_amount)>500

--5.Find departments where the total salary bill exceeds 100,000.
SELECT
    SUM(salary) AS salary_bills,
    department_id
FROM employees
GROUP BY
    department_id
HAVING
    SUM(salary) > 100000;