package com.proyecto.controladores;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.Period;

@WebServlet(name = "VacacionesServlet", urlPatterns = {"/vacaciones"})
public class VacacionesServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nombre = request.getParameter("nombre");
        String apellidos = request.getParameter("apellidos");
        String salarioStr = request.getParameter("salario");
        String fechaIngresoStr = request.getParameter("fechaIngreso");

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        if (nombre == null || nombre.isEmpty() ||
                apellidos == null || apellidos.isEmpty() ||
                salarioStr == null || salarioStr.isEmpty() ||
                fechaIngresoStr == null || fechaIngresoStr.isEmpty()) {

            out.println("<h2>Error: Todos los campos son obligatorios.</h2>");
            return;
        }

        try {
            double salario = Double.parseDouble(salarioStr);
            LocalDate fechaIngreso = LocalDate.parse(fechaIngresoStr);
            LocalDate fechaActual = LocalDate.now();

            Period periodo = Period.between(fechaIngreso, fechaActual);
            int anios = periodo.getYears();

            int diasVacaciones;
            if (anios >= 1 && anios < 3) {
                diasVacaciones = 10;
            } else if (anios >= 3 && anios <= 5) {
                diasVacaciones = 15;
            } else if (anios > 5) {
                diasVacaciones = 21;
            } else {
                diasVacaciones = 0;
            }

            // Mostrar los datos
            out.println("<h2>Información de la Persona</h2>");
            out.println("<p><strong>Nombre:</strong> " + nombre + " " + apellidos + "</p>");
            out.println("<p><strong>Salario:</strong> $" + salario + "</p>");
            out.println("<p><strong>Fecha de Ingreso:</strong> " + fechaIngreso + "</p>");
            out.println("<p><strong>Días de Vacaciones:</strong> " + diasVacaciones + "</p>");

        } catch (NumberFormatException e) {
            out.println("<h2>Error: Salario debe ser un número válido.</h2>");
        } catch (Exception e) {
            out.println("<h2>Error al procesar la información.</h2>");
        }
    }
}
