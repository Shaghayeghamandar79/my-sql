-- window functions 

SELECT dem.first_name , dem.last_name ,gender , AVG(salary) AS avg_salary
FROM employee_demographics AS dem 
JOIN employee_salary AS sal 
     ON dem.employee_id =  sal.employee_id
GROUP BY dem.first_name , dem.last_name ,gender
;


SELECT gender , AVG(salary) Over(partition by gender)
FROM employee_demographics AS dem 
JOIN employee_salary AS sal 
     ON dem.employee_id =  sal.employee_id
;



SELECT dem.first_name , dem.last_name , gender , AVG(salary) Over(partition by gender)
FROM employee_demographics AS dem 
JOIN employee_salary AS sal 
     ON dem.employee_id =  sal.employee_id
;



SELECT dem.first_name , dem.last_name , gender , salary,
SUM(salary) Over(partition by gender ORDER BY dem.employee_id) AS Rolling_Total
FROM employee_demographics AS dem 
JOIN employee_salary AS sal 
     ON dem.employee_id =  sal.employee_id
;

SELECT dem.employee_id , dem.first_name , dem.last_name , gender , salary,
ROW_NUMBER() OVER(partition by gender ORDER BY salary desc) AS row_num ,
RANK () OVER(partition by gender ORDER BY salary desc) AS rank_num,
DENSE_RANK () OVER(partition by gender ORDER BY salary desc) AS dense_rank_num
FROM employee_demographics AS dem 
JOIN employee_salary AS sal 
     ON dem.employee_id =  sal.employee_id
;







