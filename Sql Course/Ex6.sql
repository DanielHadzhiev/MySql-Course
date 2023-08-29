-- 1
use soft_uni;
select employee_id, job_title, addresses.address_id, address_text 
from employees join addresses on employees.address_id=addresses.address_id 
order by address_id limit 5;

-- 2
select first_name,last_name,towns.name,addresses.address_text 
from addresses join towns on towns.town_id=addresses.town_id 
join employees on employees.address_id=addresses.address_id 
order by first_name,last_name limit 5;

-- 3
select employee_id, first_name, last_name, employees.department_id 
from employees join departments on employees.department_id=departments.department_id 
and departments.name='Sales' 
order by employee_id desc;

-- 4
select employee_id, first_name, salary, departments.name 
from employees join departments on employees.department_id=departments.department_id 
where salary>15000 
order by employees.department_id desc limit 5;

-- 5
select e.employee_id, e.first_name from employees as e 
left join employees_projects as ep on e.employee_id=ep.employee_id 
where ep.project_id is null 
order by e.employee_id desc limit 3;

-- 6
select first_name, last_name, hire_date, departments.name as 'dept_name' 
from employees join departments on employees.department_id=departments.department_id 
where hire_date>'1999-1-1' and departments.name in ('Sales','Finance') 
order by hire_date asc ;

-- 7
select e.employee_id, first_name, p.name as project_name from employees as e 
join employees_projects as ep on e.employee_id=ep.employee_id
join projects as p on ep.project_id=p.project_id 
where date(p.start_date)>'2002-08-13' and p.end_date is null 
order by first_name,p.name limit 5;

-- 8
select e.employee_id, first_name, if(year(p.start_date)>=2005,null,p.name) 
from employees as e 
join employees_projects as ep on ep.employee_id=e.employee_id
join projects as p on ep.project_id=p.project_id 
where e.employee_id = 24 
order by p.name;

-- 9
select employee_id, first_name, manager_id as mi, (select first_name from employees where mi=employee_id)
from employees 
where manager_id in(3,7) 
order by first_name asc;

-- 10
select e.employee_id, concat_ws(' ',e.first_name,e.last_name) as 'Employee name',
concat_ws(' ',m.first_name,m.last_name) as 'Manager name',
d.name 
from employees as e 
join employees as m on e.manager_id = m.employee_id
join departments as d on e.department_id = d.department_id order by e.employee_id limit 5;

-- 11
select avg(employees.salary) as avg_departments 
from employees group by department_id 
order by avg_departments limit 1;

-- 12
use geography;
select c.country_code, mountain_range, peak_name, elevation 
from  countries as c 
join mountains_countries as mc on c.country_code= mc.country_code
join mountains as m on mc.mountain_id=m.id
join peaks as p on m.id=p.mountain_id
where c.country_code ='BG' and elevation>2835
order by elevation desc;

-- 13
select c.country_code, count(mountain_range)  as count_mountains
from countries as c 
join mountains_countries as mc on c.country_code =mc.country_code
join mountains as m on mc.mountain_id=m.id 
where c.country_code in ('BG','RU','US') 
group by country_code
order by count_mountains desc;

-- 14
select country_name, river_name 
from countries as c 
left join countries_rivers as cr on c.country_code=cr.country_code
left join rivers as r on cr.river_id=r.id 
join continents as cn  on c.continent_code=cn.continent_code
where c.continent_code='AF'
order by country_name asc limit 5;

-- 16
select * from countries;
select count(*)-19 from countries;

-- 17
select country_name, max(elevation) as max_elevation, max(`length`) as max_length from countries as c 
left join mountains_countries as mc on c.country_code= mc.country_code
left join mountains as m on mc.mountain_id=m.id
left join peaks as p on m.id=p.mountain_id
left join countries_rivers as cr on c.country_code=cr.country_code
left join rivers as r on cr.river_id=r.id group by country_name 
order by max_elevation desc,max_length desc,country_name limit 5;


