-- Buscar usuarios cuyo nombre de usuario es mayor que cualquier otro en la tabla
SELECT *
FROM users u
WHERE u.userName > ANY (
    SELECT userName
    FROM users
);

-- Listar productos cuyo precio es menor que el precio más alto de cualquier producto
SELECT *
FROM products p
WHERE p.id < ALL (
    SELECT price
    FROM historyProductPrices
);

-- Encontrar categorías de productos que tienen al menos un producto cuyo nombre es más corto que cualquier otro
SELECT *
FROM productCategories pc
WHERE EXISTS (
    SELECT 1
    FROM products p
    WHERE p.idCategory = pc.id AND LENGTH(p.productName) < ANY (
        SELECT LENGTH(productName)
        FROM products
    )
);

-- Listar órdenes de compra con un estado de orden que es el mismo que todos los estados de orden registrados
SELECT *
FROM purchaseOrders po
WHERE po.idOrderStatus = ALL (
    SELECT id
    FROM orderStatus
);

-- Encontrar personas que tienen un número de identificación mayor que todos los números de identificación en la base de datos
SELECT *
FROM people p
WHERE p.identificationNumber > ALL (
    SELECT identificationNumber
    FROM people
);
