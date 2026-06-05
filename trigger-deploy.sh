#!/bin/bash

# Script para desencadenar despliegue manual de TimeCrawler
# Este script te permite hacer push para activar el workflow automáticamente

echo "🚀 TimeCrawler - Desencadenando despliegue manual..."
echo "================================================"

# Verificar que estamos en el directorio correcto
if [ ! -f "package.json" ]; then
    echo "❌ Error: No se encontró package.json. Asegúrate de estar en el directorio del proyecto."
    exit 1
fi

# Verificar estado de git
echo "📁 Verificando estado de Git..."
git status

# Hacer commit y push para desencadenar el workflow
echo ""
echo "📤 Haciendo commit y push para activar el workflow..."
echo "================================================"

# Crear un commit vacío si no hay cambios
if ! git diff --quiet; then
    echo "📝 Hay cambios, creando commit..."
    git add .
    git commit -m "Desencadenar despliegue manual de TimeCrawler

- Activación manual del workflow de GitHub Actions
- Despliegue automático a Pages
- Fecha: $(date '+%Y-%m-%d %H:%M:%S')"
else
    echo "📝 No hay cambios, creando commit vacío para activar workflow..."
    git commit --allow-empty -m "Desencadenar despliegue manual - $(date '+%Y-%m-%d %H:%M:%S')"
fi

# Hacer push
echo ""
echo "🚀 Subiendo a GitHub para activar el workflow..."
git push origin master

echo ""
echo "✅ ¡Listo! El workflow se está ejecutando ahora."
echo "📊 Puedes verificar el progreso en:"
echo "   https://github.com/kaira-timecrawler/web-mvp/actions"
echo ""
echo "🌐 La web estará disponible en:"
echo "   https://kaira-timecrawler.github.io/web-mvp"
echo ""
echo "�️ El despliegue tarda aproximadamente 2-5 minutos."