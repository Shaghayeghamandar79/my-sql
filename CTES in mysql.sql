with CTE_Example AS 
(
SELECT  gender , AVG (salary) AS avg_sal , MAX(salary) as max_sal , MIN(salary) as min_sal, COUNT(salary) as count_sal
From employee_demographics AS dem 
join employee_salary AS sal 
     ON dem.employee_id = sal.employee_id
Group BY gender 
)
Select *
From  CTE_Example 
;





with CTE_Example   AS 
(
SELECT employee_id, gender, birth_date
From employee_demographics AS dem 
where birth_date > '1985-01-01'
),
CTE_Example2  As 
(
SELECT employee_id , salary
FROM employee_salary
where salary > 50000
)

Select *
From  CTE_Example 
join CTE_Example2
     ON CTE_Example.employee_id = CTE_Example2.employee_id
;

