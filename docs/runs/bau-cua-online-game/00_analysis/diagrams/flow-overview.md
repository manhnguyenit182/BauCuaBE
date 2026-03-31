# Flow Overview / Tong quan Luong

## Current Flow / Luong Hien tai

```mermaid
flowchart TD
    A[New contributor joins] --> B[Read minimal README]
    B --> C[Manual trial-and-error setup]
    C --> D[Start BE and FE with inconsistent steps]
    D --> E[Connectivity uncertain]
```

## Proposed Flow / Luong De xuat

```mermaid
flowchart TD
    A[New contributor joins] --> B[Read integrated startup guide]
    B --> C[Check prerequisites: Docker + env]
    C --> D[Start BauCuaBE Docker stack]
    D --> E{BE healthy?}
    E -->|No| F[Follow troubleshooting]
    F --> D
    E -->|Yes| G[Start BauCuaFE Docker stack]
    G --> H{FE can call BE API?}
    H -->|No| I[Verify API base URL and network]
    I --> G
    H -->|Yes| J[Run baseline verification checklist]
    J --> K[Local baseline ready]
```

## Changes Highlighted / Thay doi Noi bat

- Added: Docker-first startup baseline.
- Added: Explicit startup order BauCuaBE -> BauCuaFE.
- Added: Repeatable FE-BE connectivity verification.
- Removed: Ad hoc manual setup flow.
