package com.proyecto.modelos;

/**
 * JavaBean que representa los datos de un cliente y su vehículo.
 * Autor: Cesar Antonio Serrano Gutiérrez
 * Fecha: 2025-04-27
 */
public class ClienteVehiculo {

    // Atributos privados del cliente y su vehículo
    private String nombreCliente;
    private String sexo;
    private String marcaVehiculo;
    private int anioVehiculo;
    private double precioVehiculo;

    // Constructor sin argumentos (necesario para los frameworks o JSP)
    public ClienteVehiculo() { }

    // Constructor completo para inicializar todos los atributos
    public ClienteVehiculo(String nombreCliente, String sexo, String marcaVehiculo,
                           int anioVehiculo, double precioVehiculo) {
        this.nombreCliente = nombreCliente;
        this.sexo = sexo;
        this.marcaVehiculo = marcaVehiculo;
        this.anioVehiculo = anioVehiculo;
        this.precioVehiculo = precioVehiculo;
    }

    // Métodos getters y setters para acceder y modificar los atributos

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

    // Alias de getters para facilitar el uso en JSP con nombres más cortos

    public String getNombre() { return getNombreCliente(); }

    public String getMarca()  { return getMarcaVehiculo(); }

    public int getAnio()      { return getAnioVehiculo(); }

    public double getPrecio() { return getPrecioVehiculo(); }

    // Método toString() para mostrar el objeto de forma legible en consola o logs

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
