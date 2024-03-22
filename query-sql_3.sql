SELECT COUNT(customer_id) as customer_amount 
FROM customers cs
WHERE cs.customer_id IN  
(SELECT ps.customer_id FROM purchases ps JOIN purchase_items pi USING(purchase_id));

SELECT *
FROM customers
WHERE customer_id
NOT IN (SELECT customer_id FROM purchases);

SELECT * 
FROM suppliers 
WHERE supplier_id IN
(SELECT supplier_id FROM items);

SELECT *, (SELECT COUNT(*) FROM items i WHERE ss.supplier_id = i.supplier_id) AS sum_supply
FROM suppliers ss
WHERE ss.supplier_id IN
(SELECT supplier_id FROM items);

SELECT *
FROM categories
WHERE category_id 
NOT IN (SELECT category_id FROM items);

SELECT *
FROM categories
WHERE category_id 
NOT IN (SELECT category_id FROM items)
AND explanation = “Otomotif”;

-- Query 1 :
SELECT * FROM customers
WHERE customer_id IN (SELECT customer_id FROM purchases);
-- Query 2 :
SELECT * FROM customers
WHERE EXISTS (SELECT customer_id FROM purchases);

-- Query 1 :
SELECT * FROM suppliers
WHERE supplier_id = (SELECT supplier_id FROM items);
-- Query 2 :
SELECT * FROM suppliers
WHERE supplier_id IN (SELECT supplier_id FROM items);

DELETE FROM customers
WHERE customer_id NOT IN ( SELECT DISTINCT customer_id FROM purchases);