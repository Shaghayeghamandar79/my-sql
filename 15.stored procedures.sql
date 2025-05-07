-- stored procedures in mysql 

select *
from employee_salary
where salary >= 50000;



CREATE procedure large_salaries()
select *
from employee_salary
where salary >= 50000;


CALL large_salaries();


DELIMITER $$
CREATE procedure large_salaries3()
BEGIN
      select *
	  from employee_salary
      where salary >= 50000;
	  select *
      from employee_salary
      where salary >= 10000;
END $$
DELIMITER ;


CALL large_salaries3();

DELIMITER $$
CREATE procedure large_salaries7(P_employee_id INT)
BEGIN
      select salary
	  from employee_salary
      where employee_id = P_employee_id 
      ;
	  
END $$
DELIMITER ;


call large_salaries4(1);


