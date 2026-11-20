--1.Count employees per department, but only include employees hired after 2020. 
SELECT
    count(*) AS employee_count,
    department_id
from employees
WHERE
    hire_date > '2020-12-31'
GROUP BY
    department_id
ORDER BY
    count(*) DESC

--2.Find the total sales per customer for orders placed in 2024. 
SELECT
    SUM(total_amount) AS total_sales,
    customer_id
FROM orders
WHERE
    order_date >= '2024-01-01'
    AND order_date <= '2024-12-31'
GROUP BY
    customer_id
ORDER BY
    total_sales DESC;

--3.Find the average salary per department, for full-time employees only.  
SELECT
    ROUND(AVG(salary), 2) AS avg_salary,
    department_id
FROM employees
WHERE
    employment_type = 'Full-Time'
GROUP BY
    department_id
ORDER BY
    avg_salary DESC;

--4.Find departments with more than 1 full-time employee. 
SELECT
    COUNT(employee_id) AS employee_count,
    department_id
FROM employees
WHERE
    employment_type = 'Full-Time'
GROUP BY
    department_id
HAVING
    COUNT(employee_id) > 1
ORDER BY
    employee_count DESC;

--5.Find customers who spent over 500 in 2024 orders.
SELECT
    sum(total_amount) AS total_sales,
    customer_id
FROM orders
WHERE   
    order_date >= '2024-1-1' AND
    order_date <= '2024-12-31'
GROUP BY
    customer_id
HAVING
    sum(total_amount)>500
ORDER BY
    sum(total_amount) DESC
