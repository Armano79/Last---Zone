# LAST ZONE — Product Requirements Document (v1.0)

## Vision
Deliver an immediately playable, colorful 3D single-player battle royale in the browser: eight fighters, a shrinking zone, short rounds, and a clear last-survivor win condition.

## Audience and platform
Casual desktop players seeking 3–5-minute arcade sessions. Primary platform: modern desktop browsers. Keyboard and mouse required in v1; mobile touch controls are not yet implemented.

## Core loop
1. Start match from menu. 2. Move around a compact blocky arena. 3. Aim and shoot AI opponents while using blocks as cover. 4. Stay inside the shrinking storm circle. 5. Win by becoming the final survivor or retry after elimination.

## MVP requirements
| ID | Requirement | Acceptance criteria |
|---|---|---|
| G01 | 3D environment | Ground, terrain blocks, lighting, shadows, camera render |
| G02 | Player controls | WASD movement, Shift sprint, mouse aim, click/Space shoot |
| G03 | AI bots | Seven moving bots that select targets and shoot |
| G04 | Combat | Projectiles, collision, health, eliminations |
| G05 | Zone | Shrinking circular boundary and outside-zone damage |
| G06 | HUD | Alive count, kills, health, timer, zone radius |
| G07 | End state | Win/loss overlay and play again |
| G08 | Deploy | Vite production build deployable to Vercel |
| G09 | Monitoring | Optional Sentry DSN for client error monitoring |
| G10 | Data | Optional Supabase write-only match result records |

## Non-goals for v1
Real-time multiplayer, accounts, ranked leaderboards, paid items, custom matchmaking, Fortnite-style building, mobile controls, 3D character animations, audio, polished weapon balance, server-authoritative combat.

## UX
Landing screen -> Start -> Match -> Win/lose -> Restart. Game runs without third-party credentials. Target stable desktop 60 FPS on mainstream machines (performance goal, not yet benchmarked).

## Risks
Bots use lightweight heuristics rather than navigation meshes; movement can be imperfect around cover. Client-side match results can be spoofed. Anonymous telemetry policy should be tightened before public launch. Browser tab backgrounding and lower-end GPUs may affect performance.

## Definition of done
Build succeeds, game launches, player can move and shoot, bots can damage and eliminate, storm shrinks and hurts, final-survivor victory triggers, restart works, Vercel serves the production bundle, and optional integrations can be configured without exposing secrets.
