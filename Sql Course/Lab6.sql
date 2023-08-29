use restaurant;
select first_name,department_id,name from employees join departments on departments.id=employees.department_id;

select first_name,department_id,name from employees left join departments on departments.id=employees.department_id;
select first_name, department_id,departments.name from employees right join departments on departments.id=employees.department_id limit 20;

select id,first_name from employees where id < 3

union

select id,first_name from employees where id>6;

select first_name, name from employees cross join departments;

-- 1
use soft_uni;
select employee_id, concat_ws(' ',first_name, last_name),departments.department_id,departments.name 
from departments inner join employees on departments.manager_id=employees.employee_id 
order by employee_id 
limit 5;

-- 2
select towns.town_id,name as 'town_name',address_text from towns 
join addresses on towns.town_id=addresses.town_id 
where name in('San Francisco','Sofia','Carnation') 
order by town_id,address_id;

-- 3
select employee_id, first_name, last_name, department_id, salary from employees where manager_id is null;

-- 4
select count(*) as 'count' from employees where salary>(select avg(salary) from employees);
