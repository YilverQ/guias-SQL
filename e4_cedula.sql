-- Evaluacion nro 4 - Seccion: 2201D

-- Para desarrollar los requerimietos se recomienda revisar esquema de la BD
-- bdestudiante (ver archivo adjunto)
-- 
-- Desarrollar los siguintes requerimientos
-- 0 crear base de datos bdestudiante
create database bdestudiante;
  
-- 1 activar la bd bdestudiante
use bdestudiante;

-- 2 crear tablas coordinacion, estudiante, unidadcurricular y cursa
--   Para cada tabla agregar el motor de almacenamiento innodb
-- 2.1 crear tablas coordinacion
create table coordinacion(
	codcoord int(3) NOT NULL PRIMARY KEY,
	nomcoord varchar(50) NOT NULL,
	ubicacion varchar(50),
	telefono varchar(11) NOT NULL
)ENGINE=InnoDB;

-- 2.2 crear tablas estudiante
create table estudiante(
	ci int(8) NOT NULL PRIMARY KEY,
	prnombre varchar(20) NOT NULL,
	prapellido varchar(20) NOT NULL,
	genero char(1) NOT NULL,
	direccion varchar(50) NOT NULL,
	codcoord int(3) NOT NULL,
	FOREIGN KEY (codcoord) references coordinacion(codcoord)
)ENGINE=InnoDB;

-- 2.3 crear tablas unidadcurricular
create table unidadcurricular(
	coducurr int(3) NOT NULL PRIMARY KEY,
	nomucurr varchar(50) NOT NULL,
	cupo int(2)
)ENGINE=InnoDB;

-- 2.4 crear tablas cursa
create table cursa(
	ci int(8) NOT NULL,
	coducurr int(3) NOT NULL,
	nota float NOT NULL,
	FOREIGN KEY (ci) references estudiante(ci),
	FOREIGN KEY (codcurr) references unidadcurricular(coducurr)
)ENGINE=InnoDB;

-- 3. insertar datos  en tablas coordinacion, estudiante,
--    unidadcurricular y cursa (ver archivo adjunto)
-- 3.1 insertar datos  en tablas coordinacion
insert into coordinacion values(1,"INFORMATICA", "PISO-7", "02126063640");
insert into coordinacion values(2,"COMUNICACION SOCIAL", "PISO-8", "02126061510");
insert into coordinacion values(3,"AGROECOLOGIA", "PISO-8", "02126063620");
insert into coordinacion values(4,"RADIOTERAPIA", "PISO-3", "02126063690");
insert into coordinacion values(5,"ARQUITECTURA", "PISO-9", "02126063630");
       
-- 3.2 insertar datos en asignatura
insert into unidadcurricular values(1, "INTERNET EN LA WEB", 25);
insert into unidadcurricular values(2, "LABORATORIO DE INFORMATICA", 20);
insert into unidadcurricular values(3, "MATEMATICAS I", 40);
insert into unidadcurricular values(4, "ALGORITMOS Y PROGRAMACION", 35);
insert into unidadcurricular values(5, "ADMINISTRACION DE REDES", 20);
insert into unidadcurricular values(6, "ESTRUCTURA DE DATOS", 35);
insert into unidadcurricular values(7, "BASE DE DATOS I", 20);
insert into unidadcurricular values(8, "BASE DE DATOS II", 15);
insert into unidadcurricular values(9, "INTRODUCCION A LA INFORMATICA", 36);

-- 3.3 insertar datos  en estudiante
--     ver archivo adjunto y agregar sus datos como estudiante de Informatica
insert into estudiante values(111110, "LENY", "BRAVO", "F", "CARACAS", 1);
insert into estudiante values(222220, "ANA", "GOMEZ", "F", "MARACAY", 2);
insert into estudiante values(333330, "JUAN", "LOPEZ", "M", "CARACAS", 1);
insert into estudiante values(444440, "LUIS", "PEREZ", "M", "LOS TEQUES", 3);
insert into estudiante values(555000, "RICARDO", "GONZALES", "M", "CUMANA", 3);
insert into estudiante values(555550, "REBECA", "LOPEZ", "F", "CUMANA", 1);

-- 3.4 insertar datos  en cursa
insert into cursa values(111110, 1, 15);
insert into cursa values(111110, 2, 18);
insert into cursa values(111110, 3, 10);
insert into cursa values(222220, 2, 12);
insert into cursa values(222220, 4, 15);
insert into cursa values(222220, 6, 14);
insert into cursa values(222220, 8, 16);
insert into cursa values(333330, 2, 11);
insert into cursa values(333330, 3, 14);
insert into cursa values(333330, 4, 18);

-- 4. Mostrar los datos de la tablas coordinacion, estudiante,
--    unidadcurricular y cursa
-- 4.1 Mostrar los datos de la tabla coordinacion
select * from coordinacion;
+----------+---------------------+-----------+-------------+
| codcoord | nomcoord            | ubicacion | telefono    |
+----------+---------------------+-----------+-------------+
|        1 | INFORMATICA         | PISO-7    | 02126063640 |
|        2 | COMUNICACION SOCIAL | PISO-8    | 02126061510 |
|        3 | AGROECOLOGIA        | PISO-8    | 02126063620 |
|        4 | RADIOTERAPIA        | PISO-3    | 02126063690 |
|        5 | ARQUITECTURA        | PISO-9    | 02126063630 |
+----------+---------------------+-----------+-------------+

-- 4.2 Mostrar todos los datos de la tabla estudiante
select * from estudiante;
+--------+----------+------------+--------+------------+----------+
| ci     | prnombre | prapellido | genero | direccion  | codcoord |
+--------+----------+------------+--------+------------+----------+
| 111110 | LENY     | BRAVO      | F      | CARACAS    |        1 |
| 222220 | ANA      | GOMEZ      | F      | MARACAY    |        2 |
| 333330 | JUAN     | LOPEZ      | M      | CARACAS    |        1 |
| 444440 | LUIS     | PEREZ      | M      | LOS TEQUES |        3 |
| 555000 | RICARDO  | GONZALES   | M      | CUMANA     |        3 |
| 555550 | REBECA   | LOPEZ      | F      | CUMANA     |        1 |
+--------+----------+------------+--------+------------+----------+

-- 4.3 Mostrar todos los datos de la tabla unidadcurricular 
select * from unidadcurricular;
+----------+-------------------------------+------+
| coducurr | nomucurr                      | cupo |
+----------+-------------------------------+------+
|        1 | INTERNET EN LA WEB            |   25 |
|        2 | LABORATORIO DE INFORMATICA    |   20 |
|        3 | MATEMATICAS I                 |   40 |
|        4 | ALGORITMOS Y PROGRAMACION     |   35 |
|        5 | ADMINISTRACION DE REDES       |   20 |
|        6 | ESTRUCTURA DE DATOS           |   35 |
|        7 | BASE DE DATOS I               |   20 |
|        8 | BASE DE DATOS II              |   15 |
|        9 | INTRODUCCION A LA INFORMATICA |   36 |
+----------+-------------------------------+------+

-- 4.4 Mostrar cedula, nombre, apellido y direccion de los estudiantes
--     que viven en Cumana, Maracay y Los Teques. Usar operador IN
select ci, prnombre, prapellido, direccion
from estudiante
where direccion in ("CUMANA", "MARACAY", "LOS TEQUES");
+--------+----------+------------+------------+
| ci     | prnombre | prapellido | direccion  |
+--------+----------+------------+------------+
| 222220 | ANA      | GOMEZ      | MARACAY    |
| 444440 | LUIS     | PEREZ      | LOS TEQUES |
| 555000 | RICARDO  | GONZALES   | CUMANA     |
| 555550 | REBECA   | LOPEZ      | CUMANA     |
+--------+----------+------------+------------+

-- 5 Mostrar codigo, nombre y cupo de las unidades curriculares
--   con cupo mayor que 25
select coducurr, nomucurr, cupo
from unidadcurricular
where cupo>25;
+----------+-------------------------------+------+
| coducurr | nomucurr                      | cupo |
+----------+-------------------------------+------+
|        3 | MATEMATICAS I                 |   40 |
|        4 | ALGORITMOS Y PROGRAMACION     |   35 |
|        6 | ESTRUCTURA DE DATOS           |   35 |
|        9 | INTRODUCCION A LA INFORMATICA |   36 |
+----------+-------------------------------+------+

-- 6 Mostrar el cupo minimo de la tabla unidadcurricular
select MIN(cupo) from unidadcurricular;
+-----------+
| MIN(cupo) |
+-----------+
|        15 |
+-----------+

-- 7 Mostrar cedula, nombre, apellido y direccion de los estudiantes 
--   y el nombre de la coordinación a la cual pertenece
select ci, prnombre, prapellido, direccion, nomcoord
from estudiante, coordinacion
where estudiante.codcoord = coordinacion.codcoord;
+--------+----------+------------+------------+---------------------+
| ci     | prnombre | prapellido | direccion  | nomcoord            |
+--------+----------+------------+------------+---------------------+
| 111110 | LENY     | BRAVO      | CARACAS    | INFORMATICA         |
| 222220 | ANA      | GOMEZ      | MARACAY    | COMUNICACION SOCIAL |
| 333330 | JUAN     | LOPEZ      | CARACAS    | INFORMATICA         |
| 444440 | LUIS     | PEREZ      | LOS TEQUES | AGROECOLOGIA        |
| 555000 | RICARDO  | GONZALES   | CUMANA     | AGROECOLOGIA        |
| 555550 | REBECA   | LOPEZ      | CUMANA     | INFORMATICA         |
+--------+----------+------------+------------+---------------------+

-- 8 Mostrar  codigo y nombre de la coordinacion y la cantidad de
--   estudiantes por coordinacion
--   usar group by
select coordinacion.codcoord, nomcoord, COUNT(estudiante.ci)
from estudiante, coordinacion
where estudiante.codcoord = coordinacion.codcoord
group by nomcoord;
+----------+---------------------+----------------------+
| codcoord | nomcoord            | COUNT(estudiante.ci) |
+----------+---------------------+----------------------+
|        3 | AGROECOLOGIA        |                    2 |
|        2 | COMUNICACION SOCIAL |                    1 |
|        1 | INFORMATICA         |                    3 |
+----------+---------------------+----------------------+