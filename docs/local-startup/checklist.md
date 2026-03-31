# Baseline Verification Checklist

## Clean-Start Preconditions

- No required setup command has been run in this workspace session
- Docker engine is running
- .env exists for BauCuaBE and BauCuaFE

## Checklist

| Step | Command or Action                                           | Expected Success                         | Expected Failure                                    |
| ---- | ----------------------------------------------------------- | ---------------------------------------- | --------------------------------------------------- |
| 1    | Start BE: docker compose -f docker-compose.local.yml up -d  | BE app, postgres, redis containers start | Startup error points to env or Docker issue         |
| 2    | BE readiness: Mode A (/health) or Mode B (runtime fallback) | Selected readiness mode passes           | Readiness mode fails and blocks FE startup          |
| 3    | Start FE in BauCuaFE root                                   | FE container starts and serves app       | FE startup fails with env or package error          |
| 4    | FE -> BE connectivity check                                 | FE reaches BE base URL and /health       | Connectivity fails and reports URL or network issue |
| 5    | Re-run readiness checks                                     | Both checks pass consistently            | Flaky status requires troubleshooting               |

## Failure Routing

- Docker or env failures: see docs/local-startup/troubleshooting.md
- FE connectivity failures: switch to BauCuaFE repository, then see docs/local-startup/connectivity.md

## Completion Criteria

Baseline is ready when all checklist steps pass from a clean start.
