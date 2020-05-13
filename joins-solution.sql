-- 1. Get all customers and their addresses.
SELECT "first_name", "last_name", "street", "city", "state", "zip"
FROM "customers"
    JOIN "addresses" ON customers.id = addresses.customer_id;

--2. Get all orders and their line items (orders, quantity and product).
SELECT *
FROM "orders"
    JOIN "line_items" ON orders.id = line_items.order_id
    JOIN "products" ON products.id = line_items.product_id;

--3. Which warehouses have cheetos?
SELECT "warehouse"
FROM "warehouse"
    JOIN "warehouse_product" ON warehouse.id = warehouse_product.warehouse_id
    JOIN "products" ON warehouse_product.product_id = products.id
WHERE "description" = 'cheetos';


--4. Which warehouses have diet pepsi?    //should see alpha/beta/gamma
SELECT "warehouse"
FROM "warehouse"
    JOIN "warehouse_product" ON warehouse.id = warehouse_product.warehouse_id
    JOIN "products" ON warehouse_product.product_id = products.id
WHERE "description" = 'diet pepsi';

--5. Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results. //not sure if the goal is if names show up more than once to merge them?//
SELECT "first_name", "last_name", "quantity"
FROM "line_items"
    JOIN "orders" ON line_items.order_id = orders.id
    JOIN "addresses" ON orders.address_id = addresses.id
    JOIN "customers" ON addresses.customer_id = customers.id;

--6. How many customers do we have?
SELECT COUNT(*)
FROM "customers";

--7. How many products do we carry?
SELECT COUNT(*)
FROM "products";

--8. What is the total available on-hand quantity of diet pepsi?
SELECT SUM("on_hand")
FROM "warehouse_product"
    JOIN "products" ON warehouse_product.product_id = products.id
WHERE "description" = 'diet pepsi';
