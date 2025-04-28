<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--
    Autor: Cesar Antonio Serrano Gutiérrez
    Fecha: 27-04-2025
    Descripción: Página para buscar un contacto por nombre en la agenda.
--%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Buscar Contacto</title>
    <style>
        body {
            font-family: 'Poppins', Arial, sans-serif;
            background-color: #f8f9fa;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            background: #fff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            width: 100%;
            max-width: 500px;
        }
        h1 {
            text-align: center;
            color: #198754;
            margin-bottom: 30px;
        }
        form {
            display: flex;
            flex-direction: column;
        }
        label {
            margin-top: 10px;
            margin-bottom: 5px;
            font-weight: bold;
            color: #555;
        }
        input {
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 1em;
        }
        .submit {
            background-color: #198754;
            color: #fff;
            padding: 12px;
            border: none;
            border-radius: 8px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s;
            margin-top: 20px;
        }
        .submit:hover {
            background-color: #145c32;
        }
        .btn-back {
            display: block;
            text-align: center;
            margin-top: 20px;
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
    <h1>Buscar Contacto</h1>

    <form action="AgendaContactoServlet" method="post">
        <input type="hidden" name="accion" value="buscar">

        <label>Nombre del Contacto:</label>
        <input type="text" name="nombreBuscar" required>

        <input type="submit" class="submit" value="Buscar">
    </form>

    <a href="index.jsp" class="btn-back">← Volver al menú principal</a>
</div>

</body>
</html>
