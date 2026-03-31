# BauCuaBE

## Local Environment Contract (Docker Baseline)

This backend uses an environment contract for local startup.
The source of truth for required keys is in `.env.example`.

### Quick Setup

1. Copy `.env.example` to `.env`.
2. Keep placeholder values for local development unless your setup requires changes.
3. Do not commit real credentials.

### Required Keys

| Key             | Purpose                        | Example                 |
| --------------- | ------------------------------ | ----------------------- |
| `APP_ENV`       | Application environment        | `local`                 |
| `APP_URL`       | Base backend URL in local mode | `http://localhost:8000` |
| `DB_CONNECTION` | Database driver                | `pgsql`                 |
| `DB_HOST`       | Database host (Docker service) | `postgres`              |
| `DB_PORT`       | Database port                  | `5432`                  |
| `DB_DATABASE`   | Database name                  | `baucua_local`          |
| `DB_USERNAME`   | Database user                  | `baucua`                |
| `DB_PASSWORD`   | Database password placeholder  | `<placeholder>`         |
| `REDIS_HOST`    | Redis host (Docker service)    | `redis`                 |
| `REDIS_PORT`    | Redis port                     | `6379`                  |

### Security Note

- `.env.example` must contain placeholders only.
- Real secrets belong only in local `.env` and must never be committed.

## Backend Docker Runtime Baseline

Use this baseline for local Docker startup in BauCuaBE.

### Commands

1. Create env file from example:
   - Copy `.env.example` to `.env`
2. Validate compose configuration:
   - `docker compose -f docker-compose.local.yml config`
3. Start backend stack:
   - `docker compose -f docker-compose.local.yml up -d`

### Runtime Services

| Service    | Purpose                     | Default Port |
| ---------- | --------------------------- | ------------ |
| `app`      | Backend runtime container   | `8000`       |
| `postgres` | Local PostgreSQL dependency | `5432`       |
| `redis`    | Local Redis dependency      | `6379`       |

### Readiness and Troubleshooting

- Backend readiness contract: `docs/local-startup/backend-readiness.md`
- Troubleshooting matrix: `docs/local-startup/troubleshooting.md`

Readiness verification mode:

- Use App-Ready mode (`GET /health`) when endpoint exists.
- Use Baseline Runtime mode when repository is in bootstrap state without endpoint implementation.

## Integrated Startup Docs

- Shared startup flow (BE -> FE): `docs/local-startup/guide.md`
- Baseline verification checklist: `docs/local-startup/checklist.md`
- Linked PR sync checklist: `docs/local-startup/linked-pr-sync.md`
- Compatibility notes: `docs/local-startup/compatibility.md`
- Requirement traceability: `docs/local-startup/traceability.md`

Cross-root navigation:

- For FE connectivity steps, switch to BauCuaFE repository root and open `docs/local-startup/connectivity.md`.
