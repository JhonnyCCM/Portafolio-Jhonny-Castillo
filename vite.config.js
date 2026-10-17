import { resolve } from 'path';
import { defineConfig, loadEnv } from 'vite';

export default defineConfig(({ mode }) => {
  const env = loadEnv(mode, process.cwd(), '');
  // El hash de administrador NUNCA se hardcodea en el repositorio; se valida contra Supabase / .env local
  const adminHash = env.VITE_ADMIN_PWD_HASH || '';
  const supabaseUrl = env.VITE_SUPABASE_URL || 'https://rrvpepoikvhojtiqqjdg.supabase.co';
  const supabaseKey = env.VITE_SUPABASE_PUBLISHABLE_KEY || 'sb_publishable_6lekXaPI2RzqcyLVVxPoNw_34D07O0K';

  return {
    // base: './' asegura que los assets funcionen tanto en la raíz como en subdirectorios (ej: GitHub Pages o Vercel)
    base: './',
    plugins: [
      {
        name: 'inject-env-vars',
        transformIndexHtml(html) {
          return html
            .replace(/__VITE_ADMIN_PWD_HASH__/g, adminHash)
            .replace(/__VITE_SUPABASE_URL__/g, supabaseUrl)
            .replace(/__VITE_SUPABASE_PUBLISHABLE_KEY__/g, supabaseKey);
        }
      }
    ],
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
  };
});
