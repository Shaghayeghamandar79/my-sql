select first_name,
last_name,
age,
CASE
    WHEN age <=30 THEN 'young' 
    WHEN age between 31 and 50 THEN 'old'
    WHEN age >=50 THEN "On Death's Door"
END AS Age_Bracket
From employee_demographics;

-- Pay Increase and Bouns
-- < 50000=5%
-- >50000=7%
-- finance =10% bonus

Select first_name , last_name, salary,
Case
     When salary <50000 then salary * 1.05
     when salary >50000 then salary * 1.07
End AS new_salary,
Case 
    when dept_id =6 then salary *0.10
End as Bouns
From employee_salary;