# MySQL Lab

Colección de prácticas de MySQL organizadas por tema, desde el diseño de esquemas
hasta la optimización de consultas con `EXPLAIN`. Material desarrollado durante la
asignatura de *Base de Datos* (ITLA), consolidado y corregido para que cada script
sea ejecutable de principio a fin en MySQL 8+.

## Contenido

| Módulo | Tema | Destacado |
|---|---|---|
| [01-fundamentos](01-fundamentos/) | Diseño de esquemas y DDL | Relaciones N:M con tablas intermedias (universidad, tienda, gestión académica) |
| [02-ejercicios](02-ejercicios/) | Ejercicios guiados (SQLya) | Creación de tablas, claves primarias, inserts y casos de error |
| [03-normalizacion](03-normalizacion/) | Normalización 1FN → 3FN | De una tabla "ancha" de ventas a un esquema normalizado con FKs |
| [04-consultas-avanzadas](04-consultas-avanzadas/) | SQL avanzado | Subconsultas, funciones de ventana, CTEs recursivas, operaciones de conjuntos, transacciones con ROLLBACK condicional |
| [05-optimizacion](05-optimizacion/) | Rendimiento | Antes/después con `EXPLAIN`: índices y predicados sargables (`BETWEEN` en vez de `YEAR()`) |

## Proyecto final relacionado

El proyecto final de la asignatura — el diseño completo de una **banca en línea**
(esquema, índices, consultas de negocio y documentación) — está en su propio
repositorio: [banca-online-sql](https://github.com/Criscarr26/banca-online-sql).

## Uso

Cada script es independiente y crea su propia base de datos:

```sql
-- En MySQL Workbench o el cliente mysql:
SOURCE 04-consultas-avanzadas/consultas-avanzadas.sql;
```

## Temas cubiertos

- DDL: tablas, claves primarias y foráneas, `AUTO_INCREMENT`, acciones en cascada
- Relaciones 1:N y N:M con tablas intermedias
- Normalización y eliminación de redundancia
- `JOIN`, agregaciones, `GROUP BY` / `HAVING`
- Subconsultas y CTEs (incluida una CTE recursiva)
- Funciones de ventana: `ROW_NUMBER`, `SUM() OVER`, `LAG`
- `UNION` y equivalentes de `INTERSECT` / `EXCEPT` con `EXISTS`
- Transacciones (`START TRANSACTION`, `COMMIT`, `ROLLBACK`), procedimientos y `LOCK TABLES`
- Índices y análisis de planes de ejecución con `EXPLAIN`

## Licencia

[MIT](LICENSE)
