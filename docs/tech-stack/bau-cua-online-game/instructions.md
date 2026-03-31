---
applyTo: 'docs/tech-stack/bau-cua-online-game/**'
---

# Bau Cua Online Game Instructions

## Overview

- This product uses a React 19 single-page frontend and a Laravel 12 API backend.
- Keep the frontend focused on room browsing, betting actions, rewards, and player state; keep business rules in the backend.
- Treat points, room membership, bets, missions, and rewards as server-authoritative state.
- Use real-time updates for room state changes, round results, and point balance changes.
- Keep the stack simple enough for an initial release, with room to add scale later.

## Architecture & Patterns

- Use Laravel as the source of truth for authentication, room rules, rounds, wagers, rewards, and point balances.
- Use React components for presentation and user interaction only; fetch and cache data through a dedicated API layer.
- Model the game around immutable point transactions rather than overwriting balances directly.
- Separate room lobby, active room, round history, and mission views into feature-oriented modules.
- Use event-driven updates for round completion, room membership changes, and reward grants.
- Keep public and private room access rules enforced in the backend, not in the UI.

## Stack Best Practices

- Use Laravel 12, PHP 8.4, Eloquent, form requests, policies, and service classes for all game rules.
- Use Laravel Sanctum for SPA authentication and CSRF-protected sessions.
- Use PostgreSQL for relational integrity and transactional updates to points, room membership, and mission progress.
- Use Redis for cache, queues, and real-time support when room activity increases.
- Use React 19 with TypeScript, Vite, and route-based code splitting.
- Use TanStack Query for server-state caching and React Router for navigation.
- Use Pest for backend tests, Vitest and React Testing Library for frontend tests, and Playwright for end-to-end flows.

## Anti-Patterns

- Do not keep authoritative point balances only in the browser.
- Do not let the frontend decide whether a player can enter or stay in a room.
- Do not update balances by simple overwrite operations without a transaction.
- Do not mix betting logic directly into UI components.
- Do not let mission rewards and daily rewards bypass audit trails.
- Do not store room membership rules as ad hoc flags scattered across the codebase.

## Data Models

- User: account identity, login status, display name, and current reward eligibility.
- Point ledger: append-only record of every point gain, spend, mission reward, login reward, and adjustment.
- Wallet or balance projection: current spendable point total derived from the ledger.
- Room: owner, visibility, minimum entry requirement, minimum stay requirement, and status.
- Room membership: current players in a room and their joined-at state.
- Round: one completed game round with dice outcome, winners, and settlement results.
- Bet: player selections, stake amount, and payout result for a round.
- Daily mission progress: per-user counters for played rounds, wins, and cumulative bet volume.
- Daily check-in: last login reward date and whether the daily reward has been claimed.
- Audit trail: timestamps and actor references for every system-driven change.

## Security & Configuration

- Keep secrets in environment files and never commit credentials.
- Use CSRF protection, secure cookies, and same-site settings for SPA auth.
- Enforce authorization checks on every room, bet, mission, and reward action.
- Rate-limit login, room creation, bet placement, and reward-claiming endpoints.
- Validate every point change server-side and reject stale or duplicate actions.
- Log important state transitions for room entry, room removal, settlement, and reward grants.
- Keep CORS explicit and narrow to the approved frontend origin.

## Commands & Scripts

- Backend dev: `php artisan serve`
- Backend tests: `php artisan test`
- Backend migrations: `php artisan migrate`
- Backend queue worker: `php artisan queue:work`
- Backend realtime server: `php artisan reverb:start`
- Frontend install: `npm install`
- Frontend dev: `npm run dev`
- Frontend build: `npm run build`
- Frontend tests: `npm run test`
- Frontend lint: `npm run lint`
