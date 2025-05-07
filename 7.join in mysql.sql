select * 
From parks_departments;

Select *
From employee_demographics;

-- inner join 

select employee_id , age , department_name 
From parks_departments as pd
inner join employee_demographics as emp
     ON pd.department_id = emp.employee_id;
     
     
select *
From employee_demographics;

Select *
From employee_salary;

Select dem.employee_id , age ,occupation
From employee_demographics as dem  
inner join employee_salary as sal 
    ON dem.employee_id = sal.employee_id;
    
    
-- outer join 

Select *
From employee_demographics as dem  
left join employee_salary as sal 
    ON dem.employee_id = sal.employee_id;


Select *
From employee_demographics as dem  
Right join employee_salary as sal 
    ON dem.employee_id = sal.employee_id;
    
    
-- self join 

Select emp1.employee_id as emp_santa,
emp1.first_name as first_name_santa,
emp1.last_name  as last_name_santa,
emp2.employee_id as emp_name,
emp2.first_name as first_name_emp,
emp2.last_name  as last_name_emp
From employee_salary as emp1
join employee_salary as emp2
    ON emp1.employee_id+ 1=emp2.employee_id;


-- joinig multiple tables together 
    
Select *
From employee_demographics as dem  
inner join employee_salary as sal 
    ON dem.employee_id = sal.employee_id
INNER join parks_departments as pd 
      ON sal.dept_id = pd.department_id
;
    
Select *
From parks_departments;

