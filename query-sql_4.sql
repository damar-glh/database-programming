SELECT i.name, cs.explanation AS category
FROM items i
INNER JOIN categories cs
USING(category_id)
ORDER BY name ASC;

SELECT i.name, cs.explanation AS category, ss.name
FROM items i
INNER JOIN categories cs USING(category_id)
INNER JOIN suppliers ss USING(supplier_id);

SELECT cs.name AS customers_name, i.name AS items_name, pi.amount, p.date
FROM customers cs
INNER JOIN purchases p USING(customer_id)
INNER JOIN purchase_items pi USING(purchase_id)
INNER JOIN items i USING(item_id)
ORDER BY p.date ASC;

SELECT cs.name, ps.purchase_id
FROM customers cs
LEFT JOIN purchases ps USING(customer_id)
ORDER BY cs.name ASC;

SELECT i.name AS items_name, ss.name AS supliers_name 
FROM items i
RIGHT JOIN suppliers ss USING(supplier_id)
ORDER BY ss.name ASC;

SELECT name, explanation
FROM items
INNER JOIN categories ON items.category_id = categories.category_id;

SELECT name, explanation, name FROM items
JOIN categories USING(category_id)
JOIN suppliers USING(supplier_id);