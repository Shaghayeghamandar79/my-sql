Select gender, AVG(age)
From employee_demographics
group by gender
having AVG(age) >40;

Select occupation,AVG(salary)
From employee_salary
where occupation like '%manager%'
group by occupation
HAVING AVG(salary) > 75000;
