package com.proyecto.controladores;

/**
 * Autor: Cesar Antonio Serrano Gutiérrez
 * Fecha: 27-04-2025
 * Descripción: Servlet que maneja la agenda de contactos, permitiendo agregar, listar y buscar contactos en memoria.
 */

import com.proyecto.modelos.AgendaContacto;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "AgendaContactoServlet", urlPatterns = {"/AgendaContactoServlet"})
public class AgendaContactoServlet extends HttpServlet {

    // Lista en memoria para almacenar los contactos
    private static List<AgendaContacto> contactos = new ArrayList<>();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accion = request.getParameter("accion");

        try {
            if ("agregar".equals(accion)) {
                agregarContacto(request, response);
            } else if ("buscar".equals(accion)) {
                buscarContacto(request, response);
            } else {
                listarContactos(request, response);
            }
        } catch (Exception e) {
            response.getWriter().println("Ocurrió un error: " + e.getMessage());
            e.printStackTrace();
        }
    }

    private void agregarContacto(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String nombre = request.getParameter("nombre");
        String telefono = request.getParameter("telefono");
        String correo = request.getParameter("correo");

        // Validaciones
        if (nombre == null || nombre.trim().isEmpty() ||
                telefono == null || telefono.trim().isEmpty() ||
                correo == null || correo.trim().isEmpty()) {
            response.getWriter().println("Error: Todos los campos son obligatorios.");
            return;
        }

        if (!correo.contains("@") || !correo.contains(".")) {
            response.getWriter().println("Error: El correo electrónico no es válido.");
            return;
        }

        AgendaContacto nuevoContacto = new AgendaContacto(nombre.trim(), telefono.trim(), correo.trim());
        contactos.add(nuevoContacto);

        // Guardar la lista en el contexto de aplicación para que listaContactos.jsp pueda acceder
        getServletContext().setAttribute("listaContactos", contactos);

        response.getWriter().println("¡Contacto agregado exitosamente!");
    }

    private void listarContactos(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // No necesita lógica aquí porque listaContactos.jsp usa directamente la lista guardada
        response.sendRedirect("listaContactos.jsp");
    }

    private void buscarContacto(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String nombreBusqueda = request.getParameter("nombreBuscar");

        if (nombreBusqueda == null || nombreBusqueda.trim().isEmpty()) {
            response.getWriter().println("Error: Debe ingresar un nombre para buscar.");
            return;
        }

        boolean encontrado = false;

        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().println("<h1>Resultado de Búsqueda</h1>");

        for (AgendaContacto contacto : contactos) {
            if (contacto.getNombre().equalsIgnoreCase(nombreBusqueda.trim())) {
                response.getWriter().println("<p><strong>Nombre:</strong> " + contacto.getNombre() + "<br>");
                response.getWriter().println("<strong>Teléfono:</strong> " + contacto.getTelefono() + "<br>");
                response.getWriter().println("<strong>Correo:</strong> " + contacto.getCorreo() + "</p>");
                encontrado = true;
            }
        }

        if (!encontrado) {
            response.getWriter().println("<p>No se encontró ningún contacto con ese nombre.</p>");
        }

        response.getWriter().println("<br><a href='buscarContacto.jsp'>← Buscar Otro</a>");
    }
}
