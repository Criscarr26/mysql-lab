/*ejercicio 11 al 20*/
use libros;
drop table if exists libros;
/*ejercicio 11*/
create table libros(
  codigo int,
  titulo varchar(20),
  autor varchar(30),
  editorial varchar(15),
  primary key(codigo)
 );
 
 describe libros;
 
 insert into libros (codigo, titulo, autor, editorial) values (1, 'El aleph', 'Borges', 'Planeta'),
 (2, 'Martin Fierro', 'Jose Hernandez', 'Emece'),
 (3, 'Aprenda PHP' ,'Mario Molina', 'Emece'),
 (4, 'Don quijote' ,'Borges', 'Paidos'),
 (5, 'Matematica estas ahi' ,'Paenza', 'Paidos');

select * from libros;
insert into libros (codigo , titulo, editorial) values (6, 'El alpeh', 'planeta');
insert into libros (codigo , titulo, editorial) values (1, 'El alpeh', 'planeta');

/*ejercicio 11 (A)*/
create database clientes;
use clientes;
drop table if exists clientes;
create table clientes(
  documento varchar(8),
  apellido varchar(20),
  nombre varchar(20),
  domicilio varchar(30),
  telefono varchar (11),
  primary key(documento)
 );
 
 describe clientes;
 insert into clientes (documento, nombre, apellido, domicilio, telefono) values('22345678','Marcos','Perez','Colon 123','4545454'),
 ('23222222','Ana','Garcia','Avellaneda 1345','4252652'), 
 ('20454545','Susana','Lopez','Urquiza 344','4522525'), 
 ('35454545','Susana','Lopez','Urquiza 344','4522525');
 select * from clientes;
 insert into clientes (documento, nombre, apellido) values ('12345678', 'Ana', 'Garcia');
 insert into clientes (documento, domicilio) values ('12345679', 'urquiza 344');
 insert into clientes (documento, nbombre, apellido) values ('23222222', 'Ana', 'Garcia');
 
 /*ejercicio 11 (B)*/
 create database alumnos;
 use alumnos;
 drop table if exists alumnos;
 create table alumnos(
  legajo varchar(4) not null,
  documento varchar(8) not null,
  apellido varchar(30),
  nombre varchar(30),
  domicilio varchar(30),
  primary key (legajo)
 );
 
 describe alumnos;
 insert into alumnos (legajo, documento, apellido, nombre, domicilio) values('A233','22345345','Perez','Mariana','Colon 234'),
('A567','23545345','Morales','Marcos','Avellaneda 348'),
('B654','24356345','Gonzalez','Analia','Caseros 444'),
('A642','20254125','Torres','Ramiro','Dinamarca 209'),
('B509','20445778','Miranda','Carmen','Uspallata 999'),
('C777','28111444','Figueroa','Natalia','Sarmiento 856');
 
select * from alumnos;
insert into alumnos (legajo, documento, apellido, nombre) values('C243', '23545345', 'Perez','Mariana'), ('B253','20254125', 'Perez','Mariana');
insert into alumnos (legajo, documento, apellido, nombre) values('A233','24356345', 'Perez','Mariana');

/*Ejercicio 12*/
create database medicamentos;
drop table if exists medicamentos;
use medicamentos;
create table medicamentos(
  codigo int auto_increment,
  nombre varchar(20),
  laboratorio varchar(20),
  precio float,
  cantidad int,
  primary key (codigo)
);

describe medicamentos;
insert into medicamentos (nombre, laboratorio, precio, cantidad)values('Sertal','Roche',5.2,100),
('Buscapina','Roche',4.10,200), ('Amoxidal 500','Bayer',15.60,100);
select codigo, nombre, laboratorio, precio, cantidad from medicamentos;
insert into medicamentos (codigo) values (1);
insert into medicamentos (codigo, nombre, laboratorio, precio, cantidad) values (12,'Paracetamol 500','Bago',1.90,200);
insert into medicamentos (nombre, laboratorio, precio, cantidad) values('Bayaspirina','Bayer',2.10,150); 

/*Ejercicio 13*/ /* me pide usar la misma table medicamentos por eso pongo el ejrcicio 13 aqui*/
describe medicamentos;
insert into medicamentos (nombre, laboratorio,precio,cantidad) values('Sertal','Roche',5.2,100),
('Buscapina','Roche',4.10,200),
('Amoxidal 500','Bayer',15.60,100);

SET SQL_SAFE_UPDATES = 0;
delete from medicamentos;
SET SQL_SAFE_UPDATES = 1;
insert into medicamentos (nombre, laboratorio,precio,cantidad) values('Sertal','Roche',5.2,100),
('Amoxidal 500','Bayer',15.60,100);

select * from medicamentos;

truncate table medicamentos;
insert into medicamentos (nombre, laboratorio,precio,cantidad)
values('Buscapina','Roche',4.10,200);
select * from medicamentos;

/*Ejercicio 14,me pide usar la tabla medicamentos tambien*/
insert into medicamentos (nombre,laboratorio,precio,cantidad) values('Sertal gotas','Roche',5.2,100),
('Sertal compuesto','Roche',7.1,150),
('Buscapina','Roche',null,200),
('Amoxidal 500','Bayer',15.60,0),
('Amoxidal jarabe','Bayer',25,120),
('Amoxinil',null,25,120),
('Bayaspirina','',0,150); 

select * from medicamentos;
select * from medicamentos where laboratorio is null;
select * from medicamentos where laboratorio='';
select * from medicamentos where precio is null;
select * from medicamentos where precio=0;
insert into medicamentos (nombre, laboratorio,precio,cantidad) values(null,'Bayer',10.20,100); 
insert into medicamentos (nombre, laboratorio,precio,cantidad) values('Benadryl comprimidos','Bayer',10.20,null); 
insert into medicamentos (codigo,nombre, laboratorio,precio,cantidad) values(null,'Benadryl comprimidos','Bayer',10.20,null);
select * from medicamentos where precio<>0; 
select * from medicamentos where precio is not null;
select * from medicamentos where laboratorio<>'';
select * from medicamentos where laboratorio is not null;

/*Ejercicio 12 (A)*/
create database videoclub;
use videoclub;
drop table if exists peliculas;
create table peliculas(
codigo int auto_increment,
titulo varchar (30),/*(50), este numero es para la tabla del ejercicio 13*/
actor varchar (20),/*(40), este numero es para la tabla del ejercicio 13*/
duracion int,
primary key (codigo)
);

describe peliculas;
insert into peliculas (titulo,actor,duracion) values('Top Gun','Tom cruise',120),
('Harry Potter','xxx',180),
('speed racer','xxx',190),
('Mision imposible 2','Tom Cruise',120),
('La vida es bella','zzz',220);

select * from peliculas;
update peliculas set actor = 'Daniel R.' where codigo = 3;
SET SQL_SAFE_UPDATES = 0;
delete from peliculas where titulo = 'La vida es bella';
delete from peliculas where duracion = 120;
SET SQL_SAFE_UPDATES = 1;
select * from peliculas;
insert into peliculas (titulo, actor, duracion) values ('Mujer bonita', 'Richard Gere', 120);
insert into peliculas (codigo, titulo, actor, duracion) values (1, 'Tootsie', 'D. Hoffman', 90);
insert into peliculas (codigo, titulo, actor, duracion) values (1, 'Otra película', 'Otro Actor', 100);
insert into peliculas (titulo, actor, duracion) values ('Un oso rojo', 'Julio Chavez', 100);

/*me pide usar una tabla peliculas, asi que usare esta misma*/
insert into peliculas (titulo,actor,duracion) values('Mision imposible','Tom Cruise',120),
('Harry Potter y la piedra filosofal','xxx',180),
('Harry Potter y la camara secreta','xxx',190),
('Mision imposible 2','Tom Cruise',120),
('La vida es bella','zzz',220);

select * from peliculas;
SET SQL_SAFE_UPDATES = 0;
delete from peliculas;
SET SQL_SAFE_UPDATES = 1;
insert into peliculas (titulo,actor,duracion) values('Mujer bonita','Richard Gere',120);
select *from peliculas;
truncate table peliculas;
insert into peliculas (titulo,actor,duracion) values('Elsa y Fred','China Zorrilla',90);
select * from peliculas;

/*Ejercicio 14, pide usar la tabla pelicula*/
truncate table peliculas;
insert into peliculas (titulo,actor,duracion) values('Mision imposible','Tom Cruise',120),
('Harry Potter 1','Daniel R.',180),
('Harry Potter 3','Daniel R.',190),
('Mision imposible 2','Tom Cruise',150),
('Titanic','L. Di Caprio',220),
('Mujer bonita','R. Gere-J. Roberts',200);

select * from peliculas;
insert into peliculas (codigo,titulo,actor,duracion) values(null,'Elsa y Fred','China Zorrilla',90);
insert into peliculas (titulo,actor,duracion) values(null,'China Zorrilla',90);
insert into peliculas (titulo,actor,duracion) values('Mr. Johns',null,null);
insert into peliculas (codigo,titulo,actor,duracion) values(0,'','',0);
SET SQL_SAFE_UPDATES = 0;
update peliculas set duracion=120 where duracion is null;
update peliculas set actor='Desconocido' where actor is null;
update peliculas set actor='Desconocido' where actor='';
delete from peliculas where titulo='';
SET SQL_SAFE_UPDATES = 1;

/*Ejercicio 15*/
drop table if exists peliculas;
use videoclub;
create table peliculas(
  codigo integer unsigned auto_increment,
  titulo varchar(40) not null,
  actor varchar(20),
  duracion integer unsigned,
  primary key(codigo)
 );

describe peliculas;

create database stand;
use stand;
create table visitantes(
nombre varchar (30) not null,
edad int unsigned not null,
sexo enum ( 'f' , 'm') not null,
domicilio varchar (30),
ciudad varchar (30),
teléfono varchar (11),
monto_compra decimal (10,2) unsigned not null
);

describe visitantes;

/*El ejercicio 16 es solo informacion*/
/*Ejercicio 17*/
create database concesionario;
drop table if exists concesionario;
use concesionario;
create table autos(
  patente char(6),
  marca varchar(20),
  modelo char(4),
  precio float unsigned,
  primary key(patente)
 );
 
insert into autos (patente,marca,modelo,precio) values('ACD123','Fiat 128','1970',15000),
('ACG234','Renault 11','1990',40000),
('BCD333','Peugeot 505','1990',80000),
('GCD123','Renault Clio','1990',70000),
('BCC333','Renault Megane','1998',95000),
('BVF543','Fiat 128','1975',20000);

select * from autos where modelo='1990';
select * from autos where precio>50000;


drop table if exists clientes;
use clientes;
 create table clientes(
  documento char(8),
  apellido varchar(20),
  nombre varchar(20),
  domicilio varchar(30),
  telefono varchar (11),
  primary key(documento)
 );

truncate table clientes;
insert into clientes (documento,apellido,nombre,domicilio,telefono) values('2233344','Perez','Juan','Sarmiento 980','4342345'),
('2333344','Perez','Ana','Colon 234','4569877'),
('2433344','Garcia','Luis','Avellaneda 1454','4558877'),
('2533344','Juarez','Ana','Urquiza 444','4789900');

select * from clientes where apellido = 'perez';
select apellido, domicilio, telefono from clientes where nombre = 'Ana' 

/*Ejercicio 18*/;
create database comercio;
use comercio;
create table pedidos (
    numero_pedido int unsigned auto_increment primary key, 
    nombre enum('pizza', 'empanada') not null, 
    tipo varchar(30) not null,
    precio decimal(5, 2) unsigned not null check (precio > 0 and precio <= 99.99), 
    cantidad int unsigned not null check  (cantidad > 0 and cantidad < 200), 
    domicilio_cliente varchar (100)not null
);

/*Ejercicio 18 (A)*/
create database meteorologia;
create table estadisticas (
    ciudad varchar(50) not null, 
    pais varchar(50) not null,
    temp_max int check (temp_max between -20 and 40), 
    temp_min int check (temp_min between -20 and 40), 
    precipitaciones_anuales int check (precipitaciones_anuales between 0 and 2000) 
);

/*Ejercicio 18 (B)*/
create table gases (
    gas varchar(50) not null, 
    temp_critica decimal(6, 2) not null check (temp_critica between -300 and 400), 
    presion_critica decimal(6, 2) unsigned not null check (presion_critica <= 300) 
);

/*Ejercicio 18 (C)*/
create table cuentas (
    numero_cuenta int unsigned not null primary key, 
    documento char(8) not null, 
    nombre varchar(100) not null, 
    saldo decimal(15, 2) not null 
);

/*Ejercicio 19*/
drop table if exists autos;
use concesionario;
create table autos(
  marca varchar(15),
  modelo year,
  dueño varchar(30),
  precio decimal (8,2) unsigned  
 );

describe autos;
 insert into autos values('Fiat 128','1970','Juan Lopez',50000);
 insert into autos values('Renault 11','1990','Juan Lopez',80000);
 insert into autos values('Fiat 128','1971','Ana Ferreyra',51000);
 insert into autos values('Peugeot 505','1998','Luis Luque',99000);
 insert into autos values('Peugeot 505','1997','Carola Perez',85000);
 
 select * from autos where modelo<1995;
 select marca,modelo from autos where modelo<>1970;
 insert into autos values('Peugeot 505',1995,'Carlos Lopez',88000);

/*Ejercicio 19 (A)*/
use empleados;
drop table if exists empleados;
 create table empleados(
  nombre varchar(20),
  documento char(8),
  sexo char(1),
  domicilio varchar(30),
  fechaingreso date
 );

 insert into empleados values('Juan Perez','22333444','m','Colon 123','1990-10-08'),
('Ana Acosta','23333444','f','Caseros 987','1995-12-18'),
('Lucas Duarte','25333444','m','Sucre 235','2005-05-15'),
('Pamela Gonzalez','26333444','f','Sarmiento 873','1999-02-12'),
('Marcos Juarez','30333444','m','Rivadavia 801','2002-09-22');

select nombre,fechaingreso from empleados where sexo='m';
SET SQL_SAFE_UPDATES = 0;
update empleados set fechaingreso='1990-10-18' where documento='22333444';
SET SQL_SAFE_UPDATES = 1;
insert into empleados values('Susana Duarte','30123456','f','Sucre 1234','99-02-12');
insert into empleados values('Daniel Herrero','30000001','m',null,'1980-2-03');
insert into empleados values('Ana Juarez','31123123','f',null,'19900306');
insert into empleados values('Juan Mores','32222333','m',null,'1990-03-06 10:15');
insert into empleados values('Hector Perez','34444555','m',null,'1990036');

/*Ejercicio 20*/
use videoclub;
drop table if exists peliculas;
truncate peliculas;
insert into peliculas (titulo,actor,duracion) values('Mision imposible','Tom Cruise',120);
insert into peliculas (titulo, codigo,duracion) values('Harry Potter 1', 6,90);
insert into peliculas (titulo,actor) values ('Harry Potter y la piedra filosofal','Daniel R.');
insert into peliculas (titulo,actor,duracion) values ('Harry Potter y la piedra filosofal','Daniel R.',120);

use empleados;
drop table if exists empleados;
 create table empleados(
  nombre varchar(20),
  documento char(8) not null,
  sexo char(1),
  domicilio varchar(30),
  fechaingreso date not null,
  fechanacimiento date,
  sueldo decimal(5,2) unsigned not null
 );

truncate empleados;
insert into empleados (nombre,documento,sexo) values('Marcela Medina','22333444','f');
insert into empleados (domicilio,fechaingreso) values('Avellaneda 200','2005-08-16');
insert into empleados (fechanacimiento,sueldo) values('1970-09-26',500.90);

select * from empleados;
SET sql_mode = '';





