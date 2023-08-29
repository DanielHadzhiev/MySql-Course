use book_library;
SELECT 
    id, SUBSTRING(title, 1, 10) title
FROM
    book_library.books;
-- 1
SELECT 
    title
FROM
    books
WHERE
    SUBSTRING(title, 1, 3) = 'The'
ORDER BY id;

SELECT REPLACE('0123456789', 0, '') AS numbers_to_count;

SELECT 
    id, REPLACE(title, 'Murder', '******')
FROM
    books;
-- 2
SELECT 
    REPLACE(title, 'The', '***')
FROM
    books
WHERE
    SUBSTRING(title, 1, 3) = 'The'
ORDER BY id;

SELECT '      something', LTRIM('		something');

select char_length('абвг'),length('абвг');

select left('1234',2);

select right('1234',2);

select lower('STRING');

select upper('string');

select reverse('String');

select repeat('012',3);

select insert('01234', 2, 2, 'ab');

select 15 div 3;
select 5 div 2;

select 5 / 2;

select 5 mod 2;
select 5 % 2;

select pi();

select abs (-1566);

select sqrt(16);
select pow (3,2);

select conv(13, 10, 2);
select conv(1101,2,10);

select round (2.356), floor(2.356), ceiling(2.356);
select sign(20), sign (-20), sign (0);

select rand (); -- from [0 to 1)
select floor( rand () * 11);-- from[0 to 10]

select extract(year from '2023-05-19');
select title, extract(year from year_of_release ) as 'Year of release' from books;

select timestampdiff(year, '2023-05-19', '2022-06-23');
select id, first_name, timestampdiff( year, born, now()) from authors;

select date_format(born,'%d %M %Y') from authors;

select* from authors where first_name like 'a%';
select *from books where title like'The%';

select * from books where title regexp'^the';
select title from books where title regexp '^Harry Potter';
