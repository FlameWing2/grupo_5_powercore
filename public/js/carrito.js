const carrito = [];  // Este array representaría el contenido del carrito.
const carritoVacio = document.querySelector(".carrito-vacio");
const carritoProductos = document.querySelector(".carrito-productos");

// Simular si el carrito está vacío o no.
// if (carrito.length === 0 && carrito!=null) {
//     carritoVacio.style.display = "flex";
// } else {
//     carritoVacio.style.display = "none";
// }

document.querySelectorAll('.btn-sumar').forEach(btn => {
    btn.addEventListener('click', function() {
        let cantidadInput = this.previousElementSibling;
        cantidadInput.value = parseInt(cantidadInput.value) + 1;
        actualizarTotal();
    });
});

document.querySelectorAll('.btn-restar').forEach(btn => {
    btn.addEventListener('click', function() {
        let cantidadInput = this.nextElementSibling;
        if (parseInt(cantidadInput.value) > 1) {
            cantidadInput.value = parseInt(cantidadInput.value) - 1;
        }
        actualizarTotal();
    });
});

document.querySelectorAll('.btn-eliminar').forEach(btn => {
    btn.addEventListener('click', function() {
        this.closest('.carrito-item').remove();
        actualizarTotal();
    });
});

function actualizarTotal() {
    let total = 0;
    let productos = document.querySelectorAll('.carrito-item');
    productos.forEach(item => {
        let precio = parseFloat(item.querySelector('.producto-precio').textContent.replace('$', ''));
        let cantidad = parseInt(item.querySelector('.cantidad-comprada').value);
        total += precio * cantidad;
    });

    document.querySelector('.total-precio').textContent = '$' + total.toFixed(2);
    if(productos.length===0){
        document.querySelector(".mostrar-aviso-carrito").style.display="block";
    }
    
}


