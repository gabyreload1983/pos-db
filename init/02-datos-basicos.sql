
-- Datos iniciales para provincias (Argentina)
INSERT INTO provincias (id, nombre) VALUES
(1, 'Buenos Aires'),
(2, 'Catamarca'),
(3, 'Chaco'),
(4, 'Chubut'),
(5, 'Córdoba'),
(6, 'Corrientes'),
(7, 'Entre Ríos'),
(8, 'Formosa'),
(9, 'Jujuy'),
(10, 'La Pampa'),
(11, 'La Rioja'),
(12, 'Mendoza'),
(13, 'Misiones'),
(14, 'Neuquén'),
(15, 'Río Negro'),
(16, 'Salta'),
(17, 'San Juan'),
(18, 'San Luis'),
(19, 'Santa Cruz'),
(20, 'Santa Fe'),
(21, 'Santiago del Estero'),
(22, 'Tierra del Fuego'),
(23, 'Tucumán');

-- Ciudades comunes de Santa Fe
INSERT INTO ciudades (id, nombre, provincia_id, codigo_postal) VALUES
(1, 'Santa Fe', 20, '3000'),
(2, 'Rosario', 20, '2000'),
(3, 'Rafaela', 20, '2300'),
(4, 'Venado Tuerto', 20, '2600'),
(5, 'Reconquista', 20, '3560'),
(6, 'Villa Gobernador Gálvez', 20, '2124'),
(7, 'Esperanza', 20, '3080'),
(8, 'San Lorenzo', 20, '2200'),
(9, 'Santo Tomé', 20, '3016'),
(10, 'Cañada de Gómez', 20, '2500');


-- Datos iniciales para roles
INSERT INTO roles (id, nombre) VALUES
(1, 'Administrador'),
(2, 'Cajero'),
(3, 'Vendedor');

-- Datos iniciales para IVA Articulos
INSERT INTO iva_aliquotas (descripcion, porcentaje) VALUES
  ('IVA 10.5%', 10.50),
  ('IVA 21%', 21.00),
  ('IVA 27%', 27.00);

-- Datos iniciales para IVA Clinetes - Proveedores
INSERT INTO condiciones_iva (nombre) VALUES
  ('Consumidor Final'),
  ('Responsable Inscripto'),
  ('Monotributo'),
  ('Exento');

INSERT INTO tipos_documento (nombre) VALUES
('DNI'), ('CUIT'), ('CUIL'), ('PASAPORTE');


-- Datos iniciales para monedas
INSERT INTO monedas (id, nombre, simbolo, codigo_iso) VALUES
(1, 'Peso Argentino', '$', 'ARS'),
(2, 'Dólar Estadounidense', 'U$', 'USD'),
(3, 'Euro', '€', 'EUR');


-- Usuarios de prueba
INSERT INTO usuarios (nombre, email, password, rol_id) VALUES
('Administrador', 'admin@pos.com', '$2b$10$iKmyx/cuss.tdXRVVwJsx.RcVCXOkFRbb0B69ahw.Os4Len.UqVGO', 1),
('Cajero', 'cajero@pos.com', '$2b$10$iKmyx/cuss.tdXRVVwJsx.RcVCXOkFRbb0B69ahw.Os4Len.UqVGO', 2),
('Vendedor', 'vendedor@pos.com', '$2b$10$iKmyx/cuss.tdXRVVwJsx.RcVCXOkFRbb0B69ahw.Os4Len.UqVGO', 3);


-- Clientes de prueba
INSERT INTO clientes (
  nombre, apellido, razon_social, tipo_documento_id, documento,
  email, telefono, direccion, ciudad_id, provincia_id, condicion_iva_id
)
VALUES
-- Consumidor Final (solo nombre y apellido, sin razon social ni documento obligatorio)
('Ana', 'Pérez', NULL, NULL, NULL, 'ana.perez@mail.com', '342555001', 'Av. Siempreviva 123', 1, 20, 1),

-- Responsable Inscripto (requiere CUIT, razon social, tipo_documento_id = CUIT)
(NULL, NULL, 'Empresa SRL', 2, '30123456789', 'empresa@mail.com', '342555002', 'San Martín 456', 2, 20, 2),

-- Monotributo
(NULL, NULL, 'Comercio Uno', 2, '20987654321', 'monotributo@mail.com', '342555003', 'Belgrano 789', 3, 20, 3),

-- Exento
(NULL, NULL, 'Fundación Libre', 2, '33111122223', 'exento@mail.com', '342555004', 'Urquiza 147', 4, 20, 4),

-- Otro Consumidor Final
('Carlos', 'Gómez', NULL, 1, '12345678', 'carlos@mail.com', '342555005', 'Alem 456', 5, 20, 1),

-- Otro Responsable Inscripto
(NULL, NULL, 'Servicios SRL', 2, '30876543210', 'servicios@mail.com', '342555006', 'Rivadavia 321', 6, 20, 2),

-- Otro Monotributo
(NULL, NULL, 'Monotributista SA', 2, '20102030405', 'mono2@mail.com', '342555007', 'Sarmiento 900', 7, 20, 3),

-- Otro Exento
(NULL, NULL, 'ONG Verde', 2, '33555566667', 'ongverde@mail.com', '342555008', 'Mitre 2020', 8, 20, 4);



-- Proveedores de prueba
INSERT INTO proveedores (
  nombre, razon_social, cuit, email, telefono, direccion,
  ciudad_id, provincia_id, condicion_iva_id
)
VALUES
-- Consumidor Final (puede no tener CUIT)
('Proveedor CF', 'Proveedor Consumidor Final', NULL, 'provcf@mail.com', '342555101', '9 de Julio 100', 1, 20, 1),

-- Responsable Inscripto
('Proveedor RI', 'Proveedor Responsable Inscripto', '30123456789', 'provri@mail.com', '342555102', '25 de Mayo 200', 2, 20, 2),

-- Monotributo
('Proveedor Mono', 'Proveedor Monotributista', '20987654321', 'provmono@mail.com', '342555103', 'Belgrano 300', 3, 20, 3),

-- Exento
('Proveedor Exento', 'Proveedor Exento SA', '33111122223', 'provexento@mail.com', '342555104', 'Urquiza 400', 4, 20, 4),

-- Otro Responsable Inscripto
('Proveedor SRL', 'Proveedor Servicios SRL', '30876543210', 'provsrl@mail.com', '342555105', 'Rivadavia 500', 5, 20, 2);


-- Categorías
INSERT INTO categorias (nombre) VALUES ('Categoria1'), ('Categoria2'), ('Categoria3');

-- Marcas
INSERT INTO marcas (nombre) VALUES ('MarcaA'), ('MarcaB'), ('MarcaC');

-- Sucursal por defecto
INSERT INTO sucursales (nombre, direccion, ciudad_id, provincia_id, telefono, email)
VALUES ('Sucursal Central', 'Calle Principal 123', 1, 20, '3424441111', 'sucursal@mail.com');

INSERT INTO articulos (
  nombre, costo, iva_aliquota_id, moneda_id, renta, precio_venta, categoria_id,
  marca_id, proveedor_id, codigo_barra, unidad_medida, controla_stock, tiene_nro_serie
)
VALUES 
('Articulo1', 342.91, 2, 1, 35.00, 900.84, 1, 1, 1, '100000000001', 'unidad', 1, 1),
('Articulo2', 129.08, 2, 1, 40.00, 737.49, 1, 1, 1, '100000000002', 'unidad', 1, 1),
('Articulo3', 315.46, 2, 1, 30.00, 674.77, 1, 1, 1, '100000000003', 'unidad', 1, 0),
('Articulo4', 129.59, 2, 1, 45.00, 798.42, 1, 1, 1, '100000000004', 'unidad', 1, 0),
('Articulo5', 210.65, 2, 1, 38.00, 715.99, 1, 1, 1, '100000000005', 'unidad', 1, 0),
('Articulo6', 494.67, 2, 1, 25.00, 746.28, 1, 1, 1, '100000000006', 'unidad', 1, 0),
('Articulo7', 424.00, 2, 1, 40.00, 998.98, 1, 1, 1, '100000000007', 'unidad', 1, 0),
('Articulo8', 328.45, 2, 1, 37.00, 813.20, 1, 1, 1, '100000000008', 'unidad', 1, 0),
('Articulo9', 258.12, 2, 1, 36.00, 610.26, 1, 1, 1, '100000000009', 'unidad', 1, 0),
('Articulo10', 399.04, 2, 1, 35.00, 777.27, 1, 1, 1, '100000000010', 'unidad', 1, 0);

INSERT INTO articulos (
  nombre, costo, iva_aliquota_id, moneda_id, renta, precio_venta, categoria_id,
  marca_id, proveedor_id, codigo_barra, unidad_medida, controla_stock, tiene_nro_serie
)
VALUES 
('ArticuloUSD1', 10.00, 2, 2, 40.00, 25.00, 1, 1, 1, '200000000001', 'unidad', 1, 1),
('ArticuloUSD2', 15.00, 2, 2, 50.00, 40.00, 1, 1, 1, '200000000002', 'unidad', 1, 0),
('ArticuloUSD3', 20.00, 2, 2, 30.00, 50.00, 1, 1, 1, '200000000003', 'unidad', 1, 0);
