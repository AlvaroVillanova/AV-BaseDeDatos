DROP SCHEMA IF EXISTS PEDIDOCLIENTE;
CREATE SCHEMA PEDIDOCLIENTE;
USE PEDIDOCLIENTE;

# - STOCK DEBE SER POSITIVO
# - TELEFONO DE FABRICA DEBE SER UNICO
# - DESCRIPCION DE ARTICULO NO PUEDE SER NULO
# - SALDO POR DEFECTO "0"
# - EL DESCUENTO DEBE ESTAR ENTRE 0 Y 1 (INCLUIDOS)


CREATE TABLE CLIENTE (
	ID_CLIENTE INT PRIMARY KEY AUTO_INCREMENT,
    SALDO DECIMAL (9,2) DEFAULT 0,
    DESCUENTO DECIMAL(3,2),
    
    CONSTRAINT DESCUENTO_PORCENTAJE CHECK (DESCUENTO>0 AND DESCUENTO<1)
);

CREATE TABLE DIRECCIONES (
	ID_DIRECCIONES INT PRIMARY KEY AUTO_INCREMENT,
    NUMERO INT,
    CALLE VARCHAR(50),
    PUEBLO VARCHAR(50),
    CIUDAD VARCHAR(50)
);

CREATE TABLE PEDIDO (
	ID_PEDIDO INT AUTO_INCREMENT,
    FECHAHORA DATETIME,
    ID_CLIENTE INT,
    ID_DIRECCIONES INT,
    
    PRIMARY KEY (ID_PEDIDO),
    FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTE(ID_CLIENTE),
    FOREIGN KEY (ID_DIRECCIONES) REFERENCES DIRECCIONES(ID_DIRECCIONES)
);

CREATE TABLE ARTICULO (
	ID_ARTICULO INT PRIMARY KEY AUTO_INCREMENT,
    DESCRIPCION TEXT NOT NULL
);

CREATE TABLE FABRICA (
	ID_FABRICA INT PRIMARY KEY AUTO_INCREMENT,
    TELEFONO INT UNIQUE
);

CREATE TABLE PEDIDO_CONTIENE_ARTICULO (
	ID_PEDIDO INT,
    ID_ARTICULO INT,
    CANTIDAD INT,
    
    PRIMARY KEY (ID_PEDIDO,ID_ARTICULO),
    FOREIGN KEY (ID_PEDIDO) REFERENCES PEDIDO(ID_PEDIDO),
    FOREIGN KEY (ID_ARTICULO) REFERENCES ARTICULO(ID_ARTICULO)
);

CREATE TABLE FABRICA_PROVEE_ARTICULO (
	ID_FABRICA INT,
    ID_ARTICULO INT,
    STOCK INT,
    
    PRIMARY KEY (ID_FABRICA,ID_ARTICULO),
    FOREIGN KEY (ID_FABRICA) REFERENCES FABRICA(ID_FABRICA),
    FOREIGN KEY (ID_ARTICULO) REFERENCES ARTICULO(ID_ARTICULO),
    CONSTRAINT STOCK_POSITIVO CHECK (STOCK>0)
);

CREATE TABLE CLIENTE_TIENE_DIRECCIONES (
	ID_CLIENTE INT,
    ID_DIRECCIONES INT,

	PRIMARY KEY (ID_CLIENTE,ID_DIRECCIONES),
    FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTE(ID_CLIENTE),
    FOREIGN KEY (ID_DIRECCIONES) REFERENCES DIRECCIONES(ID_DIRECCIONES)
);