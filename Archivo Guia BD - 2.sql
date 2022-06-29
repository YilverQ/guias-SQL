-- Archivo Guia Bases De Datos I.sql

-- 1) Mostrar cedula, nombre, apellido, dirección, sueldo y nombre de cargo del empleado de personas que viven en Caracas.
select ci, prnombre, prapellido, direccion, sueldo, nomcargo
from empleado, cargo
where empleado.codcargo = cargo.codcargo and direccion="Caracas";
+----------+----------+------------+-----------+--------+--------------+
| ci       | prnombre | prapellido | direccion | sueldo | nomcargo     |
+----------+----------+------------+-----------+--------+--------------+
| 11692027 | Yelitze  | Zuniaga    | Caracas   |   3500 | Presidente   |
| 16091411 | Jubgeidy | Figueroa   | Caracas   |    800 | Secretaria   |
| 13489803 | Heydi    | Soto       | Caracas   |   2300 | Analista III |
| 14585791 | Mayra    | Mendoza    | Caracas   |    614 | Motorizado   |
+----------+----------+------------+-----------+--------+--------------+


-- 2) Mostrar cedula, nombre, apellido, dirección. sueldo, 
--		NOMBRE DE LA EMPRESA y NOMBRE DEL CARGO del empleado que vivan en Charallave
-- 		NOMBRE DE LA EMPRESA Y NOMBRE DEL CARGO del empleado. Que viva
select ci, prnombre, prapellido, empleado.direccion, sueldo, nomempresa, nomcargo
from empleado, empresa, cargo
where empleado.codcargo = cargo.codcargo and empleado.codempresa = empresa.codempresa;
+----------+-------------+--------------+------------+--------+-----------------+------------+
| ci       | prnombre    | prapellido   | direccion  | sueldo | nomempresa      | nomcargo   |
+----------+-------------+--------------+------------+--------+-----------------+------------+
| 13217464 | Belkys Aida | Lunar Osorio | Charallave |   2050 | UBV XXI         | Analista I |
| 16937993 | Luis        | Mejias       | Charallave |   2050 | UBV XXI         | Analista I |
| 17856588 | Lissette    | Milla        | charallave |   1950 | Consultora 3003 | Analista I |
+----------+-------------+--------------+------------+--------+-----------------+------------+


-- 3) Mostrar codigo, y nombre de la empresa y cantidad de empleados por empresa
--		usar el clasificador "Group by" y la función de agregado COUNT. 
select empresa.codempresa, nomempresa, COUNT(empleado.ci)
from empresa, empleado
where empresa.codempresa = empleado.codempresa
group by nomempresa;

+------------+-----------------+--------------------+
| codempresa | nomempresa      | COUNT(empleado.ci) |
+------------+-----------------+--------------------+
|          3 | Consultora 3003 |                  6 |
|          1 | Rapidito, C. A. |                  4 |
|          2 | UBV XXI         |                  9 |
+------------+-----------------+--------------------+


-- 4) Mostrar codigo, y nombre de la empresa y cantidad de empleados por empresa
-- 		OJO - -- solo aquellas empresas con cantidad de empleados mayor que cuatro.
select empresa.codempresa, nomempresa, COUNT(empleado.ci)
from empresa, empleado
where empresa.codempresa = empleado.codempresa
group by nomempresa
having COUNT(empleado.ci) > 4;

+------------+-----------------+--------------------+
| codempresa | nomempresa      | COUNT(empleado.ci) |
+------------+-----------------+--------------------+
|          3 | Consultora 3003 |                  6 |
|          2 | UBV XXI         |                  9 |
+------------+-----------------+--------------------+

-- 5) Mostrar código y nombre del cargo y cantidad de empleados por cargos. Ordenar la lista por numero de empleados
select cargo.codcargo, nomcargo, COUNT(empleado.ci)
from cargo, empleado
where cargo.codcargo = empleado.codcargo
group by nomcargo
order by COUNT(empleado.ci) asc;
+----------+----------------+--------------------+
| codcargo | nomcargo       | COUNT(empleado.ci) |
+----------+----------------+--------------------+
|        1 | Presidente     |                  1 |
|        7 | Motorizado     |                  1 |
|        2 | Vicepresidente |                  1 |
|        6 | Analista III   |                  2 |
|        3 | Secretaria     |                  2 |
|        5 | Analista II    |                  4 |
|        4 | Analista I     |                  8 |
+----------+----------------+--------------------+


-- 6) Mostrar código y nombre del cargo y cantidad de empleados por cargos. 
-- 		OJO -- solo aquellos cargos que sean mayor a 3.
select cargo.codcargo, nomcargo, COUNT(empleado.ci)
from empleado, cargo
where empleado.codcargo = cargo.codcargo
group by nomcargo
having COUNT(empleado.ci) > 3;
+----------+-------------+--------------------+
| codcargo | nomcargo    | COUNT(empleado.ci) |
+----------+-------------+--------------------+
|        4 | Analista I  |                  8 |
|        5 | Analista II |                  4 |
+----------+-------------+--------------------+

-- 7) Sumar la columna sueldo, usar la función de agregado SUM. 
select SUM(sueldo) as "Sueldo Total" from empleado;
+--------------+
| Sueldo Total |
+--------------+
|        36204 |
+--------------+

-- 8) Obtener el máximo sueldo de empleado y nombre, usar la función de agregado Max.
select MAX(sueldo) as "Sueldo Maximo" from empleado;
+---------------+
| Sueldo Maximo |
+---------------+
|          3500 |
+---------------+

-- 9) Obtener el mínimo sueldo de empleado y nombre, usar la función de agregado Min. 
select MIN(sueldo) as "Sueldo Minimo" from empleado;
+---------------+
| Sueldo Minimo |
+---------------+
|           614 |
+---------------+

-- 10) Obtener el promedio de los sueldos de los empleados, usar la función de promerio AVG. 
Select AVG(sueldo) as "Sueldo Promedio" from empleado;
	+--------------------+
	| Sueldo Promedio    |
	+--------------------+
	| 1905.4736842105262 |
	+--------------------+