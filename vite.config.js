import { resolve } from 'path';
import { defineConfig } from 'vite';

export default defineConfig({
  // base: './' asegura que los assets funcionen tanto en la raíz como en subdirectorios (ej: GitHub Pages o Vercel)
  base: './',
  build: {
    rollupOptions: {
      input: {
        main: resolve(__dirname, 'index.html'),
        admin: resolve(__dirname, 'admin.html')
      }
    }
  },
  server: {
    port: 5173,
    open: true
  }
});
