
-- Usuarios de prueba
INSERT INTO usuarios (nombre, email, password, rol_id) VALUES
('Administrador', 'admin@pos.com', 'admin123', 1),
('Cajero', 'cajero@pos.com', 'cajero123', 2),
('Vendedor', 'vendedor@pos.com', 'vendedor123', 3);


-- Clientes de prueba
INSERT INTO clientes (nombre, apellido, email, telefono, ciudad_id, provincia_id)
VALUES ('Cliente1', 'Apellido1', 'cliente1@mail.com', '342555001', 1, 20);
INSERT INTO clientes (nombre, apellido, email, telefono, ciudad_id, provincia_id)
VALUES ('Cliente2', 'Apellido2', 'cliente2@mail.com', '342555002', 1, 20);
INSERT INTO clientes (nombre, apellido, email, telefono, ciudad_id, provincia_id)
VALUES ('Cliente3', 'Apellido3', 'cliente3@mail.com', '342555003', 1, 20);
INSERT INTO clientes (nombre, apellido, email, telefono, ciudad_id, provincia_id)
VALUES ('Cliente4', 'Apellido4', 'cliente4@mail.com', '342555004', 1, 20);
INSERT INTO clientes (nombre, apellido, email, telefono, ciudad_id, provincia_id)
VALUES ('Cliente5', 'Apellido5', 'cliente5@mail.com', '342555005', 1, 20);
INSERT INTO clientes (nombre, apellido, email, telefono, ciudad_id, provincia_id)
VALUES ('Cliente6', 'Apellido6', 'cliente6@mail.com', '342555006', 1, 20);
INSERT INTO clientes (nombre, apellido, email, telefono, ciudad_id, provincia_id)
VALUES ('Cliente7', 'Apellido7', 'cliente7@mail.com', '342555007', 1, 20);
INSERT INTO clientes (nombre, apellido, email, telefono, ciudad_id, provincia_id)
VALUES ('Cliente8', 'Apellido8', 'cliente8@mail.com', '342555008', 1, 20);
INSERT INTO clientes (nombre, apellido, email, telefono, ciudad_id, provincia_id)
VALUES ('Cliente9', 'Apellido9', 'cliente9@mail.com', '342555009', 1, 20);
INSERT INTO clientes (nombre, apellido, email, telefono, ciudad_id, provincia_id)
VALUES ('Cliente10', 'Apellido10', 'cliente10@mail.com', '3425550010', 1, 20);

-- Proveedores de prueba
INSERT INTO proveedores (nombre, email, telefono, ciudad_id, provincia_id)
VALUES ('Proveedor1', 'proveedor1@mail.com', '342555101', 1, 20);
INSERT INTO proveedores (nombre, email, telefono, ciudad_id, provincia_id)
VALUES ('Proveedor2', 'proveedor2@mail.com', '342555102', 1, 20);
INSERT INTO proveedores (nombre, email, telefono, ciudad_id, provincia_id)
VALUES ('Proveedor3', 'proveedor3@mail.com', '342555103', 1, 20);
INSERT INTO proveedores (nombre, email, telefono, ciudad_id, provincia_id)
VALUES ('Proveedor4', 'proveedor4@mail.com', '342555104', 1, 20);
INSERT INTO proveedores (nombre, email, telefono, ciudad_id, provincia_id)
VALUES ('Proveedor5', 'proveedor5@mail.com', '342555105', 1, 20);

-- Categorías
INSERT INTO categorias (nombre) VALUES ('Alimentos'), ('Bebidas'), ('Limpieza');

-- Marcas
INSERT INTO marcas (nombre) VALUES ('MarcaA'), ('MarcaB'), ('MarcaC');

-- Artículos de prueba
INSERT INTO articulos (nombre, costo, iva_id, moneda_id, categoria_id, marca_id, proveedor_id, precio_venta)
VALUES ('Articulo1', 342.91, 4, 1, 1, 1, 1, 900.84);
INSERT INTO articulos (nombre, costo, iva_id, moneda_id, categoria_id, marca_id, proveedor_id, precio_venta)
VALUES ('Articulo2', 129.08, 4, 1, 1, 1, 1, 737.49);
INSERT INTO articulos (nombre, costo, iva_id, moneda_id, categoria_id, marca_id, proveedor_id, precio_venta)
VALUES ('Articulo3', 315.46, 4, 1, 1, 1, 1, 674.77);
INSERT INTO articulos (nombre, costo, iva_id, moneda_id, categoria_id, marca_id, proveedor_id, precio_venta)
VALUES ('Articulo4', 129.59, 4, 1, 1, 1, 1, 798.42);
INSERT INTO articulos (nombre, costo, iva_id, moneda_id, categoria_id, marca_id, proveedor_id, precio_venta)
VALUES ('Articulo5', 210.65, 4, 1, 1, 1, 1, 715.99);
INSERT INTO articulos (nombre, costo, iva_id, moneda_id, categoria_id, marca_id, proveedor_id, precio_venta)
VALUES ('Articulo6', 494.67, 4, 1, 1, 1, 1, 746.28);
INSERT INTO articulos (nombre, costo, iva_id, moneda_id, categoria_id, marca_id, proveedor_id, precio_venta)
VALUES ('Articulo7', 424.00, 4, 1, 1, 1, 1, 998.98);
INSERT INTO articulos (nombre, costo, iva_id, moneda_id, categoria_id, marca_id, proveedor_id, precio_venta)
VALUES ('Articulo8', 328.45, 4, 1, 1, 1, 1, 813.20);
INSERT INTO articulos (nombre, costo, iva_id, moneda_id, categoria_id, marca_id, proveedor_id, precio_venta)
VALUES ('Articulo9', 258.12, 4, 1, 1, 1, 1, 610.26);
INSERT INTO articulos (nombre, costo, iva_id, moneda_id, categoria_id, marca_id, proveedor_id, precio_venta)
VALUES ('Articulo10', 399.04, 4, 1, 1, 1, 1, 777.27);

-- Sucursal por defecto
INSERT INTO sucursales (nombre, direccion, ciudad_id, provincia_id, telefono, email)
VALUES ('Sucursal Central', 'Calle Principal 123', 1, 20, '3424441111', 'sucursal@mail.com');

-- Stock inicial
INSERT INTO stock (articulo_id, sucursal_id, cantidad) VALUES (1, 1, 64);
INSERT INTO stock (articulo_id, sucursal_id, cantidad) VALUES (2, 1, 59);
INSERT INTO stock (articulo_id, sucursal_id, cantidad) VALUES (3, 1, 43);
INSERT INTO stock (articulo_id, sucursal_id, cantidad) VALUES (4, 1, 53);
INSERT INTO stock (articulo_id, sucursal_id, cantidad) VALUES (5, 1, 55);
INSERT INTO stock (articulo_id, sucursal_id, cantidad) VALUES (6, 1, 14);
INSERT INTO stock (articulo_id, sucursal_id, cantidad) VALUES (7, 1, 45);
INSERT INTO stock (articulo_id, sucursal_id, cantidad) VALUES (8, 1, 79);
INSERT INTO stock (articulo_id, sucursal_id, cantidad) VALUES (9, 1, 25);
INSERT INTO stock (articulo_id, sucursal_id, cantidad) VALUES (10, 1, 55);

-- Cajas abiertas
INSERT INTO cajas (usuario_id, sucursal_id, fecha_apertura, saldo_inicial, estado)
VALUES (1, 1, '2025-06-22 08:00:00', 10000, 'abierta');
INSERT INTO cajas (usuario_id, sucursal_id, fecha_apertura, saldo_inicial, estado)
VALUES (1, 1, '2025-06-07 08:00:00', 10000, 'abierta');
INSERT INTO cajas (usuario_id, sucursal_id, fecha_apertura, saldo_inicial, estado)
VALUES (1, 1, '2025-05-23 08:00:00', 10000, 'abierta');
INSERT INTO cajas (usuario_id, sucursal_id, fecha_apertura, saldo_inicial, estado)
VALUES (1, 1, '2025-05-08 08:00:00', 10000, 'abierta');
INSERT INTO cajas (usuario_id, sucursal_id, fecha_apertura, saldo_inicial, estado)
VALUES (1, 1, '2025-04-23 08:00:00', 10000, 'abierta');
INSERT INTO cajas (usuario_id, sucursal_id, fecha_apertura, saldo_inicial, estado)
VALUES (1, 1, '2025-04-08 08:00:00', 10000, 'abierta');

-- Ventas simuladas
INSERT INTO ventas (cliente_id, usuario_id, caja_id, total, tipo_pago, fecha)
VALUES (9, 1, 1, 1927.26, 'efectivo', '2025-06-22 9:30:00');
INSERT INTO ventas (cliente_id, usuario_id, caja_id, total, tipo_pago, fecha)
VALUES (4, 1, 1, 2877.83, 'efectivo', '2025-06-22 10:30:00');
INSERT INTO ventas (cliente_id, usuario_id, caja_id, total, tipo_pago, fecha)
VALUES (9, 1, 1, 2993.50, 'efectivo', '2025-06-22 11:30:00');
INSERT INTO ventas (cliente_id, usuario_id, caja_id, total, tipo_pago, fecha)
VALUES (6, 1, 1, 1397.22, 'efectivo', '2025-06-22 12:30:00');
INSERT INTO ventas (cliente_id, usuario_id, caja_id, total, tipo_pago, fecha)
VALUES (10, 1, 1, 2357.35, 'efectivo', '2025-06-22 13:30:00');
INSERT INTO ventas (cliente_id, usuario_id, caja_id, total, tipo_pago, fecha)
VALUES (4, 1, 2, 2473.87, 'efectivo', '2025-06-07 9:30:00');
INSERT INTO ventas (cliente_id, usuario_id, caja_id, total, tipo_pago, fecha)
VALUES (5, 1, 2, 2330.15, 'efectivo', '2025-06-07 10:30:00');
INSERT INTO ventas (cliente_id, usuario_id, caja_id, total, tipo_pago, fecha)
VALUES (9, 1, 2, 2230.02, 'efectivo', '2025-06-07 11:30:00');
INSERT INTO ventas (cliente_id, usuario_id, caja_id, total, tipo_pago, fecha)
VALUES (4, 1, 2, 2922.55, 'efectivo', '2025-06-07 12:30:00');
INSERT INTO ventas (cliente_id, usuario_id, caja_id, total, tipo_pago, fecha)
VALUES (9, 1, 2, 2076.20, 'efectivo', '2025-06-07 13:30:00');
INSERT INTO ventas (cliente_id, usuario_id, caja_id, total, tipo_pago, fecha)
VALUES (3, 1, 3, 2367.77, 'efectivo', '2025-05-23 9:30:00');
INSERT INTO ventas (cliente_id, usuario_id, caja_id, total, tipo_pago, fecha)
VALUES (9, 1, 3, 1208.94, 'efectivo', '2025-05-23 10:30:00');
INSERT INTO ventas (cliente_id, usuario_id, caja_id, total, tipo_pago, fecha)
VALUES (4, 1, 3, 1081.05, 'efectivo', '2025-05-23 11:30:00');
INSERT INTO ventas (cliente_id, usuario_id, caja_id, total, tipo_pago, fecha)
VALUES (4, 1, 3, 2626.93, 'efectivo', '2025-05-23 12:30:00');
INSERT INTO ventas (cliente_id, usuario_id, caja_id, total, tipo_pago, fecha)
VALUES (6, 1, 3, 2399.60, 'efectivo', '2025-05-23 13:30:00');
INSERT INTO ventas (cliente_id, usuario_id, caja_id, total, tipo_pago, fecha)
VALUES (10, 1, 4, 1489.83, 'efectivo', '2025-05-08 9:30:00');
INSERT INTO ventas (cliente_id, usuario_id, caja_id, total, tipo_pago, fecha)
VALUES (4, 1, 4, 2504.06, 'efectivo', '2025-05-08 10:30:00');
INSERT INTO ventas (cliente_id, usuario_id, caja_id, total, tipo_pago, fecha)
VALUES (5, 1, 4, 2444.89, 'efectivo', '2025-05-08 11:30:00');
INSERT INTO ventas (cliente_id, usuario_id, caja_id, total, tipo_pago, fecha)
VALUES (2, 1, 4, 1423.95, 'efectivo', '2025-05-08 12:30:00');
INSERT INTO ventas (cliente_id, usuario_id, caja_id, total, tipo_pago, fecha)
VALUES (1, 1, 4, 1269.35, 'efectivo', '2025-05-08 13:30:00');
INSERT INTO ventas (cliente_id, usuario_id, caja_id, total, tipo_pago, fecha)
VALUES (7, 1, 5, 2330.06, 'efectivo', '2025-04-23 9:30:00');
INSERT INTO ventas (cliente_id, usuario_id, caja_id, total, tipo_pago, fecha)
VALUES (4, 1, 5, 2304.95, 'efectivo', '2025-04-23 10:30:00');
INSERT INTO ventas (cliente_id, usuario_id, caja_id, total, tipo_pago, fecha)
VALUES (10, 1, 5, 2703.13, 'efectivo', '2025-04-23 11:30:00');
INSERT INTO ventas (cliente_id, usuario_id, caja_id, total, tipo_pago, fecha)
VALUES (7, 1, 5, 2759.57, 'efectivo', '2025-04-23 12:30:00');
INSERT INTO ventas (cliente_id, usuario_id, caja_id, total, tipo_pago, fecha)
VALUES (9, 1, 5, 1745.09, 'efectivo', '2025-04-23 13:30:00');
INSERT INTO ventas (cliente_id, usuario_id, caja_id, total, tipo_pago, fecha)
VALUES (6, 1, 6, 2851.48, 'efectivo', '2025-04-08 9:30:00');
INSERT INTO ventas (cliente_id, usuario_id, caja_id, total, tipo_pago, fecha)
VALUES (2, 1, 6, 2795.67, 'efectivo', '2025-04-08 10:30:00');
INSERT INTO ventas (cliente_id, usuario_id, caja_id, total, tipo_pago, fecha)
VALUES (8, 1, 6, 1855.46, 'efectivo', '2025-04-08 11:30:00');
INSERT INTO ventas (cliente_id, usuario_id, caja_id, total, tipo_pago, fecha)
VALUES (10, 1, 6, 1119.18, 'efectivo', '2025-04-08 12:30:00');
INSERT INTO ventas (cliente_id, usuario_id, caja_id, total, tipo_pago, fecha)
VALUES (10, 1, 6, 2017.67, 'efectivo', '2025-04-08 13:30:00');
INSERT INTO detalle_venta (venta_id, articulo_id, cantidad, precio_unitario)
VALUES (1, 7, 3, 415.07);
INSERT INTO detalle_venta (venta_id, articulo_id, cantidad, precio_unitario)
VALUES (2, 7, 3, 430.78);
INSERT INTO detalle_venta (venta_id, articulo_id, cantidad, precio_unitario)
VALUES (3, 4, 3, 429.62);
INSERT INTO detalle_venta (venta_id, articulo_id, cantidad, precio_unitario)
VALUES (4, 2, 5, 412.41);
INSERT INTO detalle_venta (venta_id, articulo_id, cantidad, precio_unitario)
VALUES (5, 7, 3, 278.90);
INSERT INTO detalle_venta (venta_id, articulo_id, cantidad, precio_unitario)
VALUES (6, 1, 1, 306.74);
INSERT INTO detalle_venta (venta_id, articulo_id, cantidad, precio_unitario)
VALUES (7, 10, 4, 492.87);
INSERT INTO detalle_venta (venta_id, articulo_id, cantidad, precio_unitario)
VALUES (8, 8, 2, 424.12);
INSERT INTO detalle_venta (venta_id, articulo_id, cantidad, precio_unitario)
VALUES (9, 1, 5, 342.93);
INSERT INTO detalle_venta (venta_id, articulo_id, cantidad, precio_unitario)
VALUES (10, 2, 5, 421.60);
INSERT INTO detalle_venta (venta_id, articulo_id, cantidad, precio_unitario)
VALUES (11, 4, 1, 496.47);
INSERT INTO detalle_venta (venta_id, articulo_id, cantidad, precio_unitario)
VALUES (12, 5, 1, 383.54);
INSERT INTO detalle_venta (venta_id, articulo_id, cantidad, precio_unitario)
VALUES (13, 10, 5, 360.87);
INSERT INTO detalle_venta (venta_id, articulo_id, cantidad, precio_unitario)
VALUES (14, 5, 3, 211.99);
INSERT INTO detalle_venta (venta_id, articulo_id, cantidad, precio_unitario)
VALUES (15, 2, 5, 221.41);
INSERT INTO detalle_venta (venta_id, articulo_id, cantidad, precio_unitario)
VALUES (16, 3, 2, 270.59);
INSERT INTO detalle_venta (venta_id, articulo_id, cantidad, precio_unitario)
VALUES (17, 3, 4, 388.94);
INSERT INTO detalle_venta (venta_id, articulo_id, cantidad, precio_unitario)
VALUES (18, 2, 2, 306.95);
INSERT INTO detalle_venta (venta_id, articulo_id, cantidad, precio_unitario)
VALUES (19, 5, 1, 357.77);
INSERT INTO detalle_venta (venta_id, articulo_id, cantidad, precio_unitario)
VALUES (20, 10, 4, 426.04);
INSERT INTO detalle_venta (venta_id, articulo_id, cantidad, precio_unitario)
VALUES (21, 5, 3, 392.10);
INSERT INTO detalle_venta (venta_id, articulo_id, cantidad, precio_unitario)
VALUES (22, 6, 4, 270.30);
INSERT INTO detalle_venta (venta_id, articulo_id, cantidad, precio_unitario)
VALUES (23, 2, 3, 327.39);
INSERT INTO detalle_venta (venta_id, articulo_id, cantidad, precio_unitario)
VALUES (24, 8, 2, 431.90);
INSERT INTO detalle_venta (venta_id, articulo_id, cantidad, precio_unitario)
VALUES (25, 1, 4, 425.89);
INSERT INTO detalle_venta (venta_id, articulo_id, cantidad, precio_unitario)
VALUES (26, 3, 4, 202.75);
INSERT INTO detalle_venta (venta_id, articulo_id, cantidad, precio_unitario)
VALUES (27, 3, 4, 220.65);
INSERT INTO detalle_venta (venta_id, articulo_id, cantidad, precio_unitario)
VALUES (28, 6, 1, 215.48);
INSERT INTO detalle_venta (venta_id, articulo_id, cantidad, precio_unitario)
VALUES (29, 3, 1, 363.64);
INSERT INTO detalle_venta (venta_id, articulo_id, cantidad, precio_unitario)
VALUES (30, 8, 5, 398.00);
INSERT INTO cuentas_corrientes (cliente_id, venta_id, fecha, tipo_movimiento, descripcion, monto, saldo)
VALUES (9, 1, '2025-06-22', 'venta', 'Venta a cuenta', 1927.26, 1927.26);
INSERT INTO cuentas_corrientes (cliente_id, venta_id, fecha, tipo_movimiento, descripcion, monto, saldo)
VALUES (9, 3, '2025-06-22', 'venta', 'Venta a cuenta', 2993.50, 2993.50);
INSERT INTO cuentas_corrientes (cliente_id, venta_id, fecha, tipo_movimiento, descripcion, monto, saldo)
VALUES (10, 5, '2025-06-22', 'venta', 'Venta a cuenta', 2357.35, 2357.35);
INSERT INTO cuentas_corrientes (cliente_id, venta_id, fecha, tipo_movimiento, descripcion, monto, saldo)
VALUES (4, 6, '2025-06-07', 'venta', 'Venta a cuenta', 2473.87, 2473.87);
INSERT INTO cuentas_corrientes (cliente_id, venta_id, fecha, tipo_movimiento, descripcion, monto, saldo)
VALUES (9, 8, '2025-06-07', 'venta', 'Venta a cuenta', 2230.02, 2230.02);
INSERT INTO cuentas_corrientes (cliente_id, venta_id, fecha, tipo_movimiento, descripcion, monto, saldo)
VALUES (9, 10, '2025-06-07', 'venta', 'Venta a cuenta', 2076.20, 2076.20);
INSERT INTO cuentas_corrientes (cliente_id, venta_id, fecha, tipo_movimiento, descripcion, monto, saldo)
VALUES (3, 11, '2025-05-23', 'venta', 'Venta a cuenta', 2367.77, 2367.77);
INSERT INTO cuentas_corrientes (cliente_id, venta_id, fecha, tipo_movimiento, descripcion, monto, saldo)
VALUES (4, 13, '2025-05-23', 'venta', 'Venta a cuenta', 1081.05, 1081.05);
INSERT INTO cuentas_corrientes (cliente_id, venta_id, fecha, tipo_movimiento, descripcion, monto, saldo)
VALUES (6, 15, '2025-05-23', 'venta', 'Venta a cuenta', 2399.60, 2399.60);
INSERT INTO cuentas_corrientes (cliente_id, venta_id, fecha, tipo_movimiento, descripcion, monto, saldo)
VALUES (10, 16, '2025-05-08', 'venta', 'Venta a cuenta', 1489.83, 1489.83);
INSERT INTO cuentas_corrientes (cliente_id, venta_id, fecha, tipo_movimiento, descripcion, monto, saldo)
VALUES (5, 18, '2025-05-08', 'venta', 'Venta a cuenta', 2444.89, 2444.89);
INSERT INTO cuentas_corrientes (cliente_id, venta_id, fecha, tipo_movimiento, descripcion, monto, saldo)
VALUES (1, 20, '2025-05-08', 'venta', 'Venta a cuenta', 1269.35, 1269.35);
INSERT INTO cuentas_corrientes (cliente_id, venta_id, fecha, tipo_movimiento, descripcion, monto, saldo)
VALUES (7, 21, '2025-04-23', 'venta', 'Venta a cuenta', 2330.06, 2330.06);
INSERT INTO cuentas_corrientes (cliente_id, venta_id, fecha, tipo_movimiento, descripcion, monto, saldo)
VALUES (10, 23, '2025-04-23', 'venta', 'Venta a cuenta', 2703.13, 2703.13);
INSERT INTO cuentas_corrientes (cliente_id, venta_id, fecha, tipo_movimiento, descripcion, monto, saldo)
VALUES (9, 25, '2025-04-23', 'venta', 'Venta a cuenta', 1745.09, 1745.09);
INSERT INTO cuentas_corrientes (cliente_id, venta_id, fecha, tipo_movimiento, descripcion, monto, saldo)
VALUES (6, 26, '2025-04-08', 'venta', 'Venta a cuenta', 2851.48, 2851.48);
INSERT INTO cuentas_corrientes (cliente_id, venta_id, fecha, tipo_movimiento, descripcion, monto, saldo)
VALUES (8, 28, '2025-04-08', 'venta', 'Venta a cuenta', 1855.46, 1855.46);
INSERT INTO cuentas_corrientes (cliente_id, venta_id, fecha, tipo_movimiento, descripcion, monto, saldo)
VALUES (10, 30, '2025-04-08', 'venta', 'Venta a cuenta', 2017.67, 2017.67);

-- Arqueos de caja
INSERT INTO arqueos (caja_id, efectivo_contado, total_sistema, observaciones)
VALUES (1, 13593.55, 13400.72, 'Arqueo diario.');
INSERT INTO arqueos (caja_id, efectivo_contado, total_sistema, observaciones)
VALUES (2, 14727.46, 14575.95, 'Arqueo diario.');
INSERT INTO arqueos (caja_id, efectivo_contado, total_sistema, observaciones)
VALUES (3, 12366.45, 12474.31, 'Arqueo diario.');
INSERT INTO arqueos (caja_id, efectivo_contado, total_sistema, observaciones)
VALUES (4, 13854.34, 13669.17, 'Arqueo diario.');
INSERT INTO arqueos (caja_id, efectivo_contado, total_sistema, observaciones)
VALUES (5, 12481.53, 12502.72, 'Arqueo diario.');
INSERT INTO arqueos (caja_id, efectivo_contado, total_sistema, observaciones)
VALUES (6, 11585.71, 11399.14, 'Arqueo diario.');

-- Movimientos de caja
INSERT INTO movimientos_caja (caja_id, tipo_movimiento, motivo, descripcion, monto, fecha)
VALUES (1, 'ingreso', 'venta', 'Ingreso por ventas', 13593.55, '2025-06-22 21:00:00');
INSERT INTO movimientos_caja (caja_id, tipo_movimiento, motivo, descripcion, monto, fecha)
VALUES (1, 'ingreso', 'aporte', 'Pago del cliente 2', 1466.08, '2025-06-22 10:05:00');
INSERT INTO movimientos_caja (caja_id, tipo_movimiento, motivo, descripcion, monto, fecha)
VALUES (1, 'ingreso', 'aporte', 'Pago del cliente 6', 1923.36, '2025-06-22 10:05:00');
INSERT INTO movimientos_caja (caja_id, tipo_movimiento, motivo, descripcion, monto, fecha)
VALUES (2, 'ingreso', 'venta', 'Ingreso por ventas', 14727.46, '2025-06-07 21:00:00');
INSERT INTO movimientos_caja (caja_id, tipo_movimiento, motivo, descripcion, monto, fecha)
VALUES (2, 'ingreso', 'aporte', 'Pago del cliente 1', 2565.65, '2025-06-07 10:05:00');
INSERT INTO movimientos_caja (caja_id, tipo_movimiento, motivo, descripcion, monto, fecha)
VALUES (2, 'ingreso', 'aporte', 'Pago del cliente 4', 1137.07, '2025-06-07 10:05:00');
INSERT INTO movimientos_caja (caja_id, tipo_movimiento, motivo, descripcion, monto, fecha)
VALUES (3, 'ingreso', 'venta', 'Ingreso por ventas', 12366.45, '2025-05-23 21:00:00');
INSERT INTO movimientos_caja (caja_id, tipo_movimiento, motivo, descripcion, monto, fecha)
VALUES (3, 'ingreso', 'aporte', 'Pago del cliente 4', 1888.65, '2025-05-23 10:05:00');
INSERT INTO movimientos_caja (caja_id, tipo_movimiento, motivo, descripcion, monto, fecha)
VALUES (3, 'ingreso', 'aporte', 'Pago del cliente 2', 2220.51, '2025-05-23 10:05:00');
INSERT INTO movimientos_caja (caja_id, tipo_movimiento, motivo, descripcion, monto, fecha)
VALUES (4, 'ingreso', 'venta', 'Ingreso por ventas', 13854.34, '2025-05-08 21:00:00');
INSERT INTO movimientos_caja (caja_id, tipo_movimiento, motivo, descripcion, monto, fecha)
VALUES (4, 'ingreso', 'aporte', 'Pago del cliente 4', 2095.28, '2025-05-08 10:05:00');
INSERT INTO movimientos_caja (caja_id, tipo_movimiento, motivo, descripcion, monto, fecha)
VALUES (4, 'ingreso', 'aporte', 'Pago del cliente 4', 2782.01, '2025-05-08 10:05:00');
INSERT INTO movimientos_caja (caja_id, tipo_movimiento, motivo, descripcion, monto, fecha)
VALUES (5, 'ingreso', 'venta', 'Ingreso por ventas', 12481.53, '2025-04-23 21:00:00');
INSERT INTO movimientos_caja (caja_id, tipo_movimiento, motivo, descripcion, monto, fecha)
VALUES (5, 'ingreso', 'aporte', 'Pago del cliente 5', 2292.38, '2025-04-23 10:05:00');
INSERT INTO movimientos_caja (caja_id, tipo_movimiento, motivo, descripcion, monto, fecha)
VALUES (5, 'ingreso', 'aporte', 'Pago del cliente 3', 2555.40, '2025-04-23 10:05:00');
INSERT INTO movimientos_caja (caja_id, tipo_movimiento, motivo, descripcion, monto, fecha)
VALUES (6, 'ingreso', 'venta', 'Ingreso por ventas', 11585.71, '2025-04-08 21:00:00');
INSERT INTO movimientos_caja (caja_id, tipo_movimiento, motivo, descripcion, monto, fecha)
VALUES (6, 'ingreso', 'aporte', 'Pago del cliente 10', 2073.35, '2025-04-08 10:05:00');
INSERT INTO movimientos_caja (caja_id, tipo_movimiento, motivo, descripcion, monto, fecha)
VALUES (6, 'ingreso', 'aporte', 'Pago del cliente 1', 1135.36, '2025-04-08 10:05:00');

-- Pagos registrados
INSERT INTO pagos (cliente_id, caja_id, fecha, monto, forma_pago, observaciones)
VALUES (2, 1, '2025-06-22 10:00:00', 1466.08, 'transferencia', 'Pago parcial de cuenta.');
INSERT INTO cuentas_corrientes (cliente_id, fecha, tipo_movimiento, descripcion, monto, saldo)
VALUES (2, '2025-06-22', 'pago', 'Pago recibido', 1466.08, 0);
INSERT INTO pagos (cliente_id, caja_id, fecha, monto, forma_pago, observaciones)
VALUES (6, 1, '2025-06-22 10:00:00', 1923.36, 'transferencia', 'Pago parcial de cuenta.');
INSERT INTO cuentas_corrientes (cliente_id, fecha, tipo_movimiento, descripcion, monto, saldo)
VALUES (6, '2025-06-22', 'pago', 'Pago recibido', 1923.36, 0);
INSERT INTO pagos (cliente_id, caja_id, fecha, monto, forma_pago, observaciones)
VALUES (1, 2, '2025-06-07 10:00:00', 2565.65, 'transferencia', 'Pago parcial de cuenta.');
INSERT INTO cuentas_corrientes (cliente_id, fecha, tipo_movimiento, descripcion, monto, saldo)
VALUES (1, '2025-06-07', 'pago', 'Pago recibido', 2565.65, 0);
INSERT INTO pagos (cliente_id, caja_id, fecha, monto, forma_pago, observaciones)
VALUES (4, 2, '2025-06-07 10:00:00', 1137.07, 'transferencia', 'Pago parcial de cuenta.');
INSERT INTO cuentas_corrientes (cliente_id, fecha, tipo_movimiento, descripcion, monto, saldo)
VALUES (4, '2025-06-07', 'pago', 'Pago recibido', 1137.07, 0);
INSERT INTO pagos (cliente_id, caja_id, fecha, monto, forma_pago, observaciones)
VALUES (4, 3, '2025-05-23 10:00:00', 1888.65, 'transferencia', 'Pago parcial de cuenta.');
INSERT INTO cuentas_corrientes (cliente_id, fecha, tipo_movimiento, descripcion, monto, saldo)
VALUES (4, '2025-05-23', 'pago', 'Pago recibido', 1888.65, 0);
INSERT INTO pagos (cliente_id, caja_id, fecha, monto, forma_pago, observaciones)
VALUES (2, 3, '2025-05-23 10:00:00', 2220.51, 'transferencia', 'Pago parcial de cuenta.');
INSERT INTO cuentas_corrientes (cliente_id, fecha, tipo_movimiento, descripcion, monto, saldo)
VALUES (2, '2025-05-23', 'pago', 'Pago recibido', 2220.51, 0);
INSERT INTO pagos (cliente_id, caja_id, fecha, monto, forma_pago, observaciones)
VALUES (4, 4, '2025-05-08 10:00:00', 2095.28, 'transferencia', 'Pago parcial de cuenta.');
INSERT INTO cuentas_corrientes (cliente_id, fecha, tipo_movimiento, descripcion, monto, saldo)
VALUES (4, '2025-05-08', 'pago', 'Pago recibido', 2095.28, 0);
INSERT INTO pagos (cliente_id, caja_id, fecha, monto, forma_pago, observaciones)
VALUES (4, 4, '2025-05-08 10:00:00', 2782.01, 'transferencia', 'Pago parcial de cuenta.');
INSERT INTO cuentas_corrientes (cliente_id, fecha, tipo_movimiento, descripcion, monto, saldo)
VALUES (4, '2025-05-08', 'pago', 'Pago recibido', 2782.01, 0);
INSERT INTO pagos (cliente_id, caja_id, fecha, monto, forma_pago, observaciones)
VALUES (5, 5, '2025-04-23 10:00:00', 2292.38, 'transferencia', 'Pago parcial de cuenta.');
INSERT INTO cuentas_corrientes (cliente_id, fecha, tipo_movimiento, descripcion, monto, saldo)
VALUES (5, '2025-04-23', 'pago', 'Pago recibido', 2292.38, 0);
INSERT INTO pagos (cliente_id, caja_id, fecha, monto, forma_pago, observaciones)
VALUES (3, 5, '2025-04-23 10:00:00', 2555.40, 'transferencia', 'Pago parcial de cuenta.');
INSERT INTO cuentas_corrientes (cliente_id, fecha, tipo_movimiento, descripcion, monto, saldo)
VALUES (3, '2025-04-23', 'pago', 'Pago recibido', 2555.40, 0);
INSERT INTO pagos (cliente_id, caja_id, fecha, monto, forma_pago, observaciones)
VALUES (10, 6, '2025-04-08 10:00:00', 2073.35, 'transferencia', 'Pago parcial de cuenta.');
INSERT INTO cuentas_corrientes (cliente_id, fecha, tipo_movimiento, descripcion, monto, saldo)
VALUES (10, '2025-04-08', 'pago', 'Pago recibido', 2073.35, 0);
INSERT INTO pagos (cliente_id, caja_id, fecha, monto, forma_pago, observaciones)
VALUES (1, 6, '2025-04-08 10:00:00', 1135.36, 'transferencia', 'Pago parcial de cuenta.');
INSERT INTO cuentas_corrientes (cliente_id, fecha, tipo_movimiento, descripcion, monto, saldo)
VALUES (1, '2025-04-08', 'pago', 'Pago recibido', 1135.36, 0);
