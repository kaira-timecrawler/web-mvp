#!/bin/bash

# Script de monitoreo para TimeCrawler deployment
# Verifica periódicamente si la web está disponible

echo "🔍 MONITORIZANDO EL DESPLIEGUE DE TIMECRAWLER"
echo "================================================"
echo ""
echo "🌐 URL a monitorear: https://kaira-timecrawler.github.io/web-mvp"
echo "⏱️  Verificación cada 60 segundos"
echo "📊 Presiona Ctrl+C para detener el monitoreo"
echo ""

# URL del despliegue
URL="https://kaira-timecrawler.github.io/web-mvp"

# Contador de intentos
attempt=0

while true; do
    attempt=$((attempt + 1))
    minutes=$((attempt * 1))
    
    echo "⏰ Tiempo transcurrido: ${minutes} min"
    
    # Verificar si la web está disponible
    if curl -s --head "$URL" >/dev/null 2>&1; then
        echo "✅ ¡ÉXITO! La web está disponible en: $URL"
        echo ""
        echo "🎉 TimeCrawler ha sido desplegado exitosamente!"
        echo ""
        echo "📋 Detalles del despliegue:"
        echo "   - URL: $URL"
        echo "   - Estado: Online"
        echo "   - Tiempo total: ${minutes} min"
        echo ""
        echo "🚀 ¡Tu proyecto TimeCrawler está en línea!"
        break
    else
        echo "⏳ La web aún no está disponible..."
        echo "   - Intento $attempt de $(($attempt + 2))"
        echo "   - Status: Desplegando en progreso..."
        echo ""
    fi
    
    # Esperar 60 segundos antes de la siguiente verificación
    sleep 60
done