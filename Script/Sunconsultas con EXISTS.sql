-- Buscar usuarios que han generado al menos una factura
SELECT *
FROM users u
WHERE EXISTS (
    SELECT 1
    FROM invoices i
    WHERE i.idUser = u.id
);

-- Encontrar productos que tienen un historial de precios registrado
SELECT *
FROM products p
WHERE EXISTS (
    SELECT 1
    FROM historyProductPrices hpp
    WHERE hpp.idProduct = p.id
);

-- Listar órdenes de compra que tienen al menos un detalle de orden
SELECT *
FROM purchaseOrders po
WHERE EXISTS (
    SELECT 1
    FROM orderDetails od
    WHERE od.idPurchaseOrder = po.id
);

-- Buscar categorías de productos que tienen productos asociados
SELECT *
FROM productCategories pc
WHERE EXISTS (
    SELECT 1
    FROM products p
    WHERE p.idCategory = pc.id
);

-- Encontrar direcciones que han sido asociadas a al menos una persona
SELECT *
FROM addresses a
WHERE EXISTS (
    SELECT 1
    FROM people p
    WHERE p.idAddress = a.id
);
