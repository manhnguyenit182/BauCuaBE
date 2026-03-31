# Requirement Traceability Sheet

| Requirement                            | Artifact(s)                                                                                         | Verification Point                                        |
| -------------------------------------- | --------------------------------------------------------------------------------------------------- | --------------------------------------------------------- |
| FR-001 Unified startup guide           | docs/local-startup/guide.md, docs/local-startup/linked-pr-sync.md                                   | Guide enforces BE -> FE order and checkpoints             |
| FR-002 Backend Docker baseline         | Dockerfile, docker-compose.local.yml, docs/local-startup/backend-readiness.md                       | Compose config valid and readiness contract documented    |
| FR-003 Frontend Docker baseline        | BauCuaFE/Dockerfile, BauCuaFE/docker-compose.local.yml, BauCuaFE/docs/local-startup/connectivity.md | FE runtime config valid and API base URL contract present |
| FR-004 Environment contract            | .env.example, BauCuaFE/.env.example, README files                                                   | Required keys documented per root                         |
| FR-005 Baseline verification checklist | docs/local-startup/checklist.md, BauCuaFE/docs/local-startup/connectivity.md                        | End-to-end checklist from clean start                     |
| FR-006 Troubleshooting flow            | docs/local-startup/troubleshooting.md, docs/local-startup/compatibility.md                          | Common failures mapped to recovery steps                  |
| NFR-001 Startup performance            | docs/local-startup/checklist.md                                                                     | Repeatable startup flow with explicit checkpoints         |
| NFR-002 Security hygiene               | .env.example, BauCuaFE/.env.example, README files                                                   | Placeholders only, no real secrets                        |
| NFR-003 Local scalability baseline     | docker-compose.local.yml files                                                                      | Service-level restart support per compose services        |
| NFR-004 Maintainability                | guide.md, checklist.md, traceability.md                                                             | Cross-referenced docs with clear ownership                |
| NFR-005 Cross-platform compatibility   | docs/local-startup/compatibility.md                                                                 | Windows-first guidance plus Linux/macOS equivalents       |

## Reference

This sheet is referenced by the integrated startup guide and remains the audit checkpoint for US-0.0.1.
