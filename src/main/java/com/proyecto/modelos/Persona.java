package com.proyecto.modelos;

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
