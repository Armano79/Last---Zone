# ⚡ LAST ZONE

A playable 3D single-player mini battle royale with 7 AI opponents, a shrinking storm, blaster combat, cover blocks, and last-survivor victory.

## Quick start
Requires Node.js 20.19+ or 22.12+.

```bash
npm install
npm run dev
```
Open the URL printed by Vite (typically http://localhost:5173).

## Controls
- WASD: move
- Mouse: aim
- Left click or Space: shoot
- Left Shift: sprint
- R: restart after a match

## Production
```bash
npm run build
npm run preview
```

## GitHub and Vercel
Create a GitHub repository and push these files. Import it into Vercel; Vite is auto-detected, with `dist` output. Vercel will deploy on Git pushes.

## Optional Supabase
Create a Supabase project, execute `supabase/schema.sql` in SQL Editor, copy the Project URL and publishable/anon key into a local `.env` file or Vercel environment variables. The game works without Supabase. Do not expose service-role keys.

## Optional Sentry
Create a Sentry Browser JavaScript project and set `VITE_SENTRY_DSN`. Error reporting is then enabled. The game works without Sentry.

## Documents
- [PRD](PRD.md)
- [Architecture and context](CONTEXT.md)
- [Roadmap](ROADMAP.md)

## Known limitations
Single-player only, simple bot AI, no audio or touch controls, no authenticated scoreboards. Anonymous result inserts in the demo schema are untrusted and should be secured before public deployment.
