#!/bin/bash

# Script para subir el código a GitHub
echo "🚀 Subiendo TimeCrawler a GitHub..."

# Configurar Git
git config user.name "TimeCrawler Dev"
git config user.email "timecrawler@example.com"

# Cambiar a HTTPS con token
git remote set-url origin https://kaira-timecrawler@github.com/kaira-timecrawler/web-mvp.git

# Hacer push (esto pedirá tu token de GitHub)
echo "Se pedirá tu token de GitHub personal:"
echo "1. Ve a GitHub → Settings → Developer settings → Personal access tokens"
echo "2. Crea un token con 'repo' scope"
echo "3. Pégalo aquí cuando se pida:"
git push origin master

echo "✅ ¡Subida completada!"
echo "La web se desplegará automáticamente en: https://kaira-timecrawler.github.io/web-mvp"