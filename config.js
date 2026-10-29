// Configuración pública (la anon/publishable key es segura en el frontend; RLS protege la escritura)
const SUPABASE_URL = "https://kfupwcdihqxubpteimwh.supabase.co";
const SUPABASE_ANON_KEY = "PEGAR_AQUI_ANON_KEY";
const TABLA = "catalogo_pijamas";
const BUCKET = "catalogo-pijamas";
const WHATSAPP = "593993960760";

const sb = supabase.createClient(SUPABASE_URL, SUPABASE_ANON_KEY);
