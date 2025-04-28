package com.proyecto.modelos;

/**
 * Autor: Cesar Antonio Serrano Gutiérrez
 * Fecha: 27-04-2025
 * Interface que define el método para calcular el total a pagar.
 */
public interface Servicio {
    double totalPago(String tipoVehiculo, boolean vip);
}
