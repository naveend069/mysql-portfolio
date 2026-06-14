SELECT
    JobRole,
    ROUND(AVG(YearsAtCompany),2) AS AvgYearsAtCompany
FROM employee_attrition
GROUP BY JobRole
ORDER BY AvgYearsAtCompany DESC;