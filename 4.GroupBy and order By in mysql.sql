Select gender, AVG(age), max(age),MIN(age),count(age)
From employee_demographics
group by gender;

Select occupation ,salary
From employee_salary
group by occupation , salary;

Select *
From employee_salary;

-- order by 
Select *
From employee_demographics
order by gender, age DESC;

Select *
From employee_demographics
order by gender, age;
