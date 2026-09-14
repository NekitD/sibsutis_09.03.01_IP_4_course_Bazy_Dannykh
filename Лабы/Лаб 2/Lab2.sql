-- SET SEARCH_PATH TO my_schema

-- № 5-1 

-- SELECT DISTINCT city FROM prod;
-- SELECT DISTINCT city FROM prod WHERE city ILIKE 'm%w';

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

-- № 5-6
-- SELECT DISTINCT ord_date FROM ord;
-- SELECT DISTINCT TO_CHAR(ord_date, 'dd.mm'), DATE_PART('year', ord_date) FROM ord;

-- № 5-7
-- SELECT name FROM sal;
-- SELECT name FROM sal WHERE name ~ '^[A-I][a-z]*(a|nk)$';

-- № 5-8
--	INSERT INTO sal (snum, name, comm, city) VALUES (7, 'Aegis', 0.13, 'Moscow');
-- SELECT name FROM sal;
--	SELECT name FROM sal WHERE name ~* '[qwrtpsdfghjklzxcvbnm][qwrtpsdfghjklzxcvbnm]';
--	SELECT name FROM sal WHERE name ~* '[^aeyuio][^aeyuio]';
-- 	DELETE FROM sal WHERE name = 'Aegis';


-- ЗАЩИТА 
-- SELECT 1 WHERE '630054, ул. Кирова, 85 - 30'~ '630[0-9]{3}, ул\. [А-Я][а-я]*, [0-9][0-9]? [-|—] [0-9][0-9]?';
-- SELECT 1 WHERE '630078, ул. Ленина, 49 - 1'~ '630[0-9]{3}, ул\. [А-Я][а-я]*, [0-9][0-9]? [-|—] [0-9][0-9]?';
-- SELECT 1 WHERE '630068, ул. Крылова, 31 - 18'~ '630[0-9]{3}, ул\. [А-Я][а-я]*, [0-9][0-9]? [-|—] [0-9][0-9]?';

-- SELECT 1 WHERE 'Пушкин А.С. «Повести Белкина» — М. — 1910' ~ '[А-Я][а-я]* [А-Я]\.[А-Я]\. «[А-Я][а-я][а-я][а-я|А-Я| ]*» — [М|(СПб)]*\. — [12][890][1234567890][1234567890]';
-- SELECT 1 WHERE 'Лермонтов М.Ю. «Герой нашего времени» — СПб. — 1952' ~ '[А-Я][а-я]* [А-Я]\.[А-Я]\. «[А-Я][а-я][а-я][а-я|А-Я| ]*» — [М|(СПб)]*\. — [12][890][1234567890][1234567890]';
-- SELECT 1 WHERE 'Толстой Л.Н. «Война и мир» — М. — 1930' ~ '[А-Я][а-я]* [А-Я]\.[А-Я]\. «[А-Я][а-я][а-я][а-я|А-Я| ]*» — [М|(СПб)]*. — [12][890][1234567890][1234567890]';



