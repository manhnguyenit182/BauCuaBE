# Decision Log / Nhat ky Quyet dinh

| ID    | Date       | Decision                                          | Rationale                                                                    |
| ----- | ---------- | ------------------------------------------------- | ---------------------------------------------------------------------------- |
| D-001 | 2026-03-30 | Adopt Docker-first local baseline for both roots  | User-confirmed mandatory Docker requirement and reproducible onboarding goal |
| D-002 | 2026-03-30 | Deliver with 2 linked PRs (BauCuaBE and BauCuaFE) | User-confirmed process for repo ownership and review traceability            |
| D-003 | 2026-03-30 | Enforce startup order BauCuaBE -> BauCuaFE        | Matches API-consumer relation and workspace build order                      |
| D-004 | 2026-03-30 | Keep scope limited to startup baseline and docs   | Prevents scope creep into gameplay/business implementation                   |

---

## Decision D-001: Docker-first local baseline

**Context:**
Current repositories do not include executable startup scaffolding.

**Options considered:**

- Native tooling only
- Docker-first linked baseline
- Single mono-compose in one repo

**Decision:**
Use Docker-first linked baseline across both roots.

**Rationale:**
Consistent, repeatable onboarding with lower environment drift.

---

## Decision D-002: Two linked PRs

**Context:**
Work spans two separate repositories with distinct ownership.

**Options considered:**

- One coordinated PR pattern
- Two linked PRs (one per repo)

**Decision:**
Two linked PRs.

**Rationale:**
Clear review boundaries while preserving cross-root traceability.

---

## Decision D-003: Startup order enforcement

**Context:**
Frontend consumes backend API immediately after boot.

**Decision:**
Document and enforce BE start before FE start.

**Rationale:**
Reduces false failures and aligns with API dependency.

---

## Decision D-004: Scope control

**Context:**
US-0.0.1 targets startup baseline only.

**Decision:**
Exclude gameplay, business rules, and production infrastructure changes.

**Rationale:**
Keeps delivery focused and auditable against acceptance criteria.
