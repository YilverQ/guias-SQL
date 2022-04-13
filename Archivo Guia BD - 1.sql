-- Archivo Guia Bases De Datos I.sql

-- 1) Escribe la sentencia para entrar al servidor mariadb.
-- mariadb -u root -p
-- password: root.

-- 2) Mostrar Lista de BD.
show databases; 
+--------------------+
| Database           |
+--------------------+
| bdcargo22          |
| information_schema |
| mysql              |
| performance_schema |
+--------------------+

-- 3) Subir bdcargos22.sql
source cargos.sql

-- 3.1) Usar una base de datos creada. 
use bdcargo22;

-- 4) Mostrar listas de tablas.
show tables;
+---------------------+
| Tables_in_bdcargo22 |
+---------------------+
| cargo               |
| comprador           |
| empleado            |
| empresa             |
+---------------------+

-- 5) Muestra 2 estructura de tablas.
describe cargo;
+-------------+-------------+------+-----+---------+-------+
| Field       | Type        | Null | Key | Default | Extra |
+-------------+-------------+------+-----+---------+-------+
| codcargo    | int(3)      | NO   | PRI | NULL    |       |
| nomcargo    | varchar(30) | NO   |     | NULL    |       |
| descripcion | varchar(50) | YES  |     | NULL    |       |
+-------------+-------------+------+-----+---------+-------+

describe  empresa;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| codempresa | int(3)      | NO   | PRI | NULL    |       |
| nomempresa | varchar(50) | NO   |     | NULL    |       |
| mision     | varchar(50) | YES  |     | NULL    |       |
| vision     | varchar(50) | YES  |     | NULL    |       |
| telefono   | varchar(12) | NO   |     | NULL    |       |
| direccion  | varchar(50) | NO   |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+


-- 6) Mostrar datos de cargo y empresa. 
select * from cargo;
+----------+----------------+-------------+
| codcargo | nomcargo       | descripcion |
+----------+----------------+-------------+
|        1 | Presidente     | NULL        |
|        2 | Vicepresidente | NULL        |
|        3 | Secretaria     | NULL        |
|        4 | Analista I     | NULL        |
|        5 | Analista II    | NULL        |
|        6 | Analista III   | NULL        |
|        7 | Motorizado     | NULL        |
|        8 | Educador       | NULL        |
+----------+----------------+-------------+

select * from empresa;
+------------+-----------------+--------+--------+-------------+-------------+
| codempresa | nomempresa      | mision | vision | telefono    | direccion   |
+------------+-----------------+--------+--------+-------------+-------------+
|          1 | Rapidito, C. A. | NULL   | NULL   | 02125555555 | Los Rosales |
|          2 | UBV XXI         | NULL   | NULL   | 02126616666 | Chaguaramos |
|          3 | Consultora 3003 | NULL   | NULL   | 02122028888 | Chuao       |
+------------+-----------------+--------+--------+-------------+-------------+


-- 7) Mostrar cedula, nombre, apellido, dirección y sueldo del empelado. 
describe empleado;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| ci         | int(8)      | NO   | PRI | NULL    |       |
| prnombre   | varchar(20) | NO   |     | NULL    |       |
| prapellido | varchar(20) | NO   |     | NULL    |       |
| sexo       | char(1)     | NO   |     | NULL    |       |
| edocivil   | char(1)     | NO   |     | NULL    |       |
| fecnac     | date        | NO   |     | NULL    |       |
| canthijos  | int(2)      | NO   |     | NULL    |       |
| telefono   | varchar(12) | NO   |     | NULL    |       |
| direccion  | varchar(20) | NO   |     | NULL    |       |
| sueldo     | double      | NO   |     | NULL    |       |
| codcargo   | int(3)      | NO   | MUL | NULL    |       |
| codempresa | int(3)      | NO   | MUL | NULL    |       |
+------------+-------------+------+-----+---------+-------+

select ci, prnombre, prapellido, direccion, sueldo from empleado;
+----------+-------------+--------------+--------------------+--------+
| ci       | prnombre    | prapellido   | direccion          | sueldo |
+----------+-------------+--------------+--------------------+--------+
| 11692027 | Yelitze     | Zuniaga      | Caracas            |   3500 |
| 12172814 | Oscar       | Camacho      | Cotiza             |   2500 |
| 13217464 | Belkys Aida | Lunar Osorio | Charallave         |   2050 |
| 13489803 | Heydi       | Soto         | Caracas            |   2300 |
| 13715464 | Sandra      | Acosta       | Maracay            |    614 |
| 14585791 | Mayra       | Mendoza      | Caracas            |    614 |
| 14935165 | Jos         | Echeverr     | cua                |   2000 |
| 16034136 | Jean        | Rebolledo    |  23 de Enero       |   2005 |
| 16091411 | Jubgeidy    | Figueroa     | Caracas            |    800 |
| 16937993 | Luis        | Mejias       | Charallave         |   2050 |
| 16954177 | Diarlyn     | Rodriguez    | Catia la Mar       |   1960 |
| 17060216 | Pedro       | Prada        | Teques             |   2100 |
| 17144248 | Leikys      | Andrades     | Santa Lucia        |   1500 |
| 17224724 | Juan        | Moreno       | Cua                |   2450 |
| 17429618 | Jos         | Salazar      | Santa Teresa       |   2001 |
| 17856588 | Lissette    | Milla        | charallave         |   1950 |
| 17922226 | Carlos      | Vivas        | Vista Alegre       |   1900 |
| 18164992 | Servando    | Reyes        | Sta Teresa del Tuy |   2010 |
| 18598734 | Wilson      | Mendoza      | Cua                |   1900 |
+----------+-------------+--------------+--------------------+--------+

--8) Mostrar cedula, nombre, apellido. dirección, sueldo de los empleados que generan menos de 2000.
select ci, prnombre, prapellido, direccion, sueldo from empleado where sueldo<2000;
+----------+----------+------------+--------------+--------+
| ci       | prnombre | prapellido | direccion    | sueldo |
+----------+----------+------------+--------------+--------+
| 13715464 | Sandra   | Acosta     | Maracay      |    614 |
| 14585791 | Mayra    | Mendoza    | Caracas      |    614 |
| 16091411 | Jubgeidy | Figueroa   | Caracas      |    800 |
| 16954177 | Diarlyn  | Rodriguez  | Catia la Mar |   1960 |
| 17144248 | Leikys   | Andrades   | Santa Lucia  |   1500 |
| 17856588 | Lissette | Milla      | charallave   |   1950 |
| 17922226 | Carlos   | Vivas      | Vista Alegre |   1900 |
| 18598734 | Wilson   | Mendoza    | Cua          |   1900 |
+----------+----------+------------+--------------+--------+

-- 9) Mostrar cedula, nombre, apellido. dirección, sueldo de los empleados que generan entre 1500 y 2500.
select ci, prnombre, prapellido, direccion, sueldo 
from empleado 
where sueldo>=1500 and sueldo<=2500;
+----------+-------------+--------------+--------------------+--------+
| ci       | prnombre    | prapellido   | direccion          | sueldo |
+----------+-------------+--------------+--------------------+--------+
| 12172814 | Oscar       | Camacho      | Cotiza             |   2500 |
| 13217464 | Belkys Aida | Lunar Osorio | Charallave         |   2050 |
| 13489803 | Heydi       | Soto         | Caracas            |   2300 |
| 14935165 | Jos         | Echeverr     | cua                |   2000 |
| 16034136 | Jean        | Rebolledo    |  23 de Enero       |   2005 |
| 16937993 | Luis        | Mejias       | Charallave         |   2050 |
| 16954177 | Diarlyn     | Rodriguez    | Catia la Mar       |   1960 |
| 17060216 | Pedro       | Prada        | Teques             |   2100 |
| 17144248 | Leikys      | Andrades     | Santa Lucia        |   1500 |
| 17224724 | Juan        | Moreno       | Cua                |   2450 |
| 17429618 | Jos         | Salazar      | Santa Teresa       |   2001 |
| 17856588 | Lissette    | Milla        | charallave         |   1950 |
| 17922226 | Carlos      | Vivas        | Vista Alegre       |   1900 |
| 18164992 | Servando    | Reyes        | Sta Teresa del Tuy |   2010 |
| 18598734 | Wilson      | Mendoza      | Cua                |   1900 |
+----------+-------------+--------------+--------------------+--------+


-- 10) Mostrar cedula, nombre, apellido, dirección, sueldo de los empleados que viven en Caracas, Cua o Teques.
select ci, prnombre, prapellido, direccion, sueldo from empleado where direccion in ("Caracas", "Cua", "Teques");
select ci, prnombre, prapellido, direccion, sueldo from empleado where direccion=("Caracas") or direccion="Cua" or direccion="Teques";

+----------+----------+------------+-----------+--------+
| ci       | prnombre | prapellido | direccion | sueldo |
+----------+----------+------------+-----------+--------+
| 11692027 | Yelitze  | Zuniaga    | Caracas   |   3500 |
| 13489803 | Heydi    | Soto       | Caracas   |   2300 |
| 14585791 | Mayra    | Mendoza    | Caracas   |    614 |
| 14935165 | Jos      | Echeverr   | cua       |   2000 |
| 16091411 | Jubgeidy | Figueroa   | Caracas   |    800 |
| 17060216 | Pedro    | Prada      | Teques    |   2100 |
| 17224724 | Juan     | Moreno     | Cua       |   2450 |
| 18598734 | Wilson   | Mendoza    | Cua       |   1900 |
+----------+----------+------------+-----------+--------+


-- 11) Mostar cedula, nombre, apellido, dirección, sueldo de los empleados que viven Caracas, Cua y Teques 
-- ordenados por nombre en forma descendente, usar el operador "IN". 
select ci, prnombre, prapellido, direccion, sueldo from empleado 
where direccion in ("Caracas", "Cua", "Teques") 
order by prnombre desc;
+----------+----------+------------+-----------+--------+
| ci       | prnombre | prapellido | direccion | sueldo |
+----------+----------+------------+-----------+--------+
| 11692027 | Yelitze  | Zuniaga    | Caracas   |   3500 |
| 18598734 | Wilson   | Mendoza    | Cua       |   1900 |
| 17060216 | Pedro    | Prada      | Teques    |   2100 |
| 14585791 | Mayra    | Mendoza    | Caracas   |    614 |
| 16091411 | Jubgeidy | Figueroa   | Caracas   |    800 |
| 17224724 | Juan     | Moreno     | Cua       |   2450 |
| 14935165 | Jos      | Echeverr   | cua       |   2000 |
| 13489803 | Heydi    | Soto       | Caracas   |   2300 |
+----------+----------+------------+-----------+--------+

-- 12) Mostrar cedula, nombre, apellido, sueldo y el código de la empresa donde trabaja. 
select ci, prnombre, prapellido, sueldo, codempresa from empleado;
+----------+-------------+--------------+--------+------------+
| ci       | prnombre    | prapellido   | sueldo | codempresa |
+----------+-------------+--------------+--------+------------+
| 11692027 | Yelitze     | Zuniaga      |   3500 |          3 |
| 12172814 | Oscar       | Camacho      |   2500 |          2 |
| 13217464 | Belkys Aida | Lunar Osorio |   2050 |          2 |
| 13489803 | Heydi       | Soto         |   2300 |          1 |
| 13715464 | Sandra      | Acosta       |    614 |          1 |
| 14585791 | Mayra       | Mendoza      |    614 |          3 |
| 14935165 | Jos         | Echeverr     |   2000 |          2 |
| 16034136 | Jean        | Rebolledo    |   2005 |          1 |
| 16091411 | Jubgeidy    | Figueroa     |    800 |          1 |
| 16937993 | Luis        | Mejias       |   2050 |          2 |
| 16954177 | Diarlyn     | Rodriguez    |   1960 |          2 |
| 17060216 | Pedro       | Prada        |   2100 |          3 |
| 17144248 | Leikys      | Andrades     |   1500 |          2 |
| 17224724 | Juan        | Moreno       |   2450 |          3 |
| 17429618 | Jos         | Salazar      |   2001 |          2 |
| 17856588 | Lissette    | Milla        |   1950 |          3 |
| 17922226 | Carlos      | Vivas        |   1900 |          2 |
| 18164992 | Servando    | Reyes        |   2010 |          2 |
| 18598734 | Wilson      | Mendoza      |   1900 |          3 |
+----------+-------------+--------------+--------+------------+

-- 13) Mostrar cedula, nombre, apellido, sueldo y el codigo y nombre de la empresa donde trabaja. 
select ci, prnombre, prapellido, sueldo, empleado.codempresa, nomempresa 
from empresa, empleado
where empresa.codempresa = empleado.codempresa;
+----------+-------------+--------------+--------+------------+-----------------+
| ci       | prnombre    | prapellido   | sueldo | codempresa | nomempresa      |
+----------+-------------+--------------+--------+------------+-----------------+
| 13489803 | Heydi       | Soto         |   2300 |          1 | Rapidito, C. A. |
| 13715464 | Sandra      | Acosta       |    614 |          1 | Rapidito, C. A. |
| 16034136 | Jean        | Rebolledo    |   2005 |          1 | Rapidito, C. A. |
| 16091411 | Jubgeidy    | Figueroa     |    800 |          1 | Rapidito, C. A. |
| 12172814 | Oscar       | Camacho      |   2500 |          2 | UBV XXI         |
| 13217464 | Belkys Aida | Lunar Osorio |   2050 |          2 | UBV XXI         |
| 14935165 | Jos         | Echeverr     |   2000 |          2 | UBV XXI         |
| 16937993 | Luis        | Mejias       |   2050 |          2 | UBV XXI         |
| 16954177 | Diarlyn     | Rodriguez    |   1960 |          2 | UBV XXI         |
| 17144248 | Leikys      | Andrades     |   1500 |          2 | UBV XXI         |
| 17429618 | Jos         | Salazar      |   2001 |          2 | UBV XXI         |
| 17922226 | Carlos      | Vivas        |   1900 |          2 | UBV XXI         |
| 18164992 | Servando    | Reyes        |   2010 |          2 | UBV XXI         |
| 11692027 | Yelitze     | Zuniaga      |   3500 |          3 | Consultora 3003 |
| 14585791 | Mayra       | Mendoza      |    614 |          3 | Consultora 3003 |
| 17060216 | Pedro       | Prada        |   2100 |          3 | Consultora 3003 |
| 17224724 | Juan        | Moreno       |   2450 |          3 | Consultora 3003 |
| 17856588 | Lissette    | Milla        |   1950 |          3 | Consultora 3003 |
| 18598734 | Wilson      | Mendoza      |   1900 |          3 | Consultora 3003 |
+----------+-------------+--------------+--------+------------+-----------------+


-- 14) Mostrar cedula, nombre, apellido, sueldo y el código y nombre de la empresa, de los 
-- empleados que trabajan en Rapiditos, C. A.
select ci, prnombre, prapellido, sueldo, empleado.codempresa, nomempresa
from empresa, empleado
where empresa.codempresa = empleado.codempresa and nomempresa = "Rapidito, C. A.";
+----------+----------+------------+--------+------------+-----------------+
| ci       | prnombre | prapellido | sueldo | codempresa | nomempresa      |
+----------+----------+------------+--------+------------+-----------------+
| 13489803 | Heydi    | Soto       |   2300 |          1 | Rapidito, C. A. |
| 13715464 | Sandra   | Acosta     |    614 |          1 | Rapidito, C. A. |
| 16034136 | Jean     | Rebolledo  |   2005 |          1 | Rapidito, C. A. |
| 16091411 | Jubgeidy | Figueroa   |    800 |          1 | Rapidito, C. A. |
+----------+----------+------------+--------+------------+-----------------+


-- 15) Mostrar cedula, nombre, apellido, sueldo y el código y nombre de la empresa, de los 
-- empleados que trabajan en UBV XXI y ordenalos por sueldo desc;
select ci, prnombre, prapellido, sueldo, empleado.codempresa, nomempresa
from empleado, empresa
where empresa.codempresa = empleado.codempresa and nomempresa = "UBV XXI"
order by sueldo desc;

+----------+-------------+--------------+--------+------------+------------+
| ci       | prnombre    | prapellido   | sueldo | codempresa | nomempresa |
+----------+-------------+--------------+--------+------------+------------+
| 12172814 | Oscar       | Camacho      |   2500 |          2 | UBV XXI    |
| 13217464 | Belkys Aida | Lunar Osorio |   2050 |          2 | UBV XXI    |
| 16937993 | Luis        | Mejias       |   2050 |          2 | UBV XXI    |
| 18164992 | Servando    | Reyes        |   2010 |          2 | UBV XXI    |
| 17429618 | Jos         | Salazar      |   2001 |          2 | UBV XXI    |
| 14935165 | Jos         | Echeverr     |   2000 |          2 | UBV XXI    |
| 16954177 | Diarlyn     | Rodriguez    |   1960 |          2 | UBV XXI    |
| 17922226 | Carlos      | Vivas        |   1900 |          2 | UBV XXI    |
| 17144248 | Leikys      | Andrades     |   1500 |          2 | UBV XXI    |
+----------+-------------+--------------+--------+------------+------------+