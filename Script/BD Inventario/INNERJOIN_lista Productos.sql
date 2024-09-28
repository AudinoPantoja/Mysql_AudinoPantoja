#Listar los productos con sus precios base y la cantidad comprada en cada orden:
SELECT pr.nombre AS producto_nombre, pr.precio_base, d.cantidad
FROM Productos pr
INNER JOIN DetalleOrdenCompra d ON pr.producto_id = d.producto_id;
