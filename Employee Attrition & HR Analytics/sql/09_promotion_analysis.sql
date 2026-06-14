SELECT
    Attrition,
    ROUND(
        AVG(YearsSinceLastPromotion),
        2
    ) AS AvgYearsWithoutPromotion
FROM employee_attrition
GROUP BY Attrition;

SELECT
    CASE
        WHEN YearsSinceLastPromotion <= 1 THEN '0-1 Years'
        WHEN YearsSinceLastPromotion <= 3 THEN '2-3 Years'
        ELSE '4+ Years'
    END AS PromotionGap,

    COUNT(*) AS Employees,

    SUM(
        CASE
            WHEN Attrition='Yes'
            THEN 1
            ELSE 0
        END
    ) AS AttritionCount,

    ROUND(
        SUM(
            CASE
                WHEN Attrition='Yes'
                THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS AttritionRate

FROM employee_attrition
GROUP BY PromotionGap;