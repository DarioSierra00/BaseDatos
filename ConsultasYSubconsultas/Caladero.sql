CREATE TABLE BARCOS
(	MATRICULA VARCHAR2(9),
	NOMBRE VARCHAR2(30),
	CLASE VARCHAR2(15),
	ARMADOR VARCHAR2(15),
	CAPACIDAD NUMBER(10),
	NACIONALIDAD VARCHAR2(12),
	CONSTRAINT PK_MATRICULA PRIMARY KEY (MATRICULA)
);

CREATE TABLE LOTES
(	CODIGO VARCHAR2(10),
	MATRICULA VARCHAR2(9),
	NUMKILOS NUMBER(6),
	PRECIOPORKILOSALIDA NUMBER(6),
	PRECIOPORKILOADJUDICADO NUMBER(6),
	FECHAVENTA DATE,
	COD_ESPECIE VARCHAR2(10),
	CONSTRAINT PK_CODIGO PRIMARY KEY (CODIGO),
	CONSTRAINT FK_MATRICULA FOREIGN KEY (MATRICULA) REFERENCES BARCOS(MATRICULA) ON DELETE CASCADE
);

CREATE TABLE ESPECIE
(	CODIGO VARCHAR2(10),
	NOMBRE VARCHAR2(30),
	TIPO VARCHAR2(15),
	CUPOPORBARCO NUMBER(4),
	CALADERO_PRINCIPAL VARCHAR2(30),
	CONSTRAINT PK_CODIGO_ESPECIE PRIMARY KEY (CODIGO)
);

ALTER TABLE LOTES ADD CONSTRAINT FK_COD_ESPECIE FOREIGN KEY (COD_ESPECIE) REFERENCES ESPECIE(CODIGO) ON DELETE CASCADE;

CREATE TABLE CALADERO
(	CODIGO VARCHAR2(10),
	NOMBRE VARCHAR2(30),
	UBICACION VARCHAR2(20),
	ESPECIE_PRINCIPAL VARCHAR2(20),
	CONSTRAINT PK_CODIGO_CALADERO PRIMARY KEY (CODIGO),
	CONSTRAINT FK_ESPECIE_PRINCIPAL FOREIGN KEY (ESPECIE_PRINCIPAL) REFERENCES ESPECIE(CODIGO)
);

CREATE TABLE FECHAS_CAPTURAS_PERMITIDAS
(	COD_ESPECIE VARCHAR2(10),
	COD_CALADERO VARCHAR2(10),
	FECHA_INICIAL DATE,
	FECHA_FINAL DATE,
	CONSTRAINT PK_FECHAS_CAPT PRIMARY KEY (COD_ESPECIE,COD_CALADERO),
	CONSTRAINT FK2_COD_ESPECIE FOREIGN KEY (COD_ESPECIE) REFERENCES ESPECIE(CODIGO),
	CONSTRAINT FK2_COD_CALADERO FOREIGN KEY (COD_CALADERO) REFERENCES CALADERO(CODIGO)
);

ALTER TABLE BARCOS ADD CONSTRAINT CHK1_MATRICULA CHECK (REGEXP_LIKE(MATRICULA,'^[A-Z]{2}-[0-9]{4}$'));
ALTER TABLE LOTES MODIFY (FECHAVENTA DATE NOT NULL);
ALTER TABLE LOTES ADD CONSTRAINT CHK1_PRECIOPORKILOSALIDA CHECK (PRECIOPORKILOSALIDA < PRECIOPORKILOADJUDICADO);

ALTER TABLE LOTES ADD CONSTRAINT CHK2_NUMKILOS CHECK ((NUMKILOS>0) AND (PRECIOPORKILOADJUDICADO>0));

ALTER TABLE CALADERO ADD CONSTRAINT CHK1_NOMBRE CHECK (UPPER(NOMBRE)=NOMBRE);
ALTER TABLE CALADERO ADD CONSTRAINT CHK2_UBICACION CHECK (UPPER(UBICACION)=UBICACION);

ALTER TABLE FECHAS_CAPTURAS_PERMITIDAS ADD CONSTRAINT CHK1_CAPTURA_PERMITIDA CHECK (FECHA_INICIAL<to_date('02/02/2020','DD/MM/YYYY') AND FECHA_FINAL>to_date('28/03/2020','DD/MM/YYYY'));
ALTER TABLE CALADERO ADD (NOMBRE_CIENTIFICO VARCHAR2(20));
ALTER TABLE BARCOS DROP COLUMN ARMADOR;
DROP BARCOS CASCADE CONSTRAINT;
DROP LOTE CASCADE CONSTRAINT;
DROP ESPECIE CASCADE CONSTRAINT;
DROP CALADERO CASCADE CONSTRAINT;
DROP FECHAS_CAPTURAS_PERMITIDAS CASCADE CONSTRAINT;