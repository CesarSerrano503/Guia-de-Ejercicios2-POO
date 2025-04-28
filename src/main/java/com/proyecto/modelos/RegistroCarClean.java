package com.proyecto.modelos;

/**
 * Autor: Cesar Antonio Serrano Gutiérrez
 * Fecha: 27-04-2025
 * Clase que representa el registro de un cliente para Car Clean.
 */
public class RegistroCarClean {
    private String nombreCompleto;
    private String marca;
    private String modelo;
    private int anio;
    private String tipoVehiculo;
    private boolean vip;

    public RegistroCarClean() {}

    public RegistroCarClean(String nombreCompleto, String marca, String modelo, int anio, String tipoVehiculo, boolean vip) {
        this.nombreCompleto = nombreCompleto;
        this.marca = marca;
        this.modelo = modelo;
        this.anio = anio;
        this.tipoVehiculo = tipoVehiculo;
        this.vip = vip;
    }

    // Getters y Setters
    public String getNombreCompleto() { return nombreCompleto; }
    public void setNombreCompleto(String nombreCompleto) { this.nombreCompleto = nombreCompleto; }

    public String getMarca() { return marca; }
    public void setMarca(String marca) { this.marca = marca; }

    public String getModelo() { return modelo; }
    public void setModelo(String modelo) { this.modelo = modelo; }

    public int getAnio() { return anio; }
    public void setAnio(int anio) { this.anio = anio; }

    public String getTipoVehiculo() { return tipoVehiculo; }
    public void setTipoVehiculo(String tipoVehiculo) { this.tipoVehiculo = tipoVehiculo; }

    public boolean isVip() { return vip; }
    public void setVip(boolean vip) { this.vip = vip; }
}
