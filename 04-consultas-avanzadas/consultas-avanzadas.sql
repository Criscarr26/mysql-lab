/*
 * Consultas avanzadas en MySQL 8+:
 * subconsultas, funciones de ventana, CTEs (incluida una recursiva),
 * operaciones de conjuntos, transacciones y bloqueo.
 * El script es ejecutable de principio a fin.
 */

DROP DATABASE IF EXISTS practicas_avanzadas;
CREATE DATABASE practicas_avanzadas;
USE practicas_avanzadas;

/* ── Datos base ──────────────────────────────────────────────────── */

CREATE TABLE Clientes (
    id_cliente INT PRIMARY KEY,
    nombre VARCHAR(100),
    email VARCHAR(100)
);

INSERT INTO Clientes VALUES
(1, 'Juan Perez', 'juan.perez@example.com'),
(2, 'Maria Lopez', 'maria.lopez@example.com'),
(3, 'Carlos Sanchez', 'carlos.sanchez@example.com');

CREATE TABLE Pedidos (
    id_pedido INT PRIMARY KEY,
    id_cliente INT,
    fecha_pedido DATE,
    total DECIMAL(10,2),
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);

INSERT INTO Pedidos VALUES
(1, 1, '2023-01-01', 150.00),
(2, 2, '2023-02-01', 300.00),
(3, 1, '2023-03-01', 700.00),
(4, 3, '2023-04-01', 500.00);

CREATE TABLE Productos (
    id_producto INT PRIMARY KEY,
    nombre_producto VARCHAR(100)
);

INSERT INTO Productos VALUES
(1, 'Teclado'), (2, 'Mouse'), (3, 'Monitor');

CREATE TABLE DetallePedidos (
    id_detalle INT PRIMARY KEY,
    id_pedido INT,
    id_producto INT,
    cantidad INT,
    FOREIGN KEY (id_pedido) REFERENCES Pedidos(id_pedido),
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)
);

INSERT INTO DetallePedidos VALUES
(1, 1, 1, 4), (2, 1, 2, 8), (3, 2, 2, 6), (4, 3, 3, 12), (5, 4, 1, 7);

/* ── 1. Subconsultas ─────────────────────────────────────────────── */

-- 1.1 Clientes que han realizado pedidos con un total mayor a 500
SELECT nombre FROM Clientes
WHERE id_cliente IN (SELECT id_cliente FROM Pedidos WHERE total > 500);

-- 1.2 Productos que han sido pedidos mas de 10 veces
SELECT p.nombre_producto
FROM Productos p
JOIN DetallePedidos dp ON p.id_producto = dp.id_producto
GROUP BY p.id_producto, p.nombre_producto
HAVING SUM(dp.cantidad) > 10;

-- 1.3 Clientes junto con el total de sus pedidos
SELECT c.nombre, SUM(p.total) AS total_pedidos
FROM Clientes c
JOIN Pedidos p ON c.id_cliente = p.id_cliente
GROUP BY c.id_cliente, c.nombre;

/* ── 2. Funciones de ventana ─────────────────────────────────────── */

-- 2.1 Numero de fila a cada pedido ordenado por fecha
SELECT id_pedido, id_cliente, fecha_pedido, total,
       ROW_NUMBER() OVER (ORDER BY fecha_pedido) AS numero_fila
FROM Pedidos;

-- 2.2 Total acumulado (running total) de pedidos por cliente
SELECT id_pedido, id_cliente, fecha_pedido, total,
       SUM(total) OVER (PARTITION BY id_cliente ORDER BY fecha_pedido) AS total_acumulado
FROM Pedidos;

-- 2.3 Diferencia entre cada pedido y el anterior del mismo cliente
SELECT id_pedido, id_cliente, fecha_pedido, total,
       total - LAG(total) OVER (PARTITION BY id_cliente ORDER BY fecha_pedido) AS diferencia
FROM Pedidos;

/* ── 3. Expresiones de tabla comunes (CTE) ───────────────────────── */

-- 3.1 Total de pedidos por cliente con una CTE
WITH TotalPedidosPorCliente AS (
    SELECT id_cliente, SUM(total) AS total_pedidos
    FROM Pedidos
    GROUP BY id_cliente
)
SELECT c.nombre, t.total_pedidos
FROM Clientes c
JOIN TotalPedidosPorCliente t ON c.id_cliente = t.id_cliente;

-- 3.2 CTE recursiva: secuencia del 1 al 10
WITH RECURSIVE Secuencia AS (
    SELECT 1 AS numero
    UNION ALL
    SELECT numero + 1 FROM Secuencia WHERE numero < 10
)
SELECT numero FROM Secuencia;

-- 3.3 Productos vendidos mas de 5 veces con una CTE
WITH VentasPorProducto AS (
    SELECT id_producto, SUM(cantidad) AS total_vendido
    FROM DetallePedidos
    GROUP BY id_producto
)
SELECT p.nombre_producto, v.total_vendido
FROM Productos p
JOIN VentasPorProducto v ON p.id_producto = v.id_producto
WHERE v.total_vendido > 5;

/* ── 4. Operaciones de conjuntos ─────────────────────────────────── */

CREATE TABLE Proveedores (
    id_proveedor INT PRIMARY KEY,
    nombre VARCHAR(100)
);

INSERT INTO Proveedores VALUES
(1, 'Ana Martinez'), (2, 'Maria Lopez'), (3, 'Pedro Gomez');

-- 4.1 Personas que son clientes o proveedores (union)
SELECT nombre FROM Clientes
UNION
SELECT nombre FROM Proveedores;

-- 4.2 Personas que son clientes Y proveedores (interseccion via EXISTS;
--     MySQL 8.0.31+ tambien soporta INTERSECT)
SELECT nombre FROM Clientes c
WHERE EXISTS (SELECT 1 FROM Proveedores p WHERE p.nombre = c.nombre);

-- 4.3 Clientes que no son proveedores (diferencia)
SELECT nombre FROM Clientes c
WHERE NOT EXISTS (SELECT 1 FROM Proveedores p WHERE p.nombre = c.nombre);

/* ── 5. Transacciones y bloqueo ──────────────────────────────────── */

CREATE TABLE Cuentas (
    id_cuenta INT PRIMARY KEY,
    saldo DECIMAL(10,2)
);

INSERT INTO Cuentas VALUES (1, 1000.00), (2, 500.00), (3, 300.00);

-- 5.1 Transferencia atomica de 200 entre cuentas: las dos actualizaciones
--     se confirman juntas o no se confirma ninguna
START TRANSACTION;
UPDATE Cuentas SET saldo = saldo - 200 WHERE id_cuenta = 1;
UPDATE Cuentas SET saldo = saldo + 200 WHERE id_cuenta = 2;
COMMIT;

-- 5.2 Actualizacion de inventario que se revierte si la cantidad queda
--     negativa (ROLLBACK dentro de un procedimiento)
CREATE TABLE Inventario (
    id_producto INT PRIMARY KEY,
    cantidad INT
);

INSERT INTO Inventario VALUES (1, 10);

DELIMITER $$
CREATE PROCEDURE descontar_inventario(IN p_id INT, IN p_cantidad INT)
BEGIN
    START TRANSACTION;
    UPDATE Inventario SET cantidad = cantidad - p_cantidad
    WHERE id_producto = p_id;
    IF (SELECT cantidad FROM Inventario WHERE id_producto = p_id) < 0 THEN
        ROLLBACK;
    ELSE
        COMMIT;
    END IF;
END$$
DELIMITER ;

CALL descontar_inventario(1, 4);   -- quedan 6 -> COMMIT
CALL descontar_inventario(1, 50);  -- quedaria -44 -> ROLLBACK
SELECT * FROM Inventario;          -- cantidad = 6

-- 5.3 Bloqueo explicito de la tabla durante una serie de operaciones
LOCK TABLES Cuentas WRITE;
UPDATE Cuentas SET saldo = saldo - 100 WHERE id_cuenta = 1;
UPDATE Cuentas SET saldo = saldo + 100 WHERE id_cuenta = 2;
UNLOCK TABLES;
