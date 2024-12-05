-- Pedidos completados y los productos asociados
SELECT po.id AS orderID, p.name AS productName, od.quantity, od.price, os.name AS orderStatus
FROM purchaseOrders po
INNER JOIN orderDetails od ON po.id = od.idPurchaseOrder
INNER JOIN products p ON od.idProduct = p.id
INNER JOIN orderStatus os ON po.idStatus = os.id
WHERE os.name = 'Completed';

-- Usuarios con sus roles asignados
SELECT u.userName, r.roleName
FROM users u
INNER JOIN userRoles ur ON u.id = ur.idUser
INNER JOIN roles r ON ur.idRole = r.id;

-- Productos con sus categorías
SELECT p.name AS productName, pc.categoryName
FROM products p
INNER JOIN productCategories pc ON p.idCategory = pc.id;

-- Historial de precios de productos
SELECT p.name AS productName, hpp.price, hpp.createdAt AS priceChangeDate
FROM products p
INNER JOIN historyProductPrices hpp ON p.id = hpp.idProduct
ORDER BY p.name, hpp.createdAt DESC;

-- Usuarios que han hecho pedidos, con detalles del estado del pedido
SELECT u.userName, po.id AS purchaseOrderID, os.name AS orderStatus
FROM users u
INNER JOIN purchaseOrders po ON u.id = po.idSupplier
INNER JOIN orderStatus os ON po.idStatus = os.id;

