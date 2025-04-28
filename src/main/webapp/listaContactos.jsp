<%@ page contentType="text/html;charset=UTF-8" language="java" import="com.proyecto.modelos.AgendaContacto, java.util.ArrayList, java.util.List" %>
<%--
    Autor: Cesar Antonio Serrano Gutiérrez
    Fecha: 27-04-2025
    Descripción: Página para listar todos los contactos registrados en la agenda.
--%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Lista de Contactos</title>
    <style>
        body {
            font-family: 'Poppins', Arial, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 40px;
        }
        .container {
            background: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            max-width: 900px;
            margin: 0 auto;
        }
        h1 {
            text-align: center;
            color: #198754;
            margin-bottom: 30px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 12px;
            border: 1px solid #dee2e6;
            text-align: center;
        }
        th {
            background-color: #198754;
            color: white;
            font-size: 1.1em;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        .btn-back {
            display: block;
            text-align: center;
            margin-top: 30px;
            font-size: 0.9em;
            color: #555;
            text-decoration: none;
        }
        .btn-back:hover {
            color: #198754;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>Agenda de Contactos</h1>

    <table>
        <thead>
        <tr>
            <th>Nombre</th>
            <th>Teléfono</th>
            <th>Correo Electrónico</th>
        </tr>
        </thead>
        <tbody>
        <%
            // Recuperar lista de contactos desde la sesión
            List<AgendaContacto> contactos = (List<AgendaContacto>) application.getAttribute("listaContactos");

            if (contactos != null && !contactos.isEmpty()) {
                for (AgendaContacto c : contactos) {
        %>
        <tr>
            <td><%= c.getNombre() %></td>
            <td><%= c.getTelefono() %></td>
            <td><%= c.getCorreo() %></td>
        </tr>
        <%
            }
        } else {
        %>
        <tr>
            <td colspan="3">No hay contactos registrados aún.</td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>

    <a href="index.jsp" class="btn-back">← Volver al menú principal</a>
</div>

</body>
</html>
