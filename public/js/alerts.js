   // Muestra la alerta con el mensaje correspondiente
   function showAlert(type, message) {
    const alertDiv = document.getElementById('alert');
    const alertMessage = document.getElementById('alert-message');

    alertDiv.className = 'alert ' + type; // Agrega la clase de tipo (success o error)
    alertMessage.textContent = message; // Establece el mensaje

    alertDiv.classList.remove('hidden'); // Muestra la alerta
}

// Cierra la alerta
function closeAlert() {
    const alertDiv = document.getElementById('alert');
    alertDiv.classList.add('hidden'); // Oculta la alerta
}
