DROP TABLE IF EXISTS customer_segments;

CREATE TABLE customer_segments AS

WITH rfm_base AS (

    SELECT
        CustomerID,

        DATEDIFF(
            (SELECT MAX(order_date)
             FROM orders),
            MAX(order_date)
        ) AS recency,

        COUNT(InvoiceNo) AS frequency,

        ROUND(SUM(order_amount),2) AS monetary

    FROM orders
    WHERE CustomerID <> 0
    GROUP BY CustomerID
),

rfm_score AS (

    SELECT
        CustomerID,
        recency,
        frequency,
        monetary,

        NTILE(4) OVER (
            ORDER BY recency DESC
        ) AS r_score,

        NTILE(4) OVER (
            ORDER BY frequency
        ) AS f_score,

        NTILE(4) OVER (
            ORDER BY monetary
        ) AS m_score

    FROM rfm_base
)

SELECT
    CustomerID,
    recency,
    frequency,
    monetary,
    r_score,
    f_score,
    m_score,

    CASE

        WHEN r_score >= 4
         AND f_score >= 4
         AND m_score >= 4
        THEN 'VIP'

        WHEN r_score >= 3
         AND f_score >= 3
        THEN 'Loyal'

        WHEN r_score <= 2
         AND f_score >= 3
        THEN 'At_Risk'

        ELSE 'Lost'

    END AS customer_segment

FROM rfm_score;