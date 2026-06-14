DELIMITER //

CREATE PROCEDURE high_attrition_dept()
BEGIN

SELECT
    Department,

    ROUND(
        SUM(
            CASE
                WHEN Attrition='Yes'
                THEN 1
                ELSE 0
            END
        ) * 100 / COUNT(*),
        2
    ) AS AttritionRate

FROM employee_attrition

GROUP BY Department

HAVING AttritionRate > 15

ORDER BY AttritionRate DESC;

END //

DELIMITER ;

CALL high_attrition_dept();