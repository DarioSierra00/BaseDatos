CREATE OR REPLACE
PACKAGE aritmetica IS
  version NUMBER := 1.0;

  PROCEDURE mostrar_info;
  FUNCTION suma       (a NUMBER, b NUMBER) RETURN NUMBER;
  FUNCTION resta      (a NUMBER, b NUMBER) RETURN NUMBER;
  FUNCTION multiplica (a NUMBER, b NUMBER) RETURN NUMBER;
  FUNCTION divide     (a NUMBER, b NUMBER) RETURN NUMBER;
 FUNCTION RESTO (A NUMBER, B NUMBER) RETURN NUMBER;
PROCEDURA AYUDA;
END aritmetica;

