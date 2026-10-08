select * from coffee_shop_sales;

SET SQL_SAFE_UPDATES = 0;
update coffee_shop_sales
set transaction_date = str_to_date(transaction_date,'%d-%m-%y');
SET SQL_SAFE_UPDATES = 1;

alter table coffee_shop_sales
modify column transaction_date date;

SET SQL_SAFE_UPDATES = 0;
update coffee_shop_sales
set transaction_time = str_to_date(transaction_time,'%H:%i:%s');
SET SQL_SAFE_UPDATES = 1;

alter table coffee_shop_sales
modify column transaction_time time;

desc coffee_shop_sales;


alter table coffee_shop_sales
change column ï»¿transaction_id transaction_id int;

-- check duplicates and null values
select 
	transaction_id,
    count(*) as total
    from coffee_shop_sales
    group by transaction_id
    having count(*) > 1;
    
SELECT COUNT(*) AS duplicate_transaction_ids
FROM (
    SELECT transaction_id
    FROM coffee_shop_sales
    GROUP BY transaction_id
    HAVING COUNT(*) > 1
) AS d;
    
select 
	count(*) as total,
    sum(transaction_id is null)as transaction_id
    from coffee_shop_sales;

-- checks the values is zero or negative transaction_qty,unit_price
SELECT *
FROM coffee_shop_sales
WHERE transaction_qty <= 0;

SELECT *
FROM coffee_shop_sales
WHERE unit_price <= 0;

SELECT
    MIN(transaction_date) AS start_date,
    MAX(transaction_date) AS end_date
FROM coffee_shop_sales;
