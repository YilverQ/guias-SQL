-- Archivo Guia Bases De Datos I.sql

-- 1) Abrir la terminal y entrar en Mariadb.
-- mariadb -u root -p
-- password: root

-- 2) Mostrar las bases de datos.
show databases;
+--------------------+
| Database           |
+--------------------+
| bdbiblioteca       |
| bdcargo22          |
| information_schema |
| mysql              |
| performance_schema |
+--------------------+

-- 3) Crear una bases de datos. (bdbiblioteca)
create database bdbiblioteca;
Query OK, 1 row affected (0.043 sec)

-- 4) Activar la bases de datos creada. 
use bdbiblioteca;
Database changed

-- 5) Crear tablas usuario, autor, editorial, libro, prestamo
-- crear tablas en este orden
create table autor(
	codautor int(3) NOT NULL PRIMARY KEY,
	nomautor varchar(50) NOT NULL
)ENGINE=InnoDB;

create table editorial(
	codeditorial int(3) NOT NULL PRIMARY KEY,
	nomautor varchar(50) NOT NULL
)ENGINE=InnoDB;

create table libro(
	codlibro int(3) NOT NULL PRIMARY KEY,
	nomlibro varchar(100) NOT NULL,
	codautor int(3) NOT NULL,
	codeditorial int(3) NOT NULL,
	FOREIGN KEY (codautor) references autor(codautor),
	FOREIGN KEY (codeditorial) references editorial(codeditorial)
)ENGINE=InnoDB;

MariaDB [bdbiblioteca]> show tables;
+------------------------+
| Tables_in_bdbiblioteca |
+------------------------+
| autor                  |
| editorial              |
| libro                  |
+------------------------+

-- 6) Insertar datos en tablas usuario, autor, editorial, libro, prestamo.
insert into autor values(1, "Grabriel");
insert into autor values(2, "Edgar");
insert into autor values(3, "Maria");

insert into editorial values(1, "Wallace");
insert into editorial values(2, "Freebook");
insert into editorial values(3, "Paybook");

insert into libro values(1, "Cien arboles de soledad", 1, 1);
insert into libro values(2, "Bandolera", 3,2);
insert into libro values(3, "Fundacion Futbol", 2, 1);
insert into libro values(4, "Movimientos Espectaculares", 2, 3);
insert into libro values(5, "La vida de la mujer", 3,3);
insert into libro values(6, "Flojo no soy", 1, 1);
insert into libro values(7, "Programa de futbol", 2, 3);
insert into libro values(8, "La gran mujer", 3, 2);

-- 7) Mostrar datos de las tablas usuario, autor, editorial, libro, prestamo de forma independiente.
select * from autor;
+----------+----------+
| codautor | nomautor |
+----------+----------+
|        1 | Grabriel |
|        2 | Edgar    |
|        3 | Maria    |
+----------+----------+

select * from editorial;
+--------------+--------------+
| codeditorial | nomeditorial |
+--------------+--------------+
|            1 | Wallace      |
|            2 | Freebook     |
|            3 | Paybook      |
+--------------+--------------+

select * from libro;
+----------+----------------------------+----------+--------------+
| codlibro | nomlibro                   | codautor | codeditorial |
+----------+----------------------------+----------+--------------+
|        1 | Cien arboles de soledad    |        1 |            1 |
|        2 | Bandolera                  |        3 |            2 |
|        3 | Fundacion Futbol           |        2 |            1 |
|        4 | Movimientos Espectaculares |        2 |            3 |
|        5 | La vida de la mujer        |        3 |            3 |
|        6 | Flojo no soy               |        1 |            1 |
|        7 | Programa de futbol         |        2 |            3 |
|        8 | La gran mujer              |        3 |            2 |
+----------+----------------------------+----------+--------------+

-- 8) mostrar los campos codlibro, titulo, nombre del autor, nombre de la 
--    editorial
-- Nota: consulta compleja, en ésta intervienen todas las tablas, recuerden 
--       estas tablas se unen clave foranea con clave primaria

select codlibro, nomlibro, nomautor, nomeditorial
from editorial, autor, libro
where libro.codautor = autor.codautor and libro.codeditorial = editorial.codeditorial
order by nomeditorial;

+----------+----------------------------+----------+--------------+
| codlibro | nomlibro                   | nomautor | nomeditorial |
+----------+----------------------------+----------+--------------+
|        2 | Bandolera                  | Maria    | Freebook     |
|        8 | La gran mujer              | Maria    | Freebook     |
|        4 | Movimientos Espectaculares | Edgar    | Paybook      |
|        5 | La vida de la mujer        | Maria    | Paybook      |
|        7 | Programa de futbol         | Edgar    | Paybook      |
|        3 | Fundacion Futbol           | Edgar    | Wallace      |
|        6 | Flojo no soy               | Grabriel | Wallace      |
|        1 | Cien arboles de soledad    | Grabriel | Wallace      |
+----------+----------------------------+----------+--------------+