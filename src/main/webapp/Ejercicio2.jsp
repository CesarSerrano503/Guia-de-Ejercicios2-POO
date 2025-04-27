<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Cálculo de Vacaciones</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body class="bg-gray-100 min-h-screen flex items-center justify-center">

<div id="formulario-container" class="bg-white p-8 rounded-lg shadow-lg w-full max-w-md">
  <h2 class="text-2xl font-bold mb-6 text-center">Formulario de Datos</h2>

  <form id="formulario-vacaciones" action="vacaciones" method="post" onsubmit="return validarFormulario();">
    <div class="mb-4">
      <label class="block text-gray-700 mb-2">Nombre:</label>
      <input type="text" name="nombre" id="nombre" required onkeypress="return soloLetras(event);"
             class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500">
    </div>

    <div class="mb-4">
      <label class="block text-gray-700 mb-2">Apellidos:</label>
      <input type="text" name="apellidos" id="apellidos" required onkeypress="return soloLetras(event);"
             class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500">
    </div>

    <div class="mb-4">
      <label class="block text-gray-700 mb-2">Salario Mensual:</label>
      <input type="number" step="0.01" name="salario" id="salario" required
             class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500">
    </div>

    <div class="mb-6">
      <label class="block text-gray-700 mb-2">Fecha de Ingreso:</label>
      <input type="date" name="fechaIngreso" id="fechaIngreso" required
             class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500">
    </div>

    <button type="submit"
            class="w-full bg-blue-500 text-white font-bold py-2 px-4 rounded hover:bg-blue-600">
      Calcular Vacaciones
    </button>
  </form>
</div>

<div id="informacion-persona" class="bg-white p-8 rounded-lg shadow-lg w-full max-w-md hidden">
  <h2 class="text-2xl font-bold mb-6 text-center">Información de la Persona</h2>
  <table class="w-full border-collapse shadow-md">
    <thead>
    <tr class="bg-gray-200">
      <th class="border border-gray-300 p-2 text-left font-semibold">Campo</th>
      <th class="border border-gray-300 p-2 text-left">Valor</th>
    </tr>
    </thead>
    <tbody>
    <tr>
      <td class="border border-gray-300 p-2 font-semibold">Nombre</td>
      <td id="info-nombre" class="border border-gray-300 p-2"></td>
    </tr>
    <tr>
      <td class="border border-gray-300 p-2 font-semibold">Apellidos</td>
      <td id="info-apellidos" class="border border-gray-300 p-2"></td>
    </tr>
    <tr>
      <td class="border border-gray-300 p-2 font-semibold">Salario Mensual</td>
      <td id="info-salario" class="border border-gray-300 p-2"></td>
    </tr>
    <tr>
      <td class="border border-gray-300 p-2 font-semibold">Fecha de Ingreso</td>
      <td id="info-fechaIngreso" class="border border-gray-300 p-2"></td>
    </tr>
    <tr>
      <td class="border border-gray-300 p-2 font-semibold">Días de Vacaciones</td>
      <td id="info-diasVacaciones" class="border border-gray-300 p-2"></td>
    </tr>
    </tbody>
  </table>
  <div class="mt-4 flex justify-center gap-4">
    <button class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded"
            onclick="mostrarFormulario()">Regresar
    </button>
    <button class="bg-green-500 hover:bg-green-700 text-white font-bold py-2 px-4 rounded"
            onclick="limpiarFormulario()">Nueva Persona
    </button>
  </div>
</div>

<script>
  // Función para validar que solo se ingresen letras
  function soloLetras(event) {
    const charCode = event.which ? event.which : event.keyCode;
    if ((charCode >= 65 && charCode <= 90) || (charCode >= 97 && charCode <= 122) || charCode === 32) {
      return true;
    } else {
      event.preventDefault();
      Swal.fire({
        icon: 'warning',
        title: 'Campo inválido',
        text: 'Por favor, ingrese solo letras en este campo.'
      });
      return false;
    }
  }

  // Clase FormularioVacaciones para gestionar los datos del formulario y calcular las vacaciones
  class FormularioVacaciones {
    constructor() {
      this.nombre = '';
      this.apellidos = '';
      this.salario = 0;
      this.fechaIngreso = '';
      this.diasVacaciones = 0;
    }

    // Método para obtener los datos del formulario
    obtenerDatos() {
      this.nombre = document.getElementById('nombre').value.trim();
      this.apellidos = document.getElementById('apellidos').value.trim();
      this.salario = parseFloat(document.getElementById('salario').value);
      this.fechaIngreso = document.getElementById('fechaIngreso').value;
    }

    // Método para validar los datos del formulario
    validarDatos() {
      if (!this.nombre || !this.apellidos || isNaN(this.salario) || !this.fechaIngreso) {
        Swal.fire({
          icon: 'warning',
          title: 'Campos incompletos',
          text: 'Por favor, complete todos los campos correctamente.'
        });
        return false;
      }

      if (this.salario <= 0) {
        Swal.fire({
          icon: 'error',
          title: 'Salario inválido',
          text: 'El salario debe ser mayor a 0.'
        });
        return false;
      }

      // Ya no necesitamos validar nombre y apellidos aquí, ya se hace con onkeypress
      return true;
    }

    // MEtodo para calcular los días de vacaciones
    calcularDiasVacaciones() {
      const fechaIngresoDate = new Date(this.fechaIngreso);
      const hoy = new Date();
      const tiempoTranscurrido = hoy.getTime() - fechaIngresoDate.getTime();
      const añosTranscurridos = tiempoTranscurrido / (1000 * 3600 * 24 * 365.25);

      if (añosTranscurridos >= 1 && añosTranscurridos < 2) {
        this.diasVacaciones = 12;
      } else if (añosTranscurridos >= 2 && añosTranscurridos < 3) {
        this.diasVacaciones = 14;
      } else if (añosTranscurridos >= 3 && añosTranscurridos < 4) {
        this.diasVacaciones = 16;
      } else if (añosTranscurridos >= 4) {
        this.diasVacaciones = Math.floor(16 + (añosTranscurridos - 4) * 2);
      } else {
        this.diasVacaciones = 0;
      }
    }
  }

  // Clase InterfazUsuario para manejar la interfaz de usuario
  class InterfazUsuario {
    constructor() {
      this.formularioContainer = document.getElementById('formulario-container');
      this.informacionPersona = document.getElementById('informacion-persona');
    }

    // Metodo para mostrar el formulario
    mostrarFormulario() {
      this.formularioContainer.classList.remove('hidden');
      this.informacionPersona.classList.add('hidden');
    }

    // Metodo para mostrar la tabla con la información de la persona
    mostrarInformacionPersona() {
      this.formularioContainer.classList.add('hidden');
      this.informacionPersona.classList.remove('hidden');
    }

    // Metodo para limpiar el formulario
    limpiarFormulario() {
      document.getElementById('formulario-vacaciones').reset();
      this.mostrarFormulario();
    }
  }

  // Crear instancias de las clases
  let formulario = new FormularioVacaciones();
  let interfaz = new InterfazUsuario();

  // Función que se ejecuta cuando el formulario se envía
  function validarFormulario() {
    // Obtener los datos del formulario
    formulario.obtenerDatos();

    // Validar los datos
    if (formulario.validarDatos()) {
      // Calcular los días de vacaciones
      formulario.calcularDiasVacaciones();
      // Si los datos son válidos, mostrar la información
      mostrarInformacion();
      interfaz.mostrarInformacionPersona();
    }
    return false; // Evitar que el formulario se envíe
  }

  // Función para mostrar la información de la persona
  function mostrarInformacion() {
    document.getElementById('info-nombre').textContent = formulario.nombre;
    document.getElementById('info-apellidos').textContent = formulario.apellidos;
    document.getElementById('info-salario').textContent = formulario.salario;
    document.getElementById('info-fechaIngreso').textContent = formulario.fechaIngreso;
    document.getElementById('info-diasVacaciones').textContent = formulario.diasVacaciones;
  }

  // Funciones para manejar la interfaz
  function mostrarFormulario() {
    interfaz.mostrarFormulario();
  }

  function limpiarFormulario() {
    interfaz.limpiarFormulario();
  }
</script> //hecho por saraTorres

</body>
</html>