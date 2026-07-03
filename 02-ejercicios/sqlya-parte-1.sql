/*ejercicio 3 y 4 (los dos son lo mismo)*/
/*1*/ 
create database agenda;
/*drop table if exists agenda;*/
use agenda;
create table agenda(
   nombre varchar(20),
   domicilio varchar(30),
   telefono varchar(11)
);
insert into agenda (nombre, domicilio, telefono) values ('Alberto Mores','Colon 123','4234567');
insert into agenda (nombre, domicilio, telefono) values ('Juan Torres','Avellaneda 135','4458787');

/*show tables;*/
/*describe agenda;*/
select * from agenda; /*select nombre, domicilio, telefono from agenda;*/

/*primera parte del ejercicio 7*/
insert into agenda (nombre, domicilio, telefono) values ('Alberto Mores','Colon 123','4234567');
insert into agenda (nombre, domicilio, telefono) values ('Juan Torres','Avellaneda 135','4458787');
insert into agenda (nombre, domicilio, telefono) values ('Mariana Lopez','Urquiza 333','4545454');
insert into agenda (nombre, domicilio, telefono) values ('Fernando Lopez','Urquiza 333','4545454');

select nombre, domicilio, telefono from agenda where nombre = 'Juan Torres';
select nombre from agenda where domicilio = 'colon 123';
select nombre,domicilio from agenda where telefono = '4545454'; 
/*lo hago aqui para no tener que hacer otra tabla agenda*/

/*2*/
drop table if exists libros;
create database libros;
drop table if exists libros;
use libros;
create table libros(
titulo varchar(20),
autor varchar(30),
editorial varchar(15)
);

/*show tables;*/
/*describe libros;*/
insert into libros (titulo, autor, editorial) values('El aleph','Borges','Planeta');
insert into libros (titulo, autor, editorial) values ('Martin Fierro','Jose Hernandez','Emece');
insert into libros (titulo, autor, editorial) values ('Aprenda PHP','Mario Molina','Emece');

/*segunda parte del ejercicio 7(A)*/
insert into libros (titulo, autor, editorial) values('El aleph','Borges','Planeta');
insert into libros (titulo, autor, editorial) values ('Martin Fierro','Jose Hernandez','Emece');
insert into libros (titulo, autor, editorial) values ('Aprenda PHP','Mario Molina','Emece');
insert into libros (titulo, autor, editorial) values ('Cervantes','Borges','Paidos');

select titulo, editorial from libros where autor = 'Borges';
select titulo, autor from libros where editorial = 'Emece';
select autor, editorial from libros where titulo = 'Martin Fierro';
select * from libros;
/*lo hago aqui para no tener que crear otra tabla libros*/

/*ejercicio 5 y 6*/
/*1*/ /*en el 6 tambien esta la tabla de peliculas pero se le agrega lo que esta mas abajo, pero esta tabla es del 5 a excepcion de
lo que se especifica del 6 abajo*/
create database pelicula;
use pelicula;
create table peliculas(
  nombre varchar(20),
  actor varchar(20),
  duracion int,
  cantidad int
 );

describe peliculas;
insert into peliculas (nombre, actor, duracion, cantidad) values ('Mision imposible','Tom Cruise',120,3);
insert into peliculas (nombre, actor, duracion, cantidad) values ('Mision imposible 2','Tom Cruise',180,2);
insert into peliculas (nombre, actor, duracion, cantidad) values ('Mujer bonita','Julia R.',90,3);
insert into peliculas (nombre, actor, duracion, cantidad) values ('Elsa y Fred','China Zorrilla',90,2);

select * from peliculas;
/*me pide que haga esto en el 6*/
select titulo,actor from peliculas;
select nombre, duracion from peliculas;
select nombre, cantidad from peliculas;

/*2*/
/*A,  me pide que haga una tabla empleados en el 5, solo le agregue mas abajo lo que me especifica el 6*/
create database empleados;
use empleados;
create table empleados(
  nombre varchar(20),
  documento varchar(8),
  sexo varchar(1),
  domicilio varchar(30),
  sueldobasico float
 );

 describe empleados;
 insert into empleados (nombre, documento, sexo, domicilio, sueldobasico) values ('Juan Perez','22345678','m','Sarmiento 123',300);
 insert into empleados (nombre, documento, sexo, domicilio, sueldobasico) values ('Ana Acosta','24345678','f','Colon 134',500);
 insert into empleados (nombre, documento, sexo, domicilio, sueldobasico) values ('Marcos Torres','27345678','m','Urquiza 479',800);

/*Me pide que haga esto en el 6*/
select * from empleados;
select nombre, documento from empleados;
select nombre, documento, sueldobasico from empleados;
/*show tables;*/
  
  /*B*/ /*esta tabla es del 6*/
  drop table if exists articulos;
  create database articulos;
  use articulos;
  create table articulos(
  codigo_articulos int,
  nombre_articulos varchar(20),
  descripcion varchar(30),
  precio float
  );
  
describe articulos;
insert into articulos (codigo_articulos, nombre_articulos, descripcion, precio) values (1,'impresora','Epson Stylus C45',400.80);
insert into articulos (codigo_articulos, nombre_articulos, descripcion, precio) values (2,'impresora','Epson Stylus C85',500);
insert into articulos (codigo_articulos, nombre_articulos, descripcion, precio) values (3,'monitor','Samsung 14',800);

select * from articulos;
select codigo_articulos, descripcion, precio from articulos;

/*ejercicio 7(B)*/
insert into articulos (codigo_articulos, nombre_articulos, descripcion, precio)  values (1,'impresora','Epson Stylus C45',400.80);
insert into articulos (codigo_articulos, nombre_articulos, descripcion, precio)  values (2,'impresora','Epson Stylus C85',500);
insert into articulos (codigo_articulos, nombre_articulos, descripcion, precio)  values (3,'monitor','Samsung 14',800);
insert into articulos (codigo_articulos, nombre_articulos, descripcion, precio)  values (4,'teclado','ingles Biswal',100);
insert into articulos (codigo_articulos, nombre_articulos, descripcion, precio)  values (5,'teclado','español Biswal',90);

select codigo_articulos, descripcion, precio from articulos where nombre_articulos= 'impresora';
select codigo_articulos, descripcion, precio from articulos where nombre_articulos= 'teclado';
 /*lo hago aqui para no tener que crear otra tabla articulos*/
 
 /*Ejercicio 8*/ /* de aqui en adelante lo hare mas facil de enteder, pero como ya comence de la forma que lo habia hecho lo dejare asi
 aunque entiendo que se entiende lo suficiente*/
 create table articulos(
  codigo int,
  nombre varchar(20),
  descripcion varchar(30),
  precio float,
  cantidad int
 );
 
 describe articulos;
insert into articulos (codigo, nombre, descripcion, precio,cantidad) values (1,'impresora','Epson Stylus C45',400.80,20);
insert into articulos (codigo, nombre, descripcion, precio,cantidad) values (2,'impresora','Epson Stylus C85',500,30);
insert into articulos (codigo, nombre, descripcion, precio,cantidad) values (3,'monitor','Samsung 14',800,10);
insert into articulos (codigo, nombre, descripcion, precio,cantidad) values (4,'teclado','ingles Biswal',100,50);
insert into articulos (codigo, nombre, descripcion, precio,cantidad) values (5,'teclado','español Biswal',90,50);

select * from articulos;
select nombre from articulos;
select * from articulos where precio >=500;
select nombre, descripcion, precio, cantidad from articulos where cantidad <=20;
select nombre, descripcion from articulos where precio<>100;
  
/*ejercicio 8(A)*/
 create table peliculas(
  titulo varchar(20),
  actor varchar(20),
  duracion int,
  cantidad int
 );

describe peliculas;
insert into peliculas (titulo, actor, duracion, cantidad) values ('Mision imposible','Tom Cruise',120,3);
insert into peliculas (titulo, actor, duracion, cantidad) values ('Mision imposible 2','Tom Cruise',180,2);
insert into peliculas (titulo, actor, duracion, cantidad) values ('Mujer bonita','Julia R.',90,3);
insert into peliculas (titulo, actor, duracion, cantidad) values ('Elsa y Fred','China Zorrilla',90,2);
  
select *from peliculas where duracion<=90;
select * from peliculas where actor<>'Tom Cruise';
select * from peliculas where cantidad >2;

/* ejercicio 8(B)*/
drop table if exists agenda;
use agenda;
create table agenda(
nombre varchar (30),
apellido varchar (20), 
domicilio varchar (20),
telefono  varchar (11)
);

describe agenda;
insert into agenda (nombre, apellido, domicilio, telefono) values ('Alberto', 'Mores' ,'Colon 123', '4234567');
insert into agenda (nombre, apellido, domicilio, telefono) values ('Juan', 'Torres', 'Avellaneda 135', '4458787');
insert into agenda (nombre, apellido, domicilio, telefono) values ('Mariana', 'Lopez', 'Urquiza 333', '4545454');
insert into agenda (nombre, apellido, domicilio, telefono) values ('Fernando', 'Lopez', 'Urquiza 333', '4545454');
insert into agenda (nombre, apellido, domicilio, telefono) values ('Mariana', 'Suarez', 'Sarmiento 643', '4445544');
insert into agenda (nombre, apellido, domicilio, telefono) values ('Ana', 'Lopez', 'Sucre 309', '4252587');

select * from agenda;
select * from agenda where apellido = 'Lopez';
select * from agenda where nombre<>'Mariana';
select * from agenda where domicilio = 'Colon 123';
select * from agenda where telefono = '4545454';

/*ejercicio 9, me pide que use la tabla agenda y usare la que acabo de crear*/
select * from agenda;
insert into agenda (nombre, apellido, domicilio, telefono) values ('Alberto', 'Mores', 'Colon 123', '4234567');
insert into agenda (nombre, apellido, domicilio, telefono) values ('Juan', 'Torres', 'Avellaneda 135', '4458787');
insert into agenda (nombre, apellido, domicilio, telefono) values ('Mariana', 'Lopez', 'Urquiza 333', '4545454');
insert into agenda (nombre, apellido, domicilio, telefono) values ('Jose', 'Lopez', 'Urquiza 333', '4545454');
insert into agenda (nombre, apellido, domicilio, telefono) values ('Susana', 'Peralta', 'Gral. Paz 1234', '4123456');

set SQL_SAFE_UPDATES=0;
delete from agenda where nombre = 'juan';
delete from agenda where telefono ='4545454';
set SQL_SAFE_UPDATES=1;

/*ejercicio 9(A)*/
drop table if exists libros;
use libros;
create table libros(
titulo varchar (20),
autor varchar (30),
editorial varchar (15),
precio float
);

describe libros;
insert into libros (titulo, autor, editorial, precio) values ('El aleph', 'Borges', 'Planeta', '15.00');
insert into libros (titulo, autor, editorial, precio) values ('Martin Fierro', 'Jose Hernandez', 'Emece', '25.50');
insert into libros (titulo, autor, editorial, precio) values ('Aprenda PHP', 'Mario Molina', 'Emece', '26.80');
insert into libros (titulo, autor, editorial, precio) values ('don quijote', 'cervantes', 'Paidos', '45.50');
insert into libros (titulo, autor, editorial, precio) values ('Matematica estas ahi', 'Paenza', 'Paidos', '50.00');

select * from libros;
/*select * from libros where precio <40;*/
set SQL_SAFE_UPDATES=0;
delete from libros where autor ='Paenza';
delete from libros where precio <'20';
delete from libros where precio >='40';
set SQL_SAFE_UPDATES=1;    

delete from libros;

/* ejercio 10(A)/ /*me pide trabajar con una tabla libros identica a esta, por eso la uso*/
set SQL_SAFE_UPDATES=0;
update libros set autor= 'Adrian Paenza' where autor = 'Paenza';
update libros set precio='27.00' where autor= 'Mario Molina';
update libros set editorial='Emece S.A.' where editorial= 'Emece';
set SQL_SAFE_UPDATES=1;  


/*ejercicio 9(B)*/
drop table if exists articulos;
use articulos;
create table articulos(
  codigo int,
  nombre varchar(20),
  descripcion varchar(30),
  precio float,
  cantidad int
 );

describe articulos;
insert into articulos (codigo, nombre, descripcion, precio,cantidad) values (1,'impresora','Epson Stylus C45',400.80,20);
insert into articulos (codigo, nombre, descripcion, precio,cantidad) values (2,'impresora','Epson Stylus C85',500,30);
insert into articulos (codigo, nombre, descripcion, precio,cantidad) values (3,'monitor','Samsung 14',800,10);
insert into articulos (codigo, nombre, descripcion, precio,cantidad) values (4,'teclado','ingles Biswal',100,50);
insert into articulos (codigo, nombre, descripcion, precio,cantidad) values (5,'teclado','español Biswal',90,50);

select * from articulos;
set SQL_SAFE_UPDATES=0;
delete from articulos where precio >='500';
delete from articulos where nombre ='impresora';
delete from articulos where codigo <>'4';
set SQL_SAFE_UPDATES=1; 

/*ejercicio 10(B)*//*usare la tabla de articulos por que me pide usar una exactamente igual a esta*/
set SQL_SAFE_UPDATES=0;
update articulos set precio='400' where descripcion= 'Epson Stylus C45';
update articulos set precio='100' where nombre= 'teclado';
update articulos set cantidad= '50', precio= '550' where codigo= '2';
set SQL_SAFE_UPDATES=1;

/*ejercicio 10*/ /*me pide usar otra tabla "agenda" pero hare un nueva, en vez de usar una de las que ya estan creadas*/
drop table if exists agenda;
use agenda;
create table agenda(
  nombre varchar(30),
  apellido varchar(20),
  domicilio varchar(30),
  telefono varchar(11)
 );

describe agenda;
insert into agenda (nombre, apellido, domicilio, telefono) values ('Alberto', 'Mores', 'Colon 123', '4234567');
insert into agenda (nombre, apellido, domicilio, telefono) values ('Juan', 'Torres', 'Avellaneda 135', '4458787');
insert into agenda (nombre, apellido, domicilio, telefono) values ('Mariana', 'Lopez', 'Urquiza 333', '4545454');
insert into agenda (nombre, apellido, domicilio, telefono) values ('Jose', 'Lopez', 'Urquiza 333', '4545454');
insert into agenda (nombre, apellido, domicilio, telefono) values ('Susana', 'Peralta', 'Gral. Paz 1234', '4123456');

select * from agenda;
set SQL_SAFE_UPDATES=0;
update agenda set nombre='Juan Jose' where nombre='Juan';
update agenda set telefono='4445566' where telefono='4545454';
set SQL_SAFE_UPDATES=1; 

