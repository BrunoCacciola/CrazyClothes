// Script global para manejar el carrito en todas las páginas
document.addEventListener('DOMContentLoaded', function() {
    actualizarContadorCarrito();
    
    // Escuchar cambios en localStorage
    window.addEventListener('storage', function(e) {
        if (e.key === 'cart') {
            actualizarContadorCarrito();
        }
    });

    // Escuchar evento personalizado de actualización del carrito
    window.addEventListener('carritoActualizado', function(e) {
        actualizarContadorCarrito();
    });
});

function actualizarContadorCarrito() {
    const cartItems = JSON.parse(localStorage.getItem('cart')) || [];
    // Sumar la cantidad total de items (no solo la cantidad de productos diferentes)
    const cantidadTotal = cartItems.reduce((acc, item) => acc + (item.quantity || 1), 0);
    
    // Actualizar badges en navbar
    const badgeMobile = document.getElementById('cart-badge-mobile');
    const badgeDesktop = document.getElementById('cart-badge-desktop');
    
    if (badgeMobile) {
        badgeMobile.textContent = cantidadTotal;
        badgeMobile.style.display = cantidadTotal > 0 ? 'inline-block' : 'none';
    }
    
    if (badgeDesktop) {
        badgeDesktop.textContent = cantidadTotal;
        badgeDesktop.style.display = cantidadTotal > 0 ? 'inline-block' : 'none';
    }
}

// Función para agregar producto al carrito (para usar en páginas de productos)
function agregarAlCarrito(nombre, precio, imagen = '', talle = 'M', cantidad = 1) {
    const cartItems = JSON.parse(localStorage.getItem('cart')) || [];
    
    const producto = {
        name: nombre,
        price: precio,
        quantity: cantidad,
        size: talle,
        image: imagen
    };
    
    cartItems.push(producto);
    localStorage.setItem('cart', JSON.stringify(cartItems));
    
    // Actualizar contador
    actualizarContadorCarrito();
    
    // Mostrar notificación (si existe)
    mostrarNotificacionCarrito();
}

function mostrarNotificacionCarrito() {
    // Buscar toast de producto agregado
    const toastEl = document.getElementById('liveToastAddedCart');
    if (toastEl) {
        const toast = new bootstrap.Toast(toastEl);
        toast.show();
    }
}