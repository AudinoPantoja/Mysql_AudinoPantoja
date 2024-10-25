-- ***** Consultas con LEFT JOIN *****

-- 1. Listar todos los usuarios y sus roles (incluso si algún usuario no tiene rol asignado)
SELECT u.userName, r.roleName 
FROM users u
LEFT JOIN usersRoles ur ON u.id = ur.idUser
LEFT JOIN roles r ON ur.idRole = r.id;

-- 2. Mostrar todas las categorías de productos, incluso aquellas que no tienen productos asociados
SELECT pc.categoryName, p.productName 
FROM productCategories pc
LEFT JOIN products p ON pc.id = p.idCategory;

-- 3. Obtener todos los productos, incluso si no tienen precios registrados
SELECT p.productName, hpp.price 
FROM products p
LEFT JOIN historyProductPrices hpp ON p.id = hpp.idProduct;

-- 4. Listar todas las órdenes de compra con el nombre del proveedor (incluso si el proveedor no está registrado como persona)
SELECT po.id, po.orderDate, p.firstName, p.lastName1 
FROM purchaseOrders po
LEFT JOIN people p ON po.idSupplier = p.idUser;

-- 5. Mostrar todas las direcciones, incluso aquellas que no están asociadas a personas
SELECT a.street, a.city, p.firstName 
FROM addresses a
LEFT JOIN people p ON a.id = p.idAddress;

-- 6. Obtener todos los productos con sus categorías, incluso si algún producto no tiene una categoría asociada
SELECT p.productName, pc.categoryName 
FROM products p
LEFT JOIN productCategories pc ON p.idCategory = pc.id;

-- 7. Listar todas las personas y sus direcciones (aunque alguna persona no tenga dirección)
SELECT p.firstName, p.lastName1, a.street, a.city 
FROM people p
LEFT JOIN addresses a ON p.idAddress = a.id;

-- 8. Mostrar todos los roles y los usuarios asignados a ellos (incluyendo roles sin usuarios)
SELECT r.roleName, u.userName 
FROM roles r
LEFT JOIN usersRoles ur ON r.id = ur.idRole
LEFT JOIN users u ON ur.idUser = u.id;

-- 9. Obtener todos los productos junto con los detalles de órdenes de compra (incluyendo productos que no han sido comprados)
SELECT p.productName, od.quantity 
FROM products p
LEFT JOIN orderDetails od ON p.id = od.idProduct;

-- 10. Mostrar todas las órdenes de compra, con los detalles de los productos (incluyendo órdenes sin productos)
SELECT po.id, od.idProduct, od.quantity 
FROM purchaseOrders po
LEFT JOIN orderDetails od ON po.id = od.idPurchaseOrder;
