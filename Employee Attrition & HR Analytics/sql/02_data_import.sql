lSHOW VARIABLES LIKE 'local_infile';

LOAD DATA LOCAL INFILE
'C:/Users/acer/OneDrive/Desktop/Documents/mysql-portfolio/Employee Attrition & HR Analytics/WA_Fn-UseC_-HR-Employee-Attrition.csv'
INTO TABLE employee_attrition
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;