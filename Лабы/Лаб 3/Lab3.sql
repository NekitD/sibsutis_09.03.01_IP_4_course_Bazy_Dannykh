-- SET SEARCH_PATH TO my_schema

-- № 5-1 
-- SELECT snum, name, city FROM sal;
-- SELECT COUNT(*) FROM sal WHERE city ~ '^[I-N]';

-- № 5-2
-- SELECT weight FROM prod;
-- SELECT MIN(weight), MAX(weight) FROM prod;

-- № 5-3
-- SELECT pnum, snum FROM ord;
-- SELECT pnum, MIN(snum) FROM ord GROUP BY pnum ORDER BY pnum;

-- № 5-4
-- SELECT COUNT(DISTINCT snum) FROM ord WHERE cnum in (2004, 2005);

-- № 5-5
-- SELECT cnum, SUM(amt) FROM ord GROUP BY cnum;
-- SELECT cnum, SUM(amt) FROM ord GROUP BY cnum HAVING SUM(amt) >= 15 ORDER BY cnum;

-- № 5-6
-- SELECT snum, pnum, COUNT(*) FROM ord GROUP BY snum, pnum ORDER BY snum;

-- № 5-7
-- SELECT ord_date, cnum, pnum FROM ord;
-- SELECT ord_date FROM ord GROUP BY ord_date HAVING COUNT(DISTINCT cnum) = 3 AND COUNT(DISTINCT pnum) = 1;

-- ЗАЩИТА

-- Все значения комиссионных в таблице sal которые встречаются ровно у одного продавца
-- SELECT comm FROM sal GROUP BY comm HAVING COUNT(*) = 1;

-- Все названия городов в таблице sal в которых ровно 1 продавец, кроме продавца DNS
-- SELECT city FROM sal WHERE name != 'DNS' GROUP BY city HAVING COUNT(*) = 1;
