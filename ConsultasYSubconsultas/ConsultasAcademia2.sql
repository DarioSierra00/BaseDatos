--    1. Para cada titulación ordenar por coste mostrando primero las asignaturas más caras 
--y para las asignaturas del mismo coste mostrar por orden alfabético de nombre de asignatura. 
SELECT T.*,A.NOMBRE ,A.COSTEBASICO 
FROM ASIGNATURA a, TITULACION t 
WHERE A.IDTITULACION  = T.IDTITULACION 
ORDER BY COSTEBASICO DESC;


--    2. Mostrar el nombre y los apellidos de los profesores. 
SELECT PE.NOMBRE, PE.APELLIDO  
FROM PERSONA pe , PROFESOR p 
WHERE PE.DNI = P.DNI;


--    3. Mostrar el nombre de las asignaturas impartidas por profesores de Sevilla. 
SELECT a.NOMBRE 
FROM ASIGNATURA a , PROFESOR p , PERSONA p2 
WHERE A.IDPROFESOR = P.IDPROFESOR 
AND P.DNI = P2.DNI
AND p2.CIUDAD LIKE 'Sevilla';

--    4. Mostrar el nombre y los apellidos de los alumnos.
SELECT P.NOMBRE 
FROM PERSONA p ,ALUMNO a 
WHERE P.DNI = A.DNI;

--    5. Mostrar el DNI, nombre y apellidos de los alumnos que viven en Sevilla. 
SELECT P.DNI ,P.NOMBRE, P.APELLIDO 
FROM PERSONA p ,ALUMNO a 
WHERE P.DNI = A.DNI 
AND CIUDAD LIKE 'Sevilla';

--    6. Mostrar el DNI, nombre y apellidos de los alumnos matriculados en la asignatura "Seguridad Vial". 
SELECT p.DNI, p.NOMBRE , p.APELLIDO 
FROM ASIGNATURA a , ALUMNO_ASIGNATURA aa ,ALUMNO a2 ,PERSONA p 
WHERE A.IDASIGNATURA = AA.IDASIGNATURA 
AND AA.IDALUMNO = A2.IDALUMNO AND A2.DNI = P.DNI
AND A.NOMBRE LIKE 'Seguridad Vial';

--    7. Mostrar el Id de las titulaciones en las que está matriculado el alumno con DNI 20202020A. 
--Un alumno está matriculado en una titulación si está matriculado en una asignatura de la titulación.
SELECT T.IDTITULACION 
FROM TITULACION t , ASIGNATURA a , ALUMNO_ASIGNATURA aa , ALUMNO a2 
WHERE T.IDTITULACION = A.IDTITULACION AND A.IDASIGNATURA  = AA.IDASIGNATURA 
AND AA.IDALUMNO = A2.IDALUMNO AND A2.DNI LIKE '20202020A';

--    8. Obtener el nombre de las asignaturas en las que está matriculada Rosa Garcia.
SELECT A.NOMBRE
FROM ASIGNATURA a , ALUMNO_ASIGNATURA aa , ALUMNO a2 , PERSONA p 
WHERE A. IDASIGNATURA = AA.IDASIGNATURA AND AA.IDALUMNO = A2.IDALUMNO 
AND A2.DNI = P.DNI AND P.NOMBRE LIKE 'Rosa' AND P.APELLIDO LIKE 'Garcia';

--    9. Obtener el DNI de los alumnos a los que le imparte clase el profesor Jorge Saenz. 
SELECT A.DNI
FROM ALUMNO a ,ALUMNO_ASIGNATURA aa ,ASIGNATURA a2 ,PROFESOR p ,PERSONA p2
WHERE A.IDALUMNO =AA.IDALUMNO
AND AA.IDASIGNATURA =A2.IDASIGNATURA
AND A2.IDPROFESOR = P.IDPROFESOR
AND P.DNI = P2.DNI
AND P2.NOMBRE LIKE 'Jorge'
AND P2.APELLIDO LIKE 'Saenz';

--    10. Obtener el DNI, nombre y apellido de los alumnos a los que imparte clase el profesor Jorge Sáenz. 
SELECT P2.DNI , P2.NOMBRE , P2.APELLIDO 
FROM ALUMNO a ,ALUMNO_ASIGNATURA aa ,ASIGNATURA a2 ,PROFESOR p ,PERSONA p2
WHERE A.IDALUMNO =AA.IDALUMNO
AND AA.IDASIGNATURA =A2.IDASIGNATURA
AND A2.IDPROFESOR = P.IDPROFESOR
AND P.DNI = P2.DNI
AND P2.NOMBRE LIKE 'Jorge'
AND P2.APELLIDO LIKE 'Saenz';

--    11. Mostrar el nombre de las titulaciones que tengan al menos una asignatura de 4 créditos. 
SELECT T.NOMBRE 
FROM TITULACION t , ASIGNATURA a 
WHERE T.IDTITULACION = A.IDTITULACION 
AND A.CREDITOS >=4;

--    12. Mostrar el nombre y los créditos de las asignaturas del primer cuatrimestre 
--junto con el nombre de la titulación a la que pertenecen. 
SELECT A.NOMBRE , A.CREDITOS , T.NOMBRE 
FROM TITULACION t , ASIGNATURA a 
WHERE T.IDTITULACION = A.IDTITULACION 
AND A.CUATRIMESTRE = 1;

--    13. Mostrar el nombre y el coste básico de las asignaturas de más de 4,5 créditos 
--junto con el nombre de las personas matriculadas
SELECT A.NOMBRE , A.CREDITOS , P.NOMBRE 
FROM ASIGNATURA a , ALUMNO_ASIGNATURA aa , ALUMNO a2 , PERSONA p 
WHERE A.IDASIGNATURA = AA.IDASIGNATURA  AND AA.IDALUMNO = A2.IDALUMNO 
AND A2.DNI = P.DNI AND A.CREDITOS > 4;

--    14. Mostrar el nombre de los profesores que imparten asignaturas con coste entre 25 y 35 euros,
-- ambos incluidos
SELECT P2.NOMBRE 
FROM PROFESOR p , ASIGNATURA a , PERSONA p2 
WHERE P2.DNI = P.DNI 
AND P.IDPROFESOR = A.IDPROFESOR
AND A.COSTEBASICO BETWEEN 25 AND 35;

--    15. Mostrar el nombre de los alumnos matriculados en la asignatura '150212' ó en la '130113' 
--ó en ambas.
SELECT P.NOMBRE 
FROM PERSONA p , ALUMNO a , ALUMNO_ASIGNATURA aa , ASIGNATURA a2 
WHERE P.DNI = A.DNI AND A.IDALUMNO = AA.IDALUMNO 
AND AA.IDASIGNATURA = A2.IDASIGNATURA 
AND (A2.IDASIGNATURA LIKE '150212' OR A2.IDASIGNATURA LIKE '130113') OR (A2.IDASIGNATURA LIKE '150212' AND A2.IDASIGNATURA LIKE '130113');

--    16. Mostrar el nombre de las asignaturas del 2º cuatrimestre que no sean de 6 créditos, 
--junto con el nombre de la titulación a la que pertenece.
SELECT A.NOMBRE , T.NOMBRE 
FROM ASIGNATURA a ,TITULACION t 
WHERE T.IDTITULACION = A.IDTITULACION 
AND A.CUATRIMESTRE = 2 AND A.CREDITOS !=6;


--    17. Mostrar el nombre y el número de horas de todas las asignaturas. (1cred.=10 horas) 
--junto con el dni de los alumnos que están matriculados.
SELECT A2.DNI ,A.NOMBRE , A.CREDITOS*10 AS HORAS
FROM ASIGNATURA a ,ALUMNO_ASIGNATURA aa ,ALUMNO a2 
WHERE A.IDASIGNATURA = AA.IDASIGNATURA 
AND AA.IDALUMNO = A2.IDALUMNO;

--    18. Mostrar el nombre de todas las mujeres que viven en “Sevilla” y que 
--estén matriculados de alguna asignatura
SELECT p.NOMBRE 
FROM ALUMNO_ASIGNATURA aa , ALUMNO a, PERSONA p 
WHERE AA.IDALUMNO = A.IDALUMNO AND A.DNI = P.DNI 
AND P.CIUDAD LIKE 'Sevilla' AND P.VARON =0
AND aa.NUMEROMATRICULA > 0;


--    19. Mostrar el nombre de la asignatura de primero y que lo imparta el profesor con identificador p101.
SELECT A.NOMBRE 
FROM ASIGNATURA a , PROFESOR p 
WHERE A.IDPROFESOR = P.IDPROFESOR 
AND P.IDPROFESOR = 'p101'
AND A.CURSO =1;

--    20. Mostrar el nombre de los alumnos que se ha matriculado tres o más veces en alguna asignatura.
SELECT p.NOMBRE 
FROM PERSONA p ,ALUMNO a ,ALUMNO_ASIGNATURA aa 
WHERE P.DNI = A.DNI 
AND AA.IDALUMNO = A.IDALUMNO 
AND AA.NUMEROMATRICULA >2;



