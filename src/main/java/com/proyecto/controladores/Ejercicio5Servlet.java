// Autor: Cesar Antonio Serrano Gutiérrez
// Fecha: 2025-04-27

package com.proyecto.controladores;

import com.proyecto.modelos.Automotor;
import com.proyecto.modelos.Cliente;
import com.proyecto.modelos.Registro;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "Ejercicio5", urlPatterns = {"/Ejercicio5"})
public class Ejercicio5Servlet extends HttpServlet {

    private Connection getConnection() throws SQLException {
        String url = "jdbc:mysql://localhost:3306/guia2poo";
        String user = "root";
        String password = "";
        return DriverManager.getConnection(url, user, password);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try (Connection conn = getConnection()) {
            List<Registro> registros = new ArrayList<>();

            String sql = """
                SELECT c.id, c.nombres, c.apellidos, c.vip, 
                       a.marca, a.modelo, a.year, 
                       c.tipo_vehiculo
                FROM cliente c
                INNER JOIN automotor a ON c.automotor_id = a.id
                """;

            try (PreparedStatement ps = conn.prepareStatement(sql);
                 ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Cliente cliente = new Cliente(rs.getInt("id"), rs.getString("nombres"), rs.getString("apellidos"), rs.getBoolean("vip"));
                    Automotor automotor = new Automotor(rs.getString("marca"), rs.getString("modelo"), rs.getInt("year"));
                    String tipoVehiculo = rs.getString("tipo_vehiculo");
                    boolean descuento = rs.getBoolean("vip");

                    Registro r = new Registro(cliente, automotor, tipoVehiculo, descuento);
                    registros.add(r);
                }
            }

            request.setAttribute("registros", registros);

            request.getRequestDispatcher("ejercicio5.jsp").forward(request, response);
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Recoger datos del formulario
        String nombres = request.getParameter("nombres");
        String apellidos = request.getParameter("apellidos");
        boolean vip = request.getParameter("vip") != null;
        String marca = request.getParameter("marca");
        String modelo = request.getParameter("modelo");
        int year = Integer.parseInt(request.getParameter("year"));
        String tipoVehiculo = request.getParameter("tipoVehiculo");

        // Validación para evitar error de tipoVehiculo vacío
        if (tipoVehiculo == null || tipoVehiculo.isEmpty()) {
            request.setAttribute("error", "Debe seleccionar un tipo de vehículo.");
            request.getRequestDispatcher("ejercicio5.jsp").forward(request, response);
            return;
        }

        try (Connection conn = getConnection()) {
            conn.setAutoCommit(false);

            // Insertar automotor
            String sqlAuto = "INSERT INTO automotor (marca, modelo, year) VALUES (?, ?, ?)";
            int automotorId;
            try (PreparedStatement psAuto = conn.prepareStatement(sqlAuto, Statement.RETURN_GENERATED_KEYS)) {
                psAuto.setString(1, marca);
                psAuto.setString(2, modelo);
                psAuto.setInt(3, year);
                psAuto.executeUpdate();
                ResultSet rs = psAuto.getGeneratedKeys();
                if (rs.next()) {
                    automotorId = rs.getInt(1);
                } else {
                    throw new SQLException("No se pudo obtener ID de automotor.");
                }
            }

            // Insertar cliente
            String sqlCliente = "INSERT INTO cliente (nombres, apellidos, vip, automotor_id, tipo_vehiculo) VALUES (?, ?, ?, ?, ?)";
            try (PreparedStatement psCliente = conn.prepareStatement(sqlCliente)) {
                psCliente.setString(1, nombres);
                psCliente.setString(2, apellidos);
                psCliente.setBoolean(3, vip);
                psCliente.setInt(4, automotorId);
                psCliente.setString(5, tipoVehiculo);
                psCliente.executeUpdate();
            }

            conn.commit();
            response.sendRedirect("Ejercicio5");

        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
}
