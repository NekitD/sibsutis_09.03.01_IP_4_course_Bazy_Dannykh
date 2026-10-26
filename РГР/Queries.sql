-- 1.1) Вывести номера колонок, суммарная выручка с которых превышает 5000 рублей. 

-- SELECT pump_number FROM pumps WHERE puid IN (SELECT puid FROM sales GROUP BY puid HAVING SUM(total_sum) > 5000);

-- 1.2) Для каждого покупателя, не являющегося ООО или АО, вывести id и общую сумму его покупок.

-- SELECT cid, SUM(total_sum) FROM sales WHERE cid IN 
-- (SELECT cid FROM customers WHERE POSITION('АО' IN full_name) = 0 AND POSITION('ООО' IN full_name) = 0)
-- GROUP BY cid;

-- 2.1) Вывести номер каждой топливораздаточной колонки, название отпускаемого ею вида топлива и ФИО сотрудника, 
-- который обслуживал последнюю по времени продажу на этой колонке.

-- SELECT*FROM pumps;
-- SELECT DISTINCT pumps.pump_number, fuel_types.name, employees.full_name FROM
-- (((sales RIGHT JOIN pumps USING(puid)) LEFT JOIN fuel_types USING(fid)) LEFT JOIN employees USING(eid))
-- WHERE sales.sale_time = (SELECT MAX(sale_time) FROM sales WHERE puid = pumps.puid); 


-- 2.2) Вывести ФИО клиента, его номер карты лояльности, количество совершённых им покупок и общую сумму 
-- всех его покупок, но только для клиентов, имеющих карту лояльности. Отсортировать по убыванию общей суммы.

-- SELECT customers.full_name, customers.loyalty_card, COUNT(*), SUM(sales.total_sum) FROM
-- (sales RIGHT JOIN customers USING(cid)) GROUP BY customers.cid HAVING (LENGTH(customers.loyalty_card) != 0)
-- ORDER BY SUM(sales.total_sum) DESC;

-- 3.1) Создать представление «Выручка по видам топлива», которое для каждого вида топлива содержит его 
-- название, цену за литр и общую сумму продаж по этому виду топлива за всё время.

-- CREATE VIEW incom_by_fuel_types AS (
-- 	SELECT fuel_types.name, fuel_types.price_per_liter, SUM(sales.total_sum) FROM
-- 	((sales RIGHT JOIN pumps USING(puid)) RIGHT JOIN fuel_types USING(fid)) GROUP BY fuel_types.fid
-- );
-- SELECT*FROM incom_by_fuel_types;

-- 3.2) Создать представление «Активные сотрудники и их нагрузка», которое для каждого сотрудника, 
-- у которого нет даты увольнения (fire_date IS NULL), содержит ФИО, должность, количество отработанных смен 
-- и количество оформленных им чеков. Количество смен и количество чеков должны вычисляться через подзапросы 
-- (по одному на каждую метрику), а не через прямой JOIN с группировкой.

-- CREATE VIEW employee_activity AS (
-- 	SELECT 
-- 	employees.full_name, 
-- 	positions.title,
-- 	(SELECT COUNT(*) FROM shifts WHERE shifts.eid = employees.eid) AS shift_count,
-- 	(SELECT COUNT(*) FROM sales WHERE sales.eid = employees.eid) AS sales_count
-- 	FROM (employees LEFT JOIN positions USING(posid))
-- 	WHERE (fire_date IS NULL)
-- );
-- SELECT*FROM employee_activity;
