-- 1
create database universities;
use universities; 

create table countries(
id int primary key auto_increment,
name varchar(40) not null unique
);

create table cities(
id int primary key auto_increment,
name varchar(40) not null unique,
population int,
country_id int not null,
constraint fk_cities_countries foreign key (country_id)
references countries(id) 
);

create table universities(
id int primary key auto_increment,
name varchar(60) not null unique,
address varchar(80) not null unique,
tuition_fee decimal(19,2) not null,
number_of_staff int,
city_id int,
constraint fk_universities_cities foreign key (city_id)
references cities(id)
);

create table students(
id int primary key auto_increment,
first_name varchar(40) not null,
last_name varchar(40) not null,
age int,
phone varchar(20) not null unique,
email varchar(255) not null unique,
is_graduated tinyint(1),
city_id int,
constraint fk_students_cities foreign key (city_id)
references cities(id)
);

create table courses(
id int primary key auto_increment,
name varchar(40) not null unique,
duration_hours decimal(19,2),
start_date date,
teacher_name varchar(60) not null unique,
`description` text,
university_id int,
constraint fk_courses_universities foreign key (university_id)
references universities(id)
);

create table students_courses(
grade decimal(19,2) not null,
student_id int not null,
course_id int not null,
constraint fk_students_courses_students foreign key (student_id)
references students(id),
constraint fk_students_courses_courses foreign key (course_id)
references courses(id)
);

-- 2
insert into courses (name,duration_hours,start_date,teacher_name,`description`,university_id) 
(select(concat_ws(' ',teacher_name,'course')),
char_length(name)/10,
date(start_date+5),
reverse(teacher_name),
concat('Course ',teacher_name,reverse(`description`)),
extract(day from start_date) from courses where id<=5);

-- 3
update universities set tuition_fee=tuition_fee+300 where id between 5 and 12;

-- 4
delete from universities where number_of_staff is null;

-- 5
select * from cities order by population desc;

-- 6
select first_name,last_name,age,phone,email from students
 where age>=21 
 order by first_name desc,email, id limit 10;
 
 -- 7
 select concat_ws(' ',first_name,last_name) as 'full_name',
 substring(email,2,10) as 'username',
 reverse(phone)as 'password' from students as s  
 left join students_courses as sc on s.id=sc.student_id 
 where sc.course_id is null  
 order by `password` desc;
 
 -- 8

 select count(s.id)as s_count,u.name from students as s 
 join students_courses as sc on s.id=sc.student_id
 join courses as c on sc.course_id=c.id
 join universities as u on c.university_id=u.id group by u.id 
 having s_count>=8 
 order by s_count desc,u.name desc;
 
 -- 9
 select u.name as university_name,c.name as city_name,u.address,
 ( case
 when tuition_fee<800 then 'cheap'
 when tuition_fee>=800 and tuition_fee<1200 then 'normal'
 when tuition_fee>=1200 and tuition_fee<2500 then 'high'
 when tuition_fee>=2500 then 'expensive'
 end
 )
 as price_rank,tuition_fee 
 from universities as u 
 join cities as c on u.city_id=c.id order by tuition_fee;
 
 -- 10
 delimiter $$
create function udf_average_alumni_grade_by_course_name(course_name VARCHAR(60))
returns decimal(4,2)
deterministic
begin
  return (select avg(sc.grade) from students as s 
join students_courses as sc on s.id=sc.student_id 
join courses as c on sc.course_id=c.id 
where c.name=course_name and s.is_graduated=1  
group by sc.course_id);
 end$$

SELECT c.name, udf_average_alumni_grade_by_course_name('Quantum Physics') as average_alumni_grade FROM courses c 
WHERE c.name = 'Quantum Physics';

-- 11
delimiter $$
create procedure udp_graduate_all_students_by_year (year_started int)
begin
update students join students_courses as sc on students.id=sc.studentid
join courses as c on sc.course_id=c.id set is_graduated=1 where extract(year from c.start_date)=year_started;
end$$

CALL udp_graduate_all_students_by_year(2017); 