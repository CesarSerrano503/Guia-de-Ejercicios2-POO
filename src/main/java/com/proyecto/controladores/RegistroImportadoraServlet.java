package com.proyecto.controladores;

import com.proyecto.modelos.ClienteVehiculo;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Servlet para el Ejercicio 4 - Importadora de Vehículos.
 * Implementa Post-Redirect-Get y muestra mensajes de éxito o error.
 * Autor: Cesar Antonio Serrano Gutiérrez
 * Fecha: 2025-04-27
 */
@WebServlet(name = "RegistroImportadoraServlet", urlPatterns = {"/RegistroImportadoraServlet"})
public class RegistroImportadoraServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private List<ClienteVehiculo> registros;

    @Override
    public void init() throws ServletException {
        super.init();
        registros = new ArrayList<>();
        getServletContext().setAttribute("registros", registros);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obtener lista de registros desde contexto
        @SuppressWarnings("unchecked")
        List<ClienteVehiculo> regs = (List<ClienteVehiculo>) getServletContext().getAttribute("registros");

        // Calcular estadísticas
        int totalNissan = 0, totalToyota = 0, totalKia = 0;
        double sumaNissan = 0, sumaToyota = 0, sumaKia = 0;
        int cnt2000a2015 = 0, cnt2016a2025 = 0;
        if (regs != null) {
            for (ClienteVehiculo cv : regs) {
                switch (cv.getMarcaVehiculo()) {
                    case "Nissan": totalNissan++; sumaNissan += cv.getPrecioVehiculo(); break;
                    case "Toyota": totalToyota++; sumaToyota += cv.getPrecioVehiculo(); break;
                    case "Kia":    totalKia++;    sumaKia    += cv.getPrecioVehiculo(); break;
                }
                int ano = cv.getAnioVehiculo();
                if (ano >= 2000 && ano <= 2015) cnt2000a2015++;
                else if (ano >= 2016 && ano <= 2025) cnt2016a2025++;
            }
        }

        // Asignar atributos a la solicitud
        request.setAttribute("registros", regs);
        request.setAttribute("totalNissan", totalNissan);
        request.setAttribute("sumaNissan", sumaNissan);
        request.setAttribute("totalToyota", totalToyota);
        request.setAttribute("sumaToyota", sumaToyota);
        request.setAttribute("totalKia", totalKia);
        request.setAttribute("sumaKia", sumaKia);
        request.setAttribute("cantidad2000a2015", cnt2000a2015);
        request.setAttribute("cantidad2016a2025", cnt2016a2025);

        // Propagar parámetro success a un atributo booleano
        if (request.getParameter("success") != null) {
            request.setAttribute("success", Boolean.TRUE);
        }

        // Forward a JSP
        request.getRequestDispatcher("/Ejercicio4.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nombre   = request.getParameter("nombre");
        String sexo     = request.getParameter("sexo");
        String marca    = request.getParameter("marca");
        String anioStr  = request.getParameter("anio");
        String precioStr= request.getParameter("precio");

        String error = null;
        int anio = 0;
        double precio = 0;

        // Validaciones de entrada
        if (nombre == null || !nombre.matches("[A-Za-zÁÉÍÓÚáéíóúñÑ ]+")) {
            error = "Nombre inválido. Solo letras y espacios.";
        } else if (!"Masculino".equals(sexo) && !"Femenino".equals(sexo)) {
            error = "Sexo inválido.";
        } else if (!("Nissan".equals(marca) || "Toyota".equals(marca) || "Kia".equals(marca))) {
            error = "Marca inválida.";
        } else {
            try {
                anio = Integer.parseInt(anioStr);
                if (anio < 2000 || anio > 2025) {
                    error = "El año debe estar entre 2000 y 2025.";
                }
            } catch (NumberFormatException e) {
                error = "Año inválido.";
            }
        }
        if (error == null) {
            try {
                precio = Double.parseDouble(precioStr);
                if (precio <= 0) {
                    error = "El precio debe ser mayor que cero.";
                }
            } catch (NumberFormatException e) {
                error = "Precio inválido.";
            }
        }

        // Si hay error, reenvío para mostrarlo
        if (error != null) {
            request.setAttribute("error", error);
            request.getRequestDispatcher("/Ejercicio4.jsp").forward(request, response);
            return;
        }

        // Crear y guardar el nuevo registro
        ClienteVehiculo cv = new ClienteVehiculo(nombre, sexo, marca, anio, precio);
        registros.add(cv);

        // Redirect con success para mostrar mensaje
        response.sendRedirect(request.getContextPath() + "/RegistroImportadoraServlet?success=1");
    }
}
