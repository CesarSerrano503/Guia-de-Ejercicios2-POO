package com.proyecto.modelos;
/**
 * Autor: Cesar Antonio Serrano Gutiérrez
 * Fecha: 27-04-2025
 * Descripción: [Explicación breve del archivo]
 */

public class Cliente {
    private int id;
    private String nombres;
    private String apellidos;
    private boolean vip;

    public Cliente(int id, String nombres, String apellidos, boolean vip) {
        this.id = id;
        this.nombres = nombres;
        this.apellidos = apellidos;
        this.vip = vip;
    }

    public Cliente(String nombres, String apellidos, boolean vip) {
        this.nombres = nombres;
        this.apellidos = apellidos;
        this.vip = vip;
    }

    public int getId() {
        return id;
    }

    public String getNombres() {
        return nombres;
    }

    public String getApellidos() {
        return apellidos;
    }

    public boolean isVip() {
        return vip;
    }
}
