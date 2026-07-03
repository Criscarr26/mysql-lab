/*
 * Normalización de una tabla de ventas (1FN -> 3FN).
 * Se parte de una tabla "ancha" que mezcla datos de cliente, producto,
 * empleado y sucursal en cada fila, y se normaliza separando cada
 * entidad en su propia tabla con claves foráneas.
 */

DROP DATABASE IF EXISTS ventas;
CREATE DATABASE ventas;
USE ventas;

/* Tabla original SIN normalizar: cada venta repite el nombre y la ciudad
   del cliente, el nombre y precio del producto y los datos de la sucursal.
   Eso produce redundancia y anomalías de actualización. */
CREATE TABLE ventas_original (
    ventas_id INT PRIMARY KEY,
    fecha DATE,
    cliente_id INT,
    nombre_cliente VARCHAR(100),
    ciudad_cliente VARCHAR(100),
    producto_id INT,
    nombre_producto VARCHAR(100),
    precio_unitario DECIMAL(10,2),
    cantidad INT,
    total_venta DECIMAL(10,2),
    empleado_id INT,
    ciudad_sucursal VARCHAR(100),
    metodo_pago VARCHAR(50),
    descuento DECIMAL(5,2)
);

/* ── Esquema normalizado ─────────────────────────────────────────── */

CREATE TABLE clientes (
    cliente_id INT PRIMARY KEY,
    nombre_cliente VARCHAR(100),
    ciudad VARCHAR(100)
);

CREATE TABLE productos (
    producto_id INT PRIMARY KEY,
    nombre_producto VARCHAR(100),
    precio_unitario DECIMAL(10,2)
);

CREATE TABLE sucursales (
    sucursal_id INT PRIMARY KEY,
    ciudad VARCHAR(100)
);

CREATE TABLE empleados (
    empleado_id INT PRIMARY KEY,
    nombre_empleado VARCHAR(100),
    sucursal_id INT,
    FOREIGN KEY (sucursal_id) REFERENCES sucursales(sucursal_id)
);

CREATE TABLE ventas (
    ventas_id INT PRIMARY KEY,
    fecha DATE,
    cliente_id INT,
    producto_id INT,
    cantidad INT,
    total_venta DECIMAL(10,2),
    empleado_id INT,
    metodo_pago VARCHAR(50),
    descuento DECIMAL(5,2),
    FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id),
    FOREIGN KEY (producto_id) REFERENCES productos(producto_id),
    FOREIGN KEY (empleado_id) REFERENCES empleados(empleado_id)
);

/* ── Datos de ejemplo ────────────────────────────────────────────── */

INSERT INTO clientes (cliente_id, nombre_cliente, ciudad) VALUES
(1, 'Juan Perez', 'Michigan'),
(2, 'Ana Lopez', 'Florida');

INSERT INTO productos (producto_id, nombre_producto, precio_unitario) VALUES
(1, 'Tomate', 20.00),
(2, 'Cebolla', 35.00);

INSERT INTO sucursales (sucursal_id, ciudad) VALUES
(1, 'Texas'),
(2, 'Los Angeles');

INSERT INTO empleados (empleado_id, nombre_empleado, sucursal_id) VALUES
(1, 'Carlos Ruiz', 1),
(2, 'Maria Gomez', 2);

INSERT INTO ventas (ventas_id, fecha, cliente_id, producto_id, cantidad,
                    total_venta, empleado_id, metodo_pago, descuento) VALUES
(1, '2024-10-01', 1, 1, 2, 40.00, 1, 'efectivo', 0),
(2, '2024-10-02', 2, 2, 1, 35.00, 2, 'tarjeta', 5);

/* ── Consulta: detalle de ventas reconstruido con JOINs ──────────── */

SELECT v.ventas_id,
       v.fecha,
       c.nombre_cliente,
       p.nombre_producto,
       v.cantidad,
       v.total_venta,
       e.nombre_empleado,
       s.ciudad AS ciudad_sucursal
FROM ventas v
JOIN clientes c    ON v.cliente_id = c.cliente_id
JOIN productos p   ON v.producto_id = p.producto_id
JOIN empleados e   ON v.empleado_id = e.empleado_id
JOIN sucursales s  ON e.sucursal_id = s.sucursal_id;
