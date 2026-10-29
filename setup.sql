-- Ejecutar una sola vez en Supabase > SQL Editor
create table if not exists public.catalogo_pijamas (
  id bigserial primary key,
  imagen_url text not null,
  descripcion text,
  precio numeric(10,2),
  talla text,
  disponible boolean not null default true,
  created_at timestamptz not null default now()
);

alter table public.catalogo_pijamas enable row level security;

-- Público: solo ve las disponibles. Admin: ve y edita todo.
create policy "catalogo_lectura_publica" on public.catalogo_pijamas
  for select using (disponible or auth.jwt()->>'email' = 'dome@pijamas.app');
create policy "catalogo_admin_escritura" on public.catalogo_pijamas
  for all to authenticated
  using (auth.jwt()->>'email' = 'dome@pijamas.app')
  with check (auth.jwt()->>'email' = 'dome@pijamas.app');

-- Bucket público para imágenes
insert into storage.buckets (id, name, public) values ('catalogo-pijamas', 'catalogo-pijamas', true)
  on conflict (id) do nothing;

create policy "catalogo_img_admin" on storage.objects
  for all to authenticated
  using (bucket_id = 'catalogo-pijamas' and auth.jwt()->>'email' = 'dome@pijamas.app')
  with check (bucket_id = 'catalogo-pijamas' and auth.jwt()->>'email' = 'dome@pijamas.app');
