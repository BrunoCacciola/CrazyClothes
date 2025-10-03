# 🛒 Sistema de Carrito con WhatsApp -### 📱 Ejemplo de Mensaje de WhatsApp

```
¡Hola! Quiero comprar los siguientes productos:

• Buzo Oversize Marrón (Talle: L) x1 - $45.000
• Remera Básica Blanca (Talle: M) x2 - $56.000

💰 Total: $101.000

¡Gracias!
```# 📋 Funcionalidades Implementadas

### ✅ Carrito Funcional
- **Agregar productos** desde las páginas de productos
- **Ver productos** en el carrito con detalles (nombre, talle, cantidad, precio)
- **Eliminar productos** individuales
- **Vaciar carrito** completo
- **Contador dinámico** en el ícono del carrito (navbar)
- **Persistencia** usando localStorage

### 🆕 Nuevas Funcionalidades
- **📸 Imágenes de productos** en el carrito
- **✏️ Editar cantidades** directamente desde el carrito (botones +/- y input)
- **🔢 Contador de items totales** (suma las cantidades, no solo productos únicos)
- **📱 Badges dinámicos** en todas las páginas del sitio
- **🔄 Actualización en tiempo real** del contador

### ✅ Integración con WhatsApp
- **Mensaje automático** con todos los productos del carrito
- **Formato profesional** del mensaje con cantidades
- **Total calculado** automáticamente
- **Enlace directo** a WhatsApp

## 🔧 Configuración del Número de WhatsApp

### En cart.html (línea ~70 aprox):
```javascript
// Reemplaza este número con tu número de WhatsApp
const numeroWhatsApp = "+5491123456789"; // ⚠️ CAMBIAR ESTE NÚMERO
```

### Formato del número:
- ✅ Correcto: `+5491123456789` (con código de país)
- ❌ Incorrecto: `1123456789` (sin código de país)
- ❌ Incorrecto: `+54 9 11 2345 6789` (con espacios)

## 📱 Ejemplo de Mensaje de WhatsApp

```
¡Hola! Quiero comprar los siguientes productos:

• Buzo Oversize Marrón - Talle: L - Cant: 1 - $45.000
• Remera Básica Blanca - Talle: M - Cant: 2 - $28.000

💰 Total: $73.000

¡Gracias!
```

## 🚀 Archivos Modificados/Creados

### Nuevos archivos:
- `carrito-global.js` - Script global para manejar el carrito en todas las páginas

### Archivos modificados:
- `cart.html` - Página del carrito con nueva funcionalidad
- `cart.js` - Lógica mejorada para agregar productos
- `Productos/prod1.html` - Ejemplo con badges del carrito (aplicar a otras páginas)

## 📝 Cómo aplicar a otras páginas de productos

### Para cada archivo en la carpeta `Productos/`:

1. **Agregar badges en los íconos del carrito:**

```html
<!-- Carrito móvil -->
<a href="../cart.html" class="carritoimg d-lg-none position-relative">
  <i class="bi bi-cart fs-4"></i>
  <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger" id="cart-badge-mobile" style="display: none;">0</span>
</a>

<!-- Carrito desktop -->
<a href="../cart.html" class="carritoimg d-none d-lg-block position-relative">
  <i class="bi bi-cart fs-4"></i>
  <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger" id="cart-badge-desktop" style="display: none;">0</span>
</a>
```

2. **Incluir el script global antes del cart.js:**

```html
<script src="../carrito-global.js"></script>
<script src="../cart.js"></script>
```

## 🔄 Aplicar a otras páginas del sitio

### Para páginas en la raíz (index.html, productos.html, etc.):

1. **Agregar badges (sin ../ en las rutas):**
```html
<span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger" id="cart-badge-mobile" style="display: none;">0</span>
```

2. **Incluir script global:**
```html
<script src="carrito-global.js"></script>
```

## 🎯 Funciones Principales

### JavaScript Functions:
- `actualizarContadorCarrito()` - Actualiza el badge del carrito en todas las páginas
- `agregarAlCarrito(nombre, precio, imagen, talle, cantidad)` - Agrega producto
- `eliminarItem(index)` - Elimina producto específico
- `vaciarCarrito()` - Limpia todo el carrito
- `actualizarCarrito()` - Actualiza la vista del carrito y genera link de WhatsApp
- `cambiarCantidad(index, cambio)` - Cambia cantidad con botones +/-
- `actualizarCantidad(index, nuevaCantidad)` - Actualiza cantidad directamente
- `actualizarContadorGlobal()` - Sincroniza contador en todas las páginas

## 📞 Personalización del Mensaje de WhatsApp

### Modificar el mensaje en cart.html:
```javascript
let mensaje = "¡Hola! Quiero comprar los siguientes productos:\n\n";
carrito.forEach(item => {
    mensaje += `• ${item.nombre} - $${item.precio.toLocaleString()}\n`;
});
mensaje += `\n💰 Total: $${total.toLocaleString()}\n\n¡Gracias!`;
```

## 🐛 Troubleshooting

### Si el contador no aparece:
1. Verificar que el script `carrito-global.js` esté incluido
2. Verificar que los IDs `cart-badge-mobile` y `cart-badge-desktop` existan
3. Verificar la consola del navegador para errores

### Si WhatsApp no abre:
1. Verificar el formato del número de WhatsApp
2. Verificar que el navegador permita abrir enlaces externos
3. Probar en móvil y desktop

## 🎨 Características del Carrito Mejorado

### � Vista de Productos
- **Imágenes** de productos mostradas en el carrito
- **Layout responsivo** con Bootstrap
- **Información completa**: nombre, talle, cantidad, precio

### ✏️ Edición de Cantidades
- **Botones +/-** para cambios rápidos
- **Input numérico** para cambios directos
- **Límites**: mínimo 1, máximo 10 items
- **Recálculo automático** del precio total

### 🔢 Contador Inteligente
- **Suma total de items** (no solo productos únicos)
- **Actualización en tiempo real** 
- **Sincronización** entre todas las páginas
- **Badges rojos** que aparecen/desaparecen según cantidad

## �💡 Próximas Mejoras Sugeridas

- [x] ✅ Editar cantidad desde el carrito (IMPLEMENTADO)
- [x] ✅ Mostrar imágenes en el carrito (IMPLEMENTADO)  
- [x] ✅ Contador de items totales (IMPLEMENTADO)
- [ ] Guardar productos favoritos
- [ ] Historial de compras
- [ ] Descuentos y cupones
- [ ] Múltiples números de WhatsApp según horario
- [ ] Integración con API de pagos
- [ ] Productos relacionados/sugeridos

---

¡El carrito está listo para usar! 🎉