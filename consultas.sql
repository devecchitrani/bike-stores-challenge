1. Listar todos Clientes que não tenham realizado uma compra
SELECT c.customer_id, c.first_name, c.last_name, c.email
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.customer_id IS NULL;

2. Listar os Produtos que não tenham sido comprados
SELECT p.product_id, p.product_name, p.brand_id, p.category_id
FROM products p
LEFT JOIN order_items oi ON p.product_id = oi.product_id
WHERE oi.product_id IS NULL;

3. Listar os Produtos sem Estoque
SELECT p.product_id, p.product_name, s.store_id
FROM products p
LEFT JOIN stocks s ON p.product_id = s.product_id
WHERE s.quantity IS NULL OR s.quantity = 0;

4. Agrupar a quantidade de vendas que uma determinada Marca teve por Loja
SELECT 
    b.brand_name, 
    s.store_name, 
    COUNT(oi.product_id) AS total_vendas
FROM order_items oi
INNER JOIN products p ON oi.product_id = p.product_id
INNER JOIN brands b ON p.brand_id = b.brand_id
INNER JOIN orders o ON oi.order_id = o.order_id
INNER JOIN stores s ON o.store_id = s.store_id
GROUP BY b.brand_name, s.store_name;

5. Listar os Funcionários que não estejam relacionados a um Pedido
SELECT s.staff_id, s.first_name, s.last_name, s.email
FROM staffs s
LEFT JOIN orders o ON s.staff_id = o.staff_id
WHERE o.staff_id IS NULL;
