# Architecture Change / Thay doi Kien truc

## Before / Truoc thay doi

```mermaid
flowchart LR
    Dev[Contributor] --> BE[BauCuaBE repo]
    Dev --> FE[BauCuaFE repo]
    BE --> X[No startup scaffold]
    FE --> Y[No startup scaffold]
```

## After / Sau thay doi

```mermaid
flowchart LR
    Dev[Contributor] --> Guide[Integrated startup guide]
    Guide --> BEStack[BauCuaBE Docker runtime]
    Guide --> FEStack[BauCuaFE Docker runtime]
    FEStack -->|HTTP/JSON| BEStack
    BEStack --> PG[(PostgreSQL)]
    BEStack --> R[(Redis)]
```

## Architecture Notes / Ghi chu kien truc

- Backend remains API authority for business logic.
- Frontend remains API consumer.
- Local runtime becomes reproducible and environment-driven via Docker.
