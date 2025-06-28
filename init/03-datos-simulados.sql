-- Artículos de prueba actualizados
INSERT INTO articulos (nombre, costo, iva_id, moneda_id, renta, precio_venta, categoria_id, marca_id, proveedor_id, codigo_barra, unidad_medida)
VALUES 
('Articulo1', 342.91, 4, 1, 35.00, 900.84, 1, 1, 1, '100000000001', 'unidad'),
('Articulo2', 129.08, 4, 1, 40.00, 737.49, 1, 1, 1, '100000000002', 'unidad'),
('Articulo3', 315.46, 4, 1, 30.00, 674.77, 1, 1, 1, '100000000003', 'unidad'),
('Articulo4', 129.59, 4, 1, 45.00, 798.42, 1, 1, 1, '100000000004', 'unidad'),
('Articulo5', 210.65, 4, 1, 38.00, 715.99, 1, 1, 1, '100000000005', 'unidad'),
('Articulo6', 494.67, 4, 1, 25.00, 746.28, 1, 1, 1, '100000000006', 'unidad'),
('Articulo7', 424.00, 4, 1, 40.00, 998.98, 1, 1, 1, '100000000007', 'unidad'),
('Articulo8', 328.45, 4, 1, 37.00, 813.20, 1, 1, 1, '100000000008', 'unidad'),
('Articulo9', 258.12, 4, 1, 36.00, 610.26, 1, 1, 1, '100000000009', 'unidad'),
('Articulo10', 399.04, 4, 1, 35.00, 777.27, 1, 1, 1, '100000000010', 'unidad');


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
-- Detalle de ventas actualizado
INSERT INTO detalle_venta (venta_id, articulo_id, cantidad, precio_base, tipo_ajuste, porcentaje_ajuste, precio_unitario, moneda_id, cotizacion_dolar) VALUES (1, 7, 3, 998.98, 'ninguno', 0.00, 415.07, 1, NULL);
INSERT INTO detalle_venta (venta_id, articulo_id, cantidad, precio_base, tipo_ajuste, porcentaje_ajuste, precio_unitario, moneda_id, cotizacion_dolar) VALUES (2, 7, 3, 998.98, 'ninguno', 0.00, 430.78, 1, NULL);
INSERT INTO detalle_venta (venta_id, articulo_id, cantidad, precio_base, tipo_ajuste, porcentaje_ajuste, precio_unitario, moneda_id, cotizacion_dolar) VALUES (3, 4, 3, 798.42, 'ninguno', 0.00, 429.62, 1, NULL);
INSERT INTO detalle_venta (venta_id, articulo_id, cantidad, precio_base, tipo_ajuste, porcentaje_ajuste, precio_unitario, moneda_id, cotizacion_dolar) VALUES (4, 2, 5, 737.49, 'ninguno', 0.00, 412.41, 1, NULL);
INSERT INTO detalle_venta (venta_id, articulo_id, cantidad, precio_base, tipo_ajuste, porcentaje_ajuste, precio_unitario, moneda_id, cotizacion_dolar) VALUES (5, 7, 3, 998.98, 'ninguno', 0.00, 278.90, 1, NULL);
INSERT INTO detalle_venta (venta_id, articulo_id, cantidad, precio_base, tipo_ajuste, porcentaje_ajuste, precio_unitario, moneda_id, cotizacion_dolar) VALUES (6, 1, 1, 900.84, 'ninguno', 0.00, 306.74, 1, NULL);
INSERT INTO detalle_venta (venta_id, articulo_id, cantidad, precio_base, tipo_ajuste, porcentaje_ajuste, precio_unitario, moneda_id, cotizacion_dolar) VALUES (7, 10, 4, 777.27, 'ninguno', 0.00, 492.87, 1, NULL);
INSERT INTO detalle_venta (venta_id, articulo_id, cantidad, precio_base, tipo_ajuste, porcentaje_ajuste, precio_unitario, moneda_id, cotizacion_dolar) VALUES (8, 8, 2, 813.2, 'ninguno', 0.00, 424.12, 1, NULL);
INSERT INTO detalle_venta (venta_id, articulo_id, cantidad, precio_base, tipo_ajuste, porcentaje_ajuste, precio_unitario, moneda_id, cotizacion_dolar) VALUES (9, 1, 5, 900.84, 'ninguno', 0.00, 342.93, 1, NULL);
INSERT INTO detalle_venta (venta_id, articulo_id, cantidad, precio_base, tipo_ajuste, porcentaje_ajuste, precio_unitario, moneda_id, cotizacion_dolar) VALUES (10, 2, 5, 737.49, 'ninguno', 0.00, 421.60, 1, NULL);
INSERT INTO detalle_venta (venta_id, articulo_id, cantidad, precio_base, tipo_ajuste, porcentaje_ajuste, precio_unitario, moneda_id, cotizacion_dolar) VALUES (11, 4, 1, 798.42, 'ninguno', 0.00, 496.47, 1, NULL);
INSERT INTO detalle_venta (venta_id, articulo_id, cantidad, precio_base, tipo_ajuste, porcentaje_ajuste, precio_unitario, moneda_id, cotizacion_dolar) VALUES (12, 5, 1, 715.99, 'ninguno', 0.00, 383.54, 1, NULL);
INSERT INTO detalle_venta (venta_id, articulo_id, cantidad, precio_base, tipo_ajuste, porcentaje_ajuste, precio_unitario, moneda_id, cotizacion_dolar) VALUES (13, 10, 5, 777.27, 'ninguno', 0.00, 360.87, 1, NULL);
INSERT INTO detalle_venta (venta_id, articulo_id, cantidad, precio_base, tipo_ajuste, porcentaje_ajuste, precio_unitario, moneda_id, cotizacion_dolar) VALUES (14, 5, 3, 715.99, 'ninguno', 0.00, 211.99, 1, NULL);
INSERT INTO detalle_venta (venta_id, articulo_id, cantidad, precio_base, tipo_ajuste, porcentaje_ajuste, precio_unitario, moneda_id, cotizacion_dolar) VALUES (15, 2, 5, 737.49, 'ninguno', 0.00, 221.41, 1, NULL);
INSERT INTO detalle_venta (venta_id, articulo_id, cantidad, precio_base, tipo_ajuste, porcentaje_ajuste, precio_unitario, moneda_id, cotizacion_dolar) VALUES (16, 3, 2, 674.77, 'ninguno', 0.00, 270.59, 1, NULL);
INSERT INTO detalle_venta (venta_id, articulo_id, cantidad, precio_base, tipo_ajuste, porcentaje_ajuste, precio_unitario, moneda_id, cotizacion_dolar) VALUES (17, 3, 4, 674.77, 'ninguno', 0.00, 388.94, 1, NULL);
INSERT INTO detalle_venta (venta_id, articulo_id, cantidad, precio_base, tipo_ajuste, porcentaje_ajuste, precio_unitario, moneda_id, cotizacion_dolar) VALUES (18, 2, 2, 737.49, 'ninguno', 0.00, 306.95, 1, NULL);
INSERT INTO detalle_venta (venta_id, articulo_id, cantidad, precio_base, tipo_ajuste, porcentaje_ajuste, precio_unitario, moneda_id, cotizacion_dolar) VALUES (19, 5, 1, 715.99, 'ninguno', 0.00, 357.77, 1, NULL);
INSERT INTO detalle_venta (venta_id, articulo_id, cantidad, precio_base, tipo_ajuste, porcentaje_ajuste, precio_unitario, moneda_id, cotizacion_dolar) VALUES (20, 10, 4, 777.27, 'ninguno', 0.00, 426.04, 1, NULL);
INSERT INTO detalle_venta (venta_id, articulo_id, cantidad, precio_base, tipo_ajuste, porcentaje_ajuste, precio_unitario, moneda_id, cotizacion_dolar) VALUES (21, 5, 3, 715.99, 'ninguno', 0.00, 392.10, 1, NULL);
INSERT INTO detalle_venta (venta_id, articulo_id, cantidad, precio_base, tipo_ajuste, porcentaje_ajuste, precio_unitario, moneda_id, cotizacion_dolar) VALUES (22, 6, 4, 746.28, 'ninguno', 0.00, 270.30, 1, NULL);
INSERT INTO detalle_venta (venta_id, articulo_id, cantidad, precio_base, tipo_ajuste, porcentaje_ajuste, precio_unitario, moneda_id, cotizacion_dolar) VALUES (23, 2, 3, 737.49, 'ninguno', 0.00, 327.39, 1, NULL);
INSERT INTO detalle_venta (venta_id, articulo_id, cantidad, precio_base, tipo_ajuste, porcentaje_ajuste, precio_unitario, moneda_id, cotizacion_dolar) VALUES (24, 8, 2, 813.2, 'ninguno', 0.00, 431.90, 1, NULL);
INSERT INTO detalle_venta (venta_id, articulo_id, cantidad, precio_base, tipo_ajuste, porcentaje_ajuste, precio_unitario, moneda_id, cotizacion_dolar) VALUES (25, 1, 4, 900.84, 'ninguno', 0.00, 425.89, 1, NULL);
INSERT INTO detalle_venta (venta_id, articulo_id, cantidad, precio_base, tipo_ajuste, porcentaje_ajuste, precio_unitario, moneda_id, cotizacion_dolar) VALUES (26, 3, 4, 674.77, 'ninguno', 0.00, 202.75, 1, NULL);
INSERT INTO detalle_venta (venta_id, articulo_id, cantidad, precio_base, tipo_ajuste, porcentaje_ajuste, precio_unitario, moneda_id, cotizacion_dolar) VALUES (27, 3, 4, 674.77, 'ninguno', 0.00, 220.65, 1, NULL);
INSERT INTO detalle_venta (venta_id, articulo_id, cantidad, precio_base, tipo_ajuste, porcentaje_ajuste, precio_unitario, moneda_id, cotizacion_dolar) VALUES (28, 6, 1, 746.28, 'ninguno', 0.00, 215.48, 1, NULL);
INSERT INTO detalle_venta (venta_id, articulo_id, cantidad, precio_base, tipo_ajuste, porcentaje_ajuste, precio_unitario, moneda_id, cotizacion_dolar) VALUES (29, 3, 1, 674.77, 'ninguno', 0.00, 363.64, 1, NULL);
INSERT INTO detalle_venta (venta_id, articulo_id, cantidad, precio_base, tipo_ajuste, porcentaje_ajuste, precio_unitario, moneda_id, cotizacion_dolar) VALUES (30, 8, 5, 813.2, 'ninguno', 0.00, 398.00, 1, NULL);

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


-- Artículos en dólares
INSERT INTO articulos (nombre, costo, iva_id, moneda_id, renta, precio_venta, categoria_id, marca_id, proveedor_id, codigo_barra, unidad_medida)
VALUES 
('ArticuloUSD1', 10.00, 4, 2, 40.00, 25.00, 1, 1, 1, '200000000001', 'unidad'),
('ArticuloUSD2', 15.00, 4, 2, 50.00, 40.00, 1, 1, 1, '200000000002', 'unidad'),
('ArticuloUSD3', 20.00, 4, 2, 30.00, 50.00, 1, 1, 1, '200000000003', 'unidad');

-- Venta con artículos en USD
INSERT INTO ventas (cliente_id, usuario_id, caja_id, total, tipo_pago, fecha)
VALUES (1, 1, 1, 13780.00, 'efectivo', '2025-06-22 14:00:00');

-- Detalle de venta en USD
INSERT INTO detalle_venta (venta_id, articulo_id, cantidad, precio_base, tipo_ajuste, porcentaje_ajuste, precio_unitario, moneda_id, cotizacion_dolar)
VALUES 
(31, 11, 1, 25.00, 'ninguno', 0.00, 8662.50, 2, 346.50),
(31, 12, 1, 40.00, 'recargo', 5.00, 14538.00, 2, 346.50),
(31, 13, 1, 50.00, 'descuento', 10.00, 15592.50, 2, 346.50);
