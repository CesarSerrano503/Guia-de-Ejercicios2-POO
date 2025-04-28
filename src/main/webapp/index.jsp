<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--
    Autor: Cesar Antonio Serrano Gutiérrez
    Fecha de creación: 26/04/2025
    Descripción: Página principal para navegar entre los ejercicios de la Guía de Ejercicios 2.
--%>
<% String ctx = request.getContextPath(); %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Guía de Ejercicios 2 - Navegación</title>
    <style>
        /* Estilos principales (sin cambios) */
        body { margin: 0; padding: 0; background-color: #f8f9fa; font-family: 'Poppins', sans-serif; display: flex; flex-direction: column; align-items: center; }
        header { margin-top: 30px; text-align: center; }
        header h1 { font-size: 2.5em; color: #333; }
        .container { display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 20px; max-width: 1200px; padding: 40px 20px; }
        .card { background: #fff; border: 1px solid #dee2e6; border-radius: 10px; overflow: hidden; display: flex; flex-direction: column; justify-content: space-between; box-shadow: 0 2px 8px rgba(0,0,0,0.05); transition: box-shadow .3s; }
        .card:hover { box-shadow: 0 4px 12px rgba(0,0,0,0.2); }
        .card img { width: 100%; height: 200px; object-fit: cover; }
        .card-content { padding: 20px; flex-grow: 1; display: flex; flex-direction: column; justify-content: flex-start; text-align: center; }
        .card-title { font-size: 1.4em; font-weight: bold; margin-bottom: 10px; color: #000; }
        .card-question { font-size: 1em; color: #555; margin-bottom: 10px; }
        .card-description { font-size: 0.95em; color: #666; margin-top: 10px; display: none; }
        .btn-more { margin: 10px 0; background: transparent; border: none; color: #198754; cursor: pointer; font-weight: bold; }
        .btn { background-color: #198754; color: #fff; padding: 12px; border-radius: 8px; text-decoration: none; font-weight: bold; margin-top: 15px; display: inline-block; transition: background-color .3s; }
        .btn:hover { background-color: #145c32; }
        footer { margin-top: 40px; padding: 20px; font-size: 0.9em; color: #888; text-align: center; }
    </style>
    <script>
        function toggleDescription(btn) {
            var desc = btn.nextElementSibling;
            if (!desc.style.display || desc.style.display === 'none') {
                desc.style.display = 'block'; btn.textContent = 'Menos información';
            } else {
                desc.style.display = 'none'; btn.textContent = 'Más información';
            }
        }
    </script>
</head>
<body>
<header><h1>Guía de Ejercicios 2</h1></header>
<div class="container">
    <!-- Ejercicio 1 -->
    <div class="card">
        <img src="<%=ctx%>/img/ejercicio1.jpg" alt="Ficha Estudiante">
        <div class="card-content">
            <div class="card-title">Ejercicio 1: Ficha de Estudiante</div>
            <div class="card-question">¿Quieres registrar fácilmente los datos de estudiantes?</div>
            <button class="btn-more" onclick="toggleDescription(this)">Más información</button>
            <div class="card-description">Con este módulo podrás registrar de forma segura el nombre, dirección, teléfono y correo de cada alumno.</div>
            <a href="<%=ctx%>/Ejercicio1.jsp" class="btn">Ir al Ejercicio</a>
        </div>
    </div>
    <!-- Ejercicio 2 -->
    <div class="card">
        <img src="<%=ctx%>/img/ejercicio2.jpg" alt="Cálculo Vacaciones">
        <div class="card-content">
            <div class="card-title">Ejercicio 2: Cálculo de Vacaciones</div>
            <div class="card-question">¿Te gustaría saber cuántos días de vacaciones le corresponden a un empleado?</div>
            <button class="btn-more" onclick="toggleDescription(this)">Más información</button>
            <div class="card-description">Calcula automáticamente los días de descanso de un trabajador según sus años de servicio.</div>
            <a href="<%=ctx%>/Ejercicio2.jsp" class="btn">Ir al Ejercicio</a>
        </div>
    </div>
    <!-- Ejercicio 3 -->
    <div class="card">
        <img src="<%=ctx%>/img/ejercicio3.jpg" alt="Agenda Contactos">
        <div class="card-content">
            <div class="card-title">Ejercicio 3: Agenda de Contactos</div>
            <div class="card-question">¿Quieres tener tus contactos organizados y al alcance de un clic?</div>
            <button class="btn-more" onclick="toggleDescription(this)">Más información</button>
            <div class="card-description">Guarda nombres, teléfonos y correos y búscalos fácilmente.</div>
            <a href="<%=ctx%>/Ejercicio3.jsp" class="btn">Ir al Ejercicio</a>
        </div>
    </div>
    <!-- Ejercicio 4 -->
    <div class="card">
        <img src="<%=ctx%>/img/ejercicio4.jpg" alt="Importadora Vehículos">
        <div class="card-content">
            <div class="card-title">Ejercicio 4: Importadora</div>
            <div class="card-question">¿Te gustaría gestionar las ventas de autos de manera eficiente?</div>
            <button class="btn-more" onclick="toggleDescription(this)">Más información</button>
            <div class="card-description">Registra ventas de vehículos y obtén estadísticas de marcas y años vendidos.</div>
            <a href="<%=ctx%>/Ejercicio4.jsp" class="btn">Ir al Ejercicio</a>
        </div>
    </div>
    <!-- Ejercicio 5 -->
    <div class="card">
        <img src="<%=ctx%>/img/ejercicio5.jpg" alt="Car Clean Lavado">
        <div class="card-content">
            <div class="card-title">Ejercicio 5: Car Clean</div>
            <div class="card-question">¿Quieres calcular el precio de lavado de tu vehículo?</div>
            <button class="btn-more" onclick="toggleDescription(this)">Más información</button>
            <div class="card-description">Calcula precios y descuentos VIP rápidamente.</div>
            <a href="<%=ctx%>/Ejercicio5.jsp" class="btn">Ir al Ejercicio</a>
        </div>
    </div>
</div>
<footer>© 2025 | Cesar Antonio Serrano Gutiérrez</footer>
</body>
</html>
