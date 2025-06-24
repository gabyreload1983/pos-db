
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

-- Datos iniciales para IVA
INSERT INTO iva (id, descripcion, porcentaje) VALUES
(1, 'Exento', 0.00),
(2, 'No Gravado', 0.00),
(3, 'IVA 10.5%', 10.50),
(4, 'IVA 21%', 21.00),
(5, 'IVA 27%', 27.00);

-- Datos iniciales para monedas
INSERT INTO monedas (id, nombre, simbolo, codigo_iso) VALUES
(1, 'Peso Argentino', '$', 'ARS'),
(2, 'Dólar Estadounidense', 'U$', 'USD'),
(3, 'Euro', '€', 'EUR');
