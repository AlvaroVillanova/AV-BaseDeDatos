DROP SCHEMA IF EXISTS CICLISTA;
CREATE SCHEMA CICLISTA;
USE CICLISTA;

CREATE TABLE CICLISTA (
DNI VARCHAR(9) PRIMARY KEY,
NOMBRE VARCHAR(30),
NACIONALIDAD VARCHAR(30),
FNACIMIENTO DATE
);

INSERT INTO CICLISTA VALUES
("12345678A","Manuel Calavera","Irlandes","1986-02-24");

CREATE TABLE EQUIPO (
NOMBRE VARCHAR(30) PRIMARY KEY,
NACIONALIDAD VARCHAR(30),
DIRECTOR VARCHAR(30)
);

INSERT INTO EQUIPO VALUES
("PEPETO","CHINO","ELON MUSK");

CREATE TABLE PRUEBA (
NOMBRE VARCHAR(30),
ANIO INT(4),
NUM_ETAPAS INT,
KM_TOTALES INT,
DNI_CICLISTA VARCHAR(9),

PRIMARY KEY (NOMBRE, ANIO),
FOREIGN KEY (DNI_CICLISTA) REFERENCES CICLISTA(DNI)
);

INSERT INTO PRUEBA VALUES
("Pikes Peak Rally","1994","5","32",NULL);

CREATE TABLE CICLISTA_PERTENECE_EQUIPO (
NOMBRE_EQUIPO VARCHAR(30),
DNI_CICLISTA VARCHAR(30),
F_INICIO DATE,
F_FIN DATE,

PRIMARY KEY (NOMBRE_EQUIPO, DNI_CICLISTA, F_INICIO),
FOREIGN KEY (NOMBRE_EQUIPO) REFERENCES EQUIPO(NOMBRE),
FOREIGN KEY (DNI_CICLISTA) REFERENCES CICLISTA(DNI)
);

INSERT INTO CICLISTA_PERTENECE_EQUIPO VALUES
("PEPETO","12345678A","2019-02-02","2019-02-03");

CREATE TABLE EQUIPO_PARTICIPA_PRUEBA (
NOMBRE_EQUIPO VARCHAR(30),
NOMBRE_PRUEBA VARCHAR(30),
ANIO_PRUEBA INT(4),
PUESTO INT,

PRIMARY KEY (NOMBRE_EQUIPO, NOMBRE_PRUEBA, ANIO_PRUEBA),
FOREIGN KEY (NOMBRE_EQUIPO) REFERENCES EQUIPO(NOMBRE),
FOREIGN KEY (NOMBRE_PRUEBA) REFERENCES PRUEBA(NOMBRE)
);

INSERT INTO EQUIPO_PARTICIPA_PRUEBA VALUES
("PEPETO","Pikes Peak Rally","1994","2");

SELECT * FROM EQUIPO_PARTICIPA_PRUEBA;

