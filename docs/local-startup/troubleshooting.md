# Backend Troubleshooting Matrix

## Fail-Fast Rule

Stop immediately if Docker engine is unavailable or required env keys are missing.
Do not continue to FE startup until BE readiness is healthy.

## Common Failures

| Scenario                  | Symptom                           | Recovery                                                          |
| ------------------------- | --------------------------------- | ----------------------------------------------------------------- |
| Docker daemon not running | docker compose fails to connect   | Start Docker Desktop/service, then rerun compose command          |
| Missing env key           | App container exits or boot fails | Compare .env against .env.example and fill missing keys           |
| Port 8000 already in use  | Backend app cannot bind port      | Change host mapping in compose, then retry                        |
| Port 5432 already in use  | Postgres container fails to start | Change host port mapping for postgres service                     |
| Port 6379 already in use  | Redis container fails to start    | Change host port mapping for redis service                        |
| DB connection refused     | App cannot reach postgres         | Verify postgres is healthy and DB_HOST uses service name postgres |
| Redis connection refused  | App cannot reach redis            | Verify redis service is running and REDIS_HOST is redis           |

## Escalation

Escalate to team support when:

1. Docker services are healthy but readiness endpoint still fails after env validation.
2. Local host networking policies block container ports.
3. Multiple contributors reproduce the same startup failure on clean setup.
