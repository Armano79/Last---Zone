# LAST ZONE — Engineering Context Report

## Architecture
Browser (TypeScript + Three.js) -> Vite static build -> Vercel CDN. GitHub stores source and drives deployments. Optional Supabase JavaScript client writes match summaries to PostgreSQL. Optional Sentry Browser SDK captures runtime exceptions and limited performance traces.

## Design decisions
- Three.js rather than a heavy game engine: small browser-first 3D prototype, minimal setup.
- Vanilla TypeScript rather than React: simpler continuous render loop and fewer dependencies. React/Next.js is not needed for this single-screen game.
- Single-player simulation runs locally; no authoritative backend or multiplayer transport.
- Optional Supabase telemetry is not a trusted ranking system.
- No required API keys for basic gameplay.

## Runtime flow
`main.ts` initializes scene, renderer, lighting, terrain, player and bots. `requestAnimationFrame` advances simulation with capped delta time. Each frame: player input -> bot decisions -> projectile movement and collision -> zone damage -> win/loss checks -> HUD -> camera -> render.

## Environment variables
`VITE_SUPABASE_URL`, `VITE_SUPABASE_ANON_KEY`, `VITE_SENTRY_DSN` are optional client-public values. Never place a Supabase service-role key or Sentry auth token in a `VITE_` variable.

## Database and security
See `supabase/schema.sql`. RLS is enabled. The demonstration allows anonymous inserts but no anonymous reads. Before public release, use Supabase Auth, user-bound RLS, anti-spam limits, and server-side verification for competitive scores. Browser-generated records must not be trusted for prizes or rankings.

## Deployment
Push repository to GitHub. Import repository into Vercel. Framework: Vite; build `npm run build`; output `dist`. Configure optional environment variables in Vercel project settings and redeploy.

## Sentry
Create a browser JavaScript project in Sentry and set `VITE_SENTRY_DSN`. Errors will be captured through the SDK. Do not intentionally collect player identifiers without privacy review.

## Future work
Improved bot navigation, pickups and weapons, jumping, varied arena maps, audio, accessibility, mobile input, authenticated profiles, achievements, deterministic replay, server-validated scoreboards, multiplayer only after architecture redesign.
