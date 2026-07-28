# MySQL Lab

Collection of MySQL exercises organized by topic, from schema design to query
optimization with `EXPLAIN`. Material developed during the *Databases* course
(ITLA), consolidated and corrected so that each script runs end to end on MySQL 8+.

## Contents

| Module | Topic | Highlight |
|---|---|---|
| [01-fundamentos](01-fundamentos/) | Schema design and DDL | N:M relationships with junction tables (university, store, academic management) |
| [02-ejercicios](02-ejercicios/) | Guided exercises (SQLya) | Table creation, primary keys, inserts and error cases |
| [03-normalizacion](03-normalizacion/) | Normalization 1NF → 3NF | From a "wide" sales table to a normalized schema with FKs |
| [04-consultas-avanzadas](04-consultas-avanzadas/) | Advanced SQL | Subqueries, window functions, recursive CTEs, set operations, transactions with conditional ROLLBACK |
| [05-optimizacion](05-optimizacion/) | Performance | Before/after with `EXPLAIN`: indexes and sargable predicates (`BETWEEN` instead of `YEAR()`) |

## Related final project

The course's final project — the complete design of an **online bank** (schema,
indexes, business queries and documentation) — lives in its own repository:
[online-banking-sql](https://github.com/Criscarr26/online-banking-sql).

## Usage

Each script is self-contained and creates its own database:

```sql
-- In MySQL Workbench or the mysql client:
SOURCE 04-consultas-avanzadas/consultas-avanzadas.sql;
```

## Topics covered

- DDL: tables, primary and foreign keys, `AUTO_INCREMENT`, cascading actions
- 1:N and N:M relationships with junction tables
- Normalization and redundancy removal
- `JOIN`, aggregations, `GROUP BY` / `HAVING`
- Subqueries and CTEs (including a recursive CTE)
- Window functions: `ROW_NUMBER`, `SUM() OVER`, `LAG`
- `UNION` and `INTERSECT` / `EXCEPT` equivalents with `EXISTS`
- Transactions (`START TRANSACTION`, `COMMIT`, `ROLLBACK`), procedures and `LOCK TABLES`
- Indexes and execution-plan analysis with `EXPLAIN`

## License

[MIT](LICENSE)
