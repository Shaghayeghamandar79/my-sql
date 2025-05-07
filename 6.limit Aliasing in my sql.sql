select *
From employee_demographics
order by age DESC
LIMIT 2,1;

select gender,AVG(age) AS avg_age
From employee_demographics
GROUP BY gender
having avg_age >40;
