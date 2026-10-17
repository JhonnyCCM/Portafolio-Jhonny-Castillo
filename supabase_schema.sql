-- ============================================================================
-- ESQUEMA SEGURO SUPABASE PARA PORTAFOLIO INTERACTIVO — JHONNY CASTILLO (@JhonnyCCM)
-- Ejecuta este script en el SQL Editor de tu proyecto en Supabase:
-- https://supabase.com/dashboard/project/rrvpepoikvhojtiqqjdg/sql/new
-- ============================================================================

-- 1. Tabla principal de almacenamiento en la nube
CREATE TABLE IF NOT EXISTS public.portfolio_store (
  key TEXT PRIMARY KEY,
  value JSONB NOT NULL,
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

-- 2. Habilitar Row Level Security (RLS) Estricto:
--    Los visitantes públicos (anon) SOLO pueden leer el catálogo público ('projects_catalog'),
--    NUNCA pueden leer 'admin_pwd_hash' ni escribir directamente sin pasar por las funciones RPC.
ALTER TABLE public.portfolio_store ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "Lectura publica del portafolio" ON public.portfolio_store;
DROP POLICY IF EXISTS "Sincronizacion desde panel admin" ON public.portfolio_store;

CREATE POLICY "Lectura publica solo del catalogo"
  ON public.portfolio_store
  FOR SELECT
  TO anon, authenticated
  USING (key = 'projects_catalog');

-- 3. Funciones RPC seguras en el servidor (SECURITY DEFINER)
--    Validan el hash SHA-256 dentro de PostgreSQL sin exponer jamás 'admin_pwd_hash' al cliente.
CREATE OR REPLACE FUNCTION public.verify_admin_password(p_hash TEXT)
RETURNS BOOLEAN
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
DECLARE
  v_stored_hash TEXT;
BEGIN
  SELECT value->>'hash' INTO v_stored_hash
  FROM public.portfolio_store
  WHERE key = 'admin_pwd_hash';

  IF v_stored_hash IS NULL THEN
    RETURN FALSE;
  END IF;

  RETURN v_stored_hash = p_hash;
END;
$$;

CREATE OR REPLACE FUNCTION public.save_portfolio_catalog(p_hash TEXT, p_catalog JSONB)
RETURNS BOOLEAN
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
BEGIN
  IF NOT public.verify_admin_password(p_hash) THEN
    RAISE EXCEPTION 'No autorizado: hash de administrador inválido';
  END IF;

  INSERT INTO public.portfolio_store (key, value, updated_at)
  VALUES ('projects_catalog', p_catalog, now())
  ON CONFLICT (key) DO UPDATE
    SET value = EXCLUDED.value,
        updated_at = now();

  RETURN TRUE;
END;
$$;

CREATE OR REPLACE FUNCTION public.update_admin_password(p_current_hash TEXT, p_new_hash TEXT)
RETURNS BOOLEAN
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
BEGIN
  IF NOT public.verify_admin_password(p_current_hash) THEN
    RAISE EXCEPTION 'No autorizado: contraseña actual incorrecta';
  END IF;

  INSERT INTO public.portfolio_store (key, value, updated_at)
  VALUES ('admin_pwd_hash', jsonb_build_object('hash', p_new_hash), now())
  ON CONFLICT (key) DO UPDATE
    SET value = EXCLUDED.value,
        updated_at = now();

  RETURN TRUE;
END;
$$;

GRANT EXECUTE ON FUNCTION public.verify_admin_password(TEXT) TO anon, authenticated;
GRANT EXECUTE ON FUNCTION public.save_portfolio_catalog(TEXT, JSONB) TO anon, authenticated;
GRANT EXECUTE ON FUNCTION public.update_admin_password(TEXT, TEXT) TO anon, authenticated;
