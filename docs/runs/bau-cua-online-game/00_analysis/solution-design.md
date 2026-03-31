# Analysis & Solution Design — Shared local FE/BE startup baseline

<!-- Template Version: 1.0 | Contract: v1.0 | Last Updated: 2026-03-30 -->
<!-- Vietnamese first, English follows for each key section -->

---

## TL;DR

| Aspect           | Value                                          |
| ---------------- | ---------------------------------------------- |
| Feature          | US-0.0.1 — Shared local FE/BE startup baseline |
| Status           | In Review                                      |
| Affected Roots   | BauCuaBE, BauCuaFE                             |
| Complexity       | Medium                                         |
| Estimated Effort | 2-4 dev days                                   |

---

## 0.1 Request Analysis / Phan tich Yeu cau

### Problem Statement / Van de

**VI:** Du an hien chua co luong khoi dong local thong nhat cho backend va frontend. Thanh vien moi kho tiep can vi thieu huong dan setup va thieu baseline chay chung.

**EN:** The project currently has no unified local startup flow across backend and frontend. New contributors face onboarding friction due to missing setup guidance and a shared run baseline.

### Context / Ngu canh

| Aspect          | Current / Hien tai                                                     | Desired / Mong muon                                           |
| --------------- | ---------------------------------------------------------------------- | ------------------------------------------------------------- |
| Behavior        | Chi co README toi gian, chua co startup flow thuc thi                  | Co 1 luong startup Docker hoa, co the lap lai cho ca BE va FE |
| Data flow       | FE-BE relation duoc mo ta muc workspace, chua co local contract cu the | FE goi BE qua endpoint local on dinh, BE la API authority     |
| User experience | Contributor moi phai tu doan cach chay                                 | Contributor moi lam theo huong dan la chay duoc ngay          |

### Gap Analysis / Phan tich Khoang cach

- VI: Thieu scaffold Docker, thieu env templates, thieu startup instructions nhat quan. / EN: Missing Docker scaffold, env templates, and consistent startup instructions.
- VI: Chua co luong xac minh baseline local cho ca 2 roots. / EN: No local baseline verification flow across both roots.
- VI: Chua co quy uoc dong bo cross-root khi setup startup. / EN: No explicit cross-root synchronization convention for startup setup.

### Affected Areas / Vung Anh huong

| Root     | Component                                        | Impact                                                              |
| -------- | ------------------------------------------------ | ------------------------------------------------------------------- |
| BauCuaBE | Local runtime scaffold (Docker/API infra)        | Add Docker-based BE startup baseline and environment contracts      |
| BauCuaFE | Local runtime scaffold (Docker/frontend runtime) | Add Docker-based FE startup baseline and API connectivity contracts |
| BauCuaBE | Documentation for onboarding                     | Add integrated setup guide and verification checklist               |

### Open Questions / Cau hoi mo

1. VI: Khong con cau hoi chan scope intake; da chot Docker va 2 PR lien ket. / EN: No intake blocker questions remain; Docker and two linked PRs are confirmed.

### Assumptions / Gia dinh

1. VI: Docs root cho run nay la BauCuaBE. / EN: Docs root for this run is BauCuaBE.
2. VI: Branch feature/bau-cua-online-game-us-0.0.1 ton tai o ca BE va FE. / EN: Branch feature/bau-cua-online-game-us-0.0.1 exists in both BE and FE roots.
3. VI: Docker la bat buoc cho baseline local. / EN: Docker is mandatory for the local baseline.
4. VI: Chien luoc merge la 2 PR lien ket (moi repo 1 PR). / EN: Delivery strategy is two linked PRs (one per repo).

---

## 0.2 Solution Research / Nghien cuu Giai phap

### Existing Patterns Found / Pattern co san

| Location                                               | Pattern                                 | Applicable | Notes                                                          |
| ------------------------------------------------------ | --------------------------------------- | ---------- | -------------------------------------------------------------- |
| BauCuaBE/README.md                                     | Placeholder README only                 | No         | Khong co startup pattern co the tai su dung                    |
| BauCuaFE/README.md                                     | Placeholder README only                 | No         | Khong co startup pattern co the tai su dung                    |
| BauCuaBE/.github/instructions/backend.instructions.md  | Backend governance and API boundaries   | Partial    | Dung lam rang buoc thiet ke, khong phai startup implementation |
| BauCuaFE/.github/instructions/frontend.instructions.md | Frontend governance and composition     | Partial    | Dung lam rang buoc thiet ke, khong phai startup implementation |
| a-z-copilot-flow/WORKSPACE_CONTEXT.md                  | Cross-root relation FE->BE api-consumer | Yes        | Build order BauCuaBE -> BauCuaFE, sync immediate               |

### Similar Implementations / Trien khai Tuong tu

| Location                       | What it does                            | Learnings                                                                                                                 |
| ------------------------------ | --------------------------------------- | ------------------------------------------------------------------------------------------------------------------------- |
| BauCuaBE (no Docker artifacts) | Chua co Dockerfile/compose/env template | VI: Can tao scaffold moi tu dau. / EN: New scaffold must be created from scratch.                                         |
| BauCuaFE (no Docker artifacts) | Chua co Dockerfile/compose/env template | VI: Can tao scaffold moi va align endpoint BE local. / EN: New scaffold needed with explicit local BE endpoint alignment. |

### Dependencies / Phu thuoc

| Dependency         | Purpose                               | Status                                    |
| ------------------ | ------------------------------------- | ----------------------------------------- |
| Docker Engine      | Run local containerized runtime       | Required (developer machine prerequisite) |
| Docker Compose v2  | Orchestrate local services            | Required (developer machine prerequisite) |
| PHP 8.4 + Composer | Laravel runtime/build in BE container | Required for BE image                     |
| Node.js + npm      | FE runtime/build in FE container      | Required for FE image                     |
| PostgreSQL         | Local relational DB for BE            | Planned in Docker stack                   |
| Redis              | Local cache/queue support for BE      | Planned in Docker stack                   |

### Cross-Root Dependencies / Phu thuoc Da root

| From     | To       | Type                   | Impact                                                      |
| -------- | -------- | ---------------------- | ----------------------------------------------------------- |
| BauCuaFE | BauCuaBE | API consumer           | FE startup phu thuoc BE API endpoint va order khoi dong     |
| BauCuaBE | BauCuaFE | Build order dependency | Theo workspace context, BE should be ready before FE checks |

### Reusable Components / Component Tai su dung

- None confirmed in current codebase. Existing artifacts are governance docs only.

### New Components Needed / Component can tao Moi

- Docker startup artifacts for BauCuaBE (Dockerfile/compose/env template).
- Docker startup artifacts for BauCuaFE (Dockerfile/compose/env template).
- Shared onboarding setup guide and baseline verification checklist.

---

## 0.3 Solution Design / Thiet ke Giai phap

### Solution Overview / Tong quan Giai phap

**VI:** Giai phap duoc chon la mo hinh Docker-first theo huong hai repo, moi repo duoc bo sung startup scaffold rieng (Dockerfile, env template, startup instructions), dong thoi rang buoc trinh tu khoi dong theo dependency FE->BE. Huong dan onboarding duoc to chuc thanh mot flow thong nhat de contributor moi chay duoc tung buoc, xac minh duoc ket noi FE-BE va trang thai baseline local.

**EN:** The chosen approach is a Docker-first two-repo baseline where each repo receives its own startup scaffold (Dockerfile, env template, startup instructions), while startup order is enforced by FE->BE dependency. Onboarding documentation is organized as one integrated flow so a new contributor can run both roots step-by-step and verify FE-BE baseline connectivity.

### Approach Comparison / So sanh Phuong phap

| Approach                                            | Pros                                                                    | Cons                                                                       | Verdict                                                            |
| --------------------------------------------------- | ----------------------------------------------------------------------- | -------------------------------------------------------------------------- | ------------------------------------------------------------------ |
| **Chosen: Docker-first linked setup per repo**      | Consistent local runtime, reproducible onboarding, cross-root alignment | Initial setup effort, image build overhead                                 | ✅ Selected                                                        |
| Alternative 1: Native tooling only                  | Fast initial setup for current maintainers                              | Environment drift risk, hard onboarding, low reproducibility               | ❌ Rejected: Does not satisfy Docker-required decision             |
| Alternative 2: Single mono-compose in one repo only | Centralized commands                                                    | Coupling risk, less clear ownership across two repos, harder PR separation | ❌ Rejected: Conflicts with linked 2-PR process and repo ownership |

### Components / Cac Component

| #   | Name                            | Root               | Purpose                                                                                                    |
| --- | ------------------------------- | ------------------ | ---------------------------------------------------------------------------------------------------------- |
| 1   | BE Docker Runtime Scaffold      | BauCuaBE           | VI: Chuan hoa local runtime cho API backend. / EN: Standardize local API backend runtime.                  |
| 2   | FE Docker Runtime Scaffold      | BauCuaFE           | VI: Chuan hoa local runtime cho frontend app. / EN: Standardize local frontend runtime.                    |
| 3   | Environment Contracts           | BauCuaBE, BauCuaFE | VI: Dinh nghia bien env bat buoc va gia tri mau. / EN: Define required env variables and defaults.         |
| 4   | Integrated Startup Guide        | BauCuaBE docs      | VI: Huong dan 1 luong startup cho contributor moi. / EN: One integrated startup flow for new contributors. |
| 5   | Baseline Verification Checklist | BauCuaBE docs      | VI: Kiem tra lai baseline FE-BE sau setup. / EN: Repeatable FE-BE baseline verification after setup.       |

### Component Details / Chi tiet Component

#### Component 1: BE Docker Runtime Scaffold

| Aspect       | Detail                                                                                                                                       |
| ------------ | -------------------------------------------------------------------------------------------------------------------------------------------- |
| Root         | BauCuaBE                                                                                                                                     |
| Location     | BauCuaBE repository root (Docker-related files)                                                                                              |
| Purpose      | VI: Chay backend local theo Docker va expose API endpoint cho FE. / EN: Run backend locally in Docker and expose FE-consumable API endpoint. |
| Inputs       | .env values, Docker runtime, DB/Redis config                                                                                                 |
| Outputs      | Running Laravel API, reachable health endpoint                                                                                               |
| Dependencies | Docker Engine, Docker Compose, PostgreSQL service, Redis service                                                                             |

#### Component 2: FE Docker Runtime Scaffold

| Aspect       | Detail                                                                                                                         |
| ------------ | ------------------------------------------------------------------------------------------------------------------------------ |
| Root         | BauCuaFE                                                                                                                       |
| Location     | BauCuaFE repository root (Docker-related files)                                                                                |
| Purpose      | VI: Chay frontend local bang Docker va ket noi API BE local. / EN: Run frontend locally in Docker and connect to local BE API. |
| Inputs       | FE env values, API base URL, Docker runtime                                                                                    |
| Outputs      | Running FE app, successful API calls to BE                                                                                     |
| Dependencies | Docker Engine, Docker Compose, BauCuaBE running API                                                                            |

### Data Flow / Luong Du lieu

| Step | From             | To                     | Data                   | Action                           |
| ---- | ---------------- | ---------------------- | ---------------------- | -------------------------------- |
| 1    | Contributor      | BauCuaBE setup         | Env + startup commands | Start BE stack first             |
| 2    | Contributor      | BauCuaFE setup         | Env + startup commands | Start FE stack second            |
| 3    | BauCuaFE runtime | BauCuaBE runtime       | HTTP/JSON API requests | Validate local connectivity      |
| 4    | Contributor      | Verification checklist | Health and UI checks   | Confirm baseline is reproducible |

### Error Handling / Xu ly Loi

| Scenario                            | Handling                                                                                                                                      | User Impact                            |
| ----------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------- |
| Missing env variables               | VI: Fail-fast voi thong bao bien thieu + huong dan bo sung. / EN: Fail-fast with explicit missing-variable guidance.                          | Setup blocked until env fixed          |
| BE service not ready when FE starts | VI: Huong dan startup order va readiness check truoc khi chay FE. / EN: Enforce startup order and readiness check before FE startup.          | Temporary FE API failures avoided      |
| Docker not installed or unavailable | VI: Kiem tra prerequisite truoc startup va cung cap buoc cai dat. / EN: Validate prerequisites before startup and provide installation steps. | Cannot continue until Docker installed |

### Rollback Plan / Ke hoach Rollback

**VI:** Neu startup scaffold gay su co, rollback bang cach khoi phuc cac file startup ve trang thai truoc thay doi tren tung repo (BE va FE), xoa cac bien env moi khong can thiet, va quay lai huong dan setup toi gian truoc do. Vi thay doi tap trung vao config/docs, rollback khong anh huong du lieu nghiep vu.

**EN:** If the startup scaffold causes issues, rollback by restoring startup/config/doc files in each repo (BE and FE) to pre-change state, removing newly introduced env variables, and reverting to previous minimal setup guidance. Since changes are config/docs-focused, rollback has no business-data impact.

---

## 0.4 Diagrams / So do

### Diagram Index

- Flow overview: see diagrams/flow-overview.md
- Main sequence: see diagrams/sequence-main.md
- Architecture change: see diagrams/architecture.md

### Changes Highlighted / Thay doi Noi bat

- Added: Docker-first startup baseline design for BE and FE.
- Added: Cross-root startup order and connectivity verification path.
- Added: Two-linked-PR delivery alignment in design constraints.

---

## Risks & Mitigations / Rui ro va Giam thieu

| Risk                                            | Likelihood | Impact | Mitigation                                                         |
| ----------------------------------------------- | ---------- | ------ | ------------------------------------------------------------------ |
| Docker setup variance across developer machines | Medium     | Medium | Provide prerequisite matrix and fail-fast checks                   |
| FE-BE connectivity misconfiguration             | Medium     | High   | Define explicit API base URL contract and health verification step |
| Scope creep into feature implementation         | Low        | High   | Keep scope limited to startup baseline and docs only               |
| Cross-repo drift between linked PRs             | Medium     | Medium | Use linked PR references and synchronized review checklist         |

---

## Decision Summary / Tom tat Quyet dinh

| ID    | Decision                           | Rationale                                                      |
| ----- | ---------------------------------- | -------------------------------------------------------------- |
| D-001 | Adopt Docker-first local baseline  | User confirmed Docker is mandatory; improves reproducibility   |
| D-002 | Deliver via 2 linked PRs (BE + FE) | User confirmed one PR per repo for traceability and ownership  |
| D-003 | Enforce startup order BE -> FE     | Matches workspace cross-root dependency and API-consumer model |

---

## Approval / Phe duyet

| Role     | Name    | Status  | Date       |
| -------- | ------- | ------- | ---------- |
| Author   | Copilot | Done    | 2026-03-30 |
| Reviewer | User    | Pending | TBD        |

---

## Next Step / Buoc tiep theo

**VI:** Sau khi user phe duyet Phase 0, chuyen sang Phase 1 Specification.

**EN:** After user approval of Phase 0, proceed to Phase 1 Specification.
