--1. Crea un procedimiento llamado ESCRIBE para mostrar por pantalla el
--mensaje HOLA MUNDO.
CREATE OR REPLACE 
PROCEDURE Escribe IS 
BEGIN 
	dbms_output.put_line('HOLA MUNDO');
END;

BEGIN
	Escribe;
END;

--2. Crea un procedimiento llamado ESCRIBE_MENSAJE que tenga un
--parámetro de tipo VARCHAR2 que recibe un texto y lo muestre por pantalla.
--La forma del procedimiento ser. la siguiente:
--ESCRIBE_MENSAJE (mensaje VARCHAR2)
CREATE OR REPLACE 
PROCEDURE Escribe_Mensaje (mensaje Varchar2) IS 
BEGIN 
	dbms_output.put_line(mensaje);
END;

BEGIN
	Escribe_Mensaje('Currito');
END;


--3. Crea un procedimiento llamado SERIE que muestre por pantalla una serie de
--números desde un mínimo hasta un máximo con un determinado paso. La
--forma del procedimiento ser. la siguiente:
--SERIE (minimo NUMBER, maximo NUMBER, paso NUMBER)
CREATE OR REPLACE 
PROCEDURE serie (minimo NUMBER, maximo NUMBER, paso number) IS 
BEGIN 
	FOR paso IN minimo..maximo LOOP 
		IF ((paso+paso)<=maximo) THEN 
		dbms_output.put_line(paso+paso);
	END IF;
	END LOOP;
END;

BEGIN
	serie (1,100,2);
END;



--4. Crea una función AZAR que reciba dos parámetros y genere un número al
--azar entre un mínimo y máximo indicado. La forma de la función será la
--siguiente:
--AZAR (minimo NUMBER, maximo NUMBER) RETURN NUMBER

CREATE OR REPLACE 
FUNCTION AZAR(minimo NUMBER, maximo NUMBER)
RETURN NUMBER 
IS 
BEGIN 
	RETURN TRUNC(dbms_random.VALUE(minimo,maximo)); 
END AZAR;

SELECT AZAR(2,10) FROM DUAL;

--5. Crea una función NOTA que reciba un parámetro que será una nota numérica
--entre 0 y 10 y devuelva una cadena de texto con la calificación (Suficiente,
--Bien, Notable, ...). La forma de la función será la siguiente:
--NOTA (nota NUMBER) RETURN VARCHAR2


CREATE OR REPLACE FUNCTION NOTA (NOTA NUMBER)
RETURN VARCHAR2
IS 
BEGIN 
	IF  nota = 10 OR nota = 9 THEN
	    DBMS_OUTPUT.PUT_LINE('Sobresaliente');
	  ELSIF nota = 8 OR nota = 7 THEN
	    DBMS_OUTPUT.PUT_LINE('Notable');
	  ELSIF nota = 6 THEN
	    DBMS_OUTPUT.PUT_LINE('Bien');
	  ELSIF nota = 5 THEN
	    DBMS_OUTPUT. PUT_LINE('Suficiente');
	  ELSIF nota < 5 AND nota >=0 THEN
	    DBMS_OUTPUT.PUT_LINE('Insuficiente');
	  ELSE
	    DBMS_OUTPUT.PUT_LINE('Nota no válida');
	  END IF;
END;

SELECT NOTA(7) FROM DUAL;
