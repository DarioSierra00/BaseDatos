CREATE OR REPLACE
PACKAGE GESTION AS
 PROCEDURE CREAR_DEP (nombre VARCHAR2, presupuesto NUMBER);
 FUNCTION NUM_DEP (nombre VARCHAR2) RETURN NUMBER;
 PROCEDURE MOSTRAR_DEP (numero NUMBER);
 PROCEDURE BORRAR_DEP (numero NUMBER);
 PROCEDURE MODIFICAR_DEP (numero NUMBER, presupuesto NUMBER);
END GESTION;