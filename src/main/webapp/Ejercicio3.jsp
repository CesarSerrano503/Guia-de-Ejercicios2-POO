<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--
    Autor: Cesar Antonio Serrano Gutiérrez
    Fecha de creación: 27-04-2025
    Descripción: Página principal del Ejercicio 3 - Agenda de Contactos.
--%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Agenda de Contactos - Inicio</title>
    <style>
        body {
            font-family: 'Poppins', Arial, sans-serif;
            background-color: #f8f9fa;
            text-align: center;
            padding: 50px;
        }
        .container {
            background: #fff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            max-width: 500px;
            margin: 0 auto;
        }
        h1 {
            color: #198754;
            margin-bottom: 20px;
        }
        p {
            font-size: 1.2em;
            color: #666;
            margin-bottom: 30px;
        }
        a {
            display: inline-block;
            padding: 15px 25px;
            background-color: #198754;
            color: white;
            text-decoration: none;
            border-radius: 10px;
            font-weight: bold;
            transition: background-color 0.3s;
        }
        a:hover {
            background-color: #145c32;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>Bienvenido a la Agenda de Contactos</h1>
    <p>Desde aquí puedes registrar nuevos contactos fácilmente.</p>

    <a href="registroContacto.jsp">Registrar Contacto</a>
</div>

</body>
</html>
