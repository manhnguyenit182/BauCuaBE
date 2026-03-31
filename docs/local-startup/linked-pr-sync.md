# Linked PR Sync Checklist (BE <-> FE)

## Objective

Prevent desynchronized merges between backend and frontend baseline changes.

## Mandatory Gates

| Gate | Requirement                                                       |
| ---- | ----------------------------------------------------------------- |
| G1   | BE PR description references FE PR URL                            |
| G2   | FE PR description references BE PR URL                            |
| G3   | Both PRs include shared acceptance checklist links                |
| G4   | BE readiness contract is stable before FE connectivity validation |
| G5   | Merge is blocked until both PRs are review-ready                  |

## Shared Acceptance Checks

- Backend compose config resolves successfully
- Frontend compose config resolves successfully
- Backend readiness contract documented
- FE to BE connectivity contract documented
- Integrated guide and checklist references are consistent

## Bi-Directional Reference Template

- BE PR: Related FE PR: <insert FE PR URL>
- FE PR: Related BE PR: <insert BE PR URL>
