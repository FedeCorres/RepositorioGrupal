-- -------------------------------------------------------
-- A. Crear Base de Datos y Tablas según Modelo Relacional
-- -------------------------------------------------------

-- -----------------------------------------------------
-- Base de Datos veterinaria
-- -----------------------------------------------------
CREATE DATABASE veterinaria DEFAULT CHARACTER SET utf8 ;
USE veterinaria;

-- -----------------------------------------------------
-- Tabla veterinaria.Dueno
-- -----------------------------------------------------
CREATE TABLE veterinaria.Dueno (
  DNI INT NOT NULL,
  Nombre VARCHAR(45) NOT NULL,
  Apellido VARCHAR(45) NOT NULL,
  telefono BIGINT NOT NULL,
  direccion VARCHAR(45) NOT NULL,
  PRIMARY KEY (DNI));

-- -----------------------------------------------------
-- Tabla veterinaria.Perro
-- 1.Consulta para crear la tabla Perro, teniendo en cuenta 
-- sus claves foráneas y primarias
-- -----------------------------------------------------
CREATE TABLE veterinaria.Perro (
  id_Perro INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(45) NOT NULL,
  Fech_Nac DATETIME NOT NULL,
  Sexo VARCHAR(20) NOT NULL,
  DNI_Dueno INT NOT NULL,
  PRIMARY KEY (id_Perro,DNI_Dueno),
  CONSTRAINT fk_Perro_Dueno
    FOREIGN KEY (DNI_Dueno)
    REFERENCES veterinaria.Dueno (DNI)
 );

-- -----------------------------------------------------
-- Tabla veterinaria.Historial
-- -----------------------------------------------------
CREATE TABLE veterinaria.Historial(
  ID_Historial INT NOT NULL AUTO_INCREMENT,
  Fecha DATETIME NOT NULL,
  Descripcion VARCHAR(45) NOT NULL,
  Monto DECIMAL(5,2) NOT NULL,
  Perro INT NOT NULL,
  PRIMARY KEY (ID_Historial, Perro),
  CONSTRAINT fk_Historial_Perro
    FOREIGN KEY (Perro)
    REFERENCES veterinaria.Perro (id_Perro)
);


-- -----------------------------------------------------
-- 2.Inserte en la tabla correspondiente un nuevo animal (perro) 
-- como paciente y el dueño asociado a ese animal
-- -----------------------------------------------------

INSERT INTO dueno (DNI, Nombre, Apellido, telefono, direccion) 
VALUES (24456789, 'Homero', 'Simpson',156242573, 'Avda. Siempreviva 742');

INSERT INTO Perro ( nombre, Fech_Nac,Sexo,DNI_Dueno)
VALUES ('Huesos','2000-05-12 00:00:00','Macho',24456789);


-- -----------------------------------------------------
-- 5.Realice una consulta multitabla que arroje el nombre 
-- de todos los perros cuyos dueños se llaman Pedro 
-- -----------------------------------------------------

-- ----------------------------------------------------
-- Se insertan 2 dueños y sus respectivos perros
-- ----------------------------------------------------

INSERT INTO dueno (DNI, Nombre, Apellido, telefono, direccion) 
VALUES ('28123789', 'Pedro', 'Fernandez','120242573', 'Mexico 125');

INSERT INTO dueno (DNI, Nombre, Apellido, telefono, direccion) 
VALUES ('38456123', 'Pedro', 'Picapiedra','146242573', 'Piedradura 105');

INSERT INTO Perro (nombre, Fech_Nac,Sexo,DNI_Dueno)
VALUES ('Dino','2020-05-12 00:00:00','Macho','38456123');

INSERT INTO Perro (nombre, Fech_Nac,Sexo,DNI_Dueno)
VALUES ('Laika','2020-04-02 00:00:00','Hembra','28123789');

INSERT INTO Perro (nombre, Fech_Nac,Sexo,DNI_Dueno)
VALUES ('Roko','2022-05-02 00:00:00','Macho','38456123');

-- ----------------------------------------------------
-- Consulta todos los perros cuyos dueños se llaman Pedro 
-- ----------------------------------------------------

SELECT perro.nombre as "Nombre perro" 
FROM dueno, perro 
WHERE dueno.DNI =  perro.DNI_dueno and dueno.Nombre = "Pedro" ;

