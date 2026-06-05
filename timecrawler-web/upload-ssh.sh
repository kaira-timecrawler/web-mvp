#!/bin/bash

# Script para subir usando SSH una vez que la conexión está probada
echo "🚀 Subiendo TimeCrawler a GitHub usando SSH..."

# Probar conexión primero
echo "🔍 Probando conexión SSH..."
ssh -T git@github.com

if [ $? -eq 0 ]; then
    echo "✅ Conexión SSH exitosa!"
    echo "🔄 Subiendo código..."
    git push -u origin master
    echo "✅ ¡Subida completada!"
    echo "🌐 La web estará disponible en: https://kaira-timecrawler.github.io/web-mvp"
else
    echo "❌ La conexión SSH falla. Ejecuta primero el script de prueba:"
    echo "./test-ssh-connection.sh"
fi