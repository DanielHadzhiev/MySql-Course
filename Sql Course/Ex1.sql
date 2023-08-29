create database minions;
use minions;

-- minions(id, name, age)това е коментар!
-- towns(towns_id, name)
-- 1
create table minions(
id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(47),
age int  
);

CREATE TABLE towns (
    town_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(47)
);
-- 2
alter table minions
 add column town_id int;
alter table minions 
add constraint fk_minions_towns 
foreign key minions (town_id) 
references towns(id);
-- 3
use minions;
INSERT INTO `towns` (`id`, `name`) 
VALUES
(1,'Sofia'),
(2,'Plovdiv'),
(3,'Varna');


insert into `minions`(`id`,`name`,`age`,`town_id`) 
VALUES
(1,'Kevin',22,1),
(2,'Bob',15,3),
(3,'Steward',NULL,2);

select*from minions;

-- 4 
truncate table minions;

-- 5
drop table minions;
drop table towns;

-- 6 
create table people (
id int primary key auto_increment,
name varchar(200) not null,
picture BLOB,
height double(10,2),
weight double(10,2),
gender char(1) not null,
birthdate date not null,
biography TEXT
);

INSERT INTO people(name,gender,birthdate)
VALUES
('test', 'm',DATE(NOW())),
('testche', 'f',DATE(NOW())),
('test', 'm',DATE(NOW())),
('testche', 'f',DATE(NOW())),
('test', 'm',DATE(NOW()));

-- 7
use minions;
create table users(
id int primary key auto_increment,
username varchar(30) unique not null,
password varchar(26) not null,
profile_picture BLOB,
last_login_time timestamp,
is_deleted boolean
);

insert into users (username,password) 
values('test','test'),
('test','test'),
('test','test'),
('test','test'),
('test','test');

-- 8
Alter table users
drop primary key,
add constraint pk_users2
Primary key(id,username);

-- 9

alter table users
change column last_login_time 
last_login_time datetime default Now();

-- 10
alter table users
drop primary key,
add constraint pk_users
primary key users(id),
change column username
username varchar(30) unique;

-- 11
create database movies;
use movies;

CREATE TABLE directors (
    id INT PRIMARY KEY AUTO_INCREMENT,
    director_name VARCHAR(50) NOT NULL,
    notes TEXT
);
insert into directors (director_name)
values('test'),
('test'),
('test'),
('test'),
('test');

CREATE TABLE genres (
    id INT PRIMARY KEY AUTO_INCREMENT,
    genre_name VARCHAR(20) NOT NULL,
    notes TEXT
);
insert into genres (genre_name)
values('test'),
('test'),
('test'),
('test'),
('test');

CREATE TABLE categories (
    id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(20) NOT NULL,
    notes TEXT
);
insert into categories (category_name)
values('test'),
('test'),
('test'),
('test'),
('test');

CREATE TABLE movies (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    director_id INT,
    copyright_year YEAR,
    length DOUBLE(10 , 2 ),
    genre_id INT,
    category_id INT,
    rating DOUBLE(3 , 2 ),
    notes TEXT,
    FOREIGN KEY (director_id)
        REFERENCES directors (id),
    FOREIGN KEY (genre_id)
        REFERENCES genres (id),
    FOREIGN KEY (category_id)
        REFERENCES categories (id)
);
insert into movies (title,director_id,genre_id,category_id)
values('test',1,2,3),
('test',1,2,5),
('test',1,2,4),
('test',1,2,3),
('test',1,2,3);
-- 13

create database soft_uni;
use soft_uni;
create table towns (id int primary key auto_increment,
 name varchar(30)
 );
create table addresses (
id int primary key auto_increment,
address_text varchar(50),
town_id int
);
create table departments (
id int primary key auto_increment, 
name varchar(30)
);
create table employees (
id int primary key auto_increment,
 first_name varchar(30),
 middle_name varchar(30),
 last_name varchar(30),
 job_title varchar(30),
 department_id int,
 hire_date datetime default now(),
 salary double,
 address_id int,
 foreign key (department_id)
 references departments(id),
 foreign key (address_id)
 references addresses(id)
 );
 
-- Имаш да пишеш още INSERT !!!

-- 14, 15, 16
SELECT 
    t.name
FROM
    towns AS t;
SELECT 
    d.name
FROM
    departments as d;
SELECT 
    e.first_name, e.last_name, e.job_title, e.salary
FROM
    employees AS e;


-- 17
UPDATE employees 
SET 
    salary = salary * 1.1;
SELECT salary employees;