

CREATE TABLE employees (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  department VARCHAR(50) NOT NULL,
  salary NUMERIC(10,2) CHECK (salary > 0)
);




INSERT INTO employees (name, department, salary) VALUES
-- ('Rahim', 'IT', 50000),
('shihab', 'HR', 50000)
-- ('Sumon', 'Marketing', 45000),
-- ('Rafi', 'IT', 60000);


-- finde higest sellery
select max(salary) from employees;

-- find which employee higest selary 
select * from employees where salary=(select max(salary) from employees);

-- find employees who  earn more then the average salery
select avg(salary) from employees  ;
select * from employees  where salary>(select avg(salary) from employees);

-- name of the employee who gets the highest salary in HR department
-- select department  from employees  group by department ;
select max(salary) from employees  where department ='HR'  ;
select *  from employees  where department ='HR' and salary=(select max(salary) from employees  where department ='HR') ;

-- aita diye onno department ar  jodi same salary thake seta dibe 
select * from employees  where salary =(select max(salary) from employees  where department ='HR');
