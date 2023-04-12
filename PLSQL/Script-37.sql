--1. Escribe un procedimiento que muestre el número de empleados y el salario
--mínimo, máximo y medio del departamento de FINANZAS. Debe hacerse
--uso de cursores implícitos, es decir utilizar SELECT ... INTO.

CREATE OR REPLACE PROCEDURE FINANZAS
AS 	
	num_empleados NUMBER;
	salario_minimo NUMBER;
	salario_maximo NUMBER;
	salario_medio NUMBER;
BEGIN
	SELECT COUNT(E.NUMEM),MIN(E.SALAR), MAX(E.SALAR), AVG(E.SALAR) INTO num_empleados,salario_minimo,salario_maximo,salario_medio
	FROM EMPLEADOS E, DEPARTAMENTOS d WHERE E.NUMDE = D.NUMDE 
	AND D.NOMDE LIKE 'FINANZAS';

	DBMS_OUTPUT.PUT_LINE(num_empleados);
	DBMS_OUTPUT.PUT_LINE(salario_minimo);
	DBMS_OUTPUT.PUT_LINE(salario_maximo);
	DBMS_OUTPUT.PUT_LINE(salario_medio);
END;

BEGIN
	FINANZAS;
END;



--2. Escribe un procedimiento que suba un 10% el salario a los EMPLEADOS
--con más de 2 hijos y que ganen menos de 2000 €. Para cada empleado se
--mostrar por pantalla el código de empleado, nombre, salario anterior y final.
--Utiliza un cursor explícito. La transacción no puede quedarse a medias. Si
--por cualquier razón no es posible actualizar todos estos salarios, debe
--deshacerse el trabajo a la situación inicial.
CREATE OR REPLACE PROCEDURE subirSalario
AS
	CURSOR C_SubidaSalario IS
	SELECT E.NUMEM ,E.NOMEM , E.SALAR 
	FROM EMPLEADOS E
	WHERE E.NUMHI >2
	AND E.SALAR <2000;

	codigoEmpleado EMPLEADOS.NUMEM%TYPE;
	NombreEmple EMPLEADOS.NOMEM%TYPE;
	SalarioEmple EMPLEADOS.SALAR%TYPE;
BEGIN
	OPEN C_SubidaSalario;
	LOOP 
		FETCH C_SubidaSalario INTO codigoEmpleado,NombreEmple,SalarioEmple;
		EXIT WHEN C_SubidaSalario%NOTFOUND;
		DBMS_OUTPUT.PUT_LINE('Empleado con codigo: '||codigoEmpleado);
		DBMS_OUTPUT.PUT_LINE('El nombre es: '||NombreEmple);
		DBMS_OUTPUT.PUT_LINE('El nuevo salario es: '||(SalarioEmple*1.1));
		DBMS_OUTPUT.PUT_LINE('El antiguo salario es: '||SalarioEmple);
	END LOOP;
	CLOSE C_SubidaSalario;
END;

BEGIN
	subirSalario;
END;


--3. Escribe un procedimiento que reciba dos parámetros (número de
--departamento, hijos). Deber. crearse un cursor explícito al que se le pasarán
--estos parámetros y que mostrar. los datos de los empleados que pertenezcan
--al departamento y con el número de hijos indicados. Al final se indicar. el
--número de empleados obtenidos.

CREATE OR REPLACE PROCEDURE EJERCICIO3 (n_depa NUMBER, hijos NUMBER)
AS
	CURSOR Empleado IS
	SELECT numde, numhi, nomem, numem
	FROM empleados
	WHERE numde = n_depa
	AND numhi = hijos;
	contador NUMBER:=0;
BEGIN 
	FOR registro IN Empleado
	LOOP
		dbms_output.put_line('Nombre: '|| registro.nomem || ' Numero: ' || registro.numem);
		contador:=contador+1;
		dbms_output.put_line('Numero de registros: '||contador);
	END LOOP;
	CLOSE EMPLEADO;
END;

BEGIN
	EJERCICIO3(121,3);
END;

--4. Escribe un procedimiento con un parámetro para el nombre de empleado,
--que nos muestre la edad de dicho empleado en años, meses y días.

CREATE OR REPLACE PROCEDURE EJERCICIO4(nombreEmpleado varchar2)
AS
	CURSOR Empleado IS
	SELECT fecna FROM empleados
	WHERE nomem LIKE upper(nombreEmpleado);

	dia NUMBER:=0;
	mes NUMBER:=0;
 	anno NUMBER :=0;
 
 	diaA NUMBER:=0;
	mesA NUMBER:=0;
 	annoA NUMBER :=0;

 	diaFecha NUMBER:=0;
 	mesFecha NUMBER:=0;
 	annoFecha NUMBER:=0;
BEGIN 
	FOR registro IN empleado
	LOOP
		dia:=extract(DAY FROM registro.fecna);
		mes:=extract(MONTH FROM registro.fecna);
		anno:=extract(YEAR FROM registro.fecna);
	
		diaA:=extract(DAY FROM sysdate);
		mesA:=extract(MONTH FROM sysdate);
		annoA:=extract(YEAR FROM sysdate);
		
		annoFecha:=annoA-anno;
 	
 		dbms_output.put_line('Tiene '||annoFecha||' años.');
		
	END LOOP;
END;

BEGIN
	EJERCICIO4('CESAR');
END;



