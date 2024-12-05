-- ***** Consultas con INNER JOIN *****

-- 1. Obtener todos los usuarios con sus roles correspondientes
SELECT u.userName, r.roleName 
FROM users u
INNER JOIN usersRoles ur ON u.id = ur.idUser
INNER JOIN roles r ON ur.idRole = r.id;

-- 2. Listar los productos con sus categorías
SELECT p.productName, pc.categoryName 
FROM products p
INNER JOIN productCategories pc ON p.idCategory = pc.id;

-- 3. Mostrar los detalles de las órdenes de compra junto con los nombres de los productos
SELECT od.idPurchaseOrder, p.productName, od.quantity, od.unitPrice 
FROM orderDetails od
INNER JOIN products p ON od.idProduct = p.id;

-- 4. Obtener las órdenes de compra con su estado
SELECT po.id, po.orderDate, os.statusName 
FROM purchaseOrders po
INNER JOIN orderStatus os ON po.idOrderStatus = os.id;

-- 5. Listar los productos con sus precios históricos
SELECT p.productName, hpp.price, hpp.effectiveDate 
FROM products p
INNER JOIN historyProductPrices hpp ON p.id = hpp.idProduct;

-- 6. Obtener los proveedores que han realizado órdenes de compra
SELECT p.firstName, p.lastName1, po.orderDate 
FROM people p
INNER JOIN purchaseOrders po ON p.idUser = po.idSupplier;

-- 7. Listar los usuarios junto con los detalles de su dirección
SELECT u.userName, a.street, a.city, a.zipCode 
FROM users u
INNER JOIN people p ON u.id = p.idUser
INNER JOIN addresses a ON p.idAddress = a.id;

-- 8. Mostrar los precios actuales de los productos
SELECT p.productName, hpp.price 
FROM products p
INNER JOIN historyProductPrices hpp ON p.id = hpp.idProduct
WHERE hpp.effectiveDate = (
    SELECT MAX(effectiveDate) 
    FROM historyProductPrices 
    WHERE idProduct = p.id
);

-- 9. Obtener todas las órdenes de compra junto con el nombre del proveedor
SELECT po.id, p.firstName, p.lastName1, po.orderDate 
FROM purchaseOrders po
INNER JOIN people p ON po.idSupplier = p.idUser;

-- 10. Listar las categorías que tienen productos asociados
SELECT pc.categoryName, COUNT(p.id) AS productCount 
FROM productCategories pc
INNER JOIN products p ON pc.id = p.idCategory
GROUP BY pc.categoryName;
