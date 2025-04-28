
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
// Hecho por Sara Torres
// Día: 26/04/2025

<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulario Estudiante</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="p-6 font-sans">
<h2 class="text-2xl font-bold mb-6">Formulario Estudiante</h2>
<form action="procesarEstudiante" method="POST" class="space-y-4" onsubmit="return validarEdad()">
    <div>
        <label for="carnet" class="block">Carnet (ej. AB123456):</label>
        <input type="text" id="carnet" name="carnet" required pattern="^[a-zA-Z]{2}\d{6}$" class="w-full p-2 border rounded">
    </div>

    <div>
        <label for="nombres" class="block">Nombres:</label>
        <input type="text" id="nombres" name="nombres" required maxlength="25" pattern="[a-zA-Z\s]+" title="Solo letras y espacios permitidos" class="w-full p-2 border rounded">
    </div>

    <div>
        <label for="apellidos" class="block">Apellidos:</label>
        <input type="text" id="apellidos" name="apellidos" required maxlength="25" pattern="[a-zA-Z\s]+" title="Solo letras y espacios permitidos" class="w-full p-2 border rounded">
    </div>

    <div>
        <label for="direccion" class="block">Dirección:</label>
        <textarea id="direccion" name="direccion" required maxlength="255" class="w-full p-2 border rounded"></textarea>
    </div>

    <div>
        <label for="telefono" class="block">Teléfono (ej. 0000-0000):</label>
        <input type="text" id="telefono" name="telefono" required pattern="^\d{4}-\d{4}$" class="w-full p-2 border rounded">
    </div>

    <div>
        <label for="email" class="block">Email:</label>
        <input type="email" id="email" name="email" required class="w-full p-2 border rounded">
    </div>

    <div>
        <label for="fechaNacimiento" class="block">Fecha de Nacimiento (DD/MM/YYYY):</label>
        <input type="text" id="fechaNacimiento" name="fechaNacimiento" required pattern="^(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[0-2])/\d{4}$" placeholder="DD/MM/YYYY" class="w-full p-2 border rounded">
        <p id="errorFechaNacimiento" class="text-red-500 text-sm italic"></p>
    </div>

    <div>
        <input type="submit" value="Enviar" class="px-4 py-2 bg-blue-500 text-white rounded hover:bg-blue-700">
    </div>

    <script>
        function validarEdad() {
            const fechaNacimientoInput = document.getElementById('fechaNacimiento');
            const errorFechaNacimiento = document.getElementById('errorFechaNacimiento');
            const fechaNacimientoValue = fechaNacimientoInput.value;

            // Verificar el formato DD/MM/YYYY con la expresión regular
            const formatoValido = /^(0[1-9]|[12][0-9]|3[01])\/(0[1-9]|1[0-2])\/\d{4}$/.test(fechaNacimientoValue);
            if (!formatoValido) {
                errorFechaNacimiento.textContent = 'Por favor, ingrese la fecha en formato DD/MM/YYYY.';
                return false;
            } else {
                errorFechaNacimiento.textContent = ''; // Limpiar mensaje de error
            }

            const partesFecha = fechaNacimientoValue.split('/');
            const dia = parseInt(partesFecha[0], 10);
            const mes = parseInt(partesFecha[1], 10) - 1; // ¡Meses en JavaScript son de 0 a 11!
            const anio = parseInt(partesFecha[2], 10);

            const fechaNacimiento = new Date(anio, mes, dia);
            const fechaActual = new Date();
            const edadMinimaAnios = 16;

            // Calcular la fecha mínima de nacimiento permitida (hace 16 años)
            const fechaMinimaNacimiento = new Date(
                fechaActual.getFullYear() - edadMinimaAnios,
                fechaActual.getMonth(),
                fechaActual.getDate()
            );

            // Verificar si la fecha de nacimiento es anterior a la fecha mínima
            if (fechaNacimiento > fechaMinimaNacimiento) {
                errorFechaNacimiento.textContent = 'Debe tener al menos 16 años cumplidos.';
                return false;
            }

            return true; // La validación pasó
        }
    </script>
</form>
</body>
</html>