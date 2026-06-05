#!/bin/bash

# Script de diagnóstico para TimeCrawler deployment
# Identifica problemas comunes de despliegue en GitHub Pages

echo "🔍 DIAGNÓSTICO DE DESPLIEGUE - TIMECRAWLER"
echo "======================================"
echo ""

# URL del despliegue
URL="https://kaira-timecrawler.github.io/web-mvp"

echo "📋 VERIFICACIÓN DE CONFIGURACIÓN"
echo "================================"
echo ""

# 1. Verificar si el package.json tiene la configuración correcta
if [ -f "package.json" ]; then
    echo "✅ package.json encontrado"
    echo "   - Scripts: $(grep -A 5 '"scripts"' package.json | head -6)"
else
    echo "❌ package.json no encontrado"
fi

echo ""

# 2. Verificar astro.config.mjs
if [ -f "astro.config.mjs" ]; then
    echo "✅ astro.config.mjs encontrado"
    echo "   - Site URL: $(grep 'site:' astro.config.mjs)"
    echo "   - Output: $(grep 'output:' astro.config.mjs)"
else
    echo "❌ astro.config.mjs no encontrado"
fi

echo ""

# 3. Verificar .nojekyll
if [ -f ".nojekyll" ]; then
    echo "✅ .nojekyll encontrado (evita procesamiento de Jekyll)"
else
    echo "❌ .nojekyll no encontrado (puede causar problemas)"
fi

echo ""

# 4. Verificar estructura de directorios
echo "📁 ESTRUCTURA DE DIRECTORIOS"
echo "============================"
echo "   - src/: $(ls -la src/ | head -3)"
echo "   - dist/: $(ls -la dist/ 2>/dev/null | head -3 || echo 'No encontrado (ejecutar npm run build primero)')"

echo ""

# 5. Verificar si se puede construir localmente
echo "🔨 PRUEBA DE CONSTRUCCIÓN LOCAL"
echo "==============================="
echo "Intentando construir localmente..."
npm run build

if [ $? -eq 0 ]; then
    echo "✅ Construcción local exitosa"
    if [ -d "dist" ]; then
        echo "   - dist/ tamaño: $(du -sh dist/ 2>/dev/null || echo 'No medible')"
        echo "   - Archivos en dist/: $(find dist/ -type f | wc -l) archivos"
    fi
else
    echo "❌ Construcción local fallida"
fi

echo ""

# 6. Verificar estado de la web
echo "🌐 VERIFICACIÓN DE LA WEB"
echo "========================="
echo "Verificando $URL..."

# Intentar obtener el status code
HTTP_STATUS=$(curl -s -o /dev/null -w "%{http_code}" "$URL" 2>/dev/null)

if [ "$HTTP_STATUS" = "200" ]; then
    echo "✅ La web está accesible (HTTP 200)"
    echo "   - Tamaño: $(curl -s -I "$URL" | grep -i content-length | cut -d' ' -f2 2>/dev/null || echo 'No disponible')"
elif [ "$HTTP_STATUS" = "404" ]; then
    echo "❌ La web devuelve 404 (No encontrado)"
    echo "   - Esto indica que GitHub Pages aún no ha procesado el despliegue"
elif [ "$HTTP_STATUS" = "000" ]; then
    echo "⚠️ No se puede conectar a la web"
    echo "   - Puede ser un problema de red o GitHub Pages aún no está activado"
else
    echo "⚠️ La web devuelve HTTP $HTTP_STATUS"
fi

echo ""

# 7. Verificar si hay contenido en dist/
echo "📦 CONTENIDO DE DIST/"
echo "=================="
if [ -d "dist" ]; then
    echo "Archivos en dist/:"
    find dist/ -type f -name "*.html" | head -5 | while read file; do
        echo "   - $file ($(wc -l < "$file") líneas)"
    done
    echo ""
    echo "Total de archivos HTML: $(find dist/ -name "*.html" | wc -l)"
else
    echo "❌ No se encontró el directorio dist/"
    echo "   - Ejecuta 'npm run build' para generar los archivos estáticos"
fi

echo ""

# 8. Recomendaciones
echo "💡 RECOMENDACIONES"
echo "=================="
echo "Si la web muestra 'Site not found':"
echo "   1. Verifica que GitHub Pages esté activado en:"
echo "      https://github.com/kaira-timecrawler/web-mvp/settings/pages"
echo "   2. Asegúrate de que la rama sea 'main' y el directorio sea '/ (root)'"
echo "   3. Espera 5-10 minutos después del push para que GitHub Pages procese"
echo "   4. Revisa el log del workflow en:"
echo "      https://github.com/kaira-timecrawler/web-mvp/actions"
echo ""
echo "Si el workflow falla:"
echo "   1. Revisa el log completo del workflow"
echo "   2. Verifica que todas las dependencias estén instaladas"
echo "   3. Prueba la construcción local con 'npm run build'"
echo ""
echo "Para activar GitHub Pages manualmente:"
echo "   1. Ve a Settings > Pages"
echo "   2. Source: Deploy from a branch"
echo "   3. Branch: main"
echo "   4. Folder: / (root)"
echo "   5. Save"