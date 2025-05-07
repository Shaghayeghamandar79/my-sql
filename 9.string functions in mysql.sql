-- string functions 

Select length('skyfall');

select first_name , length(first_name)
From employee_demographics
Order by 2;


select salary , length('salary')
From employee_salary;

Select upper('sky');
Select lower('SKY');

select first_name , upper(first_name)
From employee_demographics;


select trim('           sky            ');

select ltrim('           sky            ');
select rtrim('           sky            ');

select first_name , 
left(first_name , 4),
right(first_name , 4),
substring(first_name , 3, 2),
substring(last_name,2,2),
birth_date,
substring(birth_date,9,2) as bith_day 
From employee_demographics;


select first_name , replace(first_name , 'a' , 'z')
From employee_demographics;

Select locate('a','shaghayegh');

select first_name ,
 locate('AN',first_name) ,
 concat(first_name , ' ', last_name) as full_name
From employee_demographics;
