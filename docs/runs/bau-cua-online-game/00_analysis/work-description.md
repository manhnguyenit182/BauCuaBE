## 📋 Work Description / Mô tả Công việc

### Summary / Tóm tắt

| Aspect                      | Value                                                                                                                                                                                 |
| --------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Work Type / Loại            | FEATURE                                                                                                                                                                               |
| Title / Tiêu đề             | Shared local FE/BE startup baseline                                                                                                                                                   |
| Affected Roots              | BauCuaBE, BauCuaFE                                                                                                                                                                    |
| Base Branch                 | main (BauCuaBE), main (BauCuaFE)                                                                                                                                                      |
| PR Strategy / Chiến lược PR | 2 linked PRs (1 PR per repo: BauCuaBE, BauCuaFE)                                                                                                                                      |
| Requestor                   | User                                                                                                                                                                                  |
| Sources                     | docs/product/bau-cua-online-game/checklist.md; docs/product/bau-cua-online-game/user-stories.md; docs/product/bau-cua-online-game/roadmap.md; user approval to execute both FE and BE |

---

## Flow 1 Context / Ngữ cảnh từ Flow 1

| Field          | Value                                         |
| -------------- | --------------------------------------------- |
| User Story ID  | US-0.0.1                                      |
| Product        | bau-cua-online-game                           |
| Checklist Path | docs/product/bau-cua-online-game/checklist.md |
| Status         | IN_PROGRESS (updated from PLANNED)            |

> ℹ️ When Phase 5 completes, checklist.md will be updated to mark this US as DONE.

---

### Problem / Request — Vấn đề / Yêu cầu

**EN:** Establish one shared local startup flow for frontend and backend so every contributor can run the same baseline environment without ad hoc setup help.

**VI:** Thiết lập một luồng khởi chạy local thống nhất cho frontend và backend để mọi thành viên có thể chạy cùng baseline mà không cần hướng dẫn thủ công.

---

### Expected Outcome — Kết quả Mong đợi

**EN:** A new contributor can follow one documented FE/BE startup flow and run both applications locally, with required environment inputs documented clearly.

**VI:** Thành viên mới có thể làm theo một luồng setup FE/BE đã tài liệu hóa để chạy cả hai ứng dụng ở local, kèm danh sách biến môi trường bắt buộc rõ ràng.

---

### In Scope — Trong Phạm vi

- EN: Define and document one shared local startup sequence for backend and frontend. / VI: Xác định và tài liệu hóa một trình tự khởi chạy local thống nhất cho backend và frontend.
- EN: Document required environment inputs, prerequisites, and first-run steps for new contributors. / VI: Tài liệu hóa các biến môi trường bắt buộc, điều kiện tiên quyết và các bước chạy lần đầu cho thành viên mới.
- EN: Validate that FE and BE can be started together from a Docker-based local setup path. / VI: Xác minh FE và BE có thể khởi chạy cùng nhau từ luồng setup local dựa trên Docker.

### Out of Scope — Ngoài Phạm vi

- EN: Implement gameplay, betting, room, mission, or reward features. / VI: Triển khai các tính năng gameplay, cược, phòng, nhiệm vụ hoặc phần thưởng.
- EN: Production infrastructure/deployment changes. / VI: Thay đổi hạ tầng hoặc triển khai production.
- EN: New business rules beyond startup baseline and environment setup. / VI: Bổ sung luật nghiệp vụ mới ngoài baseline khởi chạy và setup môi trường.

---

### Constraints — Ràng buộc

| Type                 | Constraint                                                                                                                                                        |
| -------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Technical / Kỹ thuật | Work spans both BauCuaBE and BauCuaFE; FE consumes BE API via HTTP/JSON; local baseline must include Docker; maintain cross-root build order BauCuaBE → BauCuaFE. |
| Time / Thời gian     | No explicit deadline provided; complete only what is necessary to satisfy US-0.0.1 acceptance criteria.                                                           |
| Process / Quy trình  | Checklist remains the execution-state authority; current US stays IN_PROGRESS; compare changes against base branch main; deliver as 2 linked PRs (one per repo).  |

---

### Assumptions — Giả định

- EN: Docs root for this run is BauCuaBE per user instruction to move docs into BE. / VI: Docs root cho run hiện tại là BauCuaBE theo chỉ định của user chuyển docs vào BE.
- EN: Work branch feature/bau-cua-online-game-us-0.0.1 is already created in both BE and FE roots. / VI: Branch feature/bau-cua-online-game-us-0.0.1 đã được tạo ở cả BE và FE.
- EN: Baseline targets local development consistency first, with Windows validated first if platform-specific details appear. / VI: Baseline ưu tiên tính nhất quán môi trường local, với Windows là nền tảng xác thực đầu tiên nếu có chi tiết phụ thuộc hệ điều hành.
- EN: User confirmed Docker is required for the local baseline. / VI: User đã xác nhận Docker là bắt buộc cho baseline local.
- EN: User confirmed delivery model is 2 linked PRs (one in BE repo, one in FE repo). / VI: User đã xác nhận mô hình triển khai là 2 PR liên kết (một PR ở BE, một PR ở FE).

---

### Missing Information — Thông tin Còn thiếu

> ✅ No blocking missing information at intake stage.
> ✅ Không còn thông tin thiếu mang tính chặn ở bước intake.

- EN: None. / VI: Không có.

---

### Acceptance Criteria (Refined) — Tiêu chí Nghiệm thu (Tinh chỉnh)

- [ ] **AC1 — Documented Setup Flow:** EN: A new contributor can follow one integrated FE/BE startup guide (Docker-based) and successfully start both applications locally in sequence (BE first, then FE). / VI: Thành viên mới có thể làm theo một hướng dẫn setup FE/BE tích hợp (dựa trên Docker) và khởi chạy thành công cả hai ứng dụng ở local theo thứ tự (BE trước, sau đó FE).

- [ ] **AC2 — Environment Documentation:** EN: A clear list of required environment variables, prerequisites (Docker, Node version, PHP version, etc.) and first-run commands is documented in README or setup guide with no external dependency on ad hoc guidance. / VI: Danh sách rõ ràng các biến môi trường bắt buộc, điều kiện tiên quyết (Docker, phiên bản Node, PHP, v.v.) và lệnh chạy lần đầu được tài liệu hóa trong README hoặc hướng dẫn setup mà không cần dựa vào hướng dẫn thủ công.

- [ ] **AC3 — Docker Validation:** EN: Both backend and frontend applications start successfully within Docker containers from a clean local environment (no pre-existing artifacts or state). / VI: Cả backend và frontend khởi chạy thành công trong Docker containers từ môi trường local sạch (không có artifacts hoặc trạng thái sẵn có).
