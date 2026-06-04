import { defineConfig } from 'astro/config';
import tailwind from '@astrojs/tailwind';

export default defineConfig({
  site: 'https://tu-usuario.github.io/timecrawler',
  output: 'static',
  integrations: [tailwind()],
});