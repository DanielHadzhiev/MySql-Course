-- 1
use soft_uni;
SELECT 
    first_name, last_name
FROM
    employees
WHERE
    first_name LIKE 'sa%'
ORDER BY employee_id;
-- 2
SELECT 
    first_name, last_name
FROM
    employees
WHERE
    last_name LIKE '%ei%'
ORDER BY employee_id;
-- 3
SELECT 
    first_name
FROM
    employees
WHERE
    department_id IN (3 , 10)
        AND EXTRACT(YEAR FROM hire_date) BETWEEN 1995 AND 2005
ORDER BY employee_id;
-- 4 
SELECT 
    first_name, last_name
FROM
    employees
WHERE
    job_title NOT LIKE '%engineer%'
ORDER BY employee_id;
-- 5
SELECT 
    name
FROM
    towns
WHERE
    CHAR_LENGTH(name) BETWEEN 5 AND 6
ORDER BY name;
-- 6 
SELECT 
    *
FROM
    towns
WHERE
    name REGEXP '^[m,k,b,e]'
ORDER BY name;
-- 7
SELECT 
    *
FROM
    towns
WHERE
    name NOT REGEXP '^[r,b,d]'
ORDER BY name;
-- 8
CREATE VIEW v_employees_hired_after_2000 AS
    SELECT 
        first_name, last_name
    FROM
        employees
    WHERE
        EXTRACT(YEAR FROM hire_date) > 2000;
SELECT 
    *
FROM
    v_employees_hired_after_2000;
-- 9
SELECT 
    first_name, last_name
FROM
    employees
WHERE
    CHAR_LENGTH(lat_name) = 5;
-- 10
use geography;
SELECT 
    country_name, iso_code
FROM
    countries
WHERE
    country_name LIKE '%a%a%a%'
ORDER BY iso_code;
-- 11
SELECT 
    peak_name,
    river_name,
    LOWER(CONCAT(SUBSTRING(peak_name,
                        1,
                        CHAR_LENGTH(peak_name) - 1),
                    river_name)) AS peak_river_name
FROM
    peaks,
    rivers
WHERE
    RIGHT(peak_name, 1) = LEFT(river_name, 1)
ORDER BY peak_river_name
LIMIT 200;
-- 12
use diablo;
SELECT 
    name, DATE_FORMAT(`start`, '%Y-%m-%d')
FROM
    games
WHERE
    EXTRACT(YEAR FROM `start`) BETWEEN 2011 AND 2012
ORDER BY `start` , name;
-- 13
SELECT 
    user_name,
    SUBSTRING(email,
        LOCATE('@', email) + 1,
        CHAR_LENGTH(email)) AS 'email_provider'
FROM
    users
ORDER BY email_provider , user_name;
-- 14
SELECT 
    user_name, ip_address
FROM
    users
WHERE
    ip_address LIKE '___.1%.%.___'
ORDER BY user_name;
-- 15
SELECT 
    name,
    CASE
        WHEN HOUR(`start`) BETWEEN 0 AND 11 THEN 'Morning'
        WHEN HOUR(`start`) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END AS 'Part of the day',
    CASE
        WHEN duration <= 3 THEN 'Extra Short'
        WHEN duration BETWEEN 4 AND 6 THEN 'Short'
        WHEN duration BETWEEN 6 AND 10 THEN 'Long'
        ELSE 'Extra Long'
    END AS 'Duration'
FROM
    games;
 -- 16
 use orders;
SELECT 
    product_name,
    order_date,
    DATE_ADD(order_date, INTERVAL 3 DAY) AS pay_due,
    DATE_ADD(order_date, INTERVAL 1 MONTH) AS deliver_due
FROM
    orders;