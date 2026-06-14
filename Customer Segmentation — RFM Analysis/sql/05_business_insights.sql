SELECT *
FROM customer_segments;

SELECT
    customer_segment,
    COUNT(*) AS customers
FROM customer_segments
GROUP BY customer_segment
ORDER BY customers DESC;

SELECT
    customer_segment,
    ROUND(SUM(monetary),2) AS revenue_per_segment
FROM customer_segments
GROUP BY customer_segment
ORDER BY revenue_per_segment DESC;

SELECT
    customer_segment,
    ROUND(AVG(monetary),2) AS avg_spend_per_segment
FROM customer_segments
GROUP BY customer_segment
ORDER BY avg_spend_per_segment DESC;

SELECT *
FROM customer_segments
WHERE customer_segment = 'VIP'
ORDER BY monetary DESC
LIMIT 10;

SELECT *
FROM customer_segments
WHERE customer_segment = 'At_Risk'
ORDER BY recency DESC;

SELECT *
FROM customer_segments
WHERE customer_segment = 'Lost'
ORDER BY recency DESC;