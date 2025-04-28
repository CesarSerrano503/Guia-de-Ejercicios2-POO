package com.proyecto.modelos;

public class ServicioVehiculo {
    private int id;
    private String tipo;
    private double precio;

    public ServicioVehiculo(int id, String tipo, double precio) {
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
