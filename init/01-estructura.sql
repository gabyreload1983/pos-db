DROP DATABASE IF EXISTS pos;
CREATE DATABASE IF NOT EXISTS pos CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE pos;


CREATE TABLE roles (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL UNIQUE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO roles (id, nombre) VALUES
(1, 'Administrador'),
(2, 'Cajero'),
(3, 'Vendedor');

CREATE TABLE usuarios (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  rol_id INT NOT NULL,
  activo TINYINT(1) DEFAULT 1,
  creado_en DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (rol_id) REFERENCES roles(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO usuarios (id, nombre, email, password, rol_id) VALUES
(1, 'Administrador', 'admin@pos.com', '$2b$10$iKmyx/cuss.tdXRVVwJsx.RcVCXOkFRbb0B69ahw.Os4Len.UqVGO', 1);

CREATE TABLE provincias (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL UNIQUE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE ciudades (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  provincia_id INT NOT NULL,
  codigo_postal VARCHAR(10),
  FOREIGN KEY (provincia_id) REFERENCES provincias(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE iva_aliquotas (
  id INT AUTO_INCREMENT PRIMARY KEY,
  descripcion VARCHAR(50) NOT NULL,
  porcentaje DECIMAL(5,2) NOT NULL,
  activo TINYINT(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO iva_aliquotas (id, descripcion, porcentaje) VALUES
  (1, 'IVA 10.5%', 10.50),
  (2, 'IVA 21%', 21.00),
  (3, 'IVA 27%', 27.00);

CREATE TABLE condiciones_iva (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL UNIQUE,
  activo TINYINT(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO condiciones_iva (id, nombre) VALUES
  (1, 'Consumidor Final'),
  (2, 'Responsable Inscripto'),
  (3, 'Monotributo'),
  (4, 'Exento');

CREATE TABLE tipos_documento (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL UNIQUE,
  activo TINYINT(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO tipos_documento (id, nombre) VALUES
(1, 'DNI'), (2, 'CUIT'), (3, 'CUIL'), (4, 'PASAPORTE');

CREATE TABLE monedas (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL,
  simbolo VARCHAR(5) NOT NULL,
  codigo_iso VARCHAR(5) NOT NULL UNIQUE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO monedas (id, nombre, simbolo, codigo_iso) VALUES
(1, 'Peso Argentino', '$', 'ARS'),
(2, 'Dólar Estadounidense', 'U$', 'USD'),
(3, 'Euro', '€', 'EUR');

CREATE TABLE tipos_comprobante (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL UNIQUE, 
  descripcion TEXT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO tipos_comprobante (id, nombre) VALUES
(1, 'Factura A'),
(2, 'Factura B'),
(3, 'Factura C'),
(4, 'Nota de Crédito A'),
(5, 'Nota de Crédito B'),
(6, 'Remito'),
(7, 'Factura E'),
(8, 'Factura M');

CREATE TABLE sucursales (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  direccion VARCHAR(255),
  ciudad_id INT,
  provincia_id INT,
  telefono VARCHAR(20),
  email VARCHAR(100),
  activo TINYINT(1) DEFAULT 1,
  creado_en DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (ciudad_id) REFERENCES ciudades(id),
  FOREIGN KEY (provincia_id) REFERENCES provincias(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE usuarios_sucursales (
  usuario_id INT NOT NULL,
  sucursal_id INT NOT NULL,
  PRIMARY KEY (usuario_id, sucursal_id),
  FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
  FOREIGN KEY (sucursal_id) REFERENCES sucursales(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE clientes (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NULL,
  apellido VARCHAR(100) NULL,
  razon_social VARCHAR(150) NULL,
  tipo_documento_id INT NULL,
  documento VARCHAR(20) NULL,
  email VARCHAR(100) UNIQUE,
  telefono VARCHAR(20),
  direccion VARCHAR(255),
  ciudad_id INT,
  provincia_id INT,
  condicion_iva_id INT,
  activo TINYINT(1) DEFAULT 1,
  creado_en DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (tipo_documento_id) REFERENCES tipos_documento(id),
  FOREIGN KEY (ciudad_id) REFERENCES ciudades(id),
  FOREIGN KEY (provincia_id) REFERENCES provincias(id),
  FOREIGN KEY (condicion_iva_id) REFERENCES condiciones_iva(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE proveedores (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  razon_social VARCHAR(150) NOT NULL,
  cuit VARCHAR(15),
  email VARCHAR(100) UNIQUE,
  telefono VARCHAR(20),
  direccion VARCHAR(255),
  ciudad_id INT,
  provincia_id INT,
  condicion_iva_id INT,
  activo TINYINT(1) DEFAULT 1,
  creado_en DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (ciudad_id) REFERENCES ciudades(id),
  FOREIGN KEY (provincia_id) REFERENCES provincias(id),
  FOREIGN KEY (condicion_iva_id) REFERENCES condiciones_iva(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE marcas (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL UNIQUE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE categorias (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL UNIQUE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE articulos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  slug VARCHAR(150) UNIQUE,
  descripcion TEXT,
  descripcion_larga TEXT,
  costo DECIMAL(10,2) NOT NULL,
  renta DECIMAL(5,2) NOT NULL,
  precio_venta DECIMAL(10,2) NOT NULL,
  iva_aliquota_id INT NOT NULL,
  moneda_id INT NOT NULL,
  categoria_id INT,
  marca_id INT,
  proveedor_id INT,
  codigo_barra VARCHAR(50),
  unidad_medida VARCHAR(20),
  controla_stock TINYINT(1) DEFAULT 1,
  tiene_nro_serie TINYINT(1) DEFAULT 0,
  activo TINYINT(1) DEFAULT 1,
  publicado_web TINYINT(1) DEFAULT 0,
  seo_title VARCHAR(150),
  seo_description TEXT,
  external_id VARCHAR(100),
  creado_en DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (iva_aliquota_id) REFERENCES iva_aliquotas(id),
  FOREIGN KEY (moneda_id) REFERENCES monedas(id),
  FOREIGN KEY (categoria_id) REFERENCES categorias(id),
  FOREIGN KEY (marca_id) REFERENCES marcas(id),
  FOREIGN KEY (proveedor_id) REFERENCES proveedores(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE articulo_imagenes (
  id INT AUTO_INCREMENT PRIMARY KEY,
  articulo_id INT NOT NULL,
  url_imagen TEXT NOT NULL,
  orden INT DEFAULT 0,
  activo TINYINT(1) DEFAULT 1,
  creado_en DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (articulo_id) REFERENCES articulos(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE estados_numeros_serie (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL UNIQUE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO estados_numeros_serie (id, nombre) VALUES
(1, 'disponible'),
(2, 'vendido'),
(3, 'devuelto');

CREATE TABLE numeros_serie (
  id INT AUTO_INCREMENT PRIMARY KEY,
  articulo_id INT NOT NULL,
  nro_serie VARCHAR(100) NOT NULL,
  sucursal_id INT NOT NULL,
  estado_id INT NOT NULL,
  fecha_registro DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (articulo_id) REFERENCES articulos(id),
  FOREIGN KEY (sucursal_id) REFERENCES sucursales(id),
  FOREIGN KEY (estado_id) REFERENCES estados_numeros_serie(id),
  UNIQUE (nro_serie, articulo_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE cotizaciones_monedas (
  id INT AUTO_INCREMENT PRIMARY KEY,
  moneda_id INT NOT NULL,
  fecha DATE NOT NULL,
  valor DECIMAL(18,6) NOT NULL,       
  fuente VARCHAR(100),
  activo TINYINT(1) DEFAULT 0,
  UNIQUE KEY uq_moneda_fecha (moneda_id, fecha),
  INDEX (activo),
  FOREIGN KEY (moneda_id) REFERENCES monedas(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO cotizaciones_monedas (moneda_id, fecha, valor, fuente, activo)
VALUES (2, CURDATE(), 1.00, 'Init', 1);

CREATE TABLE cajas (
  id INT AUTO_INCREMENT PRIMARY KEY,
  usuario_id INT NOT NULL,
  sucursal_id INT NOT NULL,
  fecha_apertura DATETIME DEFAULT CURRENT_TIMESTAMP,
  fecha_cierre DATETIME,
  saldo_inicial DECIMAL(10,2) DEFAULT 0.00,
  saldo_final DECIMAL(10,2),
  estado ENUM('abierta','cerrada') DEFAULT 'abierta',
  observaciones TEXT,
  FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
  FOREIGN KEY (sucursal_id) REFERENCES sucursales(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE arqueos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  caja_id INT NOT NULL,
  efectivo_contado DECIMAL(10,2) NOT NULL,
  total_sistema DECIMAL(10,2) NOT NULL,
  diferencia DECIMAL(10,2) GENERATED ALWAYS AS (efectivo_contado - total_sistema) STORED,
  observaciones TEXT,
  fecha DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (caja_id) REFERENCES cajas(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE motivos_movimientos_caja (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL UNIQUE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO motivos_movimientos_caja (id, nombre) VALUES
(1, 'venta'),
(2, 'pago proveedor'),
(3, 'retiro'),
(4, 'aporte'),
(5, 'ajuste'),
(6, 'otro');

CREATE TABLE movimientos_caja (
  id INT AUTO_INCREMENT PRIMARY KEY,
  caja_id INT NOT NULL,
  tipo_movimiento ENUM('ingreso','egreso') NOT NULL,
  motivo_id INT NOT NULL,
  descripcion TEXT,
  monto DECIMAL(10,2) NOT NULL,
  fecha DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (caja_id) REFERENCES cajas(id),
  FOREIGN KEY (motivo_id) REFERENCES motivos_movimientos_caja(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE stock (
  id INT AUTO_INCREMENT PRIMARY KEY,
  articulo_id INT NOT NULL,
  sucursal_id INT NOT NULL,
  cantidad INT NOT NULL DEFAULT 0,
  UNIQUE KEY (articulo_id, sucursal_id),
  FOREIGN KEY (articulo_id) REFERENCES articulos(id),
  FOREIGN KEY (sucursal_id) REFERENCES sucursales(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE estados_remito (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL UNIQUE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO estados_remito (id, nombre) VALUES
(1, 'sin remitir'),
(2, 'parcial'),
(3, 'completo');

CREATE TABLE compras (
  id INT AUTO_INCREMENT PRIMARY KEY,
  proveedor_id INT NOT NULL,
  usuario_id INT NOT NULL,
  sucursal_id INT NOT NULL,
  tipo_comprobante_id INT NOT NULL,
  punto_venta INT NOT NULL,
  numero_comprobante INT NOT NULL,
  fecha DATETIME DEFAULT CURRENT_TIMESTAMP,
  total_neto DECIMAL(10,2) NOT NULL,
  total_iva DECIMAL(10,2) NOT NULL DEFAULT 0.00,
  total_final DECIMAL(10,2) AS (total_neto + total_iva) STORED,
  mueve_stock TINYINT(1) DEFAULT 1,
  estado_remito_id INT NOT NULL,
  observaciones TEXT,
  UNIQUE KEY proveedor_comprobante_unico (proveedor_id, punto_venta, numero_comprobante),
  FOREIGN KEY (proveedor_id) REFERENCES proveedores(id),
  FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
  FOREIGN KEY (sucursal_id) REFERENCES sucursales(id),
  FOREIGN KEY (tipo_comprobante_id) REFERENCES tipos_comprobante(id),
  FOREIGN KEY (estado_remito_id) REFERENCES estados_remito(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE detalle_compra (
  id INT AUTO_INCREMENT PRIMARY KEY,
  compra_id INT NOT NULL,
  articulo_id INT NOT NULL,
  cantidad INT NOT NULL,
  costo_unitario_ars DECIMAL(10,2) NOT NULL,
  porcentaje_iva DECIMAL(5,2) NULL,
  moneda_id INT NOT NULL,
  tasa_cambio DECIMAL(10,4) DEFAULT NULL,
  monto_iva DECIMAL(10,2) NULL,
  subtotal DECIMAL(10,2) GENERATED ALWAYS AS (cantidad * costo_unitario_ars) STORED,
  FOREIGN KEY (compra_id) REFERENCES compras(id),
  FOREIGN KEY (articulo_id) REFERENCES articulos(id),
  FOREIGN KEY (moneda_id) REFERENCES monedas(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE compras_iva_resumen (
  id INT AUTO_INCREMENT PRIMARY KEY,
  compra_id INT NOT NULL,
  iva_aliquota_id INT NOT NULL,
  neto DECIMAL(12,2) NOT NULL,
  iva  DECIMAL(12,2) NOT NULL,
  FOREIGN KEY (compra_id) REFERENCES compras(id),
  FOREIGN KEY (iva_aliquota_id) REFERENCES iva_aliquotas(id),
  UNIQUE KEY uq_compra_aliquota (compra_id, iva_aliquota_id)
);

CREATE TABLE detalle_compra_series (
  id INT AUTO_INCREMENT PRIMARY KEY,
  detalle_compra_id INT NOT NULL,
  nro_serie VARCHAR(100) NOT NULL,
  UNIQUE (detalle_compra_id, nro_serie),
  UNIQUE KEY unique_nro_serie_compra (nro_serie),
  FOREIGN KEY (detalle_compra_id) REFERENCES detalle_compra(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


CREATE TABLE remitos_compra (
  id INT AUTO_INCREMENT PRIMARY KEY,
  proveedor_id INT,
  usuario_id INT NOT NULL,
  sucursal_id INT NOT NULL,
  punto_venta INT NOT NULL,
  numero_comprobante INT NOT NULL,
  fecha DATETIME DEFAULT CURRENT_TIMESTAMP,
  observaciones TEXT,
  total DECIMAL(10,2) NOT NULL,
  UNIQUE KEY uq_remito_proveedor_comprobante (proveedor_id, punto_venta, numero_comprobante),
  FOREIGN KEY (proveedor_id) REFERENCES proveedores(id),
  FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
  FOREIGN KEY (sucursal_id) REFERENCES sucursales(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


CREATE TABLE detalle_remito_compra (
  id INT AUTO_INCREMENT PRIMARY KEY,
  remito_id INT NOT NULL,
  articulo_id INT NOT NULL,
  cantidad INT NOT NULL,
  detalle_compra_id INT,
  FOREIGN KEY (remito_id) REFERENCES remitos_compra(id),
  FOREIGN KEY (articulo_id) REFERENCES articulos(id),
  FOREIGN KEY (detalle_compra_id) REFERENCES detalle_compra(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


CREATE TABLE detalle_remito_compra_series (
  id INT AUTO_INCREMENT PRIMARY KEY,
  detalle_remito_id INT NOT NULL,
  nro_serie VARCHAR(100) NOT NULL,
  UNIQUE (detalle_remito_id, nro_serie),
  UNIQUE KEY unique_nro_serie_remito (nro_serie),
  FOREIGN KEY (detalle_remito_id) REFERENCES detalle_remito_compra(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


CREATE TABLE remito_factura_compra (
  id INT AUTO_INCREMENT PRIMARY KEY,
  compra_id INT NOT NULL,
  remito_id INT NOT NULL,
  FOREIGN KEY (compra_id) REFERENCES compras(id),
  FOREIGN KEY (remito_id) REFERENCES remitos_compra(id),
  UNIQUE(compra_id, remito_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE origenes_movimientos_stock (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL UNIQUE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO origenes_movimientos_stock (id, nombre) VALUES
(1, 'compra'),
(2, 'remito'),
(3, 'venta'),
(4, 'ajuste'),
(5, 'otro');

CREATE TABLE movimientos_stock (
  id INT AUTO_INCREMENT PRIMARY KEY,
  articulo_id INT NOT NULL,
  sucursal_id INT NOT NULL,
  cantidad INT NOT NULL,
  tipo ENUM('entrada','salida') NOT NULL,
  origen_id INT NOT NULL,
  origen_id_externo INT,
  fecha DATETIME DEFAULT CURRENT_TIMESTAMP,
  observaciones TEXT,
  FOREIGN KEY (articulo_id) REFERENCES articulos(id),
  FOREIGN KEY (sucursal_id) REFERENCES sucursales(id),
  FOREIGN KEY (origen_id) REFERENCES origenes_movimientos_stock(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE tipos_pago (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL UNIQUE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO tipos_pago (id, nombre) VALUES
(1, 'efectivo'),
(2, 'tarjeta'),
(3, 'transferencia'),
(4, 'cuenta corriente'),
(5, 'otro');

CREATE TABLE estados_afip (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL UNIQUE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO estados_afip (id, nombre) VALUES
(1, 'pendiente'),
(2, 'autorizado'),
(3, 'rechazado');

CREATE TABLE ventas (
  id INT AUTO_INCREMENT PRIMARY KEY,
  cliente_id INT,
  usuario_id INT NOT NULL,
  caja_id INT,
  total DECIMAL(10,2) NOT NULL,        
  total_iva DECIMAL(10,2) DEFAULT 0.00, 
  total_final DECIMAL(10,2) GENERATED ALWAYS AS (total + total_iva) STORED, 
  tipo_pago_id INT NOT NULL,
  observaciones TEXT,
  fecha DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (cliente_id) REFERENCES clientes(id),
  FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
  FOREIGN KEY (caja_id) REFERENCES cajas(id),
  FOREIGN KEY (tipo_pago_id) REFERENCES tipos_pago(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE comprobantes_electronicos (
  id                    INT AUTO_INCREMENT PRIMARY KEY,
  venta_id              INT NOT NULL,
  tipo_comprobante_id   INT NOT NULL,
  punto_venta           INT NOT NULL,
  numero_comprobante    INT NOT NULL,
  cae                   VARCHAR(50) NOT NULL,
  cae_vencimiento       DATE NOT NULL,
  afip_estado_id        INT NOT NULL DEFAULT 1,
  afip_response         TEXT,
  emitida_en            DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_ce_venta
    FOREIGN KEY (venta_id)
    REFERENCES ventas(id)
    ON DELETE CASCADE,
  CONSTRAINT fk_ce_tipo_comprobante
    FOREIGN KEY (tipo_comprobante_id)
    REFERENCES tipos_comprobante(id),
  CONSTRAINT fk_ce_estado_afip
    FOREIGN KEY (afip_estado_id)
    REFERENCES estados_afip(id),
  CONSTRAINT uq_comprobantes_tipo_punto_numero
    UNIQUE (tipo_comprobante_id, punto_venta, numero_comprobante),
  KEY idx_comprobantes_venta_id (venta_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE tipos_ajuste (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL UNIQUE
);

INSERT INTO tipos_ajuste (id, nombre) VALUES
(1, 'ninguno'),
(2, 'descuento'),
(3, 'recargo');

CREATE TABLE detalle_venta (
  id INT AUTO_INCREMENT PRIMARY KEY,
  venta_id INT NOT NULL,
  articulo_id INT NOT NULL,
  cantidad INT NOT NULL,

  precio_base DECIMAL(10,2) NOT NULL, 
  tipo_ajuste_id INT NOT NULL DEFAULT 1,
  porcentaje_ajuste DECIMAL(5,2) DEFAULT 0.00,

  precio_unitario DECIMAL(10,2) NOT NULL, 
  moneda_id INT NOT NULL,                
  tasa_cambio DECIMAL(10,4) DEFAULT NULL, 
  porcentaje_iva DECIMAL(5,2) NULL,
  monto_iva DECIMAL(10,2) NULL,

  subtotal DECIMAL(10,2) GENERATED ALWAYS AS (cantidad * precio_unitario) STORED,

  FOREIGN KEY (venta_id) REFERENCES ventas(id),
  FOREIGN KEY (articulo_id) REFERENCES articulos(id),
  FOREIGN KEY (moneda_id) REFERENCES monedas(id),
  FOREIGN KEY (tipo_ajuste_id) REFERENCES tipos_ajuste(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE detalle_venta_series (
  id INT AUTO_INCREMENT PRIMARY KEY,
  detalle_venta_id INT NOT NULL,
  nro_serie VARCHAR(100) NOT NULL,
  FOREIGN KEY (detalle_venta_id) REFERENCES detalle_venta(id),
  UNIQUE (detalle_venta_id, nro_serie)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE formas_pago (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL UNIQUE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO formas_pago (id, nombre) VALUES
(1, 'efectivo'),
(2, 'transferencia'),
(3, 'tarjeta'),
(4, 'cheque'),
(5, 'otro');

CREATE TABLE pagos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  cliente_id INT NOT NULL,
  caja_id INT,
  fecha DATETIME DEFAULT CURRENT_TIMESTAMP,
  monto DECIMAL(10,2) NOT NULL,
  forma_pago_id INT NOT NULL,
  observaciones TEXT,
  FOREIGN KEY (cliente_id) REFERENCES clientes(id),
  FOREIGN KEY (caja_id) REFERENCES cajas(id),
  FOREIGN KEY (forma_pago_id) REFERENCES formas_pago(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE tipos_movimiento_ctacte (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL UNIQUE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO tipos_movimiento_ctacte (id, nombre) VALUES
(1, 'venta'),
(2, 'pago'),
(3, 'ajuste');

CREATE TABLE cuentas_corrientes (
  id INT AUTO_INCREMENT PRIMARY KEY,
  cliente_id INT NOT NULL,
  venta_id INT,
  fecha DATETIME DEFAULT CURRENT_TIMESTAMP,
  tipo_movimiento_id INT NOT NULL,
  descripcion TEXT,
  monto DECIMAL(10,2) NOT NULL,
  saldo DECIMAL(10,2),
  FOREIGN KEY (cliente_id) REFERENCES clientes(id),
  FOREIGN KEY (venta_id) REFERENCES ventas(id),
  FOREIGN KEY (tipo_movimiento_id) REFERENCES tipos_movimiento_ctacte(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE acciones_log (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(20) NOT NULL UNIQUE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO acciones_log (id, nombre) VALUES
(1, 'INSERT'),
(2, 'UPDATE'),
(3, 'DELETE'),
(4, 'LOGIN'),
(5, 'LOGOUT');

CREATE TABLE logs (
  id INT AUTO_INCREMENT PRIMARY KEY,
  usuario_id INT,
  fecha DATETIME DEFAULT CURRENT_TIMESTAMP,
  tabla VARCHAR(100),
  accion_id INT NOT NULL,
  descripcion TEXT,
  registro_id INT,
  datos_anteriores TEXT,
  datos_nuevos TEXT,
  FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
  FOREIGN KEY (accion_id) REFERENCES acciones_log(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;