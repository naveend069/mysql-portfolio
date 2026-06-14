SELECT
    JobLevel,
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
        )*100.0/COUNT(*),2
    ) AS AttritionRate

FROM employee_attrition
GROUP BY JobLevel
ORDER BY AttritionRate DESC;