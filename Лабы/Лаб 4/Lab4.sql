-- SET SEARCH_PATH TO my_schema

-- № 5-1
-- SELECT cnum, name, rating FROM cust;
-- SELECT cnum, name, rating FROM cust WHERE rating = (SELECT MIN(rating) FROM cust);

-- № 5-2
-- SELECT pnum, COUNT(*) FROM ord GROUP BY pnum;
-- SELECT pnum, COUNT(*) FROM ord GROUP BY pnum HAVING COUNT(*) > (SELECT COUNT(*) FROM ord WHERE pnum = 1001);

-- № 5-3
-- SELECT DISTINCT cnum FROM ord WHERE pnum = 1004 AND snum IN (SELECT snum FROM ord WHERE pnum = 1002);

-- № 5-4
-- SELECT name FROM sal WHERE snum <> ALL 
-- (SELECT snum FROM ord WHERE cnum = ANY 
-- (SELECT cnum FROM cust WHERE city = 'Novosibirsk'));

-- SELECT name FROM sal WHERE snum NOT IN
-- (SELECT snum FROM ord WHERE cnum IN 
-- (SELECT cnum FROM cust WHERE city = 'Novosibirsk'));

-- № 5-5
-- SELECT pnum, name, weight FROM prod;
-- SELECT pnum, name, weight FROM prod WHERE weight > (SELECT MIN(weight) FROM prod WHERE city = 'Novosibirsk');

-- № 5-6
-- SELECT * FROM prod WHERE pnum NOT IN
-- (SELECT pnum FROM ord WHERE 
-- (SELECT city FROM prod WHERE pnum = ord.pnum) = (SELECT city FROM sal WHERE snum = ord.snum));

-- № 5-7
-- SELECT snum, name, comm, city FROM sal;
-- SELECT snum, name, comm, city,
--        CASE
--            WHEN city = 'Saint Petersburg' THEN 'северо-западный'
--            WHEN city = 'Moscow' THEN 'центральный'
--            WHEN city = 'Novosibirsk' THEN 'сибирский'
--            ELSE 'другой'
--        END AS "округ продавца"
-- FROM sal;

-- № 5-8
-- SELECT pnum,
-- 	CASE 
-- 		WHEN COUNT(*) >= 4 THEN 'популярный'
-- 		WHEN COUNT(*) IN (2, 3) THEN 'умеренный'
-- 		ELSE 'непопулярный'
-- 	END as populatity
-- FROM ord GROUP BY pnum;

-- ЗАЩИТА
-- ВЫВЕСТИ ИМЕНА ВСЕХ ПОКУПАТЕЛЕЙ КОТОРЫЕ ПОКУПАЛИ ТОВАР 1001

--(без корреляции)
-- SELECT name FROM cust WHERE cnum IN (SELECT cnum FROM ord WHERE pnum = 1001);

--(с корреляцией)
-- SELECT name FROM cust WHERE cnum IN
-- (SELECT cnum FROM ord WHERE 
-- (SELECT * FROM ord WHERE cnum = ord.cnum AND pnum = 1001));

-- ВЫВЕСТИ ИМЕНА ВСЕХ ПОКУПАТЕЛЕЙ КОТОРЫЕ ПОКУПАЛИ ТОВАР В КОЛИЧЕСТВЕ 1

--(без корреляции)
-- SELECT name FROM cust WHERE cnum IN (SELECT cnum FROM ord WHERE amt = 1);
--(с корреляцией)
-- SELECT name FROM cust WHERE EXISTS (SELECT 1 FROM ord WHERE ord.cnum = cust.cnum AND ord.amt = 1);