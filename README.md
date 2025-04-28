# Gu-a-de-Ejercicios-2-POO
¡Claro! Aquí tienes una explicación de cada uno de los ejercicios propuestos:

Ejercicio 1: Ficha de estudiante

Este ejercicio se centra en la recepción y validación de datos de un formulario web utilizando un Servlet en Java. Imagina que tienes un formulario donde un estudiante ingresa su información personal.

¿Qué hace el Servlet? Cuando el usuario envía el formulario (mediante el método HTTP POST), el Servlet recibe todos los datos que se ingresaron en los campos.
Validaciones importantes: La clave de este ejercicio está en verificar que cada dato ingresado cumpla con ciertos requisitos específicos:
Carnet: Debe seguir un patrón exacto de dos letras seguidas de cuatro números (ejemplo: AB1234).
Nombres y Apellidos: No deben exceder una longitud máxima de 25 caracteres.
Dirección: No debe exceder una longitud máxima de 255 caracteres.
Teléfono: Debe tener el formato preciso de cuatro números, un guion y otros cuatro números (ejemplo: 1234-5678). No se permiten otros formatos.
Correo electrónico: Debe ser una dirección de correo electrónico válida (con un "@" y un punto "." en la estructura correcta).
Fecha de Nacimiento: Debe tener el formato día/mes/año con dos dígitos para el día, dos para el mes y cuatro para el año, separados por barras (ejemplo: 25/12/2003).
Mostrar resultados: Si todos los datos son válidos, el Servlet tomará esta información y la mostrará organizada en una tabla HTML para que sea fácil de leer.
Manejo de errores: Si algún dato no cumple con las validaciones (por ejemplo, se ingresa un carnet con letras y números revueltos o un teléfono sin el guion), el Servlet debe ser capaz de identificar cuál es el problema y mostrar un mensaje específico al usuario indicando qué tipo de dato no es válido. También debe asegurarse de que todos los campos del formulario hayan sido llenados.
