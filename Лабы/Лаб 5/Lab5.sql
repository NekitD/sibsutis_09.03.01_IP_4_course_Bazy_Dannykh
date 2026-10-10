-- SET SEARCH_PATH TO my_schema

-- № 5-1
-- SELECT onum, pnum, cnum, snum, amt, ord_date FROM ord;

-- SELECT ord.onum, ord.pnum, ord.cnum, ord.snum, ord.amt, ord.ord_date, sal.name
-- FROM (ord LEFT JOIN sal USING (snum))
-- ORDER BY ord.onum;

-- № 5-2
-- SELECT ord.onum, ord.amt, prod.name, prod.city FROM (ord JOIN prod USING(pnum)) WHERE prod.weight >= 500;

-- № 5-3
-- SELECT cnum, name FROM cust;

-- SELECT cust.name, COUNT(ord.onum)
-- FROM (cust LEFT JOIN ord ON cust.cnum = ord.cnum AND cust.name ~ '^[AI]')
-- GROUP BY cust.name
-- ORDER BY cust.name;

-- № 5-4
-- SELECT DISTINCT ord.cnum, cust.cnum FROM (ord CROSS JOIN cust) WHERE ord.cnum < cust.cnum ORDER BY ord.cnum, cust.cnum;

-- № 5-5
-- SELECT ord.onum, ord.pnum, ord.cnum, ord.snum, ord.amt, ord.ord_date, cust.name, cust.rating, cust.city
-- FROM ord
-- NATURAL JOIN cust
-- ORDER BY ord.onum;

-- № 5-6
-- SELECT pnum FROM ord WHERE snum = 3001
-- UNION
-- SELECT pnum FROM prod WHERE city != 'Moscow';

-- № 5-7
-- SELECT DISTINCT SUBSTRING(name FROM 1 FOR 1) AS first_letter FROM sal
-- EXCEPT
-- SELECT DISTINCT SUBSTRING(name FROM 1 FOR 1) AS first_letter FROM prod
-- ORDER BY first_letter;

-- № 5-8
-- SELECT city, SUM(rating) FROM cust GROUP BY city; -- 400 - максимум

-- SELECT sal.name, SUM(ord.amt) FROM (ord JOIN sal USING(snum)) WHERE ord.snum IN 
-- (SELECT snum FROM sal WHERE city IN (SELECT city FROM cust GROUP BY city HAVING SUM(rating) >= 400))
-- GROUP BY sal.name
