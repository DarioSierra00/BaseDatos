--Obtener el título de la película, la fecha y el nombre del director 
--de las películas en las que su director haya trabajado alguna vez 
--como también como actor o actriz principal o secundaria .
SELECT  DISTINCT P.TITULO_P ,P2.FECHA_ESTRENO ,T.NOMBRE_PERSONA
FROM PELICULA p ,PROYECCION p2 ,TRABAJO t ,TRABAJO t2
WHERE P.CIP=P2.CIP
AND P.CIP = T.CIP
AND T.TAREA LIKE 'Director'
AND T2.TAREA LIKE 'Actor %';


SELECT * 
FROM TRABAJO t ;

--Mostrar todos los datos de las películas que el total de su 
--recaudación sea superior a 700 veces el número de espectadores 
--que han visto la película
SELECT *
FROM PELICULA p , PROYECCION p2 
WHERE P.CIP = P2.CIP 
AND P2.RECAUDACION > (P2.ESPECTADORES*700);


--Crear una sentencia SQL para obtener todas las salas 
--(nombre del cine y de la sala) que han estrenado películas 
--escocesas (nacionalidad Escocia) en el periodo comprendido 
--entre dos meses antes del 7 de diciembre del año 1996.
SELECT P.CINE , P.SALA 
FROM PROYECCION p , PELICULA p2 
WHERE P.CIP = P2.CIP 
AND P2.NACIONALIDAD LIKE 'Escocia'
AND P.FECHA_ESTRENO BETWEEN TO_DATE('07/10/1996', 'DD/MM/YYYY') AND TO_DATE('07/12/1996', 'DD/MM/YYYY'); 




