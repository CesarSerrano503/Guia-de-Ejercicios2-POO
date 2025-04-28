package com.proyecto.modelos;

/**
 * Autor: Cesar Antonio Serrano Gutiérrez
 * Fecha: 27-04-2025
 * Implementación de la interface Servicio para calcular el total a pagar.
 */
public class ServicioImpl implements Servicio {

    @Override
    public double totalPago(String tipoVehiculo, boolean vip) {
        double precio = 0.0;

        switch (tipoVehiculo.toLowerCase()) {
            case "motocicleta":
                precio = 2.75;
                break;
            case "sedan":
                precio = 3.50;
                break;
            case "camioneta":
                precio = 4.00;
                break;
            case "microbús":
                precio = 5.00;
                break;
            case "autobús":
                precio = 7.00;
                break;
            default:
                precio = 0.0; // Tipo no reconocido
        }

        if (vip) {
            precio = precio * 0.85; // Aplicar 15% de descuento
        }

        return precio;
    }
}
