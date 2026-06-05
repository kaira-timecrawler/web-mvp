import { defineConfig } from 'astro/config';
import tailwind from '@astrojs/tailwind';

export default defineConfig({
  site: 'https://kaira-timecrawler.github.io/web-mvp',
  output: 'static',
  integrations: [tailwind()],
});