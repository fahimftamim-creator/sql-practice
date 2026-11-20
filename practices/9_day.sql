--1.Count how many employees are in each department.
SELECT
    Count(*) AS employee_count,
    department_id    
FROM employees
GROUP BY
    department_id 
ORDER BY
    employee_count DESC

--2.Find the total sales amount per customer.
SELECT
customer_id,
sum(total_amount) AS total_sales
FROM orders
GROUP BY
    customer_id
ORDER BY
    total_sales DESC

--3.Find the average price of products per category.
SELECT
    category_id,
   ROUND (AVG(price),2) AS avg_price
FROM products
GROUP BY category_id
ORDER BY avg_price DESC;

--4.Count how many orders were placed per day.
SELECT
    Count(total_amount) AS order_count,
    order_date
FROM orders 
GROUP BY
    order_date
ORDER BY
    order_count DESC

--5.Find the maximum salary in each department.
SELECT
    MAX (salary)AS maximum_salary,
    department_id
FROM employees
GROUP BY department_id
ORDER BY
    maximum_salary DESC