DROP SCHEMA IF EXISTS VILLAQUIEN;
CREATE SCHEMA VILLAQUIEN;
USE VILLAQUIEN;

#  ALVARO VILLANOVA AHLROTH


CREATE TABLE QUIEN (
	ID INT PRIMARY KEY AUTO_INCREMENT,
    NOMBRE VARCHAR(50),
    EDAD INT
);

CREATE TABLE QUIENDEVILLAQUIEN (
	ID_QUIEN INT PRIMARY KEY AUTO_INCREMENT,
    DIRECCION TEXT,
    OFICIO VARCHAR(50),
    
    FOREIGN KEY (ID_QUIEN) REFERENCES QUIEN(ID)
);

CREATE TABLE REGALO (
	ID INT PRIMARY KEY AUTO_INCREMENT,
    NOMBRE VARCHAR(50),
    PRECIO INT

);

CREATE TABLE GRINCH (
	ID_QUIEN INT PRIMARY KEY AUTO_INCREMENT,
    NOMBRE VARCHAR(50),
    COLOR VARCHAR(50),
    
    FOREIGN KEY (ID_QUIEN) REFERENCES QUIEN(ID)
    

);