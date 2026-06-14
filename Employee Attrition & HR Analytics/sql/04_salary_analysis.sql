SELECT
    Attrition,
    ROUND(AVG(MonthlyIncome),2) AS AvgSalary
FROM employee_attrition
GROUP BY Attrition;

SELECT
CASE
    WHEN MonthlyIncome < 5000 THEN 'Low'
    WHEN MonthlyIncome BETWEEN 5000 AND 10000 THEN 'Medium'
    ELSE 'High'
END AS SalaryBand,
COUNT(*) AS Employees,
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS AttritionCount
FROM employee_attrition
GROUP BY SalaryBand;