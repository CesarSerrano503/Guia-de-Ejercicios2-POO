<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" %>
<%--
    Autor: Cesar Antonio Serrano Gutiérrez
    Fecha: 27-04-2025
    Descripción: Página que muestra la lista de clientes registrados en Car Clean.
--%>

<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Lista de Clientes - Car Clean</title>

  <style>
    /* Estilos generales del cuerpo de la página */
    body {
      font-family: 'Poppins', Arial, sans-serif;
      margin: 0;
      padding: 0;
      background-color: #f8f9fa;
    }

    /* Contenedor principal */
    .container {
      max-width: 1200px;
      margin: 40px auto;
      background: #fff;
      padding: 30px;
      box-shadow: 0 4px 8px rgba(0,0,0,0.1);
      border-radius: 10px;
    }

    /* Título principal */
    h1 {
      text-align: center;
      color: #198754;
      margin-bottom: 30px;
    }

    /* Tabla de clientes */
    table {
      width: 100%;
      border-collapse: collapse;
      margin-bottom: 30px;
    }

    /* Celdas y bordes de la tabla */
    th, td {
      border: 1px solid #dee2e6;
      padding: 12px;
      text-align: center;
    }

    /* Estilo para los encabezados */
    th {
      background-color: #198754;
      color: white;
      font-size: 1.1em;
    }

    /* Filas pares con color distinto */
    tr:nth-child(even) {
      background-color: #f2f2f2;
    }

    /* Estilo de botones */
    a.button {
      display: inline-block;
      padding: 12px 20px;
      background-color: #198754;
      color: #fff;
      text-decoration: none;
      font-weight: bold;
      border-radius: 8px;
      transition: background-color 0.3s;
    }

    /* Efecto hover en botones */
    a.button:hover {
      background-color: #145c32;
    }

    /* Centrado del botón */
    .btn-center {
      text-align: center;
    }
  </style>

</head>

<body>

<!-- Contenedor principal de la página -->
<div class="container">
  <h1>Clientes Registrados - Car Clean</h1>

  <!-- Tabla donde se mostrarán los datos de los clientes -->
  <table>
    <thead>
    <tr>
      <th>Nombre Completo</th>
      <th>Marca</th>
      <th>Modelo</th>
      <th>Año</th>
      <th>Tipo de Vehículo</th>
      <th>Precio Base</th>
      <th>VIP</th>
      <th>Total a Pagar</th>
    </tr>
    </thead>

    <tbody>
    <%
      // Configuración de conexión a la base de datos
      String url = "jdbc:mysql://localhost:3306/guia2poo";
      String user = "root";
      String pass = "";

      try {
        // Carga del driver JDBC para MySQL
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Establecimiento de la conexión
        Connection con = DriverManager.getConnection(url, user, pass);

        // Consulta SQL para obtener los datos de clientes, automotores y servicios
        String sql = "SELECT c.nombres, c.apellidos, a.marca, a.modelo, a.year, s.tipo, s.precio, c.vip " +
                "FROM cliente c " +
                "JOIN automotor a ON c.automotor_id = a.id " +
                "JOIN servicio s ON c.servicio_id = s.id";

        // Preparar y ejecutar la consulta
        PreparedStatement ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();

        // Recorrer los resultados y mostrarlos en la tabla
        while(rs.next()) {
          String nombreCompleto = rs.getString("nombres") + " " + rs.getString("apellidos");
          String marca = rs.getString("marca");
          String modelo = rs.getString("modelo");
          int year = rs.getInt("year");
          String tipoVehiculo = rs.getString("tipo");
          double precioBase = rs.getDouble("precio");
          boolean vip = rs.getBoolean("vip");

          // Calcular total a pagar (15% de descuento si es VIP)
          double totalPagar = vip ? precioBase * 0.85 : precioBase;
    %>
    <!-- Mostrar cada cliente en una fila de la tabla -->
    <tr>
      <td><%= nombreCompleto %></td>
      <td><%= marca %></td>
      <td><%= modelo %></td>
      <td><%= year %></td>
      <td><%= tipoVehiculo %></td>
      <td>$<%= String.format("%.2f", precioBase) %></td>
      <td><%= vip ? "Sí" : "No" %></td>
      <td>$<%= String.format("%.2f", totalPagar) %></td>
    </tr>
    <%
        } // Fin del while
        con.close(); // Cierre de la conexión
      } catch(Exception e) {
        // Mostrar mensaje de error en caso de excepción
        out.println("Error: " + e.getMessage());
      }
    %>
    </tbody>
  </table>

  <!-- Botón para registrar nuevo cliente -->
  <div class="btn-center">
    <a href="registroCliente.jsp" class="button">Registrar Nuevo Cliente</a>
  </div>

</div>

</body>
</html>
