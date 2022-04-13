-- Archivo Guia Bases De Datos I.sql

-- 1) Usar bases de datos. Cargo22
use bdcargo22;

-- 2) Crear una tabla llamada comprador. 
Create table comprador(
	idcomprador int(3) NOT NULL PRIMARY KEY,
	nomcomprador varchar(50) NOT NULL,
	edad int(3) NOT NULL
)ENGINE=InnoDB;

-- 3) Eliminar la tabla llamada comprador. 
drop table comprador

-- 4) Crear nuevamente la tabla comprador y mostrar la estructura de la tabla.
describe comprador;
+--------------+-------------+------+-----+---------+-------+
| Field        | Type        | Null | Key | Default | Extra |
+--------------+-------------+------+-----+---------+-------+
| idcomprador  | int(3)      | NO   | PRI | NULL    |       |
| nomcomprador | varchar(50) | NO   |     | NULL    |       |
| edad         | int(3)      | NO   |     | NULL    |       |
+--------------+-------------+------+-----+---------+-------+

-- 4) Para añadir un atributo a una tabla.
alter table comprador ADD descripcion varchar(50) NOT NULL;
Query OK, 0 rows affected (0.053 sec)
Records: 0  Duplicates: 0  Warnings: 0
+--------------+-------------+------+-----+---------+-------+
| Field        | Type        | Null | Key | Default | Extra |
+--------------+-------------+------+-----+---------+-------+
| idcomprador  | int(3)      | NO   | PRI | NULL    |       |
| nomcomprador | varchar(50) | NO   |     | NULL    |       |
| edad         | int(3)      | NO   |     | NULL    |       |
| descripcion  | varchar(50) | NO   |     | NULL    |       |
+--------------+-------------+------+-----+---------+-------+

-- 5) Para eliminar un atributo de una tabla.
alter table comprador drop descripcion;
Query OK, 0 rows affected (0.556 sec)
Records: 0  Duplicates: 0  Warnings: 0
+--------------+-------------+------+-----+---------+-------+
| Field        | Type        | Null | Key | Default | Extra |
+--------------+-------------+------+-----+---------+-------+
| idcomprador  | int(3)      | NO   | PRI | NULL    |       |
| nomcomprador | varchar(50) | NO   |     | NULL    |       |
| edad         | int(3)      | NO   |     | NULL    |       |
+--------------+-------------+------+-----+---------+-------+

-- 6) Añadir una tupla o campo a la tabla. 
insert into comprador values(4, "David", 23);

-- 7) Modificar los datos del campo 4. Igualar el nombre a Julieta. 
update comprador set nomcomprador = "Julieta"
where idcomprador=4;

-- 8) Modificar todos los datos del campo 4. Igualar a (Monica, 26). 
update comprador set nomcomprador = "Monica", edad = 26
where idcomprador = 4;

-- 9) Modificar todos los campos que tengan edad 26 pero no sean idcomprador=4.
update comprador set nomcomprador="Franco"
where edad=26 and not idcomprador=4;
+-------------+--------------+------+
| idcomprador | nomcomprador | edad |
+-------------+--------------+------+
|           1 | Maria        |   20 |
|           2 | Juan         |   22 |
|           3 | Laura        |   24 |
|           4 | Monica       |   26 |
|           5 | Franco       |   26 |
+-------------+--------------+------+

-- 10) Eliminar id 3 de la tabla comprador. 
delete from comprador
where idcomprador=3;
+-------------+--------------+------+
| idcomprador | nomcomprador | edad |
+-------------+--------------+------+
|           1 | Maria        |   20 |
|           2 | Juan         |   22 |
|           4 | Monica       |   26 |
|           5 | Franco       |   26 |
+-------------+--------------+------+

-- ALTER TABLE => Añadir o redefinir una columna.
-- DROP table => Eliminar una tabla.
-- INSERT => Añadir una fila. Añadir un campo.
-- DELETE => Eliminar una fila. Eliminar un campo.
-- UPDATE => Modificar una fila. Actualizar un campo.