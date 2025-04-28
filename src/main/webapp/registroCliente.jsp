<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%--
    Autor: Cesar Antonio Serrano Gutiérrez
    Fecha: 27-04-2025
    Descripción: Formulario de registro para clientes Car Clean.
--%>

<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Registro de Cliente - Car Clean</title>

  <style>
    /* Estilos generales del cuerpo de la página */
    body {
      font-family: 'Poppins', Arial, sans-serif;
      margin: 0;
      padding: 0;
      background-color: #f8f9fa;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh; /* Altura de pantalla completa */
    }

    /* Contenedor principal del formulario */
    .container {
      background: #fff;
      padding: 40px;
      border-radius: 10px;
      box-shadow: 0 4px 8px rgba(0,0,0,0.1);
      width: 100%;
      max-width: 500px;
    }

    /* Título del formulario */
    h1 {
      text-align: center;
      color: #198754;
      margin-bottom: 30px;
    }

    /* Estilos del formulario */
    form {
      display: flex;
      flex-direction: column;
    }

    /* Etiquetas de cada campo */
    label {
      margin-top: 10px;
      margin-bottom: 5px;
      font-weight: bold;
      color: #555;
    }

    /* Campos de entrada y select */
    input, select {
      padding: 10px;
      margin-bottom: 15px;
      border: 1px solid #ccc;
      border-radius: 5px;
      font-size: 1em;
    }

    /* Botón de enviar formulario */
    .submit {
      background-color: #198754;
      color: #fff;
      padding: 12px;
      border: none;
      border-radius: 8px;
      font-size: 1em;
      font-weight: bold;
      cursor: pointer;
      transition: background-color .3s;
    }

    /* Efecto hover para el botón de envío */
    .submit:hover {
      background-color: #145c32;
    }

    /* Enlace para regresar al menú principal */
    .btn-back {
      display: block;
      text-align: center;
      margin-top: 20px;
      font-size: 0.9em;
      color: #555;
      text-decoration: none;
    }

    /* Efecto hover en el botón de volver */
    .btn-back:hover {
      color: #198754;
    }
  </style>

</head>

<body>

<!-- Contenedor principal del formulario -->
<div class="container">
  <h1>Registro de Cliente</h1>

  <!-- Formulario para enviar datos al servlet RegistroClienteServlet -->
  <form action="RegistroClienteServlet" method="post">

    <!-- Campo para nombres -->
    <label>Nombres:</label>
    <input type="text" name="nombres" required>

    <!-- Campo para apellidos -->
    <label>Apellidos:</label>
    <input type="text" name="apellidos" required>

    <!-- Selección si tiene tarjeta VIP -->
    <label>¿Tiene tarjeta VIP?</label>
    <select name="vip" required>
      <option value="true">Sí</option>
      <option value="false">No</option>
    </select>

    <!-- Campo para marca del automotor -->
    <label>Marca del Automotor:</label>
    <input type="text" name="marca" required>

    <!-- Campo para modelo del automotor -->
    <label>Modelo del Automotor:</label>
    <input type="text" name="modelo" required>

    <!-- Campo para año del automotor -->
    <label>Año del Automotor:</label>
    <input type="number" name="anio" min="1900" max="2025" required>

    <!-- Selección del tipo de automotor -->
    <label>Tipo de Automotor:</label>
    <select name="tipoServicio" required>
      <option value="Motocicleta">Motocicleta</option>
      <option value="Sedan">Sedan</option>
      <option value="Camioneta">Camioneta</option>
      <option value="Microbús">Microbús</option>
      <option value="Autobús">Autobús</option>
    </select>

    <!-- Botón para enviar el formulario -->
    <input type="submit" class="submit" value="Registrar Cliente">
  </form>

  <!-- Enlace para regresar al menú principal de Car Clean -->
  <a class="btn-back" href="Ejercicio5.jsp">← Volver al Inicio de Car Clean</a>
</div>

</body>
</html>
