-- ============================================================================
-- ESQUEMA SUPABASE PARA PORTAFOLIO INTERACTIVO — JHONNY CASTILLO (@JhonnyCCM)
-- Pega y ejecuta este script en el SQL Editor de tu proyecto en Supabase:
-- https://supabase.com/dashboard/project/rrvpepoikvhojtiqqjdg/sql/new
-- ============================================================================

-- 1. Tabla principal de sincronización en la nube (Catálogo de Proyectos y Hash Admin)
CREATE TABLE IF NOT EXISTS public.portfolio_store (
  key TEXT PRIMARY KEY,
  value JSONB NOT NULL,
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

-- 2. Habilitar Row Level Security (RLS) y políticas de acceso
ALTER TABLE public.portfolio_store ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "Lectura publica del portafolio" ON public.portfolio_store;
CREATE POLICY "Lectura publica del portafolio"
  ON public.portfolio_store
  FOR SELECT
  TO anon, authenticated
  USING (true);

DROP POLICY IF EXISTS "Sincronizacion desde panel admin" ON public.portfolio_store;
CREATE POLICY "Sincronizacion desde panel admin"
  ON public.portfolio_store
  FOR ALL
  TO anon, authenticated
  USING (true)
  WITH CHECK (true);
