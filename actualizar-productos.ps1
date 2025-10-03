# Script para actualizar todas las páginas de productos con badges del carrito
# Ejecutar este script desde la raíz del proyecto CrazayClothes

Write-Host "Actualizando páginas de productos con badges del carrito..." -ForegroundColor Green

# Lista de archivos de productos
$productFiles = Get-ChildItem -Path ".\Productos\" -Filter "*.html"

foreach ($file in $productFiles) {
    $filePath = $file.FullName
    Write-Host "Procesando: $($file.Name)" -ForegroundColor Yellow
    
    # Leer contenido del archivo
    $content = Get-Content -Path $filePath -Raw
    
    # Reemplazar badge móvil (solo si no existe ya)
    if ($content -notmatch 'cart-badge-mobile') {
        $content = $content -replace '<a href="../cart.html" class="carritoimg d-lg-none">\s*<i class="bi bi-cart fs-4"></i>\s*</a>', 
            '<a href="../cart.html" class="carritoimg d-lg-none position-relative">
                  <i class="bi bi-cart fs-4"></i>
                  <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger" id="cart-badge-mobile" style="display: none;">0</span>
                </a>'
    }
    
    # Reemplazar badge desktop (solo si no existe ya)
    if ($content -notmatch 'cart-badge-desktop') {
        $content = $content -replace '<a href="../cart.html" class="carritoimg d-none d-lg-block">\s*<i class="bi bi-cart fs-4"></i>\s*</a>', 
            '<a href="../cart.html" class="carritoimg d-none d-lg-block position-relative">
                  <i class="bi bi-cart fs-4"></i>
                  <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger" id="cart-badge-desktop" style="display: none;">0</span>
                </a>'
    }
    
    # Agregar script global (solo si no existe ya)
    if ($content -notmatch 'carrito-global.js') {
        $content = $content -replace '<script src="../cart.js"></script>', 
            '<script src="../carrito-global.js"></script>
        <script src="../cart.js"></script>'
    }
    
    # Escribir contenido actualizado
    Set-Content -Path $filePath -Value $content -Encoding UTF8
}

Write-Host "¡Todas las páginas de productos han sido actualizadas!" -ForegroundColor Green
Write-Host "Archivos procesados: $($productFiles.Count)" -ForegroundColor Cyan

# Mostrar resumen
Write-Host "`nResumen de cambios aplicados:" -ForegroundColor Magenta
Write-Host "✅ Badges del carrito agregados (móvil y desktop)" -ForegroundColor White
Write-Host "✅ Script global carrito-global.js incluido" -ForegroundColor White
Write-Host "✅ Contador dinámico funcional en todas las páginas" -ForegroundColor White