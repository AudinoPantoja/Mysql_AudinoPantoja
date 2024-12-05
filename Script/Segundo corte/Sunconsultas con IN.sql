-- Consultar los productos que están en órdenes realizadas por el usuario 'carlos123'.
SELECT productName 
FROM products 
WHERE id IN (
    SELECT idProduct 
    FROM orderDetails 
    WHERE idPurchaseOrder IN (
        SELECT id 
        FROM purchaseOrders 
        WHERE idSupplier IN (
            SELECT id 
            FROM users 
            WHERE userName = 'carlos123'
        )
    )
);

-- Consultar los nombres de los usuarios que tienen el rol 'Admin'.
SELECT userName 
FROM users 
WHERE id IN (
    SELECT idUser 
    FROM usersRoles 
    WHERE idRole IN (
        SELECT id 
        FROM roles 
        WHERE roleName = 'Admin'
    )
);

-- Consultar las órdenes que tienen el estado 'Pending'.
SELECT id, orderDate 
FROM purchaseOrders 
WHERE idOrderStatus IN (
    SELECT id 
    FROM orderStatus 
    WHERE statusName = 'Pending'
);

-- Consultar las facturas generadas por el usuario 'maria123'.
SELECT id, invoiceDate 
FROM invoices 
WHERE idUser IN (
    SELECT id 
    FROM users 
    WHERE userName = 'maria123'
);

-- Consultar los productos que pertenecen a la categoría 'Electronics'.
SELECT productName 
FROM products 
WHERE idCategory IN (
    SELECT id 
    FROM productCategories 
    WHERE categoryName = 'Electronics'
);
