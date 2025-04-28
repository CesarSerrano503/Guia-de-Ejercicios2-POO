-- Autor: Cesar Antonio Serrano Gutiérrez
--  Fecha: 2025-04-27
CREATE DATABASE IF NOT EXISTS guia2poo;
USE guia2poo;

-- 1) Tabla Clientes
CREATE TABLE clientes (
                          id         INT AUTO_INCREMENT PRIMARY KEY,
                          nombres    VARCHAR(255) NOT NULL,
                          apellidos  VARCHAR(255) NOT NULL,
                          vip        TINYINT(1)    NOT NULL  -- 0 = No VIP, 1 = VIP
);

-- 2) Tabla Servicios (según tu tarifario de Automotor)
CREATE TABLE servicios (
                           id     INT AUTO_INCREMENT PRIMARY KEY,
                           tipo   VARCHAR(50)  NOT NULL,
                           precio DECIMAL(7,2) NOT NULL
);

-- Insertamos los 5 “servicios” que son en realidad tus tipos de automotor
INSERT INTO servicios (tipo, precio) VALUES
                                         ('Motocicleta', 2.75),
                                         ('Sedan',       3.50),
                                         ('Camioneta',   4.00),
                                         ('Microbús',    5.00),
                                         ('Autobús',     7.00);

-- 3) Tabla Automotores
CREATE TABLE automotores (
                             id     INT AUTO_INCREMENT PRIMARY KEY,
                             marca  VARCHAR(50) NOT NULL,
                             modelo VARCHAR(50) NOT NULL,
                             year   INT          NOT NULL
);

-- 4) Tabla Registro: relaciona Cliente + Automotor + Servicio
CREATE TABLE registros (
                           id                  INT AUTO_INCREMENT PRIMARY KEY,
                           cliente_id          INT  NOT NULL,
                           automotor_id        INT  NOT NULL,
                           servicio_id         INT  NOT NULL,
                           descuento_aplicado  TINYINT(1)    NOT NULL,  -- 0 = no, 1 = sí
                           total_pago          DECIMAL(7,2)  NOT NULL,
                           FOREIGN KEY (cliente_id)   REFERENCES clientes(id),
                           FOREIGN KEY (automotor_id) REFERENCES automotores(id),
                           FOREIGN KEY (servicio_id)  REFERENCES servicios(id)
);
