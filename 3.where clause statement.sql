select *
From employee_salary
where first_name='Leslie';

select *
From employee_salary
where salary <= 50000;

select *
From employee_demographics
where gender!= 'female';

select *
From employee_demographics
where birth_date > '1985-01-01';


select *
From employee_demographics
where birth_date > '1985-01-01'
OR NOT gender='male';


select *
From employee_demographics
Where (first_name='Leslie' AND age=44) OR age >55;

select *
From employee_demographics
where first_name like '%er%';

select *
From employee_demographics
where first_name like 'a___%';

select *
From employee_demographics
where birth_date like '1987%';




