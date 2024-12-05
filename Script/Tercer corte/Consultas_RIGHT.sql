-- Todos los productos y sus categorías, incluyendo categorías sin productos
SELECT p.name AS productName, pc.categoryName
FROM products p
RIGHT JOIN productCategories pc ON p.idCategory = pc.id;

-- Pedidos y sus estados, incluyendo estados sin pedidos asociados
SELECT po.id AS purchaseOrderID, os.name AS orderStatus
FROM purchaseOrders po
RIGHT JOIN orderStatus os ON po.idStatus = os.id;

-- Usuarios y sus roles, incluyendo roles sin usuarios asignados
SELECT u.userName, r.roleName
FROM users u
RIGHT JOIN userRoles ur ON u.id = ur.idUser
RIGHT JOIN roles r ON ur.idRole = r.id;

-- Productos y sus detalles de pedidos, incluyendo detalles de pedidos sin productos
SELECT p.name AS productName, od.quantity, od.price
FROM products p
RIGHT JOIN orderDetails od ON p.id = od.idProduct;

-- Ubicaciones y las pasarelas de pago, incluyendo pasarelas sin ubicaciones asignadas
SELECT l.locationName, pg.gateway AS paymentGateway
FROM locations l
RIGHT JOIN paymentGatewaysLocation pgl ON l.id = pgl.idLocation
RIGHT JOIN paymentGateways pg ON pgl.idPaymentGateway = pg.id;
