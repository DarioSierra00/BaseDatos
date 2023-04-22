--1
BEGIN
	 IF 10 > 5 THEN
	  DBMS_OUTPUT.PUT_LINE ('Cierto');
	 ELSE
	  DBMS_OUTPUT.PUT_LINE ('Falso');
	 END IF;
END;
--Salida esperada: cierto
--Resultado obtenido: cierto

--2
BEGIN
	IF 10 > 5 AND 5 > 1 THEN
	 DBMS_OUTPUT.PUT_LINE ('Cierto');
	ELSE
	 DBMS_OUTPUT.PUT_LINE ('Falso');
	END IF;
END;

--Salida esperada: cierto
--Resultado obtenido: cierto

--3

BEGIN
	IF 10 > 5 AND 5 > 50 THEN
	 DBMS_OUTPUT.PUT_LINE ('Cierto');
	ELSE
	 DBMS_OUTPUT.PUT_LINE ('Falso');
	END IF;
END;

--Salida esperada: falso
--Resultado obtenido: falso

--4

BEGIN
	CASE
	 WHEN 10 > 5 AND 5 > 50 THEN
	 DBMS_OUTPUT.PUT_LINE ('Cierto');
	 ELSE
	 DBMS_OUTPUT.PUT_LINE ('Falso');
	END CASE;
END;

--Salida esperada: falso
--Resultado obtenido: falso

--5

BEGIN
	 FOR i IN 1..10 LOOP
	  DBMS_OUTPUT.PUT_LINE (i);
	 END LOOP;
END;

--Salida esperada: 1,2,3,4,5,6,7,8,9,10
--Resultado obtenido: 1,2,3,4,5,6,7,8,9,10

--6

BEGIN
	 FOR i IN REVERSE 1..10 LOOP
	  DBMS_OUTPUT.PUT_LINE (i);
	 END LOOP;
END;

--Salida esperada: 10,9,8,7,6,5,4,3,2,1
--Resultado obtenido: 10,9,8,7,6,5,4,3,2,1

--7

DECLARE
 num NUMBER(3) := 0;
BEGIN
	 WHILE num<=100 LOOP
	  DBMS_OUTPUT.PUT_LINE (num);
	  num:= num+2;
	 END LOOP;
END;

--Salida esperada: 0,2,4,6..100
--Resultado obtenido: 0,2,4,6..100

--8

DECLARE
 num NUMBER(3) := 0;
BEGIN
	 LOOP
	  DBMS_OUTPUT.PUT_LINE (num);
	 IF num > 100 THEN EXIT; END IF;
	  num:= num+2;
	 END LOOP;
END;

--Salida esperada: 0,2,4,6..100
--Resultado obtenido: 0,2,4,6..100

--9

DECLARE
 num NUMBER(3) := 0;
BEGIN
	 LOOP
	  DBMS_OUTPUT.PUT_LINE (num);
	 EXIT WHEN num > 100;
	  num:= num+2;
	 END LOOP;
END;

--Salida esperada: 0,2,4,6..100
--Resultado obtenido: 0,2,4,6..100