-- vista qie trae todos los atributos de invoices cuyo total sea mayor a 100
CREATE VIEW invoiceView AS
SELECT * FROM invoices
WHERE total > 100;

SELECT i.idUser, i.total FROM invoiceView i;

-- vista (rolesView) que contiene toda la informacion de los roles de usuario, nombres de roles y nombres de usuario,
-- filtrada solo para los usuarios con el rol "Supplier".
CREATE VIEW rolesView AS 
SELECT ur.*, r.roleName, u.userName
FROM userRoles ur
INNER JOIN roles r ON ur.idRole = r.id
INNER JOIN users u ON ur.idUser = u.id
WHERE r.roleName = 'Supplier';

SELECT * FROM rolesView;

-- información de productos, pedidos y detalles de pedido que se filtra
-- aquellos productos de la categoría Electronics y pedidos cuyo estado es Pending.
CREATE VIEW productsView AS
SELECT 
    p.name AS productName,
    p.description AS productDescription,
    p.price AS productPrice,
    od.quantity AS orderQuantity,
    od.price AS orderPrice,
    os.name AS orderStatusName,
    pc.categoryName AS productCategoryName
FROM purchaseOrders po
INNER JOIN orderDetails od ON od.idPurchaseOrder = po.id
INNER JOIN products p ON od.idProduct = p.id
INNER JOIN productCategories pc ON p.idCategory = pc.id
INNER JOIN orderStatus os ON po.idStatus = os.id
WHERE pc.categoryName = 'Electronics'
AND os.name = 'Pending';

SELECT * FROM productsView;

-- lista todos los usuarios y sus roles, incluyendo aquellos usuarios que aún no tienen un rol asignado.
CREATE VIEW userView AS
SELECT u.userName, r.roleName
FROM users u
LEFT JOIN userRoles ur ON u.id = ur.idUser
LEFT JOIN roles r ON ur.idRole = r.id;

SELECT * FROM userView;


DROP VIEW IF EXISTS productsView;

SELECT TABLE_NAME FROM information_schema.views	
WHERE table_schema = "inventory3"
