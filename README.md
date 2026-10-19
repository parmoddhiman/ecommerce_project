# 🛒 E-commerce SQL Case Study

A hands-on SQL project on a synthetic e-commerce dataset (users, products, orders, order items, reviews, events), built in **Databricks**. I used it to practice SQL from basic queries up to joins, CTEs, and window functions.

## 🧰 Tech Stack

- **Databricks** (Unity Catalog + SQL notebook)
- **SQL** (Databricks SQL)
- **Git / GitHub** for version control

## 📂 Repository Structure

| File | Description | Rows |
|------|-------------|------|
| `users_10k.csv` | Customer profiles | 10,000 |
| `products_10k.csv` | Product catalog | 10,000 |
| `orders_10k.csv` | Order headers | 10,000 |
| `order_items_15k.csv` | Line items per order | 15,000 |
| `reviews_5k.csv` | Product ratings and review text | 5,000 |
| `events_10k.csv` | User activity (view / cart / wishlist / purchase) | 10,000 |
| `ecommerce_sql_case_study.sql` | Databricks notebook with all queries | - |


## 🗺️ Data Model

```
users ──< orders ──< order_items >── products
  │                                      │
  ├──< reviews >─────────────────────────┤
  └──< events >──────────────────────────┘
```

## ⚙️ Databricks Workflow

1. Created a **catalog** (`ecommerce`) and a **schema** (`retail`)
2. Uploaded the 6 CSV files and created tables inside `ecommerce.retail`
3. Wrote and ran the SQL queries in a Databricks notebook
4. Pushed the notebook and dataset to GitHub

## 📚 What I Learned (SQL Operations Used)

- **SELECT, WHERE**: Filtering rows (completed orders, products above 1000)
- **ORDER BY, LIMIT**: Sorting and picking Top-N results
- **Aggregate functions**: `COUNT`, `SUM`, `AVG`, `ROUND`
- **GROUP BY**: Grouping by city, category, order status, customer
- **HAVING**: Filtering on aggregated results (customers with 5+ orders, categories above 50,000 revenue)
- **JOINS**: Combining users, orders, products, and order_items
- **Subquery**: `NOT IN` to find customers with no orders
- **CTE (WITH)**: Writing cleaner multi-step queries
- **Window function**: `ROW_NUMBER() OVER (PARTITION BY ...)` for the top product in each category

## 💼 Business Requirements

In this E-commerce SQL Case Study, I ran real business requirements on the data using SQL, the kind of questions a business team asks an analyst:

- Customer base: total customers, city-wise distribution, customers who never ordered
- Sales and revenue: revenue by order status, category-wise revenue, top customers by revenue
- Customer behavior: frequent buyers, average order value, most active customers
- Product performance: best-selling products, top product in each category

Each requirement is written as a separate query in `ecommerce_sql_case_study.sql`, with the question in a comment above it.

