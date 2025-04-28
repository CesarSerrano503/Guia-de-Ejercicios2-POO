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
    body {
      font-family: 'Poppins', Arial, sans-serif;
      margin: 0;
      padding: 0;
      background-color: #f8f9fa;
    }
    .container {
      max-width: 1200px;
      margin: 40px auto;
      background: #fff;
      padding: 30px;
      box-shadow: 0 4px 8px rgba(0,0,0,0.1);
      border-radius: 10px;
    }
    h1 {
      text-align: center;
      color: #198754;
      margin-bottom: 30px;
    }
    table {
      width: 100%;
      border-collapse: collapse;
      margin-bottom: 30px;
    }
    th, td {
      border: 1px solid #dee2e6;
      padding: 12px;
      text-align: center;
    }
    th {
      background-color: #198754;
      color: white;
      font-size: 1.1em;
    }
    tr:nth-child(even) {
      background-color: #f2f2f2;
    }
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
    a.button:hover {
      background-color: #145c32;
    }
    .btn-center {
      text-align: center;
    }
  </style>
</head>
<body>

<div class="container">
  <h1>Clientes Registrados - Car Clean</h1>

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
      String url = "jdbc:mysql://localhost:3306/guia2poo";
      String user = "root";
      String pass = "";

      try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(url, user, pass);

        String sql = "SELECT c.nombres, c.apellidos, a.marca, a.modelo, a.year, s.tipo, s.precio, c.vip " +
                "FROM cliente c " +
                "JOIN automotor a ON c.automotor_id = a.id " +
                "JOIN servicio s ON c.servicio_id = s.id";

        PreparedStatement ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();

        while(rs.next()) {
          String nombreCompleto = rs.getString("nombres") + " " + rs.getString("apellidos");
          String marca = rs.getString("marca");
          String modelo = rs.getString("modelo");
          int year = rs.getInt("year");
          String tipoVehiculo = rs.getString("tipo");
          double precioBase = rs.getDouble("precio");
          boolean vip = rs.getBoolean("vip");

          double totalPagar = vip ? precioBase * 0.85 : precioBase;
    %>
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
        }
        con.close();
      } catch(Exception e) {
        out.println("Error: " + e.getMessage());
      }
    %>
    </tbody>
  </table>

  <div class="btn-center">
    <a href="registroCliente.jsp" class="button">Registrar Nuevo Cliente</a>
  </div>
</div>

</body>
</html>
