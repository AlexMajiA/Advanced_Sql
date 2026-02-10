-- Crear una tabla de forma directa. Se especifica el nombre de la tabla y el nombre, tipo y restricciones de cada una de sus columnas.
CREATE OR REPLACE TABLE IF NOT EXISTS personas(
    id_per INT,
    nombre VARCHAR(255),
    apellido1 VARCHAR(255),
    apellido2 VARCHAR(255),
    id_dep INT,
    salario INT
    );

--Insertar datos en la tabla
INSERT INTO personas (id_per, nombre, apellido1, apellido2, id_dep, salario) 
    VALUES
        (1,'Antonio','Pérez','Gómez', 1, 30000),
        (2, 'Antonio','García','Rodríguez', 2, 18000),
        (3,'Pedro', 'Ruíz', 'González', 2, 26000);

SELECT * FROM personas;

-- Crear una tabla a partir de otra ya existente. Se especifica el nombre de la tabla y la query con la información especifica.
CREATE TABLE personas2 AS
SELECT * FROM personas;

SELECT * FROM personas2;

-- Agregar una columna nueva a una tabla ya creada.
ALTER TABLE personas ADD antiguedad_mes INT DEFAULT NULL;

-- Modificar una columna de una tabla (nombre VARCHAR(50)).

-- Eliminar una columna de una tabla (antiguedad_mes).

-- Devuelve las columnas especificadas en la selección de lista (nombre y apellido1).

-- Devuelve las filas únicas, es decir, elimina las filas duplicadas de los resultados de la consulta (tabla personas).

-- Devuelve las columnas especificadas en la selección de lista asignándole el nombre especificado en el alias (nombre a nombre_cliente).

--Devuelve el número de registros indicado (1).

-- Obtener todos los empleados que pertenecen al departamento 1.

-- Obtener los empleados cuyo id_pep sea 2 y cuyo nombre sea Antonio.

-- Obtener los empleados cuyo id_pep sea 1 o cuyo nombre sea Pedro.

-- Obtener los empleados cuyo nombre no sea Antonio.

-- Obtener los empleados cuyo nombre empiece por la letra A.

-- Obtener los empleados cuyo primer apellido tenga cuatro letras y empiece por “Ru”.

-- Obtener los empleados que pertenezcan al departamento 1 o 2.

-- Obtener los empleados cuyo nombre esté incluido en la tabla personas_luxemburgo.

-- Mostrar todos los registros de la tabla personas.

-- Agrupar los empleados por departamento y mostrar los resultados ordenados de forma ascendente por id_dep.

-- Calcular el salario medio, el salario máximo, el salario mínimo y el número total de empleados.

-- Mostrar los grupos cuya suma total de saldo sea superior a 30000.

-- Mostrar el nombre y apellido1 de cada empleado, indicando el nombre del departamento según su id_pep (Administración, Informática o No informado).

-- Modificar el nombre del departamento con id_dep igual a 1, asignándole el valor “Comercial”.

-- Unir los registros de tableA y tableB eliminando los duplicados.

-- Unir los registros de tableA y tableB incluyendo los registros duplicados.





-- Eliminar de la tabla personas el empleado cuyo id_per sea 1.

