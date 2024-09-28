#Obtener la información de las órdenes de compra junto con el total pagado en cada una:
SELECT o.orden_id, o.fecha,
    SUM(d.Precio_total) AS total_pagado
FROM OrdenesCompra o
INNER JOIN DetalleOrdenCompra d ON o.orden_id = d.orden_id
GROUP BY o.orden_id, o.fecha;
