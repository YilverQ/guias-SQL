-- Archivo Guia Bases De Datos I.sql

Comandos DDL: Permite crear y definir nuevas bases de datos, campos e indices.
{
	CREATE: Crea nuevas tablas, campos e indices. 
	DROP: Empleado para eliminar tablas e indices.
	ALTER: Utilizado para modificar tablas agregando o cambiando la definición de los datos.
}

Comando DML: Permite generar consultas para ordenar, filtrar y extraer datos.
{
	SELECT: Utilizado para consultar registro que sastifagan un criterio.
	INSERT: Utilizado para cargar datos. 
	UPDATE: Utilizado para modificar campos y registros.
	DELETE: Utilizado para eliminar registros.
}

Clausulas
{
	FROM: Utilizada para especificar la tabla que se va a seleccionar los registros.
	WHERE: Utilizada para especificar las condiciones que debe reunir los registros.
	GROUP BY: Utilizadas para separar los registros seleccionados en grupos.
	ORDER BY: Utilizadas para ordenar los registros seleccionados. (ASC and DESC).
	HAVING: Utilizada para especificar la condición que debe seguir cada grupo.
}

Funciones de Agregado
{
	AVG: Calcular el promedio.
	COUNT: Cuenta el número de registros.
	SUM: Una suma de todos los valores.
	MAX: Devuelve el máximo valor.
	MIN: Devuelve el valor minimo.
}

Consultas con predicado
{
	ALL or *: Devuelve todos los campos de una tabla.
	TOP: devuleve un número determinado de item.
	DISTINCT: Omite registros cuyo campos seleccionados coincidan totalmente.
	DISTINCROW: Omite los registros duplicados.
}