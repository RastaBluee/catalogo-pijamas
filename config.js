// Configuración pública (la anon/publishable key es segura en el frontend; RLS protege la escritura)
const SUPABASE_URL = "https://dffzlavmwvsidggvzzyf.supabase.co";
const SUPABASE_ANON_KEY = "sb_publishable_HAw4WM2i1p9-d1kkx55AAg_tJLnhTKI";
const TABLA = "catalogo_pijamas";
const BUCKET = "catalogo-pijamas";
const WHATSAPP = "593993960760";

const sb = supabase.createClient(SUPABASE_URL, SUPABASE_ANON_KEY);
