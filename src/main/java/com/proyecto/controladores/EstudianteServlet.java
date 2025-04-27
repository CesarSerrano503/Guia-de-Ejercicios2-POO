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
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.regex.Pattern;

@WebServlet("/procesarEstudiante")
public class EstudianteServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        // Obtener parámetros
        String carnet = request.getParameter("carnet");
        String nombres = request.getParameter("nombres");
        String apellidos = request.getParameter("apellidos");
        String direccion = request.getParameter("direccion");
        String telefono = request.getParameter("telefono");
        String email = request.getParameter("email");
        String fechaNacimientoStr = request.getParameter("fechaNacimiento");

        // Validaciones
        StringBuilder errores = new StringBuilder("<ul>");
        boolean hayErrores = false;

        if (!isValidCarnet(carnet)) {
            errores.append("<li>Carnet inválido. Formato: dos letras seguidas de seis números.</li>");
            hayErrores = true;
        }

        if (!isValidText(nombres, 25) || !nombres.matches("[a-zA-Z\\s]+")) {
            errores.append("<li>Nombres inválidos. Solo letras permitidas y máximo 25 caracteres.</li>");
            hayErrores = true;
        }

        if (!isValidText(apellidos, 25) || !apellidos.matches("[a-zA-Z\\s]+")) {
            errores.append("<li>Apellidos inválidos. Solo letras permitidas y máximo 25 caracteres.</li>");
            hayErrores = true;
        }

        if (!isValidText(direccion, 255)) {
            errores.append("<li>Dirección inválida. Máximo 255 caracteres.</li>");
            hayErrores = true;
        }

        if (!isValidTelefono(telefono)) {
            errores.append("<li>Teléfono inválido. Formato requerido: 0000-0000.</li>");
            hayErrores = true;
        }

        if (!isValidEmail(email)) {
            errores.append("<li>Email inválido. Ingrese un correo electrónico válido.</li>");
            hayErrores = true;
        }

        if (!isValidFechaNacimiento(fechaNacimientoStr)) {
            errores.append("<li>Fecha de Nacimiento inválida. Debe tener el formato DD/MM/YYYY.</li>");
            hayErrores = true;
        } else if (!isMayorDe16(fechaNacimientoStr)) {
            errores.append("<li>Debe tener al menos 16 años cumplidos.</li>");
            hayErrores = true;
        }

        errores.append("</ul>");

        // Respuesta HTML
        out.println("<!DOCTYPE html>");
        out.println("<html><head><title>Resultado del Estudiante</title>");
        out.println("<style>");
        out.println("body { font-family: Arial; padding: 20px; }");
        out.println(".error { color: red; }");
        out.println("table { border-collapse: collapse; width: 80%; }");
        out.println("th, td { border: 1px solid black; padding: 8px; }");
        out.println("th { background-color: #f2f2f2; }");
        out.println("</style></head><body>");

        if (hayErrores) {
            out.println("<h2 class='error'>Errores al procesar el formulario:</h2>");
            out.println(errores.toString());
            out.println("<a href='index.jsp'>Volver al formulario</a>");
        } else {
            out.println("<h2>Información del Estudiante</h2>");
            out.println("<table>");
            out.println("<tr><th>Campo</th><th>Valor</th></tr>");
            out.println("<tr><td>Carnet</td><td>" + carnet + "</td></tr>");
            out.println("<tr><td>Nombres</td><td>" + nombres + "</td></tr>");
            out.println("<tr><td>Apellidos</td><td>" + apellidos + "</td></tr>");
            out.println("<tr><td>Dirección</td><td>" + direccion + "</td></tr>");
            out.println("<tr><td>Teléfono</td><td>" + telefono + "</td></tr>");
            out.println("<tr><td>Email</td><td>" + email + "</td></tr>");
            out.println("<tr><td>Fecha de Nacimiento</td><td>" + fechaNacimientoStr + "</td></tr>");
            out.println("</table>");
            out.println("<br><a href='index.jsp'>Volver al formulario</a>");
        }

        out.println("</body></html>");
        out.close();
    }

    // Métodos de validación

    private boolean isValidCarnet(String carnet) {
        return carnet != null && carnet.matches("^[a-zA-Z]{2}\\d{6}$");
    }

    private boolean isValidText(String texto, int maxLen) {
        return texto != null && !texto.trim().isEmpty() && texto.length() <= maxLen;
    }

    private boolean isValidTelefono(String tel) {
        return tel != null && tel.matches("^\\d{4}-\\d{4}$");
    }

    private boolean isValidEmail(String email) {
        return email != null && Pattern.matches("^[\\w-.]+@([\\w-]+\\.)+[\\w-]{2,4}$", email);
    }

    private boolean isValidFechaNacimiento(String fecha) {
        if (fecha == null) return false;
        return fecha.matches("^(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[0-2])/\\d{4}$");
    }

    private boolean isMayorDe16(String fechaNacimientoStr) {
        try {
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
            LocalDate fechaNacimiento = LocalDate.parse(fechaNacimientoStr, formatter);
            LocalDate ahora = LocalDate.now();
            Period periodo = Period.between(fechaNacimiento, ahora);
            return periodo.getYears() >= 16;
        } catch (DateTimeParseException e) {
            return false; // La fecha no pudo ser parseada, se considera inválida
        }
    }
}