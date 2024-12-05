#Obtener detalles de las órdenes de compra con información del proveedor 
#y el producto donde la orden sea la 2
SELECT o.orden_id, p.nombres AS proveedor_nombre,
    p.identificacion AS proveedor_identificacion,
    pr.nombre AS producto_nombre,
    d.cantidad, d.precio_unitario, d.Precio_total
FROM OrdenesCompra o
INNER JOIN Proveedores p ON o.proveedor_id = p.proveedor_id
INNER JOIN DetalleOrdenCompra d ON o.orden_id = d.orden_id
INNER JOIN Productos pr ON d.producto_id = pr.producto_id
WHERE o.orden_id=2

