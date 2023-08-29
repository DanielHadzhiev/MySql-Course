create database mountains;
use mountains;
-- 1
create table mountains(
id int auto_increment not null,
name varchar(100) not  null,
constraint pk_mountains_id
primary key(id)
);

insert into mountains(name) values('Rila'),('Pirin'),('Rodopite');
select * from mountains;

create table peaks(
id int auto_increment not null primary key,
name varchar(100) not null,
mountain_id int not null,
constraint fk__peaks_mountain_id__mountains_id 
foreign key (mountain_id) references mountains(id)
);

insert into peaks(name,mountain_id)values('Musala',1),('Vihren', 2),('Golqm Perelik', 3);
select* from peaks;

select * from peaks join mountains on peaks.mountain_id=mountains.id;
select peaks.id,peaks.name as'Peak name' ,mountains.name as 'Mountain name' from peaks join mountains on peaks.mountain_id=mountains.id;
-- 2
select * from campers;
select driver_id, vehicle_type, concat_ws(' ',first_name,last_name) as 'Driver name' from vehicles join campers on driver_id=campers.id;

-- 3 
use mountains;
drop table mountains;
drop table peaks;

create table mountains(
id int auto_increment not null,
name varchar(100) not  null,
constraint pk_mountains_id
primary key(id)
);

create table peaks(
id int auto_increment not null primary key,
name varchar(100) not null,
mountain_id int not null,
constraint fk__peaks_mountain_id__mountains_id 
foreign key (mountain_id) references mountains(id)
);

create table clients (
id int primary key not null auto_increment,
client_name varchar(100)
);

create table projects(
id int auto_increment not null primary key,
client_id int,
project_lead_id int,
constraint fk__projects_client_id_clients_id foreign key (client_id) references clients(id)
);
create table employees (
id int auto_increment not null primary key,
first_name varchar(30),
last_name varchar(30),
project_id int,
constraint fk__employees_project_id__project_id foreign key (project_id) references projects(id)
);

alter table projects 
add constraint fk__projects_project_lead_id__employees_id foreign key (project_lead_id) references employees(id);

-- 3
use camp;
select starting_point, end_point, leader_id, concat_ws(' ',first_name,last_name) as 'Leader name' from routes join campers  on routes.leader_id=campers.id;