SELECT * FROM hr_data LIMIT 20;

-- total number of employees?
SELECT 
 COUNT(*) AS total_employees
 FROM hr_data
 WHERE employee_count = 1 ;
-- How many employees have left the company?
SELECT 
  COUNT(*) AS employees_left
  FROM hr_data
  WHERE attrition_flag = 1;
-- What is the overall attrition rate (%)?
SELECT 
    ROUND((SUM(attrition_flag= 1) / COUNT(*)) * 100, 2) AS attrition_rate
FROM hr_data;
--department with the highest attrition rate?
SELECT
 department,
 COUNT(*) AS total_employees,
 SUM(attrition_flag = 1) AS employees_left,
 ROUND((SUM(attrition_flag=1) / COUNT(*)) * 100, 2 ) AS attrition_rate
FROM hr_data
GROUP BY department
Order By attrition_rate DESC;
--Average monthly income of employees who left vs stayed
SELECT 
 attrition_flag,
 AVG(monthly_income) AS Avg_monthly_income
FROM hr_data
GROUP BY attrition_flag;
-- Attrition rate for employees who work overtime vs those who don't
SELECT
 over_time,
 COUNT(*) AS total_employees,
 SUM(attrition_flag= 1) AS employee_left,
 ROUND((SUM(attrition_flag= 1)/ COUNT(*)) * 100 , 2) AS Attrition_rate
FROM hr_data
GROUP BY over_time;
-- Attrition rate by years at company
SELECT
    CASE
        WHEN years_at_company BETWEEN 1 AND 3 THEN '1-3 years'
        WHEN years_at_company BETWEEN 3 AND 5 THEN '3-5 years'
        ELSE 'Over 5 years'
    END AS years_range,
    COUNT(*) AS total_employees,
    SUM(attrition_flag = 1) AS employees_left,
    ROUND((SUM(attrition_flag = 1) / COUNT(*)) * 100, 2) AS attrition_rate
FROM hr_data
GROUP BY years_range
ORDER BY 
    CASE 
        WHEN years_range = '1-3 years' THEN 1
        WHEN years_range = '3-5 years' THEN 2
        ELSE 3
    END;
--Attrition rate by age group
SELECT
 age_Group,
 COUNT(*) AS total_employees,
 SUM(attrition_flag= 1) AS employees_left,
 ROUND((SUM(attrition_flag=1) / COUNT(*)) * 100 , 2) AS attrition_rate
FROM hr_data
GROUP BY age_Group;
--Attrition rate by age group

SELECT
 age_Group,
 COUNT(*) AS total_employees,
 SUM(attrition_flag= 1) AS employees_left,
 ROUND((SUM(attrition_flag=1) / COUNT(*)) * 100 , 2) AS attrition_rate
FROM hr_data
GROUP BY age_Group;
--Attrition rate by job satisfaction level
SELECT
    job_satisfaction AS job_satisfaction_rating,
    COUNT(*) AS total_employees,
    SUM(attrition_flag = 1) AS employees_left,
    ROUND((SUM(attrition_flag = 1) / COUNT(*)) * 100, 2) AS attrition_rate
FROM hr_data
GROUP BY job_satisfaction
ORDER BY job_satisfaction;









