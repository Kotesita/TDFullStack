CREATE DATABASE kote;
USE kote;

DROP TABLE IF EXISTS pais;
CREATE TABLE pais (
	idPais INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nombre VARCHAR(255)
);

DROP TABLE IF EXISTS ciudad;
CREATE TABLE ciudad (
	idCiudad INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nombre VARCHAR(255),
    idPais INT,
    FOREIGN KEY (idPais) REFERENCES pais(idPais)
);

DROP TABLE IF EXISTS aeropuerto;
CREATE TABLE aeropuerto(
	idAeropuerto INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    codigo VARCHAR(255),
    nombre VARCHAR(255),
    idCiudad INT,
    FOREIGN KEY (idCiudad) REFERENCES ciudad(idCiudad)
);

DROP TABLE IF EXISTS lineaaerea;
CREATE TABLE lineaaerea (
	idLineaAerea INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    codigo VARCHAR(255),
    nombre VARCHAR(255)
);

DROP TABLE IF EXISTS avion;
CREATE TABLE avion (
	idAvion INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    modelo VARCHAR(255)
);

DROP TABLE IF EXISTS vuelo;
CREATE TABLE vuelo (
	idVuelo INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nro_vuelo VARCHAR(255),
    fecha DATETIME,
    asientos VARCHAR(255),
    idAvion INT,
    FOREIGN KEY (idAvion) REFERENCES avion(idAvion)
);

DROP TABLE IF EXISTS dia;
CREATE TABLE dia (
	idDia INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    fecha DATETIME
);

DROP TABLE IF EXISTS programa;
CREATE TABLE programa (
	idPrograma INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    idVuelo INT,
    idLineaAerea INT,
    idDia INT,
    idAeropuerto_sal INT,
    idAeropuerto_lle INT,
    FOREIGN KEY (idVuelo) REFERENCES vuelo(idVuelo),
    FOREIGN KEY (idLineaAerea) REFERENCES lineaaerea(idLineaAerea),
    FOREIGN KEY (idDia) REFERENCES dia(idDia),
    FOREIGN KEY (idAeropuerto_sal) REFERENCES aeropuerto(idAeropuerto),
    FOREIGN KEY (idAeropuerto_lle) REFERENCES aeropuerto(idAeropuerto)
);

DROP TABLE IF EXISTS programadia;
CREATE TABLE programadia (
	idProgramaDia INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    idDia INT,
    idPrograma INT,
    FOREIGN KEY (idDia) REFERENCES dia(idDia),
    FOREIGN KEY (idPrograma) REFERENCES programa(idPrograma)
);

DROP TABLE IF EXISTS escala;
CREATE TABLE escala (
	idEscala INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    idAeropuerto INT,
    idPrograma INT,
    FOREIGN KEY (idAeropuerto) REFERENCES aeropuerto(idAeropuerto),
    FOREIGN KEY (idPrograma) REFERENCES programa(idPrograma)
);

