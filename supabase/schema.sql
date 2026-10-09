-- Optional anonymous match analytics. No public read access.
create table if not exists public.match_results (
  id uuid primary key default gen_random_uuid(),
  created_at timestamptz not null default now(),
  result text not null check (result in ('victory','defeat')),
  eliminations integer not null check (eliminations between 0 and 7),
  survival_seconds integer not null check (survival_seconds between 0 and 3600)
);
alter table public.match_results enable row level security;
-- For demo telemetry only. Production: replace with authenticated user-bound inserts and rate limits.
create policy "anonymous demo result inserts" on public.match_results for insert to anon with check (true);
