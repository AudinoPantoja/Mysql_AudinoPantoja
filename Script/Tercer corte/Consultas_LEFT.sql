-- Todos los usuarios y sus roles, incluyendo aquellos sin rol asignado
SELECT u.userName, r.roleName
FROM users u
LEFT JOIN userRoles ur ON u.id = ur.idUser
LEFT JOIN roles r ON ur.idRole = r.id;

-- Productos con categorías, incluyendo productos sin categoría asignada
SELECT p.name AS productName, pc.categoryName
FROM products p
LEFT JOIN productCategories pc ON p.idCategory = pc.id;

-- Ubicaciones y las pasarelas de pago disponibles para cada una (si existen)
SELECT l.locationName, pg.gateway AS paymentGateway
FROM locations l
LEFT JOIN paymentGatewaysLocation pgl ON l.id = pgl.idLocation
LEFT JOIN paymentGateways pg ON pgl.idPaymentGateway = pg.id;

-- Pedidos con detalles, incluyendo aquellos sin detalles de productos
SELECT po.id AS purchaseOrderID, od.id AS orderDetailID, od.quantity, od.price
FROM purchaseOrders po
LEFT JOIN orderDetails od ON po.id = od.idPurchaseOrder;

-- Roles y usuarios asignados a cada rol, incluyendo roles sin usuarios asignados
SELECT r.roleName, u.userName
FROM roles r
LEFT JOIN userRoles ur ON r.id = ur.idRole
LEFT JOIN users u ON ur.idUser = u.id;
