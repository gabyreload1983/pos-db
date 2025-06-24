
-- Base de datos POS limpia y normalizada
CREATE DATABASE IF NOT EXISTS pos CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE pos;

-- Tabla de roles
CREATE TABLE roles (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL UNIQUE
);

-- Tabla de usuarios
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
);

-- Tabla de provincias
CREATE TABLE provincias (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL UNIQUE
);

-- Tabla de ciudades
CREATE TABLE ciudades (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  provincia_id INT NOT NULL,
  codigo_postal VARCHAR(10),
  FOREIGN KEY (provincia_id) REFERENCES provincias(id)
);

-- Tabla de sucursales
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
);

-- Tabla de clientes
CREATE TABLE clientes (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  apellido VARCHAR(100),
  razon_social VARCHAR(150),
  tipo_documento ENUM('DNI','CUIT','CUIL','Pasaporte') DEFAULT 'DNI',
  numero_documento VARCHAR(20),
  email VARCHAR(100),
  telefono VARCHAR(20),
  direccion VARCHAR(255),
  ciudad_id INT,
  provincia_id INT,
  pais VARCHAR(100) DEFAULT 'Argentina',
  condicion_iva ENUM('Responsable Inscripto','Monotributo','Consumidor Final','Exento') DEFAULT 'Consumidor Final',
  cuit VARCHAR(15),
  activo TINYINT(1) DEFAULT 1,
  creado_en DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (ciudad_id) REFERENCES ciudades(id),
  FOREIGN KEY (provincia_id) REFERENCES provincias(id)
);

-- Tabla de monedas
CREATE TABLE monedas (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL,
  simbolo VARCHAR(5) NOT NULL,
  codigo_iso VARCHAR(5) NOT NULL UNIQUE
);

-- Tabla de IVA
CREATE TABLE iva (
  id INT AUTO_INCREMENT PRIMARY KEY,
  descripcion VARCHAR(50) NOT NULL,
  porcentaje DECIMAL(5,2) NOT NULL
);

-- Tabla de marcas
CREATE TABLE marcas (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL UNIQUE
);

-- Tabla de categorias
CREATE TABLE categorias (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL UNIQUE
);

-- Tabla de proveedores
CREATE TABLE proveedores (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  razon_social VARCHAR(150),
  cuit VARCHAR(15),
  email VARCHAR(100),
  telefono VARCHAR(20),
  direccion VARCHAR(255),
  ciudad_id INT,
  provincia_id INT,
  condicion_iva ENUM('Responsable Inscripto','Monotributo','Consumidor Final','Exento'),
  activo TINYINT(1) DEFAULT 1,
  creado_en DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (ciudad_id) REFERENCES ciudades(id),
  FOREIGN KEY (provincia_id) REFERENCES provincias(id)
);

-- Tabla de articulos
CREATE TABLE articulos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  descripcion TEXT,
  costo DECIMAL(10,2) NOT NULL,
  iva_id INT NOT NULL,
  moneda_id INT NOT NULL,
  renta DECIMAL(5,2) DEFAULT 0.00,
  precio_venta DECIMAL(10,2),
  categoria_id INT,
  marca_id INT,
  proveedor_id INT,
  codigo_barra VARCHAR(50),
  unidad_medida VARCHAR(20),
  activo TINYINT(1) DEFAULT 1,
  creado_en DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (iva_id) REFERENCES iva(id),
  FOREIGN KEY (moneda_id) REFERENCES monedas(id),
  FOREIGN KEY (categoria_id) REFERENCES categorias(id),
  FOREIGN KEY (marca_id) REFERENCES marcas(id),
  FOREIGN KEY (proveedor_id) REFERENCES proveedores(id)
);


-- Tabla de stock
CREATE TABLE stock (
  id INT AUTO_INCREMENT PRIMARY KEY,
  articulo_id INT NOT NULL,
  sucursal_id INT NOT NULL,
  cantidad INT NOT NULL DEFAULT 0,
  UNIQUE KEY (articulo_id, sucursal_id),
  FOREIGN KEY (articulo_id) REFERENCES articulos(id),
  FOREIGN KEY (sucursal_id) REFERENCES sucursales(id)
);

-- Tabla de cajas
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
);

-- Tabla de arqueos
CREATE TABLE arqueos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  caja_id INT NOT NULL,
  efectivo_contado DECIMAL(10,2) NOT NULL,
  total_sistema DECIMAL(10,2) NOT NULL,
  diferencia DECIMAL(10,2) GENERATED ALWAYS AS (efectivo_contado - total_sistema) STORED,
  observaciones TEXT,
  fecha DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (caja_id) REFERENCES cajas(id)
);

-- Tabla de movimientos_caja
CREATE TABLE movimientos_caja (
  id INT AUTO_INCREMENT PRIMARY KEY,
  caja_id INT NOT NULL,
  tipo_movimiento ENUM('ingreso','egreso') NOT NULL,
  motivo ENUM('venta','pago proveedor','retiro','aporte','ajuste','otro') NOT NULL,
  descripcion TEXT,
  monto DECIMAL(10,2) NOT NULL,
  fecha DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (caja_id) REFERENCES cajas(id)
);

-- Tabla de ventas
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
);

-- Tabla detalle_venta
CREATE TABLE detalle_venta (
  id INT AUTO_INCREMENT PRIMARY KEY,
  venta_id INT NOT NULL,
  articulo_id INT NOT NULL,
  cantidad INT NOT NULL,
  precio_unitario DECIMAL(10,2) NOT NULL,
  subtotal DECIMAL(10,2) GENERATED ALWAYS AS (cantidad * precio_unitario) STORED,
  FOREIGN KEY (venta_id) REFERENCES ventas(id),
  FOREIGN KEY (articulo_id) REFERENCES articulos(id)
);

-- Tabla pagos
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
);

-- Tabla cuentas_corrientes
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
);

-- Tabla logs
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
);

