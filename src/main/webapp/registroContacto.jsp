<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--
    Autor: Cesar Antonio Serrano Gutiérrez
    Fecha: 27-04-2025
    Descripción: Página para registrar un nuevo contacto y navegar entre las opciones de la agenda.
--%>

<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Registrar Contacto</title>
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
      text-align: center;
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
      text-align: left;
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
    .button-link {
      display: inline-block;
      background-color: #198754;
      color: #fff;
      padding: 10px 20px;
      margin-top: 10px;
      border-radius: 8px;
      text-decoration: none;
      font-weight: bold;
      transition: background-color 0.3s;
    }
    .button-link:hover {
      background-color: #145c32;
    }
  </style>
</head>
<body>

<div class="container">
  <h1>Registrar Nuevo Contacto</h1>

  <form action="AgendaContactoServlet" method="post">
    <input type="hidden" name="accion" value="agregar">

    <label>Nombre:</label>
    <input type="text" name="nombre" required>

    <label>Teléfono:</label>
    <input type="text" name="telefono" required>

    <label>Correo Electrónico:</label>
    <input type="email" name="correo" required>

    <input type="submit" class="submit" value="Guardar Contacto">
  </form>

  <div style="margin-top: 30px;">
    <a href="listaContactos.jsp" class="button-link">Ver Lista de Contactos</a><br>
    <a href="buscarContacto.jsp" class="button-link">Buscar Contacto por Nombre</a>
  </div>

  <div style="margin-top: 20px;">
    <a href="index.jsp" class="button-link" style="background-color: #6c757d;">← Volver al menú principal</a>
  </div>
</div>

</body>
</html>
