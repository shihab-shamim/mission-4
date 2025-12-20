
select * from employees join departments on employees.department_id=departments_id;
-- using diye department_id 2 jaigai same thakte hobe ; aita short kore 
select * from employees join departments using(department_id)

-- show deparment  bane with average sellery  group by use korle  je ta diye groupe korbo seta diye hobe * tar bodole 
select department_name round(avg(sellery)) from employees join departments using(department_id) group by department_name;

-- count employee each department . kon department a  koto jon ase dekha jabe
select department_name count(*) AS total_employees from employees join departments using(department_id) group by department_name;

-- find the department name with the highest  average sellery 
select department_name avg(sellery) AS avg_sellery from employees join departments using(department_id) group by department_name order by avg_sellery desc limit 1;

-- count employees hired each year
-- select extract(year from "2020-12-25"::date)  extract method diye  date a convert kore 
select  extract(year from hire_date::date) as hired_year count(*) from employees   group by hired_year