package com.proyecto.controladores;

/**
 * Autor: Cesar Antonio Serrano Gutiérrez
 * Fecha: 27-04-2025
 * Servlet para registrar clientes de Car Clean.
 */

import com.proyecto.modelos.ServicioImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet(name = "RegistroClienteServlet", urlPatterns = {"/RegistroClienteServlet"})
public class RegistroClienteServlet extends HttpServlet {

    private static final String URL = "jdbc:mysql://localhost:3306/guia2poo";
    private static final String USER = "root"; // Tu usuario de MySQL
    private static final String PASS = "";     // Tu contraseña de MySQL

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nombres = request.getParameter("nombres");
        String apellidos = request.getParameter("apellidos");
        boolean vip = Boolean.parseBoolean(request.getParameter("vip"));

        String marca = request.getParameter("marca");
        String modelo = request.getParameter("modelo");
        int anio = Integer.parseInt(request.getParameter("anio"));

        String tipoServicio = request.getParameter("tipoServicio");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(URL, USER, PASS);

            // Insertar automotor
            String sqlAutomotor = "INSERT INTO automotor (marca, modelo, year) VALUES (?, ?, ?)";
            PreparedStatement psAutomotor = con.prepareStatement(sqlAutomotor, PreparedStatement.RETURN_GENERATED_KEYS);
            psAutomotor.setString(1, marca);
            psAutomotor.setString(2, modelo);
            psAutomotor.setInt(3, anio);
            psAutomotor.executeUpdate();

            ResultSet rsAutomotor = psAutomotor.getGeneratedKeys();
            int automotorId = 0;
            if (rsAutomotor.next()) {
                automotorId = rsAutomotor.getInt(1);
            }

            // Buscar el ID del servicio
            String sqlServicio = "SELECT id FROM servicio WHERE tipo = ?";
            PreparedStatement psServicio = con.prepareStatement(sqlServicio);
            psServicio.setString(1, tipoServicio);
            ResultSet rsServicio = psServicio.executeQuery();

            int servicioId = 0;
            if (rsServicio.next()) {
                servicioId = rsServicio.getInt("id");
            }

            // Insertar cliente
            String sqlCliente = "INSERT INTO cliente (nombres, apellidos, vip, automotor_id, servicio_id) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement psCliente = con.prepareStatement(sqlCliente);
            psCliente.setString(1, nombres);
            psCliente.setString(2, apellidos);
            psCliente.setBoolean(3, vip);
            psCliente.setInt(4, automotorId);
            psCliente.setInt(5, servicioId);
            psCliente.executeUpdate();

            con.close();

            response.sendRedirect("listaClientes.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
