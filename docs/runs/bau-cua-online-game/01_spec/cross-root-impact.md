# Cross-Root Impact — US-0.0.1

# Anh huong Da Root — US-0.0.1

## Summary / Tom tat

| Aspect            | Value                               |
| ----------------- | ----------------------------------- |
| Roots Involved    | BauCuaBE, BauCuaFE                  |
| Relationship Type | API consumer (BauCuaFE -> BauCuaBE) |
| Sync Type         | immediate                           |
| Delivery Model    | 2 linked PRs (1 per repo)           |

---

## Root: BauCuaBE

| Aspect                | Detail                                                                                                                           |
| --------------------- | -------------------------------------------------------------------------------------------------------------------------------- |
| Changes Summary       | Define backend local Docker runtime baseline, environment contract, readiness check contract, and setup documentation references |
| Dependencies Affected | Docker Engine, Docker Compose, PHP 8.4, Composer, PostgreSQL, Redis                                                              |
| Integration Points    | Local API readiness endpoint contract consumed by BauCuaFE                                                                       |
| Sync Type             | immediate                                                                                                                        |

---

## Root: BauCuaFE

| Aspect                | Detail                                                                                                            |
| --------------------- | ----------------------------------------------------------------------------------------------------------------- |
| Changes Summary       | Define frontend local Docker runtime baseline, environment contract, and FE-to-BE local connectivity verification |
| Dependencies Affected | Docker Engine, Docker Compose, Node.js, npm                                                                       |
| Integration Points    | API base URL contract and connectivity checks against BauCuaBE local runtime                                      |
| Sync Type             | immediate                                                                                                         |

---

## Integration Contracts / Hop dong Tich hop

| From     | To       | Type              | Contract                                                         |
| -------- | -------- | ----------------- | ---------------------------------------------------------------- |
| BauCuaFE | BauCuaBE | HTTP/JSON API     | FE local runtime must target documented BE local API endpoint    |
| BauCuaBE | BauCuaFE | Startup readiness | BE readiness is prerequisite before FE connectivity verification |

---

## Cross-Root Risks / Rui ro Da Root

| Risk                                           | Impact | Mitigation                                                           |
| ---------------------------------------------- | ------ | -------------------------------------------------------------------- |
| FE PR merged without BE baseline updates       | High   | Link PRs bi-directionally and block merge until pair is review-ready |
| Divergent env key naming across repos          | High   | Maintain one canonical env contract section in spec                  |
| Startup order not followed by new contributors | Medium | Enforce ordered checklist with explicit pass/fail gates              |

---

## Coordination Notes / Ghi chu Phoi hop

- BE PR should include references to FE PR and shared acceptance checks.
- FE PR should include references to BE PR and shared acceptance checks.
- Review sequence should validate BE readiness first, then FE connectivity.
- Final completion of US-0.0.1 requires both PRs to satisfy linked acceptance criteria.

---

## Linked PR Sync Gates / Cong dong bo Linked PR

| Gate   | Description                                                           |
| ------ | --------------------------------------------------------------------- |
| Sync-1 | BE PR must include FE PR link                                         |
| Sync-2 | FE PR must include BE PR link                                         |
| Sync-3 | Both PRs must include the same acceptance checklist references        |
| Sync-4 | Merge readiness requires both PRs to pass shared local-startup checks |
