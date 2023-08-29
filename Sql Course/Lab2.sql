SELECT 
    id as 'No', concat('Mr/Mrs ',first_name,' ',last_name) as 'Full name'
FROM
    employees
ORDER BY first_name;

SELECT 
    id,
    CONCAT_WS(' ', first_name, last_name) AS 'full_name',
    job_title,
    salary
FROM
    employees
WHERE
    salary > 1000;
    
SELECT 
    id, first_name, department_id
FROM
    employees
WHERE
    NOT department_id = 1
        AND first_name = 'John';
        use soft_uni;
   SELECT 
    *
FROM
    employees AS e
WHERE
    e.department_id = 4 AND e.salary >= 1000
ORDER BY id;
CREATE VIEW v_top_paid_employee AS
    SELECT 
        *
    FROM
        employees
    ORDER BY salary DESC
    LIMIT 1;

SELECT 
    *
FROM
    v_top_paid_employee;
    
    SELECT 
    *
FROM
    employees;
    
    insert into employees values(first_name, job_title, department_id, salary);
    insert into employees (first_name,last_name, job_title, department_id, salary) values('George', 'Clonie', 'Cook', 3, 2200);
SELECT 
    *
FROM
    employees;
    
CREATE TABLE employee_backup AS SELECT id, department_id, job_title FROM
    employees;
SELECT 
    *
FROM
    employee_backup;
    
    UPDATE employees 
SET 
    salary = salary + 100
WHERE
    job_title = 'Manager';
    
DELETE FROM employees 
WHERE
    id > 9;