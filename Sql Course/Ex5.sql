-- 1 one to one
use geography;
CREATE TABLE people (
    person_id INT UNIQUE NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(100) NOT NULL,
    salary DECIMAL(10 , 2 ) DEFAULT 0,
    passport_id INT UNIQUE
);
CREATE TABLE passports (
    passport_id INT PRIMARY KEY AUTO_INCREMENT,
    passport_number VARCHAR(8) UNIQUE
);
alter table people 
add constraint pk_person_id
primary key (person_id),
add constraint fk_people_passports
foreign key (passport_id)
references passports(passport_id);

insert into passports(passport_id,passport_number) values (101,'N34FG21B'),(102,'K65LO4R7'),(103,'ZE657QP2');
insert into people (first_name, salary, passport_id) values
('Roberto', 43300.00 ,102),
('Tom', 56100.00 ,103),
('Yana', 60200.00 ,101);

-- 2 one to many , many to one
CREATE TABLE manufacturers (
    manufacturer_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(50) NOT NULL,
    established_on DATETIME NOT NULL DEFAULT NOW ()
);
CREATE TABLE models (
    model_id INT PRIMARY KEY,
    `name` VARCHAR(50) NOT NULL,
    manufacturer_id INT NOT NULL AUTO_INCREMENT,
    FOREIGN KEY (manufacturer_id)
        REFERENCES manufacturers (manufacturer_id)
);

insert into manufacturers(`name`, established_on) 
values ('BMW','1916-03-01'),('Tesla' ,'2003-01-01'),('Lada', '1966-05-01');

insert into models (model_id, `name`, manufacturer_id)
values(101, 'X1', 1),(102, 'i6', 1),(103, 'Model S',2),(104,'Model X' ,2),(105 ,'Model 3', 2),(106,'Nova',3);

-- 3 many to many
CREATE TABLE exams (
    exam_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL
)  AUTO_INCREMENT=101;

CREATE TABLE students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE students_exams (
    student_id INT,
    exam_id INT,
    CONSTRAINT pk_students_exams PRIMARY KEY (exam_id , student_id),
    CONSTRAINT fk_students_exams FOREIGN KEY (exam_id)
        REFERENCES exams (exam_id),
    CONSTRAINT fk_exams_students FOREIGN KEY (student_id)
        REFERENCES students (student_id)
);
insert into students (`name`)
values ('Mila'),('Toni'),('Ron');

insert into exams (`name`)
values('Spring MVC'),('Neo4j'),('Oracle 11g');

insert into students_exams(student_id,exam_id) 
 values(1 ,101),(1, 102),(2 ,101),(3, 103),(2, 102),(2, 103);
 
 -- 4
CREATE TABLE techers (
    teacher_id INT AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    manager_id INT
)  AUTO_INCREMENT=101;
 
 -- 6
CREATE TABLE subjects (
    subject_id INT PRIMARY KEY AUTO_INCREMENT,
    subject_name VARCHAR(50)
);
CREATE TABLE majors (
    major_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50)
);
 
CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    student_number VARCHAR(12),
    student_name VARCHAR(50),
    major_id INT,
    CONSTRAINT fk_students_majors FOREIGN KEY (major_id)
        REFERENCES majors (major_id)
);
 
CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    payment_date DATE,
    payment_amount DECIMAL(8 , 2 ),
    student_id INT,
    CONSTRAINT fk_payments_students FOREIGN KEY (student_id)
        REFERENCES students (student_id)
);
CREATE TABLE agenda (
    student_id INT,
    subject_id INT,
    CONSTRAINT pk_agenda PRIMARY KEY (student_id , subject_id),
    CONSTRAINT fk_agenda_students FOREIGN KEY (student_id)
        REFERENCES students (student_id),
    CONSTRAINT fk_agenda_subjects FOREIGN KEY (subject_id)
        REFERENCES subjects (subject_id)
);
 
 -- 9
SELECT 
    mountain_range, peak_name, elevation
FROM
    mountains
        JOIN
    peaks ON 17 = peaks.mountain_id
WHERE
    mountain_range = 'Rila'
ORDER BY elevation DESC;