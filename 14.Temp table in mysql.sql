-- Temporary Tables

CREATE TEMPORARY TABLE temp_table
(first_name varchar(50), 
last_name varchar(50),
favorite_movie varchar(100)
);

select *
From temp_table;

insert into temp_table
values('Alex', 'Freberg', 'Lord of the Rings: The Two Tower');



select *
from employee_salary;


CREATE TEMPORARY TABLE salary_over_50k
select *
From employee_salary
where salary >= 50000;



select *
from salary_over_50k;