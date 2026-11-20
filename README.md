# SQL Practice: From Beginner to Business Reporting

A hands-on SQL portfolio built in PostgreSQL. It starts with a 30-day bootcamp on a small practice database and continues with a new business dataset every week (supply chain, production, sales, and more), with the goal of turning cleaned query results into Power BI reports.

> **Status:** 30-day bootcamp completed. Weekly business datasets in progress.

---

## What is in this repository

```
sql-practice/
├── README.md
├── bootcamp-30-days/
│   ├── dataset/
│   │   └── sql_practice_dataset.sql
│   ├── week1-basics/          day01_select.sql ... day07_review.sql
│   ├── week2-aggregation/     day08 ... day14
│   ├── week3-joins/           day15 ... day21
│   └── week4-advanced/        day22 ... day28
└── weekly-datasets/
    └── 01-supply-chain/
        ├── dataset/           week1_supply_chain_dataset.sql, CSV files
        └── solutions/         day01.sql ... day06.sql
```

---

## Tools used

- **PostgreSQL** for the database
- **VS Code** with the **SQLTools** extension for writing and running queries
- **pgAdmin** / **DBeaver** for loading and inspecting data
- **Power BI Desktop** for reporting (planned for the weekly datasets)

---

## Part 1: 30-day SQL bootcamp

### Practice database

A small retail and HR database with 7 related tables.

| Table | Rows | Description |
|---|---|---|
| `departments` | 6 | Company departments |
| `employees` | 15 | Staff, with salary, manager and department |
| `categories` | 6 | Product categories |
| `products` | 20 | Products with price and stock |
| `customers` | 12 | Customers and their cities |
| `orders` | 20 | Orders, with order and shipped dates |
| `order_items` | 34 | Products on each order |

The data contains deliberate NULLs (missing phone numbers, unshipped orders, customers with no orders) so that NULL handling and outer joins can be practised.

### What was covered

| Week | Topics |
|---|---|
| 1 | `SELECT`, `WHERE`, `AND` / `OR` / `NOT`, `ORDER BY`, `LIMIT` / `OFFSET`, `NULL` handling |
| 2 | Aggregates (`COUNT`, `SUM`, `AVG`, `MIN`, `MAX`), `GROUP BY`, `HAVING`, `DISTINCT`, string functions |
| 3 | `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`, `FULL JOIN`, multi-table joins, self joins, finding unmatched rows with `IS NULL` |
| 4 | Subqueries, `CASE WHEN`, CTEs (`WITH`), window functions (`RANK`, `ROW_NUMBER`, `LAG`, running totals), final project queries |

### Example query

Customers who spent more than the average customer, using a CTE:

```sql
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
ORDER BY total_spent DESC;
```

---

## Part 2: Weekly business datasets

Each week uses a new, larger and messier dataset in its own database, followed by SQL problems and a Power BI report.

| Week | Dataset | Status |
|---|---|---|
| 1 | Supply chain | In progress |
| 2 | Production (machines, shifts, defects, downtime) | Planned |
| 3 | Retail sales (customers, orders, returns) | Planned |
| 4 | HR (attendance, payroll, attrition) | Planned |
| 5 | Finance (accounts, transactions) | Planned |
| 6 | Logistics or a dataset of my choice | Planned |

### Week 1: Supply chain

A synthetic purchasing and inventory database covering purchase orders from 2024 to 2025 and an inventory snapshot from December 2025.

| Table | Rows | One row per |
|---|---|---|
| `suppliers` | 25 | supplier |
| `products` | 80 | product |
| `warehouses` | 6 | warehouse |
| `carriers` | 5 | carrier |
| `purchase_orders` | 600 | purchase order |
| `purchase_order_items` | 1,302 | product line on an order |
| `shipments` | 566 | shipment |
| `inventory` | 337 | product in a warehouse |

Business questions answered with SQL:

- On-time delivery rate per supplier
- Fill rate and damage rate by supplier and category
- Average lead time and freight cost by carrier mode
- Supplier share of total spend
- Products below reorder level in each warehouse
- Monthly spend with a running total, and month-over-month order changes

The dataset contains deliberate data-quality problems (inconsistent spellings, missing values) that are cleaned in SQL views before the data is loaded into Power BI.

---

## How to run it

1. Install PostgreSQL and create a database for the dataset you want, for example:

   ```sql
   CREATE DATABASE supply_chain;
   ```

2. Connect to that database and run the dataset file:

   ```bash
   psql -U postgres -d supply_chain -f week1_supply_chain_dataset.sql
   ```

   Make sure you are connected to the right database first. The files start with `DROP TABLE IF EXISTS`, so running one against the wrong database can delete tables.

3. Open the solution files in VS Code and run the queries with SQLTools.

---

## Skills demonstrated

- Writing and debugging SQL queries in PostgreSQL
- Joining multiple tables and finding unmatched records
- Aggregating data and building business KPIs
- Using CTEs and window functions for ranking and trend analysis
- Cleaning inconsistent data and building views
- Checking results by reconciling totals

---

## Data notes

- All data is synthetic and was created for learning. It does not come from a real company.
- In the bootcamp dataset, `orders.total_amount` does not always equal the sum of its `order_items`, because the sample data was entered by hand. Reports that need item-level revenue use `order_items`.

---

## Author

Fahim Faisal Tamim
[https://www.linkedin.com/in/fahimfaisaltamim] · [fahimftamim@gmail.com]
