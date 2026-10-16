# ⚡ Portafolio Interactivo Full Stack & AI MCP — Jhonny Castillo (@JhonnyCCM)

Portafolio web arquitectónico bilingüe (**Español / English**) con estética industrial **Neo-Tech Tokyo-Manta**, desarrollado con **Vue 3**, integración en vivo con la **API de GitHub**, simulador interactivo de **Servidores MCP (Model Context Protocol)** y un **Panel de Administración protegido por contraseña** con persistencia local en tiempo real.

---

## 🚀 Cómo Ejecutar en Desarrollo o Subirlo a Producción

El proyecto está configurado con **Vite y Vue 3** para que puedas correrlo localmente o subirlo en segundos a **Vercel, Netlify o GitHub Pages**.

### 1. Ejecutar localmente con Vite
```bash
# Instalar dependencias (Vite)
npm install

# Iniciar servidor de desarrollo local con recarga rápida
npm run dev
```
> Abrirá automáticamente `http://localhost:5173` con `index.html` y podrás acceder a `admin.html`.

### 2. Construir para producción (Build)
```bash
npm run build
```
Genera la carpeta `dist/` optimizada, minificada y lista para cualquier hosting estático o CDN.

### 3. Subir a Vercel o Netlify (Recomendado)
- **Vercel:**
  1. Sube tu repositorio a GitHub (`git push`).
  2. Entra en [vercel.com](https://vercel.com) e importa tu repositorio `Portafolio-JhonnyCCM`.
  3. Vercel detectará automáticamente Vite. Haz clic en **Deploy**. ¡Listo!
- **Netlify:**
  1. Conecta tu repositorio o arrastra la carpeta del proyecto a [app.netlify.com/drop](https://app.netlify.com/drop).
  2. Build command: `npm run build` | Publish directory: `dist`.

---

## 🔐 Panel de Administración (`admin.html`) Protegido

El panel de administración permite clasificar tus repositorios de GitHub, añadir nuevos proyectos y definir qué se muestra en la vitrina pública.

* **URL:** `/admin.html` (o el botón *ADMIN PORTAL* en el footer).
* **Contraseña por defecto:** `jhonny2026`
* **Seguridad:**
  * Encriptación **SHA-256** mediante Web Crypto API (nunca se almacena la clave en texto plano).
  * Sesión protegida (`sessionStorage` y opción de recordar en tu navegador).
  * **Cambio de clave:** Puedes cambiar tu contraseña en cualquier momento desde el botón `CAMBIAR CLAVE` en la barra superior del panel admin.

---

## 🛠️ Secciones del Portafolio

1. **Sección 00 // Hero Arquitectónico:**
   - Visualización de banner real (`Gemini_Generated_Image_*.jpg`).
   - Monitor CRT interactivo con 3 canales (`CH-01 3:00 AM CODE`, `CH-02 NEON MATRIX`, `CH-03 SYNTH FLOW`) y switch ON/OFF.
   - Switcher de idioma bilingüe `[ ES | EN ]` en el navbar.
2. **Sección 01 // Proyectos & Ecosistema MCP:**
   - Filtros por categoría: *MCP & IA*, *Desarrollo Web & UI*, *Automatización & Data*, *Mobile & Android*.
   - Simulador interactivo JSON-RPC 2.0 para servidores MCP (`Design-Extractor-MCP` y `Spotify-Stats-MCP`).
   - Visor de `README.md` oficial descargado desde GitHub.
3. **Sección 02 // Trayectoria & Experiencia:**
   - Investigación en servidores MCP iniciada en **Octubre 2026**.
   - Desarrollo Web Freelance con **WordPress**, **Vue 3**, **Stripe API** y prototipado en Figma.
   - Formación académica en Ingeniería de Software en la **ULEAM**.
4. **Sección 03 // Matriz de Stack (6 Capas):**
   - Lenguajes, Frontend, Backend, Persistencia, DevOps e Interfaces interactivas.
5. **Sección 04 // Pulso GitHub:**
   - Gráficos y telemetría de commits en tiempo real.
6. **Modal CV Ejecutivo ATS:**
   - Resumen profesional optimizado para postulaciones laborales con opción de imprimir en formato ATS.

---

**Jhonny Castillo Mero**  
*Full Stack Developer • AI MCP Tooling Builder • UI/UX Designer*  
Manta, Manabí, Ecuador 🇪🇨  
GitHub: [@JhonnyCCM](https://github.com/JhonnyCCM)
