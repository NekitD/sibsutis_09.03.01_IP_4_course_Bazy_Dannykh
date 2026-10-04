-- SET SEARCH_PATH TO my_schema

-- № 5-1

-- № 5-2
-- SELECT onum, amt, name, city FROM (ord JOIN prod ON prod.pnum = ord.pnum) WHERE weight >= 500;

-- № 5-3

-- № 5-4
-- SELECT DISTINCT ord.cnum, cust.cnum FROM (ord CROSS JOIN cust) WHERE ord.cnum < cust.cnum ORDER BY ord.cnum, cust.cnum;

-- № 5-5

-- № 5-6
-- SELECT pnum FROM ord WHERE snum = 3001
-- UNION
-- SELECT pnum FROM prod WHERE city != 'Moscow';

-- № 5-7

-- № 5-8
-- SELECT city, SUM(rating) FROM cust GROUP BY city; -- 400 - максимум

-- SELECT sal.name, SUM(amt) FROM (ord JOIN sal ON ord.snum = sal.snum) WHERE ord.snum IN 
-- (SELECT snum FROM sal WHERE city IN (SELECT city FROM cust GROUP BY city HAVING SUM(rating) >= 400))
-- GROUP BY sal.name
