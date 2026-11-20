-- Problem 1: Employees earning above the average, using a CTE
WITH
    company_average AS(
         SELECT
            ROUND(AVG(salary),0) AS average_salary
         FROM
            employees)
SELECT
    first_name,
    last_name,
    salary
FROM
    employees
WHERE
    salary >(
            SELECT
                average_salary
            FROM
                company_average
    )

-- Problem 2: Top 5 customers by total spent, with first names
WITH
    customer_total AS(
            SELECT
                customer_id,
                SUM(total_amount) as total_amount
            FROM
                orders
            GROUP BY
                customer_id)
SELECT
    CONCAT(Customers.first_name,' ',Customers.last_name) AS customers_name,
    customer_total.total_amount
FROM
    customer_total
left join
    Customers on
        customer_total.customer_id=Customers.customer_id
ORDER BY
    total_amount desc

-- Problem 3: The month in 2024 with the highest revenue
WITH monthly_revenue AS (
    SELECT EXTRACT(MONTH FROM order_date) AS month,
           SUM(total_amount)              AS revenue
    FROM orders
    WHERE order_date >= '2024-01-01'
      AND order_date <  '2025-01-01'
    GROUP BY EXTRACT(MONTH FROM order_date)
)
SELECT month, revenue
FROM monthly_revenue
ORDER BY revenue DESC
LIMIT 1;

-- Problem 4: Customers who spent more than the average customer total
WITH customer_totals AS (
    SELECT customer_id,
           SUM(total_amount) AS total_spent
    FROM orders
    GROUP BY customer_id
)
SELECT customer_id, total_spent
FROM customer_totals
WHERE total_spent > (
    SELECT AVG(total_spent)
    FROM customer_totals
)

-- Problem 5: Orders and revenue per employee, using two CTEs
WITH orders_per_employee AS (
    SELECT employee_id,
           COUNT(*) AS order_count
    FROM orders
    GROUP BY employee_id
),
revenue_per_employee AS (
    SELECT employee_id,
           SUM(total_amount) AS revenue
    FROM orders
    GROUP BY employee_id
)
SELECT employees.first_name,
       orders_per_employee.order_count,
       revenue_per_employee.revenue
FROM employees
INNER JOIN orders_per_employee
    ON employees.employee_id = orders_per_employee.employee_id
INNER JOIN revenue_per_employee
    ON employees.employee_id = revenue_per_employee.employee_id
ORDER BY revenue_per_employee.revenue DESC;
