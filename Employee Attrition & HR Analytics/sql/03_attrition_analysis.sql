SELECT
    Department,
    COUNT(*) AS TotalEmployees,
    SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS EmployeesLeft,
    ROUND(
        SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)
        *100.0/COUNT(*),2
    ) AS AttritionRate
FROM employee_attrition
GROUP BY Department
ORDER BY AttritionRate DESC;