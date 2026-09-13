-- SET SEARCH_PATH TO my_schema

-- № 5-1 

-- SELECT DISTINCT city FROM prod ORDER BY city DESC;
-- SELECT DISTINCT city FROM prod WHERE city ILIKE 'm%w' ORDER BY city DESC;

-- № 5-2
-- SELECT name FROM cust;
-- SELECT name FROM cust WHERE name LIKE '%o_' ORDER BY name DESC;

-- № 5-3
-- SELECT name FROM prod;
-- SELECT RPAD(UPPER(name), 7, '.') FROM prod WHERE LENGTH(name) <= 7;

-- № 5-4
-- SELECT name, weight FROM prod;
-- SELECT CONCAT(UPPER(name), ': ', weight, ' GRAMS') FROM prod WHERE POSITION('ri' in name) != 0;

-- № 5-5
-- SELECT EXTRACT(second FROM CURRENT_TIME);
-- SELECT DATE_PART('second', CURRENT_TIME);
-- SELECT EXTRACT(second FROM CURRENT_DATE); -- ERROR:  единица "second" для типа date не поддерживается 
-- SELECT DATE_PART('second', CURRENT_DATE); -- возвращает 0

-- № 5-6
-- SELECT DISTINCT ord_date FROM ord;
-- SELECT DISTINCT TO_CHAR(ord_date, 'dd.mm'), DATE_PART('year', ord_date) FROM ord;

-- № 5-7
-- SELECT name FROM sal;
-- SELECT name FROM sal WHERE name ~ '^[A-I][a-z]*(a|nk)$';

-- № 5-8
--	INSERT INTO sal (snum, name, comm, city) VALUES (7, 'Aegis', 0.13, 'Moscow');
-- 	SELECT name FROM sal;
--	SELECT name FROM sal WHERE name ~* '[qwrtpsdfghjklzxcvbnm][qwrtpsdfghjklzxcvbnm]';
--	SELECT name FROM sal WHERE name ~* '[^aeyuio][^aeyuio]';
-- 	DELETE FROM sal WHERE name = 'Aegis';

