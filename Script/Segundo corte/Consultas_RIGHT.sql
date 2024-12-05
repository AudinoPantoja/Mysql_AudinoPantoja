-- ***** Consultas con RIGHT JOIN *****

-- 1. Listar todos los productos y sus categorías (incluyendo categorías sin productos)
SELECT p.productName, pc.categoryName 
FROM products p
RIGHT JOIN productCategories pc ON p.idCategory = pc.id;

-- 2. Mostrar todos los precios de productos, incluso si algunos productos no están registrados
SELECT p.productName, hpp.price 
FROM products p
RIGHT JOIN historyProductPrices hpp ON p.id = hpp.idProduct;

-- 3. Obtener todas las personas y sus direcciones (incluyendo direcciones no asociadas a personas)
SELECT p.firstName, p.lastName1, a.street 
FROM people p
RIGHT JOIN addresses a ON p.idAddress = a.id;

-- 4. Mostrar todos los roles y los usuarios asignados (incluyendo roles que no tienen usuarios)
SELECT r.roleName, u.userName 
FROM usersRoles ur
RIGHT JOIN roles r ON ur.idRole = r.id
RIGHT JOIN users u ON ur.idUser = u.id;

-- 5. Listar todas las órdenes de compra junto con sus detalles (incluso si no tienen productos asociados)
SELECT po.id, od.idProduct, od.quantity 
FROM orderDetails od
RIGHT JOIN purchaseOrders po ON od.idPurchaseOrder = po.id;

-- 6. Obtener todos los proveedores y sus órdenes de compra (incluso si algún proveedor no tiene órdenes)
SELECT p.firstName, p.lastName1, po.id AS orderId 
FROM purchaseOrders po
RIGHT JOIN people p ON po.idSupplier = p.idUser;

-- 7. Mostrar todas las órdenes de compra con sus estados (incluso si alguna orden no tiene un estado asociado)
SELECT po.id, os.statusName 
FROM purchaseOrders po
RIGHT JOIN orderStatus os ON po.idOrderStatus = os.id;

-- 8. Listar todos los productos y sus órdenes de compra (incluso si algún producto no ha sido comprado)
SELECT p.productName, od.quantity 
FROM orderDetails od
RIGHT JOIN products p ON od.idProduct = p.id;

-- 9. Mostrar todos los usuarios y sus roles (incluso si algún rol no tiene usuarios asociados)
SELECT u.userName, r.roleName 
FROM usersRoles ur
RIGHT JOIN roles r ON ur.idRole = r.id
RIGHT JOIN users u ON ur.idUser = u.id;

-- 10. Obtener todos los productos y sus categorías (incluso si alguna categoría no tiene productos)
SELECT p.productName, pc.categoryName 
FROM products p
RIGHT JOIN productCategories pc ON p.idCategory = pc.id;
