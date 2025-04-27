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

    <%-- Estilos: Texto negro normal, blanco en hover --%>
    <style>
        body {
            margin: 0;
            padding: 0;
            min-height: 100vh;
            font-family: 'Poppins', sans-serif;
            background-color: #f8f9fa;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        header {
            margin-top: 40px;
            text-align: center;
        }

        header h1 {
            font-size: 2.5em;
            color: #333;
            margin-bottom: 10px;
        }

        .container {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 30px;
            width: 90%;
            max-width: 700px;
            margin-top: 40px;
            padding-bottom: 40px;
        }

        .card {
            background: #ffffff;
            border: 1px solid #dee2e6;
            border-radius: 12px;
            width: 100%;
            height: 150px; /* Altura fija */
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            transition: background-color 0.3s ease, box-shadow 0.3s ease;
            box-shadow: 0px 2px 8px rgba(0, 0, 0, 0.05);
        }

        .card:hover {
            background-color: #198754; /* Fondo verde fuerte */
            box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.2);
        }

        .card a {
            text-decoration: none;
            color: #000000; /* Texto negro normal */
            font-size: 20px;
            font-weight: 600;
            width: 100%;
            height: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: color 0.3s ease;
        }

        .card:hover a {
            color: #ffffff; /* Texto blanco en hover */
        }

        .single-card {
            grid-column: span 2;
            justify-self: center;
            width: 50%;
        }

        footer {
            margin-top: auto;
            padding: 20px;
            text-align: center;
            color: #888;
            font-size: 0.9em;
        }
    </style>
</head>
<body>

<%-- Encabezado --%>
<header>
    <h1>Guía de Ejercicios 2 </h1>
</header>

<%-- Contenedor de botones --%>
<div class="container">
    <div class="card">
        <a href="Ejercicio1.jsp">Ejercicio 1<br>Ficha de Estudiante</a>
    </div>
    <div class="card">
        <a href="Ejercicio2.jsp">Ejercicio 2<br>Cálculo de Vacaciones</a>
    </div>
    <div class="card">
        <a href="Ejercicio3.jsp">Ejercicio 3<br>Agenda de Contactos</a>
    </div>
    <div class="card">
        <a href="Ejercicio4.jsp">Ejercicio 4<br>Importadora</a>
    </div>
    <div class="card single-card">
        <a href="Ejercicio5.jsp">Ejercicio 5<br>Car Clean</a>
    </div>
</div>

<%-- Pie de página --%>
<footer>
    © 2025 | Cesar Antonio Serrano Gutiérrez
</footer>

</body>
</html>
