document.addEventListener('DOMContentLoaded', function () {
    const cartButton = document.querySelector('.btn-primary');

    if (cartButton) {
        cartButton.addEventListener('click', function () {
            // Obtener información del producto
            const quantityElement = document.querySelector('#cant');
            const sizeElement = document.querySelector('#talle');
            const priceElement = document.querySelector('#precio');
            const nameElement = document.querySelector('#name');
            const imageElement = document.querySelector('img.img-fluid');

            if (priceElement && nameElement && imageElement) {
                const quantity = quantityElement ? quantityElement.value : 1;
                const size = sizeElement ? sizeElement.value : 'M';
                let price = priceElement.textContent;
                const name = nameElement.textContent;
                const imageSrc = imageElement.src;

                // Limpiar y convertir precio
                price = price.replace('$', '');
                price = price.replace(/\./g, ''); // Remover todos los puntos
                price = parseInt(price);
                const totalPrice = price * parseInt(quantity);

                const product = {
                    name: name,
                    price: totalPrice,
                    quantity: parseInt(quantity),
                    size: size,
                    image: imageSrc,
                };

                // Añadir producto al carrito usando localStorage
                const cartItems = JSON.parse(localStorage.getItem('cart')) || [];
                cartItems.push(product);
                localStorage.setItem('cart', JSON.stringify(cartItems));

                // Actualizar contador del carrito
                if (typeof actualizarContadorCarrito === 'function') {
                    actualizarContadorCarrito();
                }

                // Mostrar notificación si existe
                if (typeof mostrarNotificacionCarrito === 'function') {
                    mostrarNotificacionCarrito();
                }

                console.log('Producto agregado al carrito:', product);
            } else {
                console.error('No se pudo obtener la información del producto.');
            }
        });
    }
});
