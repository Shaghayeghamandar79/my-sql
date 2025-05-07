-- Select Statement 

select *
From employee_demographics;


select first_name , 
age, 
(age+20) * 10 +2
From employee_demographics;


select distinct gender 
from employee_demographics;


-- Where Clause 
select first_name, 
last_name,
salary
from employee_salary
where first_name = 'Ron';

select *
from employee_salary
where salary  < 57000;

select *
From employee_demographics
where gender != 'Male'
;

select *
From employee_demographics
where age < 40;

select *
From employee_demographics
where birth_date > '1988-01-01';

-- And Or Not -- Logical Operators

select *
From employee_demographics
where birth_date > '1988-01-01'
And gender = 'Female';

select *
From employee_demographics
where birth_date > '1988-01-01'
OR gender = 'Female';


select *
From employee_demographics
where birth_date > '1988-01-01'
OR  NOT gender = 'Female';


select *
From employee_demographics
where (last_name = 'Perkins' and age > 30) or gender = 'Male';

-- Like Statement

select *
From employee_demographics
where last_name Like '%Wy%';

select *
From employee_demographics
where last_name Like 'D_%';


select *
From employee_demographics
where birth_date Like '1989%';


select *
From employee_demographics
where birth_date Like '19__-0%-0%';

select *
From parks_departments
where department_name Like 'P%';


-- group by 

select gender , Avg(age)
from employee_demographics
group by gender;

select stage , 
Avg(funds_raised_millions) , 
Count(funds_raised_millions), 
Min(funds_raised_millions), 
Max(funds_raised_millions)
from layoffs_staging3
group by stage
order by stage DESC;

select occupation , salary
from employee_salary
group by occupation,salary;


select gender , 
Avg(age) , 
Min(age) , 
Max(age) , 
count(age)
from employee_demographics
group by gender;


-- Order By 
select *
from employee_demographics
order by gender , age DESC;


select *
from employee_demographics
order by age , gender;

-- having Vs Where 

select gender , Avg(age)
from employee_demographics
group by gender
having Avg(age) > 30;


select stage , Avg(total_laid_off)
From layoffs_staging3
where stage Like 'Series%'
group by stage
having Avg(total_laid_off) >100;


 -- Limit and Aliasing
 
 select *
From layoffs_staging3
order by total_laid_off DESC
limit 3 ,1;

-- Aliasing 
select gender , Avg(age) as avg_age
from employee_demographics
group by gender
having avg_age > 30;


select stage , Avg(total_laid_off) as avg_tota
From layoffs_staging3
where stage Like 'Series%'
group by stage
having avg_tota >100;
