package com.proyecto.modelos;
/**
 * Autor: Cesar Antonio Serrano Gutiérrez
 * Fecha: 27-04-2025
 * Descripción: [Explicación breve del archivo]
 */

public class Automotor {
    private int id;
    private String marca;
    private String modelo;
    private int year;

    public Automotor(int id, String marca, String modelo, int year) {
        this.id = id;
        this.marca = marca;
        this.modelo = modelo;
        this.year = year;
    }

    public Automotor(String marca, String modelo, int year) {
        this.marca = marca;
        this.modelo = modelo;
        this.year = year;
    }

    public int getId() {
        return id;
    }

    public String getMarca() {
        return marca;
    }

    public String getModelo() {
        return modelo;
    }

    public int getYear() {
        return year;
    }
}
