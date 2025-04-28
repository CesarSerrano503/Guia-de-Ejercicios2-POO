package com.proyecto.modelos;
/**
 * Autor: Cesar Antonio Serrano Gutiérrez
 * Fecha: 27-04-2025
 * Descripción: [Explicación breve del archivo]
 */

public class TipoServicio {
    private int id;
    private String tipo;
    private double precio;

    public TipoServicio(int id, String tipo, double precio) {
        this.id = id;
        this.tipo = tipo;
        this.precio = precio;
    }

    public int getId() {
        return id;
    }

    public String getTipo() {
        return tipo;
    }

    public double getPrecio() {
        return precio;
    }
}
