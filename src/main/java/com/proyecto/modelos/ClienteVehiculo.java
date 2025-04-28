
package com.proyecto.modelos;

/**
 * JavaBean que representa los datos de un cliente y su vehículo.
 * Autor: Cesar Antonio Serrano Gutiérrez
 * Fecha: 2025-04-27
 */
public class ClienteVehiculo {
    private String nombreCliente;
    private String sexo;
    private String marcaVehiculo;
    private int anioVehiculo;
    private double precioVehiculo;

    public ClienteVehiculo() { }
    public ClienteVehiculo(String nombreCliente, String sexo, String marcaVehiculo,
                           int anioVehiculo, double precioVehiculo) {
        this.nombreCliente = nombreCliente;
        this.sexo = sexo;
        this.marcaVehiculo = marcaVehiculo;
        this.anioVehiculo = anioVehiculo;
        this.precioVehiculo = precioVehiculo;
    }

    public String getNombreCliente() { return nombreCliente; }
    public void setNombreCliente(String nombreCliente) { this.nombreCliente = nombreCliente; }

    public String getSexo() { return sexo; }
    public void setSexo(String sexo) { this.sexo = sexo; }

    public String getMarcaVehiculo() { return marcaVehiculo; }
    public void setMarcaVehiculo(String marcaVehiculo) { this.marcaVehiculo = marcaVehiculo; }

    public int getAnioVehiculo() { return anioVehiculo; }
    public void setAnioVehiculo(int anioVehiculo) { this.anioVehiculo = anioVehiculo; }

    public double getPrecioVehiculo() { return precioVehiculo; }
    public void setPrecioVehiculo(double precioVehiculo) { this.precioVehiculo = precioVehiculo; }

    // Aliases para JSP
    public String getNombre() { return getNombreCliente(); }
    public String getMarca()  { return getMarcaVehiculo(); }
    public int    getAnio()   { return getAnioVehiculo(); }
    public double getPrecio(){ return getPrecioVehiculo(); }

    @Override
    public String toString() {
        return "ClienteVehiculo{" +
                "nombreCliente='" + nombreCliente + '\'' +
                ", sexo='" + sexo + '\'' +
                ", marcaVehiculo='" + marcaVehiculo + '\'' +
                ", anioVehiculo=" + anioVehiculo +
                ", precioVehiculo=" + precioVehiculo +
                '}';
    }
}
