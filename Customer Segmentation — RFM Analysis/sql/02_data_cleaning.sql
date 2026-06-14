SHOW VARIABLES LIKE 'local_infile';

LOAD DATA LOCAL INFILE
'C:/Users/acer/OneDrive/Desktop/Copy of Online Retail.csv'
INTO TABLE retail_raw
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT COUNT(*) AS total_rows
FROM retail_raw;

SELECT COUNT(*) AS missing_customers
FROM retail_raw
WHERE CustomerID IS NULL;

SELECT COUNT(*) AS cancelled_orders
FROM retail_raw
WHERE InvoiceNo LIKE 'C%';

SELECT COUNT(*) AS invalid_quantity
FROM retail_raw
WHERE Quantity <= 0;

SELECT COUNT(*) AS invalid_price
FROM retail_raw
WHERE UnitPrice <= 0;

SELECT Quantity, COUNT(*) AS cnt
FROM retail_raw
WHERE Quantity <= 0
GROUP BY Quantity
ORDER BY Quantity;

SELECT *
FROM retail_raw
WHERE UnitPrice <= 0
LIMIT 20;

SELECT InvoiceDate
FROM retail_raw
LIMIT 10;

SELECT
    MIN(InvoiceDate) AS first_order,
    MAX(InvoiceDate) AS last_order
FROM retail_raw;