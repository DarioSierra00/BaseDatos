--1. Realiza un procedimiento que reciba un número de departamento y muestre por pantalla su
--nombre y localidad.
CREATE OR REPLACE PROCEDURE EJERCICIO1(DEPT NUMBER)
AS 
	NOMBRE VARCHAR2(30);
	LOCALIDAD VARCHAR2(35);
BEGIN 
	SELECT D.DNAME ,D.LOC INTO NOMBRE,LOCALIDAD
	FROM DEPT d
	WHERE D.DEPTNO = DEPT;
	DBMS_OUTPUT.PUT_LINE('Nombre' || NOMBRE);
	DBMS_OUTPUT.PUT_LINE('Localidad' || LOCALIDAD);
END;

BEGIN
	EJERCICIO1(10);
END;

--2. Realiza una función devolver_sal que reciba un nombre de departamento y devuelva la suma
--de sus salarios.
CREATE OR REPLACE FUNCTION EJER2(DEPT VARCHAR2)
RETURN NUMBER
AS 
	SUMA_SALARIO NUMBER;
BEGIN
	SELECT SUM(E.SAL) INTO SUMA_SALARIO
	FROM EMP E, DEPT D
	WHERE E.DEPTNO = D.DEPTNO 
	AND D.DNAME = DEPT;
	RETURN SUMA_SALARIO;
END;

SELECT EJER2('ACCOUNTING') FROM DUAL;

--3. Realiza un procedimiento MostrarAbreviaturas que muestre las tres primeras letras del
--nombre de cada empleado.
CREATE OR REPLACE PROCEDURE MostrarAbreviaturas
AS
	CURSOR C_ABREVIATURA IS 
	SELECT E.ENAME 
	FROM EMP E;
BEGIN
	FOR NOMBRE IN C_ABREVIATURA
	LOOP
		DBMS_OUTPUT.PUT_LINE('NOMBRE ' || SUBSTR(NOMBRE.ENAME,3));
	END LOOP;
END;

BEGIN
	MostrarAbreviaturas;
END;

--4. Realiza un procedimiento que reciba un número de departamento y muestre una lista de sus
--empleados.
CREATE OR REPLACE PROCEDURE EJER4(DEPT NUMBER)
AS 
CURSOR C_EJER4 IS 
	SELECT E.ENAME 
	FROM EMP E
	WHERE E.DEPTNO = DEPT;
BEGIN
	FOR I IN C_EJER4
	LOOP
		DBMS_OUTPUT.PUT_LINE('EMPLEADO ' || I.ENAME);
	END LOOP;
END;

BEGIN
	EJER4(10);
END;

--5. Realiza un procedimiento MostrarJefes que reciba el nombre de un departamento y muestre
--los nombres de los empleados de ese departamento que son jefes de otros empleados.Trata las
--excepciones que consideres necesarias.
CREATE OR REPLACE PROCEDURE MostrarJefes(NOMB VARCHAR2)
AS 
CURSOR C_MostrarJefes IS 
	SELECT E.ENAME 
	FROM EMP E,EMP E1, DEPT D
	WHERE E.EMPNO = E1.MGR 
	AND E.DEPTNO = D.DEPTNO 
	AND E1.DEPTNO = D.DEPTNO 
	AND D.DNAME = NOMB;
BEGIN
	FOR I IN C_MostrarJefes
	LOOP
		DBMS_OUTPUT.PUT_LINE('NOMBRE ' || I.ENAME);
	END LOOP;
END;

BEGIN
	MostrarJefes('ACCOUNTING');
END;

--6. Hacer un procedimiento que muestre el nombre y el salario del empleado cuyo código es
--7082
CREATE OR REPLACE PROCEDURE EJER6
AS 
	NOMBRE EMP.ENAME%TYPE;
	SALARIO EMP.SAL%TYPE;
	NODATA EXCEPTION;
BEGIN
	SELECT E.ENAME , E.SAL INTO NOMBRE, SALARIO
	FROM EMP e 
	WHERE E.EMPNO = 7082;
		IF NOMBRE IS NULL OR SALARIO = 0 THEN
			RAISE NODATA;
		ELSE
			DBMS_OUTPUT.PUT_LINE('Nombre: ' || NOMBRE || ' salario: ' || SALARIO);
		END IF;
		EXCEPTION WHEN NODATA OR NO_DATA_FOUND THEN
			DBMS_OUTPUT.PUT_LINE('ERROR EMPLEADO NO EXISTENTE');
END;

BEGIN
	EJER6;
END;

--7. Realiza un procedimiento llamado HallarNumEmp que recibiendo un nombre de
--departamento, muestre en pantalla el número de empleados de dicho departamento
--Si el departamento no tiene empleados deberá mostrar un mensaje informando de ello. Si el
--departamento no existe se tratará la excepción correspondiente.
CREATE OR REPLACE PROCEDURE HallarNumEmp(NOMB VARCHAR2)
AS 
	NUM_EMPLE NUMBER;
	NODATA EXCEPTION;
BEGIN
	SELECT COUNT(E.EMPNO) INTO NUM_EMPLE
	FROM DEPT d , EMP e 
	WHERE D.DEPTNO = E.DEPTNO 
	AND D.DNAME = NOMB;
	IF NUM_EMPLE = 0 THEN 
		RAISE NODATA;
	ELSE
		DBMS_OUTPUT.PUT_LINE('El departamento ' || NOMB || ' tiene ' || NUM_EMPLE || ' empleados');
	END IF;
	EXCEPTION WHEN NODATA OR NO_DATA_FOUND THEN 
		DBMS_OUTPUT.PUT_LINE('ERROR, NO HAY EMPLEADOS');
END;

BEGIN
	HallarNumEmp('ACCOUNTING');
END;

--8. Hacer un procedimiento que reciba como parámetro un código de empleado y devuelva su
--nombre.
CREATE OR REPLACE PROCEDURE EJER8(COD NUMBER)
AS 
	NOMBRE EMP.ENAME%TYPE;
	NODATA EXCEPTION;
BEGIN
	SELECT E.ENAME INTO NOMBRE
	FROM EMP e
	WHERE E.EMPNO = COD;
	IF COD IS NULL OR COD LIKE '' THEN
		RAISE NODATA;
	ELSE
		DBMS_OUTPUT.PUT_LINE(NOMBRE);
	END IF;
	EXCEPTION WHEN NODATA OR NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE('ERROR, INTRODUCE UN DATO');
END;

BEGIN
	EJER8(7369);
END;

--9. Codificar un procedimiento que reciba una cadena y la visualice al revés.
--10. Escribir un procedimiento que reciba una fecha y escriba el año, en número, correspondiente a
--esa fecha.
--11. Realiza una función llamada CalcularCosteSalarial que reciba un nombre de departamento y
--devuelva la suma de los salarios y comisiones de los empleados de dicho departamento.
--12. Codificar un procedimiento que permita borrar un empleado cuyo número se pasará en la
--llamada. Si no existiera dar el correspondiente mensaje de error.
--13. Realiza un procedimiento MostrarCostesSalariales que muestre los nombres de todos los
--departamentos y el coste salarial de cada uno de ellos
--14. Escribir un procedimiento que modifique la localidad de un departamento. El procedimiento
--recibirá como parámetros el número del departamento y la localidad nueva.
--15. Realiza un procedimiento MostrarMasAntiguos que muestre el nombre del empleado más
--antiguo de cada departamento junto con el nombre del departamento. Trata las excepciones
--que consideres necesarias.