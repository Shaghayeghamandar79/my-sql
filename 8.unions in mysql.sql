Select first_name , last_name
From employee_demographics
union distinct
Select first_name , last_name
From employee_salary
;


Select first_name , last_name , 'old man' As label
From employee_demographics
where age >40 And gender='Male'
union 
Select first_name , last_name , 'old Lady' As label
From employee_demographics
where age >40 And gender='female'
union
Select first_name , last_name , 'Highly Paid Employee' As label
From employee_salary
where salary >70000
order by first_name,last_name
;