DROP SCHEMA IF EXISTS TITULARCUENTA;
CREATE SCHEMA TITULARCUENTA;
USE TITULARCUENTA;

CREATE TABLE TITULAR (
DNI VARCHAR(9) PRIMARY KEY,
DOMICILIO VARCHAR(50),
TELEFONO INT
);

CREATE TABLE CUENTA (
NUMEROCUENTA INT PRIMARY KEY,
SALDO DECIMAL(8,2),
FECHAAPERTURA DATE,
DNI_TITULAR VARCHAR(9),

FOREIGN KEY (DNI_TITULAR) REFERENCES TITULAR(DNI)
);

CREATE TABLE TARJETA (
NUMEROTARJETA INT(30) PRIMARY KEY,
TIPO VARCHAR(30),
NCUENTARELACIONADA INTEGER(50),
DNI_TITULAR VARCHAR(9),

FOREIGN KEY (NCUENTARELACIONADA) REFERENCES CUENTA(NUMEROCUENTA),
FOREIGN KEY (DNI_TITULAR) REFERENCES TITULAR(DNI)
);