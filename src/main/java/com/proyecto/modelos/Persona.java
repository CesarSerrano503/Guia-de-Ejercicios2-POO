package com.proyecto.modelos;
/**
 * Autor: Cesar Antonio Serrano Gutiérrez
 * Fecha: 27-04-2025
 * Descripción: [Explicación breve del archivo]
 */

public class Persona {
    private String nombre;
    private String apellidos;
    private double salario;
    private String fechaIngreso; // formato: yyyy-MM-dd

    // Constructor
    public Persona(String nombre, String apellidos, double salario, String fechaIngreso) {
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.salario = salario;
        this.fechaIngreso = fechaIngreso;
    }

    // Getters
    public String getNombre() { return nombre; }
    public String getApellidos() { return apellidos; }
    public double getSalario() { return salario; }
    public String getFechaIngreso() { return fechaIngreso; }
}
