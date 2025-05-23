package com.proyecto.modelos;
/**
 * Autor: Cesar Antonio Serrano Gutiérrez
 * Fecha: 27-04-2025
 * Descripción: [Explicación breve del archivo]
 */

public class Registro {
    public Cliente cliente;
    public Automotor auto;
    public String tipoVehiculo;
    public boolean descuento;

    private ServicioImpl servicioImpl;

    public Registro(Cliente cliente, Automotor auto, String tipoVehiculo, boolean descuento) {
        this.cliente = cliente;
        this.auto = auto;
        this.tipoVehiculo = tipoVehiculo;
        this.descuento = descuento;
        this.servicioImpl = new ServicioImpl(); // Creamos la instancia para calcular
    }

    public double totalPago() {
        return Math.round(servicioImpl.totalPago(tipoVehiculo, descuento) * 100.0) / 100.0;
    }
}
