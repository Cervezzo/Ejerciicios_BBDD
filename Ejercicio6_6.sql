source tema6.sql;

-- Ejercicio 1
/* 
SELECT m.NIF, a.Descripción, m.Nota, m.Fecha 
FROM Matrícula m, Asignatura a 
WHERE m.Cod_Asig = a.Código 
ORDER BY m.Nota ASC;
 */
SELECT m.NIF, a.Descripción, m.Nota, m.Fecha 
FROM Matrícula m INNER JOIN Asignatura a ON m.Cod_Asig = a.Código
ORDER BY m.Nota ASC;



-- Ejercicio 2
/* 
SELECT a.Descripción, m.Nota*0.95 "Nueva Nota" 
FROM Asignatura a, Matrícula m 
WHERE m.Cod_Asig = a.Código;
 */

SELECT a.Descripción, m.Nota*0.95 "Nueva Nota" 
FROM Matrícula m INNER JOIN Asignatura a ON m.Cod_Asig = a.Código;


-- Ejercicio 3
/* 
SELECT a.Descripción, m.Nota*0.95 "Nueva Nota" 
FROM Asignatura a, Matrícula m 
WHERE a.Código = 3; -- mejor comprobar con descripción
 */
SELECT a.Descripción, m.Nota*0.95 "Nueva Nota" 
FROM Matrícula m INNER JOIN Asignatura a ON m.Cod_Asig = a.Código
WHERE a.Descripción = "Informatica"; 

-- Ejercicio 4
/* 
SELECT m.*  
FROM Matrícula m, Asignatura a 
WHERE m.Fecha >= "2016-07-01" 
    AND Descripción LIKE "Biología"; */

SELECT m.*  
FROM Matrícula m INNER JOIN Asignatura a ON m.Cod_Asig = a.Código
WHERE m.Fecha >= "2016-07-01" 
    AND Descripción LIKE "Biología";

-- Ejercicio 5
/* 
SELECT m.NIF, a.Descripción, a.Curso, m.Nota, m.Fecha 
FROM Matrícula m, Asignatura a 
WHERE m.Cod_Asig = a.Código 
    AND m.Fecha >= "2016-07-01" 
    AND Descripción LIKE "Biología"; */


SELECT m.NIF, a.Descripción, a.Curso, m.Nota, m.Fecha 
FROM Matrícula m INNER JOIN Asignatura a ON m.Cod_Asig = a.Código
    WHERE m.Fecha >= "2016-07-01" 
    AND a.Descripción LIKE "Biología";

-- Ejercicio 6
/* 
SELECT al.NIF, CONCAT_WS(" ",al.Nombre, al.Apellido1, al.Apellido2) "Nombre Completo", AVG(m.Nota) "Nota Media" 
FROM Matrícula m, Alumno al 
WHERE al.NIF = m.NIF 
GROUP BY al.NIF; */


SELECT al.NIF, CONCAT_WS(" ",al.Nombre, al.Apellido1, al.Apellido2) "Nombre Completo", AVG(m.Nota) "Nota Media" 
FROM Matrícula m NATURAL jOIN Alumno al 
GROUP BY al.NIF;

-- Ejercicio 7

/* SELECT a.Descripción, m.Fecha 
FROM Matrícula m, Asignatura a, Alumno al
WHERE m.Cod_Asig = a.Código AND al.NIF = m.NIF AND al.Nombre LIKE "Elías" 
ORDER BY m.Fecha DESC; */


SELECT a.Descripción, m.Fecha 
FROM Matrícula m NATURAL JOIN Alumno al
INNER JOIN Asignatura a ON m.Cod_Asig = a.Código
WHERE al.Nombre LIKE "Elías" 
ORDER BY m.Fecha DESC;


-- Ejercicio 8

/* SELECT al.Nombre 
FROM Alumno al, Matrícula m 
WHERE al.NIF = m.NIF 
GROUP BY m.NIF 
HAVING AVG(m.Nota) >= 6; */

SELECT al.Nombre 
FROM Matrícula m NATURAL jOIN Alumno al 
GROUP BY m.NIF 
HAVING AVG(m.Nota) >= 6;


-- Ejercicio 9

SELECT m.* 
FROM Matrícula m, Asignatura a 
WHERE m.Cod_Asig = a.Código 
    AND a.Curso = "3-ESO" 
ORDER BY Nota DESC;

-- Ejercicio 10

SELECT m.* 
FROM Matrícula m, Asignatura a 
WHERE m.Cod_Asig = a.Código 
    AND a.Departamento = "MAT"  
    AND m.Nota > 5.5;

-- Ejercicio 11

SELECT al.Nombre, a.Descripción, m.Nota, m.Fecha 
FROM Alumno al, Matrícula m, Asignatura a 
WHERE m.Cod_Asig = a.Código 
    AND m.NIF = al.NIF 
    AND m.Nota < 5;

-- Ejercicio 12

SELECT a.Departamento, AVG(m.Nota) "Nota Media" 
FROM Matrícula m, Asignatura a 
WHERE m.Cod_Asig = a.Código 
GROUP BY a.Departamento 
    ORDER BY AVG(m.Nota);

-- Ejercicio 13

SELECT al.Nombre, COUNT(m.NIF) 
FROM Matrícula m, Alumno al 
WHERE m.NIF = al.NIF 
GROUP BY m.NIF 
    ORDER BY al.Nombre;


-- Ejercicio 14

SELECT 
    UPPER(CONCAT_WS(" ",al.Nombre,al.Apellido1,al.Apellido2)) Nombre_Completo, 
    MAX(m.Nota) "Nota Máxima" 
FROM Matrícula m, Alumno al 
WHERE al.NIF = m.NIF 
GROUP BY Nombre_Completo 
    ORDER BY MAX(m.Nota) DESC
    LIMIT 1;


-- Ejercicio 15

SELECT m.NIF, a.Descripción, m.Nota, m.Fecha 
FROM Matrícula m, Asignatura a 
WHERE m.Cod_Asig = a.Código 
    AND ISNULL(a.Departamento);

-- Ejercicio 16

SELECT CONCAT_WS(" ",al.Nombre,al.Apellido1,al.Apellido2) AS "Nombre Completo", a.Descripción, m.Nota, m.Fecha 
FROM Matrícula m, Asignatura a, Alumno al 
WHERE m.Cod_Asig = a.Código 
    AND al.NIF = m.NIF 
    AND ISNULL(a.Departamento);
