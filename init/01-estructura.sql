DROP DATABASE IF EXISTS pos;
CREATE DATABASE IF NOT EXISTS pos CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE pos;


CREATE TABLE roles (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL UNIQUE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
);

CREATE TABLE condiciones_iva (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL UNIQUE,
  activo TINYINT(1) DEFAULT 1
);

CREATE TABLE tipos_documento (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL UNIQUE,
  activo TINYINT(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE monedas (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL,
  simbolo VARCHAR(5) NOT NULL,
  codigo_iso VARCHAR(5) NOT NULL UNIQUE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE tipos_comprobante (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL UNIQUE, 
  descripcion TEXT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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

CREATE TABLE IF NOT EXISTS articulo_imagenes (
  id INT AUTO_INCREMENT PRIMARY KEY,
  articulo_id INT NOT NULL,
  url_imagen TEXT NOT NULL,
  orden INT DEFAULT 0,
  activo TINYINT(1) DEFAULT 1,
  creado_en DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (articulo_id) REFERENCES articulos(id)
);

CREATE TABLE numeros_serie (
  id INT AUTO_INCREMENT PRIMARY KEY,
  articulo_id INT NOT NULL,
  nro_serie VARCHAR(100) NOT NULL,
  sucursal_id INT NOT NULL,
  estado ENUM('disponible', 'vendido', 'devuelto') DEFAULT 'disponible',
  fecha_registro DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (articulo_id) REFERENCES articulos(id),
  FOREIGN KEY (sucursal_id) REFERENCES sucursales(id),
  UNIQUE (nro_serie, articulo_id)
);


CREATE TABLE cotizaciones_dolar (
  id INT AUTO_INCREMENT PRIMARY KEY,
  fecha DATE NOT NULL,
  valor DECIMAL(10,4) NOT NULL, 
  fuente VARCHAR(100),          
  activo TINYINT(1) DEFAULT 0,  
  UNIQUE KEY (fecha),
  INDEX (activo)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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

CREATE TABLE movimientos_caja (
  id INT AUTO_INCREMENT PRIMARY KEY,
  caja_id INT NOT NULL,
  tipo_movimiento ENUM('ingreso','egreso') NOT NULL,
  motivo ENUM('venta','pago proveedor','retiro','aporte','ajuste','otro') NOT NULL,
  descripcion TEXT,
  monto DECIMAL(10,2) NOT NULL,
  fecha DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (caja_id) REFERENCES cajas(id)
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

CREATE TABLE compras (
  id INT AUTO_INCREMENT PRIMARY KEY,
  proveedor_id INT NOT NULL,
  usuario_id INT NOT NULL,
  sucursal_id INT NOT NULL,
  tipo_comprobante_id INT NOT NULL,
  punto_venta INT,
  numero_comprobante INT,
  fecha DATETIME DEFAULT CURRENT_TIMESTAMP,
  total DECIMAL(10,2) NOT NULL,
  mueve_stock TINYINT(1) DEFAULT 1,
  estado_remito ENUM('sin remitir', 'parcial', 'completo') DEFAULT 'sin remitir',
  observaciones TEXT,
  FOREIGN KEY (proveedor_id) REFERENCES proveedores(id),
  FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
  FOREIGN KEY (sucursal_id) REFERENCES sucursales(id),
  FOREIGN KEY (tipo_comprobante_id) REFERENCES tipos_comprobante(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE detalle_compra (
  id INT AUTO_INCREMENT PRIMARY KEY,
  compra_id INT NOT NULL,
  articulo_id INT NOT NULL,
  cantidad INT NOT NULL,
  costo_unitario DECIMAL(10,2) NOT NULL,
  moneda_id INT NOT NULL,
  cotizacion_dolar DECIMAL(10,4) DEFAULT NULL,
  subtotal DECIMAL(10,2) GENERATED ALWAYS AS (cantidad * costo_unitario) STORED,
  FOREIGN KEY (compra_id) REFERENCES compras(id),
  FOREIGN KEY (articulo_id) REFERENCES articulos(id),
  FOREIGN KEY (moneda_id) REFERENCES monedas(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE detalle_compra_series (
  id INT AUTO_INCREMENT PRIMARY KEY,
  detalle_compra_id INT NOT NULL,
  nro_serie VARCHAR(100) NOT NULL,
  UNIQUE (detalle_compra_id, nro_serie),
  FOREIGN KEY (detalle_compra_id) REFERENCES detalle_compra(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


CREATE TABLE remitos_compra (
  id INT AUTO_INCREMENT PRIMARY KEY,
  proveedor_id INT,
  usuario_id INT NOT NULL,
  sucursal_id INT NOT NULL,
  fecha DATETIME DEFAULT CURRENT_TIMESTAMP,
  observaciones TEXT,
  total DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (proveedor_id) REFERENCES proveedores(id),
  FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
  FOREIGN KEY (sucursal_id) REFERENCES sucursales(id)
);


CREATE TABLE detalle_remito_compra (
  id INT AUTO_INCREMENT PRIMARY KEY,
  remito_id INT NOT NULL,
  articulo_id INT NOT NULL,
  cantidad INT NOT NULL,
  detalle_compra_id INT,
  FOREIGN KEY (remito_id) REFERENCES remitos_compra(id),
  FOREIGN KEY (articulo_id) REFERENCES articulos(id),
  FOREIGN KEY (detalle_compra_id) REFERENCES detalle_compra(id)
);


CREATE TABLE detalle_remito_series (
  id INT AUTO_INCREMENT PRIMARY KEY,
  detalle_remito_id INT NOT NULL,
  nro_serie VARCHAR(100) NOT NULL,
  FOREIGN KEY (detalle_remito_id) REFERENCES detalle_remito_compra(id),
  UNIQUE (detalle_remito_id, nro_serie)
);


CREATE TABLE remito_factura_compra (
  id INT AUTO_INCREMENT PRIMARY KEY,
  compra_id INT NOT NULL,
  remito_id INT NOT NULL,
  FOREIGN KEY (compra_id) REFERENCES compras(id),
  FOREIGN KEY (remito_id) REFERENCES remitos_compra(id),
  UNIQUE(compra_id, remito_id)
);


CREATE TABLE movimientos_stock (
  id INT AUTO_INCREMENT PRIMARY KEY,
  articulo_id INT NOT NULL,
  sucursal_id INT NOT NULL,
  cantidad INT NOT NULL,
  tipo ENUM('entrada', 'salida') NOT NULL,
  origen ENUM('compra', 'venta', 'ajuste', 'otro') NOT NULL,
  origen_id INT,
  fecha DATETIME DEFAULT CURRENT_TIMESTAMP,
  observaciones TEXT,
  FOREIGN KEY (articulo_id) REFERENCES articulos(id),
  FOREIGN KEY (sucursal_id) REFERENCES sucursales(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE ventas (
  id INT AUTO_INCREMENT PRIMARY KEY,
  cliente_id INT,
  usuario_id INT NOT NULL,
  caja_id INT,
  total DECIMAL(10,2) NOT NULL,
  tipo_pago ENUM('efectivo','tarjeta','transferencia','cuenta corriente','otro') NOT NULL,
  observaciones TEXT,
  fecha DATETIME DEFAULT CURRENT_TIMESTAMP,
  cae VARCHAR(20),
  vencimiento_cae DATE,
  tipo_comprobante INT,
  punto_venta INT,
  numero_comprobante INT,
  afip_estado ENUM('pendiente','autorizado','rechazado') DEFAULT 'pendiente',
  afip_response TEXT,
  FOREIGN KEY (cliente_id) REFERENCES clientes(id),
  FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
  FOREIGN KEY (caja_id) REFERENCES cajas(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE detalle_venta (
  id INT AUTO_INCREMENT PRIMARY KEY,
  venta_id INT NOT NULL,
  articulo_id INT NOT NULL,
  cantidad INT NOT NULL,

  precio_base DECIMAL(10,2) NOT NULL, 
  tipo_ajuste ENUM('ninguno','descuento','recargo') DEFAULT 'ninguno',
  porcentaje_ajuste DECIMAL(5,2) DEFAULT 0.00,

  precio_unitario DECIMAL(10,2) NOT NULL, 
  moneda_id INT NOT NULL,                
  cotizacion_dolar DECIMAL(10,4) DEFAULT NULL, 

  subtotal DECIMAL(10,2) GENERATED ALWAYS AS (cantidad * precio_unitario) STORED,

  FOREIGN KEY (venta_id) REFERENCES ventas(id),
  FOREIGN KEY (articulo_id) REFERENCES articulos(id),
  FOREIGN KEY (moneda_id) REFERENCES monedas(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE detalle_venta_series (
  id INT AUTO_INCREMENT PRIMARY KEY,
  detalle_venta_id INT NOT NULL,
  nro_serie VARCHAR(100) NOT NULL,
  FOREIGN KEY (detalle_venta_id) REFERENCES detalle_venta(id),
  UNIQUE (detalle_venta_id, nro_serie)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE pagos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  cliente_id INT NOT NULL,
  caja_id INT,
  fecha DATETIME DEFAULT CURRENT_TIMESTAMP,
  monto DECIMAL(10,2) NOT NULL,
  forma_pago ENUM('efectivo','transferencia','tarjeta','cheque','otro') NOT NULL,
  observaciones TEXT,
  FOREIGN KEY (cliente_id) REFERENCES clientes(id),
  FOREIGN KEY (caja_id) REFERENCES cajas(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE cuentas_corrientes (
  id INT AUTO_INCREMENT PRIMARY KEY,
  cliente_id INT NOT NULL,
  venta_id INT,
  fecha DATETIME DEFAULT CURRENT_TIMESTAMP,
  tipo_movimiento ENUM('venta','pago','ajuste') NOT NULL,
  descripcion TEXT,
  monto DECIMAL(10,2) NOT NULL,
  saldo DECIMAL(10,2),
  FOREIGN KEY (cliente_id) REFERENCES clientes(id),
  FOREIGN KEY (venta_id) REFERENCES ventas(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE logs (
  id INT AUTO_INCREMENT PRIMARY KEY,
  usuario_id INT,
  fecha DATETIME DEFAULT CURRENT_TIMESTAMP,
  tabla VARCHAR(100),
  accion ENUM('INSERT', 'UPDATE', 'DELETE', 'LOGIN', 'LOGOUT') NOT NULL,
  descripcion TEXT,
  registro_id INT,
  datos_anteriores TEXT,
  datos_nuevos TEXT,
  FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;