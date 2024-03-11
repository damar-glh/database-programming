SELECT * FROM products;

SELECT * FROM products LIMIT 3;

SELECT province FROM customers;

SELECT DISTINCT(province) FROM customers;

SELECT name, price, stock, price*stock AS omzet_max FROM products;

SELECT * FROM products WHERE name LIKE "%YSB%";

SELECT * FROM products WHERE stock BETWEEN 30 AND 200;

SELECT product_id, name, size, weight, 
(price * stock) AS max_earning --arithmetic operator
FROM products
WHERE (price * stock) > 20000000 --comparison operator 
AND size > 35
AND weight BETWEEN 200 AND 400; ---logic operator

SELECT ps.product_id, ps.name, ps.price, ps.age_usage_from
FROM products ps
LEFT JOIN reviews rs ON ps.product_id = rs.product_id
WHERE rs.product_id IS NULL
ORDER BY ps.product_id ASC;