DROP SCHEMA IF EXISTS SEGUROVEHICULO;
CREATE SCHEMA SEGUROVEHICULO;
USE SEGUROVEHICULO;


CREATE TABLE CLIENTE (
	DNI VARCHAR(9) PRIMARY KEY,
    NOMBRE VARCHAR(40),
    FNACIMIENTO DATE,
    FPERMISO DATE
    

);

CREATE TABLE VEHICULO (
	NBASTIDOR VARCHAR(20) PRIMARY KEY,
    MATRICULA VARCHAR(10),
    MARCA VARCHAR(20),
    MODELO VARCHAR(20),
    COLOR VARCHAR(20),
    FMATRICULA VARCHAR(20)
    
);

INSERT INTO VEHICULO (NBASTIDOR,MATRICULA) VALUES
("123", "0000BBB");

CREATE TABLE COBERTURA (
	ID INT PRIMARY KEY,
    TIPO VARCHAR(20),
    CUANTIA INT

);



CREATE TABLE CLIENTE_ASEGURA_VEHICULO (
	DNI_CLIENTE VARCHAR(9),
    BASTIDOR_VEHICULO VARCHAR(20),
    
    PRIMARY KEY (DNI_CLIENTE,BASTIDOR_VEHICULO),
    FOREIGN KEY (DNI_CLIENTE) REFERENCES CLIENTE(DNI),
    FOREIGN KEY (BASTIDOR_VEHICULO) REFERENCES VEHICULO(NBASTIDOR)
    
);

CREATE TABLE POLIZA (
	NPOLIZA INT PRIMARY KEY AUTO_INCREMENT,
    PRECIO INT,
    DNI_CLIENTE VARCHAR(9),
    BASTIDOR_VEHICULO VARCHAR(20),
    
    FOREIGN KEY (DNI_CLIENTE,BASTIDOR_VEHICULO) REFERENCES CLIENTE_ASEGURA_VEHICULO(DNI_CLIENTE,BASTIDOR_VEHICULO)

);

CREATE TABLE SINIESTRO (
	ID INT PRIMARY KEY,
    FECHA DATE,
    LUGAR VARCHAR(40),
    CAUSA VARCHAR(50),
    CUANTIA INT,
	NPOLIZA INT,
    
    FOREIGN KEY (NPOLIZA) REFERENCES POLIZA(NPOLIZA)

);

CREATE TABLE POLIZA_ASOCIA_COBERTURA (
	NPOLIZA INT,
    ID_COBERTURA INT,
    
    PRIMARY KEY (NPOLIZA,ID_COBERTURA),
    FOREIGN KEY (NPOLIZA) REFERENCES POLIZA(NPOLIZA),
    FOREIGN KEY (ID_COBERTURA) REFERENCES COBERTURA(ID)


);