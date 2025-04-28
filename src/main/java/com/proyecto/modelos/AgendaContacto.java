package com.proyecto.modelos;

/**
 * Autor: Cesar Antonio Serrano Gutiérrez
 * Fecha: 27-04-2025
 * Descripción: Clase JavaBean que representa un contacto dentro de una agenda de contactos.
 */

public class AgendaContacto {
    private String nombre;
    private String telefono;
    private String correo;

    public AgendaContacto() {}

    public AgendaContacto(String nombre, String telefono, String correo) {
        this.nombre = nombre;
        this.telefono = telefono;
        this.correo = correo;
    }

    // Getters y Setters
    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }

    public String getTelefono() { return telefono; }
    public void setTelefono(String telefono) { this.telefono = telefono; }

    public String getCorreo() { return correo; }
    public void setCorreo(String correo) { this.correo = correo; }
}
