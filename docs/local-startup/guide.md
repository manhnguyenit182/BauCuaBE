# Integrated Local Startup Guide (BE -> FE)

## Scope

This guide defines one startup flow for both roots:

1. BauCuaBE first
2. BauCuaFE second

## Prerequisites

- Docker Engine installed and running
- Docker Compose v2 available
- Backend env file created from BauCuaBE/.env.example
- Frontend env file created from BauCuaFE/.env.example

## Step 1: Start Backend (BauCuaBE)

1. From BauCuaBE root:
   - docker compose -f docker-compose.local.yml up -d
2. Validate backend readiness:
   - Use `docs/local-startup/backend-readiness.md`
   - Run Mode A (`/health`) when endpoint exists, otherwise Mode B (runtime verification)

Checkpoint:

- Pass: readiness returns status ok
- Fail: follow docs/local-startup/troubleshooting.md

## Step 2: Start Frontend (BauCuaFE)

1. From BauCuaFE root:
   - docker compose -f docker-compose.local.yml up -d
2. Validate FE to BE connectivity:
   - switch to BauCuaFE repository root
   - open `docs/local-startup/connectivity.md`
   - execute FE connectivity checks described there

Checkpoint:

- Pass: FE can call BE readiness endpoint
- Fail: validate VITE_API_BASE_URL and backend readiness

## Verification and Follow-Up

- Run checklist: docs/local-startup/checklist.md
- Linked PR sync gates: docs/local-startup/linked-pr-sync.md
- Platform notes: docs/local-startup/compatibility.md
- Requirement traceability: docs/local-startup/traceability.md
- FE connectivity contract source (in FE repo): `docs/local-startup/connectivity.md`

## Checklist Execution Output Hints

- Success path: each step in docs/local-startup/checklist.md shows expected pass output.
- Failure path: each failed step points to targeted remediation documents.

## Platform Equivalence

- Windows is the primary baseline for this flow.
- Linux and macOS equivalent notes are maintained in docs/local-startup/compatibility.md.
