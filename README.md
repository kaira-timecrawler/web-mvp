# TimeCrawler - Web Serial de Kaira, la Cronocaminante

Un web serial automatizado que narra las aventuras de Kaira mientras viaja a través del tiempo, explorando diferentes épocas de la historia.

## MVP Actual

Este es el MVP inicial con:

- ✅ Web estática creada con Astro 5
- ✅ Diseño responsive con Tailwind CSS
- ✅ 10 capítulos de prueba en español
- ✅ Página principal con lista de capítulos
- ✅ Página individual de cada capítulo
- ✅ Página "Sobre Kaira"
- ✅ Navegación funcional
- ✅ Diseño coherente y atractivo

## Estructura del Proyecto

```
src/
├── components/          # Componentes reutilizables
│   ├── Navigation.astro
│   └── StoryCard.astro
├── layouts/            # Layouts base
│   └── BaseLayout.astro
├── pages/             # Páginas estáticas
│   ├── index.astro
│   ├── sobre-kaira.astro
│   └── story/[slug].astro
├── stories/es/         # Contenido de los capítulos
│   ├── chapter-01.md
│   ├── chapter-02.md
│   └── ... (10 capítulos)
└── styles/            # Estilos globales
    └── global.css
```

## Tecnologías

- **Astro 5**: Framework web moderno y rápido
- **Tailwind CSS**: Framework CSS utility-first
- **Markdown**: Sistema de contenido simple
- **GitHub Pages**: Plataforma de despliegue

## Próximos Pasos

1. Configurar despliegue en GitHub Pages
2. Integrar con n8n para generación automática
3. Implementar sistema de versionado de prompts
4. Configurar sincronización automática con core
5. Añadir diseño final y branding

## Cómo Empezar

```bash
# Instalar dependencias
npm install

# Iniciar servidor de desarrollo
npm run dev

# Construir para producción
npm run build

# Previsualizar producción
npm run preview
```

## Despliegue

```bash
# Desplegar en GitHub Pages
npm run deploy
```

## Contribución

Este proyecto sigue la metodología SDD (Specs Driver Development) con enfoque en calidad y planificación detallada antes de la ejecución.