# Sequence: Shared local FE/BE startup baseline

```mermaid
sequenceDiagram
    participant Dev as Contributor
    participant Guide as Startup Guide
    participant BED as BE Docker Stack
    participant FED as FE Docker Stack
    participant API as BE API

    Dev->>Guide: Follow setup flow
    Guide-->>Dev: Prerequisites + env steps

    Dev->>BED: Start backend stack
    BED->>API: Boot Laravel services
    API-->>BED: Health ready
    BED-->>Dev: Backend ready

    Dev->>FED: Start frontend stack
    FED->>API: HTTP/JSON call to local endpoint
    API-->>FED: Response
    FED-->>Dev: UI connected and usable

    Dev->>Guide: Execute baseline verification
    Guide-->>Dev: FE/BE baseline confirmed
```

## Notes / Ghi chu

- Startup order is backend first, frontend second.
- Connectivity check is mandatory before marking baseline ready.
- Fail-fast handling is required for missing env and unavailable Docker runtime.
