
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
INSERT INTO clientes (nombre, apellido, email, telefono, ciudad_id, provincia_id, condicion_iva_id)
VALUES 
('Cliente1', 'Apellido1', 'cliente1@mail.com', '342555001', 1, 20, 1),
('Cliente2', 'Apellido2', 'cliente2@mail.com', '342555002', 1, 20, 2),
('Cliente3', 'Apellido3', 'cliente3@mail.com', '342555003', 1, 20, 3),
('Cliente4', 'Apellido4', 'cliente4@mail.com', '342555004', 1, 20, 4),
('Cliente5', 'Apellido5', 'cliente5@mail.com', '342555005', 1, 20, 4),
('Cliente6', 'Apellido6', 'cliente6@mail.com', '342555006', 1, 20, 1),
('Cliente7', 'Apellido7', 'cliente7@mail.com', '342555007', 1, 20, 2),
('Cliente8', 'Apellido8', 'cliente8@mail.com', '342555008', 1, 20, 3),
('Cliente9', 'Apellido9', 'cliente9@mail.com', '342555009', 1, 20, 4),
('Cliente10', 'Apellido10', 'cliente10@mail.com', '3425550010', 1, 20, 4);


-- Proveedores de prueba
INSERT INTO proveedores (nombre, email, telefono, ciudad_id, provincia_id, condicion_iva_id)
VALUES 
('Proveedor1', 'proveedor1@mail.com', '342555101', 1, 20, 1),
('Proveedor2', 'proveedor2@mail.com', '342555102', 1, 20, 2),
('Proveedor3', 'proveedor3@mail.com', '342555103', 1, 20, 3),
('Proveedor4', 'proveedor4@mail.com', '342555104', 1, 20, 4),
('Proveedor5', 'proveedor5@mail.com', '342555105', 1, 20, 4);
-- Categorías
INSERT INTO categorias (nombre) VALUES ('Alimentos'), ('Bebidas'), ('Limpieza');

-- Marcas
INSERT INTO marcas (nombre) VALUES ('MarcaA'), ('MarcaB'), ('MarcaC');

-- Sucursal por defecto
INSERT INTO sucursales (nombre, direccion, ciudad_id, provincia_id, telefono, email)
VALUES ('Sucursal Central', 'Calle Principal 123', 1, 20, '3424441111', 'sucursal@mail.com');

