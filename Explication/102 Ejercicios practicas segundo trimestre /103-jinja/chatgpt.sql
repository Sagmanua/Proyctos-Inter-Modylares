-- =========================================
-- CREACIÓN DE TABLAS
-- =========================================

-- Tabla de categorías de patos
CREATE TABLE categorias (
    id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nombre_categoria VARCHAR(50) NOT NULL,
    descripcion TEXT
);

-- Tabla de productos (patos de goma)
CREATE TABLE productos (
    id_producto INT PRIMARY KEY AUTO_INCREMENT,
    nombre_producto VARCHAR(100) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10,2) NOT NULL,
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)
);

-- Tabla de clientes
CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nombre_cliente VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    telefono VARCHAR(20),
    direccion TEXT
);

-- Tabla de pedidos
CREATE TABLE pedidos (
    id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT,
    fecha_pedido DATE NOT NULL,
    estado VARCHAR(20) DEFAULT 'Pendiente',
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

-- Tabla de líneas de pedido
CREATE TABLE lineas_pedido (
    id_linea INT PRIMARY KEY AUTO_INCREMENT,
    id_pedido INT,
    id_producto INT,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

-- Tabla de stock
CREATE TABLE stock (
    id_stock INT PRIMARY KEY AUTO_INCREMENT,
    id_producto INT,
    cantidad_disponible INT NOT NULL,
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

-- =========================================
-- VISTAS PARA MOSTRAR INFORMACIÓN
-- =========================================

-- Vista de productos con su categoría
CREATE VIEW vista_productos AS
SELECT p.id_producto, p.nombre_producto, p.descripcion, p.precio, c.nombre_categoria
FROM productos p
LEFT JOIN categorias c ON p.id_categoria = c.id_categoria;

-- Vista de pedidos con información de cliente
CREATE VIEW vista_pedidos AS
SELECT o.id_pedido, o.fecha_pedido, o.estado, c.nombre_cliente, c.email
FROM pedidos o
LEFT JOIN clientes c ON o.id_cliente = c.id_cliente;

-- Vista de líneas de pedido con detalles de producto y pedido
CREATE VIEW vista_lineas_pedido AS
SELECT lp.id_linea, lp.id_pedido, lp.id_producto, lp.cantidad, lp.precio_unitario,
       p.nombre_producto, o.fecha_pedido, o.id_cliente
FROM lineas_pedido lp
LEFT JOIN productos p ON lp.id_producto = p.id_producto
LEFT JOIN pedidos o ON lp.id_pedido = o.id_pedido;

-- Vista de stock con información de producto
CREATE VIEW vista_stock AS
SELECT s.id_stock, p.nombre_producto, s.cantidad_disponible
FROM stock s
LEFT JOIN productos p ON s.id_producto = p.id_producto;

-- =========================================
-- INSERT DE DATOS DE EJEMPLO
-- =========================================

-- 1. Categorías
INSERT INTO categorias (nombre_categoria, descripcion) VALUES
('Patos clásicos', 'Patos de goma tradicionales de todos los colores'),
('Patos luminosos', 'Patos que brillan en la oscuridad'),
('Patos temáticos', 'Patos de goma con disfraces y temáticas especiales');

-- 2. Productos
INSERT INTO productos (nombre_producto, descripcion, precio, id_categoria) VALUES
('Pato amarillo', 'El clásico pato amarillo', 5.99, 1),
('Pato rosa', 'Pato rosa para niñas', 6.49, 1),
('Pato fluorescente', 'Brilla en la oscuridad', 7.99, 2),
('Pato pirata', 'Con parche y sombrero pirata', 8.49, 3),
('Pato unicornio', 'Con cuerno de unicornio', 9.99, 3);

-- 3. Clientes
INSERT INTO clientes (nombre_cliente, email, telefono, direccion) VALUES
('Ana Pérez', 'ana.perez@email.com', '555-1234', 'Calle Falsa 123'),
('Juan Gómez', 'juan.gomez@email.com', '555-5678', 'Avenida Siempre Viva 742'),
('Luis Martínez', 'luis.martinez@email.com', '555-9876', 'Plaza Mayor 1');

-- 4. Pedidos
INSERT INTO pedidos (id_cliente, fecha_pedido, estado) VALUES
(1, '2025-11-21', 'Pendiente'),
(2, '2025-11-20', 'Enviado'),
(3, '2025-11-19', 'Pendiente');

-- 5. Líneas de pedido
INSERT INTO lineas_pedido (id_pedido, id_producto, cantidad, precio_unitario) VALUES
(1, 1, 2, 5.99),
(1, 3, 1, 7.99),
(2, 2, 1, 6.49),
(2, 4, 3, 8.49),
(3, 5, 2, 9.99);

-- 6. Stock
INSERT INTO stock (id_producto, cantidad_disponible) VALUES
(1, 50),
(2, 30),
(3, 20),
(4, 15),
(5, 10);
