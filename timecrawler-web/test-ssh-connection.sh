#!/bin/bash

# Script para probar la conexión SSH a GitHub
echo "🔍 Probando conexión SSH a GitHub..."

# Mostrar la clave pública que debería estar en GitHub
echo "📋 Clave pública que debería estar en GitHub:"
cat ~/.ssh/timecrawler_github.pub
echo ""

# Probar la conexión SSH
echo "🔄 Probando conexión SSH..."
ssh -T git@github.com

echo ""
echo "🔧 Si falla:"
echo "1. Verifica que la clave pública esté correctamente agregada a GitHub"
echo "2. Revisa que no haya errores al copiar la clave"
echo "3. Espera unos minutos después de agregar la clave a GitHub"
echo "4. Asegúrate de que la clave tenga acceso al repositorio 'web-mvp'"