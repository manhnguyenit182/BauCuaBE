# Backend Readiness Contract

## Canonical Endpoint (App-Ready Mode)

- Method: GET
- Path: /health
- Full local URL: http://localhost:8000/health

## Expected Response Shape

### Success

```json
{
  "status": "ok",
  "service": "backend",
  "environment": "local"
}
```

### Failure

```json
{
  "status": "error",
  "reason": "<readiness failure reason>"
}
```

## Verification Modes

### Mode A: App-Ready Verification (preferred)

Use this mode when backend application code exposes the readiness endpoint.

1. Start backend stack:

- docker compose -f docker-compose.local.yml up -d

2. Check readiness endpoint:

- curl http://localhost:8000/health

Expected success:

- HTTP 200 class response and JSON payload matching the documented success shape.

### Mode B: Baseline Runtime Verification (fallback)

Use this mode when repository is in baseline/bootstrap state and `/health` is not yet implemented.

1. Start backend stack:

- docker compose -f docker-compose.local.yml up -d

2. Verify runtime services:

- docker compose -f docker-compose.local.yml ps

3. Confirm dependency health:

- postgres must report healthy
- redis must report running

Expected success:

- Backend runtime and dependencies are up, and no immediate startup crash loops are present.

## Notes

- If your app does not yet expose `/health`, use Mode B until endpoint implementation is available.
- Once `/health` exists, Mode A is mandatory for FE-to-BE connectivity gating.
- Frontend connectivity checks must run only after selected readiness mode passes.
