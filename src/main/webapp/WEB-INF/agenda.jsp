<%--
  Created by IntelliJ IDEA.
  User: sarat
  Date: 27/04/2025
  Time: 2:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.ArrayList, jakarta.servlet.ServletContext, com.proyecto.modelos.Contacto" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Agenda de Contactos</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <style>
        .formulario-contacto, .lista-contactos, .buscar-contacto {
            margin-top: 20px;
            padding: 15px;
            border: 1px solid #ccc;
        }
        .mostrar {
            display: block;
        }
        .error, .success {
            padding: 10px;
            margin-bottom: 10px;
            border-radius: 5px;
        }
        .error {
            color: red;
            background-color: #ffe0e0;
            border: 1px solid #ffb3b3;
        }
        .success {
            color: green;
            background-color: #e0ffe0;
            border: 1px solid #b3ffb3;
        }
    </style>
    <script>
        function mostrarSeccion(id) {
            console.log('La función mostrarSeccion se ha llamado con el ID:', id); // <---- AÑADE ESTA LÍNEA
            document.querySelectorAll('.formulario-contacto, .lista-contactos, .buscar-contacto').forEach(el => el.classList.remove('mostrar'));
            document.getElementById(id).classList.add('mostrar');
        }

        document.addEventListener('DOMContentLoaded', function() {
            const urlParams = new URLSearchParams(window.location.search);
            const mostrar = urlParams.get('mostrar');
            if (mostrar) {
                mostrarSeccion(mostrar);
            } else {
                const listaContactos = document.getElementById('listaContactos');
                if (listaContactos && listaContactos.querySelector('tbody tr')) {
                    mostrarSeccion('listaContactos');
                }
            }
        });
    </script>
    <script>
        function mostrarSeccion(id) {
            document.querySelectorAll('.formulario-contacto, .lista-contactos, .buscar-contacto').forEach(el => el.classList.remove('mostrar'));
            document.getElementById(id).classList.add('mostrar');
        }

        document.addEventListener('DOMContentLoaded', function() {
            const urlParams = new URLSearchParams(window.location.search);
            const mostrar = urlParams.get('mostrar');
            if (mostrar) {
                mostrarSeccion(mostrar);
            } else {
                // Mostrar la lista si hay contactos al cargar inicialmente
                const listaContactos = document.getElementById('listaContactos');
                if (listaContactos && listaContactos.querySelector('tbody tr')) {
                    mostrarSeccion('listaContactos');
                }
            }
        });
    </script>
</head>
<body class="bg-gray-100 p-8">
<h1 class="text-3xl font-bold mb-6 text-center text-blue-600">Agenda de Contactos</h1>

<%-- Mostrar error --%>
<% if (request.getAttribute("error") != null) { %>
<p class="error text-red-500 mb-4"><%= request.getAttribute("error") %></p>
<% } %>

<%-- Mostrar mensaje de éxito --%>
<% if (request.getParameter("success") != null) { %>
<p class="success text-green-500 mb-4"><%= request.getParameter("success").replace('+', ' ') %></p>
<% } %>

<div class="space-x-4 mb-8 text-center">
    <button type="button" onclick="mostrarSeccion('agregarContacto')" class="bg-green-500 hover:bg-green-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline">Agregar Nuevo Contacto</button>
    <button type="button" onclick="mostrarSeccion('listaContactos')" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline">Ver Lista de Contactos</button>
    <button type="button" onclick="mostrarSeccion('buscarContacto')" class="bg-yellow-500 hover:bg-yellow-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline">Buscar Contacto por Nombre</button>
</div>

<div id="agregarContacto" class="formulario-contacto bg-white shadow-md rounded px-8 pt-6 pb-8 mb-4" style="display: none;">
    <h2 class="text-xl font-semibold mb-4 text-gray-800">Agregar Nuevo Contacto</h2>
    <form action="agenda.jsp" method="post" class="space-y-4">
        <input type="hidden" name="accion" value="agregar">
        <div>
            <label for="nombre" class="block text-gray-700 text-sm font-bold mb-2">Nombre:</label>
            <input type="text" id="nombre" name="nombre" required class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
        </div>
        <div>
            <label for="telefono" class="block text-gray-700 text-sm font-bold mb-2">Teléfono:</label>
            <input type="text" id="telefono" name="telefono" required class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
        </div>
        <div>
            <label for="email" class="block text-gray-700 text-sm font-bold mb-2">Correo Electrónico:</label>
            <input type="email" id="email" name="email" required class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
        </div>
        <button type="submit" class="bg-green-500 hover:bg-green-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline">Guardar Contacto</button>
    </form>
</div>

<div id="listaContactos" class="lista-contactos bg-white shadow-md rounded px-8 pt-6 pb-8 mb-4" style="display: none;">
    <h2 class="text-xl font-semibold mb-4 text-gray-800">Lista de Contactos</h2>
    <%
        List<Contacto> contactos = (List<Contacto>) application.getAttribute("contactos");
        if (contactos != null && !contactos.isEmpty()) {
    %>
    <table class="table-auto w-full">
        <thead>
        <tr class="bg-gray-200 text-gray-700">
            <th class="px-4 py-2">Nombre</th>
            <th class="px-4 py-2">Teléfono</th>
            <th class="px-4 py-2">Correo Electrónico</th>
        </tr>
        </thead>
        <tbody>
        <% for (Contacto contacto : contactos) { %>
        <tr class="hover:bg-gray-100">
            <td class="border px-4 py-2"><%= contacto.getNombre() %></td>
            <td class="border px-4 py-2"><%= contacto.getTelefono() %></td>
            <td class="border px-4 py-2"><%= contacto.getEmail() %></td>
        </tr>
        <% } %>
        </tbody>
    </table>
    <% } else { %>
    <p class="text-gray-600">No hay contactos en la lista.</p>
    <% } %>
</div>

<div id="buscarContacto" class="buscar-contacto bg-white shadow-md rounded px-8 pt-6 pb-8 mb-4" style="display: none;">
    <h2 class="text-xl font-semibold mb-4 text-gray-800">Buscar Contacto por Nombre</h2>
    <form action="agenda.jsp" method="post" class="space-y-4">
        <input type="hidden" name="accion" value="buscar">
        <div>
            <label for="nombreBusqueda" class="block text-gray-700 text-sm font-bold mb-2">Nombre a buscar:</label>
            <input type="text" id="nombreBusqueda" name="nombreBusqueda" required class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
        </div>
        <button type="submit" class="bg-yellow-500 hover:bg-yellow-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline">Buscar</button>
    </form>
    <br>
    <%
        Contacto contactoEncontrado = (Contacto) request.getAttribute("contactoEncontrado");
        if (contactoEncontrado != null) {
    %>
    <h3 class="text-lg font-semibold mt-4 text-gray-800">Contacto Encontrado:</h3>
    <p><strong class="font-bold">Nombre:</strong> <%= contactoEncontrado.getNombre() %></p>
    <p><strong class="font-bold">Teléfono:</strong> <%= contactoEncontrado.getTelefono() %></p>
    <p><strong class="font-bold">Correo Electrónico:</strong> <%= contactoEncontrado.getEmail() %></p>
    <% } else if (request.getAttribute("contactoEncontrado") == null && "buscar".equals(request.getParameter("accion"))) { %>
    <p class="text-gray-600">No se encontró ningún contacto con ese nombre.</p>
    <% } %>
</div>

<%
    // Lógica de acciones
    String accion = request.getParameter("accion");


    try {
        if ("agregar".equals(accion)) {
            String nombre = request.getParameter("nombre");
            String telefono = request.getParameter("telefono");
            String email = request.getParameter("email");

            if (nombre != null && !nombre.trim().isEmpty() && telefono != null && !telefono.trim().isEmpty() && email != null && !email.trim().isEmpty()) {
                Contacto nuevoContacto = new Contacto(nombre, telefono, email);
                getListaContactos(application).add(nuevoContacto);
                response.sendRedirect("agenda.jsp?mostrar=listaContactos&success=Contacto+agregado+exitosamente.");
            } else {
                request.setAttribute("error", "Todos los campos son obligatorios.");
            }
        } else if ("buscar".equals(accion)) {
            String nombreBusqueda = request.getParameter("nombreBusqueda");


            if (nombreBusqueda != null && !nombreBusqueda.trim().isEmpty()) {
                for (Contacto contacto : contactos) {
                    if (contacto.getNombre().equalsIgnoreCase(nombreBusqueda)) {
                        contactoEncontrado = contacto;
                        break;
                    }
                }
            }
            request.setAttribute("contactoEncontrado", contactoEncontrado);
            request.getRequestDispatcher("agenda.jsp?mostrar=buscarContacto").forward(request, response);
        }
    } catch (Exception e) {
        request.setAttribute("error", "Ocurrió un error al procesar la solicitud: " + e.getMessage());
        request.getRequestDispatcher("agenda.jsp").forward(request, response);
    }
%>

<%!
    private List<Contacto> getListaContactos(jakarta.servlet.ServletContext context) {
        List<Contacto> contactos = (List<Contacto>) context.getAttribute("contactos");
        if (contactos == null) {
            contactos = new ArrayList<>();
            context.setAttribute("contactos", contactos);
        }
        return contactos;
    }
%>

</body>
</html>