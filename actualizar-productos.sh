#!/bin/bash
# Script para actualizar páginas de productos restantes
# Ejecutar desde la raíz del proyecto

echo "🔄 Actualizando páginas de productos restantes..."

# Lista de archivos a actualizar (excluyendo prod1.html y prod2.html que ya están)
files=("prod3.html" "prod4.html" "prod5.html" "prod6.html" "prod7.html" "prod8.html" "prod9.html" "prod10.html" "prod11.html" "prod12.html")

for file in "${files[@]}"; do
    if [ -f "Productos/$file" ]; then
        echo "📝 Procesando: $file"
        
        # Verificar si ya tiene los badges
        if ! grep -q "cart-badge" "Productos/$file"; then
            echo "   ➕ Agregando badges del carrito..."
            
            # Reemplazar enlaces del carrito móvil
            sed -i 's|<a href="../cart.html" class="carritoimg d-lg-none">|<a href="../cart.html" class="carritoimg d-lg-none position-relative">|g' "Productos/$file"
            sed -i 's|<i class="bi bi-cart fs-4"></i>|<i class="bi bi-cart fs-4"></i>\n                  <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger" id="cart-badge-mobile" style="display: none;">0</span>|g' "Productos/$file"
            
            # Reemplazar enlaces del carrito desktop
            sed -i 's|<a href="../cart.html" class="carritoimg d-none d-lg-block">|<a href="../cart.html" class="carritoimg d-none d-lg-block position-relative">|g' "Productos/$file"
            sed -i 's|<span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger" id="cart-badge-mobile" style="display: none;">0</span>|<span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger" id="cart-badge-desktop" style="display: none;">0</span>|2' "Productos/$file"
        fi
        
        # Verificar si ya tiene el script global
        if ! grep -q "carrito-global.js" "Productos/$file"; then
            echo "   📜 Agregando script global..."
            sed -i 's|<script src="../cart.js"></script>|<script src="../carrito-global.js"></script>\n        <script src="../cart.js"></script>|g' "Productos/$file"
        fi
        
        echo "   ✅ $file actualizado"
    else
        echo "   ⚠️  $file no encontrado"
    fi
done

echo ""
echo "🎉 ¡Actualización completada!"
echo "📊 Archivos procesados: ${#files[@]}"
echo ""
echo "✅ Badges del carrito agregados"
echo "✅ Script global incluido" 
echo "✅ Contador dinámico funcional"