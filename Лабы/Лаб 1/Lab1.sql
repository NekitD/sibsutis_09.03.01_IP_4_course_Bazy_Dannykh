-- № 4
-- SELECT*FROM sal;
-- SELECT*FROM prod;
-- SELECT*FROM cust;
-- SELECT*FROM ord;

-- № 5
-- INSERT INTO sal (snum, name, comm, city) VALUES (3006, 'Astra', 0.16, 'Innopolis');
-- INSERT INTO sal (snum, name, comm, city) VALUES (3007, 'RedSoft', 0.13, 'Moscow');

-- № 6
-- DELETE FROM sal WHERE snum=3007;

-- № 7
-- ALTER TABLE ord ADD COLUMN ord_date date

-- № 8
-- UPDATE ord SET ord_date='01.09.2026'

-- № 9
-- UPDATE ord SET ord_date='31.12.2025' WHERE pnum=1002;

-- № 5-1
-- SELECT*FROM ord WHERE snum != 3005;

-- № 5-2
-- SELECT pnum, weight, name, city FROM prod WHERE weight <= 700;

-- № 5-3
-- SELECT DISTINCT cnum FROM ord WHERE pnum <= 1001;

-- № 5-4
-- SELECT*FROM sal WHERE comm <= 0.13 AND city != 'Yekaterinburg';

-- № 5-5
-- SELECT * FROM cust WHERE cnum BETWEEN 2005 AND 2007;
-- SELECT * FROM cust WHERE cnum = 2005 OR cnum = 2006 OR cnum = 2007;
-- SELECT * FROM cust WHERE cnum >= 2005 AND cnum <= 2007;

--SELECT * FROM cust WHERE cnum IN (2005, 2006, 2007);
