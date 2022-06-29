-- TAREA DEL TEMA 4.

-- 1. Escriba la sentencia que permita acceder al servidor MySQL.
mariabd -u root -p
password: root

-- 2. Mostrar lista de base de datos (comando muestra la lista de base de datos existentes en MySQL).
show databases;
+--------------------+
| Database           |
+--------------------+
| bdbiblioteca       |
| bdcargo22          |
| bdestudiante       |
| information_schema |
| mysql              |
| performance_schema |
+--------------------+

-- 3. Crear y activar la Base de datos bdcompra.
create database bdcompra;
use bdcompra;

-- 4. Crear las siguientes tablas, aplicar la especificación de cada tabla, campos, claves primarias y foráneas si
-- lo requiere la tabla y el motor de almacenamiento INNODB.
-- Aplicar conocimientos vistos en clase.
create table producto(
	codprod int(3) NOT NULL PRIMARY KEY,
	nomprod varchar(30) NOT NULL,
	precioprod float NOT NULL,
	descripprod varchar(100),
	existencia int(3) NOT NULL
)ENGINE=InnoDB;

create table cliente(
	codcliente int(3) NOT NULL PRIMARY KEY,
	nomcliente varchar(30) NOT NULL,
	apecliente varchar(30) NOT NULL,
	fechanacli date NOT NULL,
	sexo char NOT NULL,
	ciudad varchar(30) NOT NULL
)ENGINE=InnoDB;

create table compra(
	codprod int(3) NOT NULL,
	codcliente int(3) NOT NULL,
	fecha date NOT NULL,
	FOREIGN KEY (codprod) references producto(codprod),
	FOREIGN KEY (codcliente) references cliente(codcliente)
)ENGINE=InnoDB;

create table tabla1(
	codigo int(3) NOT NULL PRIMARY KEY,
	nombre varchar(30) NOT NULL,
	descripcion varchar(50)
)ENGINE=InnoDB;

-- 5. Modifique la estructura de la tabla compra y agregue una nueva columna llamada cantidad tipo
--		entero. (Usar el comado ALTER)
alter table compra add cantidad int(3) NOT NULL;

-- 6. Eliminar campo descripción de la tabla tabla1 (Usar el comado ALTER)
alter table tabla1 drop descripcion;

-- 7. Insertar datos en las siguientes tablas.
insert into cliente values(301, "JORGE", "PEREZ", "1980-07-01", "M", "TRUJILLO");
insert into cliente values(420, "JOSE", "FLORES", "1986-10-10", "M", "BOCONO");
insert into cliente values(444, "JOSE", "BLANCO", "1986-04-15", "M", "BARQUISIMETO");
insert into cliente values(987, "FANNY", "CAMPOS", "1984-04-17", "F", "MARIARA");

insert into producto values(15, "CAMISA", 25000, "CAMISA DE TORCHON", 45);
insert into producto values(15, "PANTALON", 150000, "PANTALON DE LINO", 21);
insert into producto values(15, "CHAQUETA", 350000, "CHAQUETA DE CUERO", 16);
insert into producto values(15, "BLUE JEANS", 799999, "BLUE JEANS DE PANA", 7);

insert into compra values(15, 444, "2017-12-01", 5);
insert into compra values(30, 301, "2018-10-01", 3);
insert into compra values(45, 987, "2015-12-01", 4);

insert into tabla1 values(1000, "NOMBRE UNO");
insert into tabla1 values(2000, "NOMBRE DOS");

-- 8. Mostrar lista de tablas.
show tables;
+--------------------+
| Tables_in_bdcompra |
+--------------------+
| cliente            |
| compra             |
| producto           |
| tabla1             |
+--------------------+

-- 9. Mostrar la estructura de las tablas creadas en el paso 7.
describe cliente;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| codcliente | int(3)      | NO   | PRI | NULL    |       |
| nomcliente | varchar(30) | NO   |     | NULL    |       |
| apecliente | varchar(30) | NO   |     | NULL    |       |
| fechanacli | date        | NO   |     | NULL    |       |
| sexo       | char(1)     | NO   |     | NULL    |       |
| ciudad     | varchar(30) | NO   |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
describe producto;
+----------------+--------------+------+-----+---------+-------+
| Field          | Type         | Null | Key | Default | Extra |
+----------------+--------------+------+-----+---------+-------+
| codprod        | int(3)       | NO   | PRI | NULL    |       |
| nomprod        | varchar(30)  | NO   |     | NULL    |       |
| precioprod     | float        | NO   |     | NULL    |       |
| descripprod    | varchar(100) | YES  |     | NULL    |       |
| existenciaprod | int(3)       | NO   |     | NULL    |       |
+----------------+--------------+------+-----+---------+-------+
describe compra;
+------------+--------+------+-----+---------+-------+
| Field      | Type   | Null | Key | Default | Extra |
+------------+--------+------+-----+---------+-------+
| codprod    | int(3) | NO   | MUL | NULL    |       |
| codcliente | int(3) | NO   | MUL | NULL    |       |
| fecha      | date   | NO   |     | NULL    |       |
| cantidad   | int(3) | NO   |     | NULL    |       |
+------------+--------+------+-----+---------+-------+
describe tabla1;
+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| codigo | int(3)      | NO   | PRI | NULL    |       |
| nombre | varchar(30) | NO   |     | NULL    |       |
+--------+-------------+------+-----+---------+-------+

-- 10. Eliminar datos de tabla tabla1.
delete from tabla1; --Esto elimina solo los datos, no la tabla.

-- 11. Eliminar tabla tabla1.
drop table tabla1;
+--------------------+
| Tables_in_bdcompra |
+--------------------+
| cliente            |
| compra             |
| producto           |
+--------------------+

-- 12. Eliminar producto con código 60.
delete from producto
where codprod=60;
+---------+----------+------------+-------------------+----------------+
| codprod | nomprod  | precioprod | descripprod       | existenciaprod |
+---------+----------+------------+-------------------+----------------+
|      15 | CAMISA   |      25000 | CAMISA DE TORCHON |             45 |
|      30 | PANTALON |     150000 | PANTALON DE LINO  |             21 |
|      45 | CHAQUETA |     350000 | CHAQUETA DE CUERO |             16 |
+---------+----------+------------+-------------------+----------------+

-- 13. Otras sentencias SQL.
-- 13.1 Mostrar los datos de tabla producto y cliente.
select * from producto;
+---------+----------+------------+-------------------+----------------+
| codprod | nomprod  | precioprod | descripprod       | existenciaprod |
+---------+----------+------------+-------------------+----------------+
|      15 | CAMISA   |      25000 | CAMISA DE TORCHON |             45 |
|      30 | PANTALON |     150000 | PANTALON DE LINO  |             21 |
|      45 | CHAQUETA |     350000 | CHAQUETA DE CUERO |             16 |
+---------+----------+------------+-------------------+----------------+

select * from cliente;
+------------+------------+------------+------------+------+--------------+
| codcliente | nomcliente | apecliente | fechanacli | sexo | ciudad       |
+------------+------------+------------+------------+------+--------------+
|        301 | JORGE      | PEREZ      | 1980-07-01 | M    | TRUJILLO     |
|        420 | JOSE       | FLORES     | 1986-10-10 | M    | BOCONO       |
|        444 | JOSE       | BLANCO     | 1986-04-15 | M    | BARQUISIMETO |
|        987 | FANNY      | CAMPOS     | 1984-04-17 | F    | MARIARA      |
+------------+------------+------------+------------+------+--------------+

-- 13.2 Modificar cliente con codigo 420, nombre= JOSE por JOSEFINA y sexo='M' por 'F'.
update cliente set nomcliente="JOSEFA", sexo="F"
where codcliente=420;
+------------+------------+------------+------------+------+--------------+
| codcliente | nomcliente | apecliente | fechanacli | sexo | ciudad       |
+------------+------------+------------+------------+------+--------------+
|        301 | JORGE      | PEREZ      | 1980-07-01 | M    | TRUJILLO     |
|        420 | JOSEFA     | FLORES     | 1986-10-10 | F    | BOCONO       |
|        444 | JOSE       | BLANCO     | 1986-04-15 | M    | BARQUISIMETO |
|        987 | FANNY      | CAMPOS     | 1984-04-17 | F    | MARIARA      |
+------------+------------+------------+------------+------+--------------+

-- 13.3 Mostrar cantidad de clientes con sexo masculino y femenino.
select sexo, COUNT(sexo)
from cliente
group by sexo;
+------+-------------+
| sexo | COUNT(sexo) |
+------+-------------+
| F    |           2 |
| M    |           2 |
+------+-------------+

-- 13.4 Mostrar los productos comprados por los clientes, los campos son: código de cliente,
--		nombre de cliente, código del producto, nombre del producto y la descripción del producto.
select compra.codcliente, nomcliente, compra.codprod, nomprod, descripprod
from cliente, producto, compra
where compra.codcliente = cliente.codcliente and compra.codprod = producto.codprod;
+------------+------------+---------+----------+-------------------+
| codcliente | nomcliente | codprod | nomprod  | descripprod       |
+------------+------------+---------+----------+-------------------+
|        444 | JOSE       |      15 | CAMISA   | CAMISA DE TORCHON |
|        301 | JORGE      |      30 | PANTALON | PANTALON DE LINO  |
|        987 | FANNY      |      45 | CHAQUETA | CHAQUETA DE CUERO |
+------------+------------+---------+----------+-------------------+

-- 13.5 Mostar máximo precio del producto.
select MAX(precioprod) as "PRECIO MAXIMO" from producto;
+---------------+
| PRECIO MAXIMO |
+---------------+
|        350000 |
+---------------+

-- 13.6 Mostrar la suma de la existencia del producto.
select SUM(precioprod) as "SUMA DE PRODUCTOS" from producto;
+-------------------+
| SUMA DE PRODUCTOS |
+-------------------+
|            525000 |
+-------------------+

-- 13.7 Mostrar promedio de precios del producto.
select AVG(precioprod) as "PROMEDIO" from producto;
+----------+
| PROMEDIO |
+----------+
|   175000 |
+----------+

-- 13.8 Mostrar los clientes cuya ciudad es TRUJILLO y BARQUISIMETO, usar clausula IN
select * from cliente
where ciudad in ("TRUJILLO", "BARQUISIMETO");
+------------+------------+------------+------------+------+--------------+
| codcliente | nomcliente | apecliente | fechanacli | sexo | ciudad       |
+------------+------------+------------+------------+------+--------------+
|        301 | JORGE      | PEREZ      | 1980-07-01 | M    | TRUJILLO     |
|        444 | JOSE       | BLANCO     | 1986-04-15 | M    | BARQUISIMETO |
+------------+------------+------------+------------+------+--------------+

-- 13.9 Mostrar los productos cuyo precio se encuentre entre 23000 y 300000, usar clausula
-- 		BETWEEN.
select * from producto
where precioprod between 23000 and 300000;
+---------+----------+------------+-------------------+----------------+
| codprod | nomprod  | precioprod | descripprod       | existenciaprod |
+---------+----------+------------+-------------------+----------------+
|      15 | CAMISA   |      25000 | CAMISA DE TORCHON |             45 |
|      30 | PANTALON |     150000 | PANTALON DE LINO  |             21 |
+---------+----------+------------+-------------------+----------------+