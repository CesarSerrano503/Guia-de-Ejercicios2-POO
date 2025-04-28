--Autor: Cesar Antonio Serrano Gutierrez
-- Fecha: 27/4/2025
-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS guia2poo;
USE guia2poo;

-- Tabla: Servicio
CREATE TABLE IF NOT EXISTS servicio (
                                        id INT AUTO_INCREMENT PRIMARY KEY,
                                        tipo VARCHAR(50) NOT NULL,
    precio DECIMAL(6,2) NOT NULL
    );

-- Insertar tipos de automotor con sus precios
INSERT INTO servicio (tipo, precio) VALUES
                                        ('Motocicleta', 2.75),
                                        ('Sedan', 3.50),
                                        ('Camioneta', 4.00),
                                        ('Microbús', 5.00),
                                        ('Autobús', 7.00);

-- Tabla: Automotor
CREATE TABLE IF NOT EXISTS automotor (
                                         id INT AUTO_INCREMENT PRIMARY KEY,
                                         marca VARCHAR(100) NOT NULL,
    modelo VARCHAR(100) NOT NULL,
    year INT NOT NULL
    );

-- Tabla: Cliente
CREATE TABLE IF NOT EXISTS cliente (
                                       id INT AUTO_INCREMENT PRIMARY KEY,
                                       nombres VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    vip BOOLEAN NOT NULL,
    automotor_id INT,
    servicio_id INT,
    FOREIGN KEY (automotor_id) REFERENCES automotor(id),
    FOREIGN KEY (servicio_id) REFERENCES servicio(id)
    );
