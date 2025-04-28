<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--
    Autor: Cesar Antonio Serrano Gutiérrez
    Fecha de creación: 26/04/2025
    Descripción: Página principal para navegar entre los ejercicios de la Guía de Ejercicios 2.
--%>

<%
    // Obtiene el contexto de la aplicación para generar URLs relativas correctas
    String ctx = request.getContextPath();
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Guía de Ejercicios 2 - Navegación</title>

    <style>
        /* Estilos principales para cuerpo de la página */
        body {
            margin: 0; padding: 0; background-color: #f8f9fa;
            font-family: 'Poppins', sans-serif;
            display: flex; flex-direction: column; align-items: center;
        }

        /* Estilos del encabezado */
        header { margin-top: 30px; text-align: center; }
        header h1 { font-size: 2.5em; color: #333; }

        /* Contenedor de tarjetas de ejercicios */
        .container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
            max-width: 1200px;
            padding: 40px 20px;
        }

        /* Estilos para cada tarjeta */
        .card {
            background: #fff;
            border: 1px solid #dee2e6;
            border-radius: 10px;
            overflow: hidden;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            box-shadow: 0 2px 8px rgba(0,0,0,0.05);
            transition: box-shadow .3s;
        }
        /* Efecto hover en la tarjeta */
        .card:hover { box-shadow: 0 4px 12px rgba(0,0,0,0.2); }

        /* Imagen dentro de la tarjeta */
        .card img { width: 100%; height: 200px; object-fit: cover; }

        /* Contenido dentro de cada tarjeta */
        .card-content {
            padding: 20px;
            flex-grow: 1;
            display: flex;
            flex-direction: column;
            justify-content: flex-start;
            text-align: center;
        }

        /* Título del ejercicio */
        .card-title { font-size: 1.4em; font-weight: bold; margin-bottom: 10px; color: #000; }

        /* Pregunta descriptiva del ejercicio */
        .card-question { font-size: 1em; color: #555; margin-bottom: 10px; }

        /* Descripción adicional oculta por defecto */
        .card-description {
            font-size: 0.95em; color: #666; margin-top: 10px;
            display: none; /* Solo se muestra al hacer clic en "Más información" */
        }

        /* Botón para mostrar/ocultar más información */
        .btn-more {
            margin: 10px 0; background: transparent;
            border: none; color: #198754;
            cursor: pointer; font-weight: bold;
        }

        /* Botón para ir al ejercicio */
        .btn {
            background-color: #198754;
            color: #fff; padding: 12px;
            border-radius: 8px;
            text-decoration: none;
            font-weight: bold; margin-top: 15px;
            display: inline-block;
            transition: background-color .3s;
        }

        /* Efecto hover en el botón */
        .btn:hover { background-color: #145c32; }

        /* Estilos del pie de página */
        footer {
            margin-top: 40px;
            padding: 20px;
            font-size: 0.9em;
            color: #888;
            text-align: center;
        }
    </style>

    <script>
        // Función para mostrar u ocultar la descripción extra al hacer clic
        function toggleDescription(btn) {
            var desc = btn.nextElementSibling;
            if (!desc.style.display || desc.style.display === 'none') {
                desc.style.display = 'block';
                btn.textContent = 'Menos información';
            } else {
                desc.style.display = 'none';
                btn.textContent = 'Más información';
            }
        }
    </script>
</head>

<body>
<!-- Encabezado principal -->
<header><h1>Guía de Ejercicios 2</h1></header>

<!-- Contenedor principal de las tarjetas -->
<div class="container">

    <!-- Tarjeta: Ejercicio 1 -->
    <div class="card">
        <img src="<%=ctx%>/img/ejercicio1.jpg" alt="Ficha Estudiante">
        <div class="card-content">
            <div class="card-title">Ejercicio 1: Ficha de Estudiante</div>
            <div class="card-question">¿Quieres registrar fácilmente los datos de estudiantes?</div>
            <button class="btn-more" onclick="toggleDescription(this)">Más información</button>
            <div class="card-description">Con este módulo podrás registrar de forma segura el nombre, dirección, teléfono y correo de cada alumno.</div>
            <a href="<%=ctx%>/Ejercicio1.jsp" class="btn">Ir al Ejercicio</a>
        </div>
    </div>

    <!-- Tarjeta: Ejercicio 2 -->
    <div class="card">
        <img src="<%=ctx%>/img/ejercicio2.jpg" alt="Cálculo Vacaciones">
        <div class="card-content">
            <div class="card-title">Ejercicio 2: Cálculo de Vacaciones</div>
            <div class="card-question">¿Te gustaría saber cuántos días de vacaciones le corresponden a un empleado?</div>
            <button class="btn-more" onclick="toggleDescription(this)">Más información</button>
            <div class="card-description">Calcula automáticamente los días de descanso de un trabajador según sus años de servicio.</div>
            <a href="<%=ctx%>/Ejercicio2.jsp" class="btn">Ir al Ejercicio</a>
        </div>
    </div>

    <!-- Tarjeta: Ejercicio 3 -->
    <div class="card">
        <img src="<%=ctx%>/img/ejercicio3.jpg" alt="Agenda Contactos">
        <div class="card-content">
            <div class="card-title">Ejercicio 3: Agenda de Contactos</div>
            <div class="card-question">¿Quieres tener tus contactos organizados y al alcance de un clic?</div>
            <button class="btn-more" onclick="toggleDescription(this)">Más información</button>
            <div class="card-description">Guarda nombres, teléfonos y correos y búscalos fácilmente.</div>
            <a href="<%=ctx%>/Ejercicio3.jsp" class="btn">Ir al Ejercicio</a>
        </div>
    </div>

    <!-- Tarjeta: Ejercicio 4 -->
    <div class="card">
        <img src="<%=ctx%>/img/ejercicio4.jpg" alt="Importadora Vehículos">
        <div class="card-content">
            <div class="card-title">Ejercicio 4: Importadora</div>
            <div class="card-question">¿Te gustaría gestionar las ventas de autos de manera eficiente?</div>
            <button class="btn-more" onclick="toggleDescription(this)">Más información</button>
            <div class="card-description">Registra ventas de vehículos y obtén estadísticas de marcas y años vendidos.</div>
            <a href="<%=ctx%>/Ejercicio4.jsp" class="btn">Ir al Ejercicio</a>
        </div>
    </div>

    <!-- Tarjeta: Ejercicio 5 -->
    <div class="card">
        <img src="<%=ctx%>/img/ejercicio5.jpg" alt="Car Clean Lavado">
        <div class="card-content">
            <div class="card-title">Ejercicio 5: Car Clean</div>
            <div class="card-question">¿Quieres calcular el precio de lavado de tu vehículo?</div>
            <button class="btn-more" onclick="toggleDescription(this)">Más información</button>
            <div class="card-description">Calcula precios y descuentos VIP rápidamente.</div>
            <a href="<%=ctx%>/Ejercicio5.jsp" class="btn">Ir al Ejercicio</a>
        </div>
    </div>

</div>

<!-- Pie de página -->
<footer>© 2025 | Cesar Antonio Serrano Gutiérrez</footer>
</body>
</html>
