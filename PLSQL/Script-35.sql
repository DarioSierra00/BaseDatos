--1
CREATE OR REPLACE 
PACKAGE BODY ARITMETICA IS 
	
	PROCEDURE mostrar_info IS
  BEGIN
    DBMS_OUTPUT.PUT_LINE
      ('Paquete de operaciones aritméticas. Versión ' || version);
  END mostrar_info;

  FUNCTION suma       (a NUMBER, b NUMBER) RETURN NUMBER IS
  BEGIN
    RETURN (a+b);
  END suma;

  FUNCTION resta      (a NUMBER, b NUMBER) RETURN NUMBER IS
  BEGIN
    RETURN (a-b);
  END resta;

  FUNCTION multiplica (a NUMBER, b NUMBER) RETURN NUMBER IS
  BEGIN
    RETURN (a*b);
  END multiplica;

  FUNCTION divide     (a NUMBER, b NUMBER) RETURN NUMBER IS
  BEGIN
    RETURN (a/b);
  END divide;
 
FUNCTION RESTO (A NUMBER, B NUMBER) RETURN NUMBER IS
  BEGIN 
      RETURN MOD(A,B);
  END RESTO;

PROCEDURE AYUDA
IS
BEGIN
	DBMS_OUTPUT.PUT_LINE('Función suma, 2+2=4');
	DBMS_OUTPUT.PUT_LINE('Función resta, 4-2=2');
	DBMS_OUTPUT.PUT_LINE('Función multiplicacion, 3*3=9');
	DBMS_OUTPUT.PUT_LINE('Función division, 10/2=5');
	DBMS_OUTPUT.PUT_LINE('Función resto, 11%2=1');
END AYUDA;
END aritmetica;


BEGIN
  ARITMETICA.MOSTRAR_INFO;
END;

SELECT ARITMETICA.suma(4,5) FROM DUAL;
SELECT ARITMETICA.resta(5,3) FROM DUAL;
SELECT ARITMETICA.MULTIPLICA(2,3) FROM DUAL;
SELECT ARITMETICA.DIVIDE(6,2) FROM DUAL;
SELECT ARITMETICA.RESTO(6,4) FROM DUAL;
BEGIN
	ARITMETICA.AYUDA;
END;


---------------------------------------------------------------




	
