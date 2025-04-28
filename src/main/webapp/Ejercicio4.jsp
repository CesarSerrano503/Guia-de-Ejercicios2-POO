<%--
    Autor: Cesar Antonio Serrano Gutiérrez
    Fecha: 2025-04-27
    Descripción: Página JSP que permite registrar vehículos vendidos y mostrar reportes estadísticos.
--%>

<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.proyecto.modelos.ClienteVehiculo" %>
<%
    // Obtener el contexto de la aplicación para formar rutas relativas.
    String ctx = request.getContextPath();

    // Crear un formateador para mostrar números con separador de miles y dos decimales.
    java.text.NumberFormat nf = java.text.NumberFormat.getNumberInstance(java.util.Locale.US);
    nf.setMinimumFractionDigits(2);
    nf.setMaximumFractionDigits(2);

    // Obtener registros de vehículos y estadísticas desde los atributos del request, con valores por defecto si no existen.
    List<ClienteVehiculo> regs = (List<ClienteVehiculo>) request.getAttribute("registros");
    Integer totalNissan    = request.getAttribute("totalNissan")     != null ? (Integer) request.getAttribute("totalNissan")     : 0;
    Integer totalToyota    = request.getAttribute("totalToyota")     != null ? (Integer) request.getAttribute("totalToyota")     : 0;
    Integer totalKia       = request.getAttribute("totalKia")        != null ? (Integer) request.getAttribute("totalKia")        : 0;
    Double  sumaNissanVal  = request.getAttribute("sumaNissan")      != null ? (Double)  request.getAttribute("sumaNissan")      : 0.0;
    Double  sumaToyotaVal  = request.getAttribute("sumaToyota")      != null ? (Double)  request.getAttribute("sumaToyota")      : 0.0;
    Double  sumaKiaVal     = request.getAttribute("sumaKia")         != null ? (Double)  request.getAttribute("sumaKia")         : 0.0;
    Integer count2000a2015 = request.getAttribute("cantidad2000a2015") != null ? (Integer) request.getAttribute("cantidad2000a2015") : 0;
    Integer count2016a2025 = request.getAttribute("cantidad2016a2025") != null ? (Integer) request.getAttribute("cantidad2016a2025") : 0;
    Boolean success        = (Boolean) request.getAttribute("success");
    String  error          = (String)  request.getAttribute("error");
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Importadora de Vehículos</title>

    <!-- Estilos CSS para el diseño de la página -->
    <style>
        body { margin:0; padding:0; background:#f8f9fa; font-family:'Poppins', sans-serif; }
        header { text-align:center; padding:20px; background:#fff; box-shadow:0 2px 4px rgba(0,0,0,0.1); }
        header h1 { margin:0; font-size:2em; color:#333; }
        .tabs { display:flex; justify-content:center; margin:20px 0; }
        .tab-button { padding:10px 20px; margin:0 5px; border:none; border-radius:6px; background:#e9ecef; cursor:pointer; }
        .tab-button.active { background:#198754; color:#fff; }
        .tab-content { display:none; padding:0 20px; }
        .tab-content.active { display:block; }
        .form-container { background:#fff; padding:20px; border-radius:6px; max-width:600px; margin:0 auto; box-shadow:0 2px 8px rgba(0,0,0,0.1); }
        .form-group { margin-bottom:15px; }
        label { display:block; font-weight:bold; margin-bottom:5px; }
        input, select { width:100%; padding:8px; border:1px solid #ccc; border-radius:4px; }
        .actions { display:flex; gap:10px; margin-top:15px; }
        .btn { padding:10px 20px; border:none; border-radius:6px; font-weight:bold; cursor:pointer; text-decoration:none; text-align:center; }
        .btn-primary { background:#198754; color:#fff; }
        .btn-secondary { background:#198754; color:#fff; }
        .btn:hover { opacity:0.9; }
        .success-message { color:#155724; background:#d4edda; border:1px solid #c3e6cb; padding:10px; border-radius:4px; text-align:center; margin-bottom:15px; }
        .error-message   { color:#c00; text-align:center; margin-top:10px; }
        .container { max-width:1000px; margin:0 auto; padding:0 20px; }
        table { width:100%; border-collapse:collapse; margin-top:20px; background:#fff; }
        th, td { border:1px solid #ccc; padding:10px; text-align:center; }
        thead { background:#198754; color:#fff; }
        h2 { text-align:center; margin-top:40px; color:#333; }
    </style>

    <!-- Script para manejar el cambio de pestañas y el mensaje de éxito -->
    <script>
        function showTab(idx) {
            var btns = document.querySelectorAll('.tab-button'),
                tabs = document.querySelectorAll('.tab-content');
            btns.forEach((b,i) => {
                b.classList.toggle('active', i===idx);
                tabs[i].classList.toggle('active', i===idx);
            });
        }
        window.onload = function(){
            showTab(0);
            var msg = document.getElementById('successMessage');
            if (msg) {
                setTimeout(function(){
                    msg.style.transition = 'opacity 0.5s';
                    msg.style.opacity = '0';
                    setTimeout(()=> msg.style.display='none', 500);
                }, 5000);
            }
        };
    </script>
</head>

<body>

<!-- Encabezado principal -->
<header><h1>Importadora de Vehículos</h1></header>

<!-- Botones de navegación entre Registro y Reportes -->
<div class="tabs">
    <button class="tab-button" onclick="showTab(0)">Registro</button>
    <button class="tab-button" onclick="showTab(1)">Reportes</button>
</div>

<!-- Sección de Registro de Vehículo -->
<div class="tab-content" id="registro">
    <div class="form-container">
        <% if (success != null && success) { %>
        <!-- Mensaje de éxito al registrar el vehículo -->
        <div id="successMessage" class="success-message">
            ¡Vehículo registrado correctamente!
        </div>
        <% } %>

        <!-- Formulario de registro -->
        <form action="<%=ctx%>/RegistroImportadoraServlet" method="post">
            <div class="form-group">
                <label for="nombre">Nombre completo:</label>
                <input type="text" id="nombre" name="nombre" required pattern="[A-Za-zÁÉÍÓÚáéíóúñÑ ]+" title="Solo letras y espacios">
            </div>
            <div class="form-group">
                <label for="sexo">Sexo:</label>
                <select id="sexo" name="sexo" required>
                    <option value="">Seleccione...</option>
                    <option>Masculino</option>
                    <option>Femenino</option>
                </select>
            </div>
            <div class="form-group">
                <label for="marca">Marca del vehículo:</label>
                <select id="marca" name="marca" required>
                    <option value="">Seleccione...</option>
                    <option>Nissan</option>
                    <option>Toyota</option>
                    <option>Kia</option>
                </select>
            </div>
            <div class="form-group">
                <label for="anio">Año del vehículo:</label>
                <input type="number" id="anio" name="anio" min="2000" max="2025" required>
            </div>
            <div class="form-group">
                <label for="precio">Precio del vehículo ($):</label>
                <input type="number" id="precio" name="precio" min="1" step="0.01" required>
            </div>

            <!-- Botones para registrar o regresar -->
            <div class="actions">
                <button type="submit" class="btn btn-primary">Registrar</button>
                <a href="<%=ctx%>/index.jsp" class="btn btn-secondary">Volver al Menú Principal</a>
            </div>
        </form>

        <% if (error != null) { %>
        <!-- Mensaje de error en el registro -->
        <div class="error-message"><%= error %></div>
        <% } %>
    </div>
</div>

<!-- Sección de Reportes -->
<div class="tab-content" id="reportes">
    <div class="container">

        <!-- Lista de vehículos vendidos -->
        <h2>Lista de Vehículos Vendidos</h2>
        <table>
            <thead>
            <tr>
                <th>Nombre</th><th>Sexo</th><th>Marca</th><th>Año</th><th>Precio ($)</th>
            </tr>
            </thead>
            <tbody>
            <% if (regs != null) {
                for (ClienteVehiculo c : regs) { %>
            <tr>
                <td><%= c.getNombre() %></td>
                <td><%= c.getSexo() %></td>
                <td><%= c.getMarca() %></td>
                <td><%= c.getAnio() %></td>
                <td><%= nf.format(c.getPrecio()) %></td>
            </tr>
            <% } } %>
            </tbody>
        </table>

        <!-- Estadísticas por marca -->
        <h2>Estadísticas de Ventas</h2>
        <table>
            <thead>
            <tr><th>Marca</th><th>Total Vendidos</th><th>Total Ventas ($)</th></tr>
            </thead>
            <tbody>
            <tr><td>Nissan</td><td><%= totalNissan %></td><td><%= nf.format(sumaNissanVal) %></td></tr>
            <tr><td>Toyota</td><td><%= totalToyota %></td><td><%= nf.format(sumaToyotaVal) %></td></tr>
            <tr><td>Kia</td><td><%= totalKia %></td><td><%= nf.format(sumaKiaVal) %></td></tr>
            </tbody>
        </table>

        <!-- Estadísticas por rango de años -->
        <h2>Vehículos por Año</h2>
        <table>
            <thead>
            <tr><th>Rango</th><th>Cantidad</th></tr>
            </thead>
            <tbody>
            <tr><td>2000 – 2015</td><td><%= count2000a2015 %></td></tr>
            <tr><td>2016 – 2025</td><td><%= count2016a2025 %></td></tr>
            </tbody>
        </table>

    </div>
</div>

</body>
</html>
