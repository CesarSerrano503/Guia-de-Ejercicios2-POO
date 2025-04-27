<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--
    Autor: Cesar Antonio Serrano Gutiérrez
    Fecha de creación: 26/04/2025
    Descripción: Página principal para navegar entre los ejercicios de la Guía de Ejercicios 2.
--%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Guía de Ejercicios 2 - Navegación</title>

    <%-- Estilos principales --%>
    <style>
        body {
            margin: 0;
            padding: 0;
            background-color: #f8f9fa;
            font-family: 'Poppins', sans-serif;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        header {
            margin-top: 30px;
            text-align: center;
        }

        header h1 {
            font-size: 2.5em;
            color: #333;
        }

        .container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
            max-width: 1200px;
            padding: 40px 20px;
        }

        .card {
            background: #ffffff;
            border: 1px solid #dee2e6;
            border-radius: 10px;
            overflow: hidden;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            box-shadow: 0px 2px 8px rgba(0, 0, 0, 0.05);
            transition: box-shadow 0.3s ease;
        }

        .card:hover {
            box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.2);
        }

        .card img {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }

        .card-content {
            padding: 20px;
            flex-grow: 1;
            display: flex;
            flex-direction: column;
            justify-content: flex-start;
            text-align: center;
        }

        .card-title {
            font-size: 1.4em;
            font-weight: bold;
            margin-bottom: 10px;
            color: #000;
        }

        .card-question {
            font-size: 1em;
            color: #555;
            margin-bottom: 10px;
        }

        .card-description {
            font-size: 0.95em;
            color: #666;
            margin-top: 10px;
            display: none;
        }

        .btn-more {
            margin: 10px 0;
            background-color: transparent;
            border: none;
            color: #198754;
            cursor: pointer;
            font-weight: bold;
            text-decoration: none; /* <-- Esto elimina el subrayado */
        }


        .btn {
            background-color: #198754;
            color: white;
            text-decoration: none;
            padding: 12px;
            border-radius: 8px;
            text-align: center;
            font-weight: bold;
            margin-top: 15px;
            transition: background-color 0.3s;
        }

        .btn:hover {
            background-color: #145c32;
        }

        footer {
            margin-top: 40px;
            padding: 20px;
            font-size: 0.9em;
            color: #888;
            text-align: center;
        }
    </style>

    <%-- Script para mostrar/ocultar la descripción --%>
    <script>
        function toggleDescription(button) {
            var description = button.nextElementSibling;
            if (description.style.display === "none" || description.style.display === "") {
                description.style.display = "block";
                button.textContent = "Menos información";
            } else {
                description.style.display = "none";
                button.textContent = "Más información";
            }
        }
    </script>
</head>
<body>

<header>
    <h1>Guía de Ejercicios 2</h1>
</header>

<div class="container">

    <%-- Ejercicio 1 --%>
    <div class="card">
        <img src="img/ejercicio1.jpg" alt="Ficha Estudiante">
        <div class="card-content">
            <div class="card-title">Ejercicio 1: Ficha de Estudiante</div>
            <div class="card-question">
                ¿Quieres registrar fácilmente los datos de estudiantes?
            </div>
            <button class="btn-more" onclick="toggleDescription(this)">Más información</button>
            <div class="card-description">
                Con este módulo podrás registrar de forma segura el nombre, dirección, teléfono y correo de cada alumno. Ideal para una organización eficiente de datos.
            </div>
            <a href="Ejercicio1.jsp" class="btn">Ir al Ejercicio</a>
        </div>
    </div>

    <%-- Ejercicio 2 --%>
    <div class="card">
        <img src="img/ejercicio2.jpg" alt="Cálculo Vacaciones">
        <div class="card-content">
            <div class="card-title">Ejercicio 2: Cálculo de Vacaciones</div>
            <div class="card-question">
                ¿Te gustaría saber cuántos días de vacaciones le corresponden a un empleado?
            </div>
            <button class="btn-more" onclick="toggleDescription(this)">Más información</button>
            <div class="card-description">
                Este ejercicio te permite calcular automáticamente los días de descanso de un trabajador en función de sus años de servicio, ayudando a mejorar la gestión del talento humano.
            </div>
            <a href="Ejercicio2.jsp" class="btn">Ir al Ejercicio</a>
        </div>
    </div>

    <%-- Ejercicio 3 --%>
    <div class="card">
        <img src="img/ejercicio3.jpg" alt="Agenda Contactos">
        <div class="card-content">
            <div class="card-title">Ejercicio 3: Agenda de Contactos</div>
            <div class="card-question">
                ¿Quieres tener tus contactos organizados y al alcance de un clic?
            </div>
            <button class="btn-more" onclick="toggleDescription(this)">Más información</button>
            <div class="card-description">
                Crea tu propia agenda digital: guarda nombres, teléfonos y correos electrónicos y encuentra fácilmente a las personas importantes cuando más las necesites.
            </div>
            <a href="Ejercicio3.jsp" class="btn">Ir al Ejercicio</a>
        </div>
    </div>

    <%-- Ejercicio 4 --%>
    <div class="card">
        <img src="img/ejercicio4.jpg" alt="Importadora Vehículos">
        <div class="card-content">
            <div class="card-title">Ejercicio 4: Importadora</div>
            <div class="card-question">
                ¿Te gustaría gestionar las ventas de autos de manera eficiente?
            </div>
            <button class="btn-more" onclick="toggleDescription(this)">Más información</button>
            <div class="card-description">
                Registra las ventas de vehículos, lleva un control de clientes y obtén estadísticas claras sobre las marcas y años más vendidos. Perfecto para concesionarios o negocios automotrices.
            </div>
            <a href="Ejercicio4.jsp" class="btn">Ir al Ejercicio</a>
        </div>
    </div>

    <%-- Ejercicio 5 --%>
    <div class="card">
        <img src="img/ejercicio5.jpg" alt="Car Clean Lavado">
        <div class="card-content">
            <div class="card-title">Ejercicio 5: Car Clean</div>
            <div class="card-question">
                ¿Quieres calcular el precio del lavado de un vehículo de forma rápida?
            </div>
            <button class="btn-more" onclick="toggleDescription(this)">Más información</button>
            <div class="card-description">
                Calcula automáticamente el precio de lavado de automóviles y aplica descuentos VIP a tus mejores clientes. Ideal para centros de servicio automotriz que desean optimizar su atención.
            </div>
            <a href="Ejercicio5.jsp" class="btn">Ir al Ejercicio</a>
        </div>
    </div>

</div>

<footer>
    © 2025 | Cesar Antonio Serrano Gutiérrez
</footer>

</body>
</html>
