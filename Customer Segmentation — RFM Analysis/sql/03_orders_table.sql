CREATE TABLE retail_clean AS
SELECT *
FROM retail_raw
WHERE InvoiceNo NOT LIKE 'C%'
  AND Quantity > 0
  AND UnitPrice > 0;

SELECT COUNT(*) AS cleaned_rows
FROM retail_clean;

ALTER TABLE retail_clean
ADD COLUMN sales_amount DECIMAL(12,2);

SET SQL_SAFE_UPDATES = 0;

UPDATE retail_clean
SET sales_amount = Quantity * UnitPrice;

SET SQL_SAFE_UPDATES = 1;

CREATE TABLE orders AS
SELECT
    InvoiceNo,
    CustomerID,
    STR_TO_DATE(InvoiceDate,'%d-%m-%Y') AS order_date,
    SUM(sales_amount) AS order_amount
FROM retail_clean
GROUP BY
    InvoiceNo,
    CustomerID,
    STR_TO_DATE(InvoiceDate,'%d-%m-%Y');

SELECT *
FROM orders
LIMIT 10;

SELECT COUNT(*) AS total_orders
FROM orders;

SELECT MAX(order_date) AS analysis_date
FROM orders;