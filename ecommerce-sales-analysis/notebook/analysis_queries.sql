-- =====================================================
-- E-Commerce Sales Analysis Project
-- Dataset: Olist E-commerce Dataset
-- Skills Used:
-- Joins, Aggregations, CTEs, Window Functions,
-- Date Functions, Ranking Functions
-- =====================================================

-- 1. Total Revenue Generated

SELECT
ROUND(SUM(payment_value), 2) AS total_revenue
FROM order_payments;

-- 2. Total Number of Orders

SELECT
COUNT(DISTINCT order_id) AS total_orders
FROM orders;

-- 3. Monthly Revenue Trend

SELECT
DATE_FORMAT(o.order_purchase_timestamp, '%Y-%m') AS month,
ROUND(SUM(op.payment_value), 2) AS monthly_revenue
FROM orders o
JOIN order_payments op
ON o.order_id = op.order_id
GROUP BY month
ORDER BY monthly_revenue DESC;

-- 4. Top 10 Products by Revenue

SELECT
product_id,
ROUND(SUM(price), 2) AS revenue
FROM order_items
GROUP BY product_id
ORDER BY revenue DESC
LIMIT 10;

-- 5. Top Product Categories by Revenue

SELECT
p.product_category_name,
ROUND(SUM(oi.price), 2) AS revenue
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.product_category_name
ORDER BY revenue DESC
LIMIT 10;

-- 6. Worst Performing Categories

SELECT
p.product_category_name,
ROUND(SUM(oi.price), 2) AS revenue
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.product_category_name
ORDER BY revenue ASC
LIMIT 10;

-- 7. Average Order Value

SELECT
ROUND(AVG(payment_value), 2) AS average_order_value
FROM order_payments;

-- 8. Top Customers by Spending

SELECT
o.customer_id,
ROUND(SUM(op.payment_value), 2) AS total_spent
FROM orders o
JOIN order_payments op
ON o.order_id = op.order_id
GROUP BY o.customer_id
ORDER BY total_spent DESC
LIMIT 10;

-- 9. Payment Method Analysis

SELECT
payment_type,
COUNT(*) AS total_transactions,
ROUND(SUM(payment_value), 2) AS total_revenue
FROM order_payments
GROUP BY payment_type
ORDER BY total_transactions DESC;

-- 10. Top Sellers by Revenue

SELECT
seller_id,
ROUND(SUM(price), 2) AS total_revenue
FROM order_items
GROUP BY seller_id
ORDER BY total_revenue DESC
LIMIT 10;

-- 11. Orders by Customer State

SELECT
c.customer_state,
COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_state
ORDER BY total_orders DESC;

-- 12. Running Revenue Total Using Window Function

WITH monthly_sales AS (

```
SELECT 
    DATE_FORMAT(o.order_purchase_timestamp, '%Y-%m') AS month,
    SUM(op.payment_value) AS revenue
FROM orders o
JOIN order_payments op
    ON o.order_id = op.order_id
GROUP BY month
```

)

SELECT
month,
revenue,
SUM(revenue) OVER(ORDER BY month) AS running_total
FROM monthly_sales;

-- 13. Product Revenue Ranking

SELECT
product_id,
revenue,
RANK() OVER(ORDER BY revenue DESC) AS product_rank
FROM (

```
SELECT 
    product_id,
    SUM(price) AS revenue
FROM order_items
GROUP BY product_id
```

) ranked_products;

-- 14. Year-over-Year Revenue Growth

WITH yearly_sales AS (

```
SELECT 
    YEAR(o.order_purchase_timestamp) AS year,
    SUM(op.payment_value) AS revenue
FROM orders o
JOIN order_payments op
    ON o.order_id = op.order_id
GROUP BY year
```

)

SELECT
year,
revenue,
LAG(revenue) OVER(ORDER BY year) AS previous_year_revenue,

```
ROUND(
    (
        (revenue - LAG(revenue) OVER(ORDER BY year))
        / LAG(revenue) OVER(ORDER BY year)
    ) * 100,
    2
) AS yoy_growth_percentage
```

FROM yearly_sales;
