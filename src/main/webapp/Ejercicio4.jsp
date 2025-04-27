<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--
    Autor: Cesar Antonio Serrano Gutiérrez
    Fecha de creación: 26/04/2025
    Descripción: Formulario para capturar datos de clientes y vehículos en Importadora.
--%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Ejercicio 4 - Importadora de Vehículos</title>

    <%-- Estilos simples para mantener consistencia --%>
    <style>
        body {
            margin: 0;
            padding: 0;
            background-color: #f8f9fa;
            font-family: 'Poppins', sans-serif;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding-bottom: 40px;
        }

        header {
            margin-top: 30px;
            text-align: center;
        }

        header h1 {
            font-size: 2.2em;
            color: #333;
        }

        .form-container {
            background: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 2px 8px rgba(0, 0, 0, 0.1);
            margin-top: 30px;
            width: 90%;
            max-width: 600px;
        }

        .form-group {
            margin-bottom: 20px;
            text-align: left;
        }

        label {
            font-weight: bold;
            display: block;
            margin-bottom: 8px;
        }

        input[type="text"],
        input[type="number"],
        select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 1em;
        }

        .btn-submit {
            background-color: #198754;
            color: white;
            border: none;
            padding: 12px 20px;
            border-radius: 8px;
            font-size: 1em;
            font-weight: bold;
            cursor: pointer;
            width: 100%;
            transition: background-color 0.3s;
        }

        .btn-submit:hover {
            background-color: #145c32;
        }

        .return-link {
            margin-top: 20px;
            display: block;
            color: #198754;
            text-decoration: none;
            font-weight: bold;
        }

        .return-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<header>
    <h1>Registro de Clientes y Vehículos</h1>
</header>

<div class="form-container">
    <form action="RegistroImportadoraServlet" method="post">
        <div class="form-group">
            <label for="nombre">Nombre completo:</label>
            <input type="text" id="nombre" name="nombre" required>
        </div>

        <div class="form-group">
            <label for="sexo">Sexo:</label>
            <select id="sexo" name="sexo" required>
                <option value="">Seleccione una opción</option>
                <option value="Masculino">Masculino</option>
                <option value="Femenino">Femenino</option>
            </select>
        </div>

        <div class="form-group">
            <label for="marca">Marca del vehículo:</label>
            <select id="marca" name="marca" required>
                <option value="">Seleccione una opción</option>
                <option value="Nissan">Nissan</option>
                <option value="Toyota">Toyota</option>
                <option value="Kia">Kia</option>
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

        <button type="submit" class="btn-submit">Registrar Vehículo</button>
    </form>

    <a href="index.jsp" class="return-link">← Regresar al Menú Principal</a>
</div>

</body>
</html>
