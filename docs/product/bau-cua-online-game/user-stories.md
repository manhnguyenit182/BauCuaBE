# User Stories Backlog

### English

#### User Stories Overview

- Product name: Bau Cua Online Game
- Product slug: bau-cua-online-game
- Scope covered (phases): Phase 0, Phase 1, Phase 2, Phase 3

---

#### Phase 0: Product Foundation

##### Epic 0.0: FE/BE bootstrap environment

**US-0.0.1: Shared local FE/BE startup baseline**

- Description: As a development team member, I want one shared local startup flow for frontend and backend so every contributor works on the same baseline.
- Acceptance Criteria:
  - AC1: A new contributor can follow one documented setup flow and start both frontend and backend locally.
  - AC2: Required environment inputs are listed clearly enough for setup without ad hoc guidance.
- Blocked By:
  - None
- Notes / Assumptions (if any): Assumes approved local development prerequisites are available for the team.

**US-0.0.2: Verified local FE-BE connectivity baseline**

- Description: As a QA engineer, I want a repeatable baseline check for FE-BE connectivity and session handoff so feature testing starts from a known good environment.
- Acceptance Criteria:
  - AC1: Frontend can reach backend from local environment through the approved application entry flow.
  - AC2: Basic authenticated session handoff is verifiable in local baseline checks.
- Blocked By:
  - US-0.0.1
- Notes / Assumptions (if any): Assumes connectivity checks remain product-level and avoid implementation details.

##### Epic 0.1: Player account onboarding and first-session setup

**US-0.1.1: Initial points on first successful onboarding**

- Description: As a new player, I want to receive the starting 1000 points after first successful account onboarding so I can immediately join the game progression.
- Acceptance Criteria:
  - AC1: A newly onboarded player receives exactly 1000 starting points once.
  - AC2: The starting points are visible in the player balance view before room entry.
- Blocked By:
  - US-0.0.2
- Notes / Assumptions (if any): Assumes one account maps to one starting-point grant.

**US-0.1.2: Returning sign-in with visible player state**

- Description: As a returning player, I want to sign in and see my current profile presence and point summary so I can decide my next action quickly.
- Acceptance Criteria:
  - AC1: Returning players can access their account and see current balance summary.
  - AC2: Player identity and session presence are shown before entering room flow.
- Blocked By:
  - US-0.0.2
  - US-0.1.1
- Notes / Assumptions (if any): Assumes player-facing state is presented consistently across sessions.

##### Epic 0.2: Point integrity and activity traceability baseline

**US-0.2.1: Transparent point transaction history**

- Description: As a player, I want each point change to include reason and time so I can trust progression and rewards.
- Acceptance Criteria:
  - AC1: Each point gain or spend appears with a readable reason.
  - AC2: Each recorded point change includes a visible timestamp.
- Blocked By:
  - US-0.1.1
- Notes / Assumptions (if any): Assumes point history is user-visible and understandable.

**US-0.2.2: Reliable balance consistency from transaction history**

- Description: As a player, I want my shown balance to stay consistent with my transaction history so settlement outcomes are trusted.
- Acceptance Criteria:
  - AC1: Balance updates after point-changing events remain consistent with recorded transactions.
  - AC2: Players do not see conflicting balances across major app views in the same session.
- Blocked By:
  - US-0.2.1
- Notes / Assumptions (if any): Assumes balance is derived from authoritative point records.

##### Epic 0.3: Room access policy baseline

**US-0.3.1: Host-defined room visibility and entry rules**

- Description: As a host, I want to configure room visibility and minimum point rules so my room access expectations are clear.
- Acceptance Criteria:
  - AC1: Host can define room as public or private at room creation.
  - AC2: Host can define minimum point requirements for entry and stay.
- Blocked By:
  - US-0.1.2
- Notes / Assumptions (if any): Assumes rule setup is presented clearly before room becomes joinable.

**US-0.3.2: Player eligibility enforcement with clear feedback**

- Description: As a player, I want room eligibility to be enforced consistently with clear messaging so I understand why I can join, stay, or get removed.
- Acceptance Criteria:
  - AC1: Players who do not meet entry rules cannot join restricted rooms.
  - AC2: Players who drop below stay requirements are removed with clear reason feedback.
- Blocked By:
  - US-0.3.1
  - US-0.2.2
- Notes / Assumptions (if any): Assumes enforcement is server-authoritative from player perspective.

---

#### Phase 1: MVP

##### Epic 1.1: Room lifecycle for hosts and players

**US-1.1.1: Host room session lifecycle control**

- Description: As a host, I want to create and control room session readiness so players can gather and start play smoothly.
- Acceptance Criteria:
  - AC1: Host can create a room and make it available according to configured room rules.
  - AC2: Host can manage room availability state before active rounds begin.
- Blocked By:
  - US-0.3.1
- Notes / Assumptions (if any): Assumes host capabilities align with room policy baseline.

**US-1.1.2: Player room join and leave flow**

- Description: As a player, I want to join and leave eligible rooms with current member visibility so I can choose where to play.
- Acceptance Criteria:
  - AC1: Eligible players can join a room and see updated room member presence.
  - AC2: Players can leave room flow gracefully without losing their account state.
- Blocked By:
  - US-1.1.1
  - US-0.3.2
- Notes / Assumptions (if any): Assumes room membership updates are timely for participants.

##### Epic 1.2: Core round loop

**US-1.2.1: Bet placement with confirmation**

- Description: As a player, I want to place bets during the valid round window and receive confirmation so I trust my wager is accepted.
- Acceptance Criteria:
  - AC1: Player can place valid bets while round accepts wagers.
  - AC2: Player receives clear confirmation for accepted bets.
- Blocked By:
  - US-1.1.2
  - US-0.2.2
- Notes / Assumptions (if any): Assumes bet eligibility follows room and balance rules.

**US-1.2.2: Round outcome and point settlement visibility**

- Description: As a player, I want to see each round result and resulting point settlement so I understand win or loss outcomes.
- Acceptance Criteria:
  - AC1: Completed round outcome is shown clearly to room participants.
  - AC2: Point settlement effects are visible after round completion.
- Blocked By:
  - US-1.2.1
  - US-0.2.2
- Notes / Assumptions (if any): Assumes settlement visibility uses the same authoritative point model.

##### Epic 1.3: Daily engagement loop

**US-1.3.1: Daily login reward claim**

- Description: As a player, I want to claim my daily login reward once per day with clear eligibility state so I can maintain regular progression.
- Acceptance Criteria:
  - AC1: Player can claim daily login reward only when eligible for the current day.
  - AC2: Player can see whether daily reward is already claimed or still available.
- Blocked By:
  - US-0.1.2
  - US-0.2.1
- Notes / Assumptions (if any): Assumes daily reward visibility is clear before claim action.

**US-1.3.2: Daily mission progress and reward grants**

- Description: As a player, I want mission progress and mission rewards to update from my gameplay so I have a clear reason to return daily.
- Acceptance Criteria:
  - AC1: Mission counters for rounds played, wins, and bet volume update from completed gameplay.
  - AC2: Mission reward is granted when mission criteria are met and claim is valid.
- Blocked By:
  - US-1.2.2
  - US-1.3.1
- Notes / Assumptions (if any): Assumes mission rewards follow the same point integrity rules.

---

#### Phase 2: Expansion

##### Epic 2.1: Session continuity and room discovery improvements

**US-2.1.1: Room discovery with entry clarity**

- Description: As a player, I want to browse available rooms and their entry requirements so I can choose a suitable room quickly.
- Acceptance Criteria:
  - AC1: Player can view available rooms with visibility and minimum-point requirement information.
  - AC2: Room listing provides enough context to decide join eligibility before entry attempt.
- Blocked By:
  - US-1.1.2
  - US-0.3.1
- Notes / Assumptions (if any): Assumes room visibility rules remain consistent with host configuration.

**US-2.1.2: Return-to-play continuity flow**

- Description: As a returning player, I want a smoother return-to-play flow so I can resume active gameplay with less friction.
- Acceptance Criteria:
  - AC1: Returning player can re-enter active play flow with clear room and session state.
  - AC2: Player sees clear guidance when previous room context is unavailable.
- Blocked By:
  - US-2.1.1
  - US-1.2.2
- Notes / Assumptions (if any): Assumes continuity behavior prioritizes clarity over hidden automatic actions.

##### Epic 2.2: Progression depth extensions

**US-2.2.1: Expanded mission and reward patterns**

- Description: As a player, I want expanded mission and reward patterns so progression stays engaging beyond the MVP loop.
- Acceptance Criteria:
  - AC1: Players can access additional mission or reward patterns beyond the initial MVP set.
  - AC2: Expanded progression still respects point-only economy and non-top-up constraints.
- Blocked By:
  - US-1.3.2
- Notes / Assumptions (if any): Assumes expansion remains within approved roadmap scope.

**US-2.2.2: Progression history and next-reward visibility**

- Description: As a player, I want to view progression history and upcoming reward opportunities so I can plan my sessions.
- Acceptance Criteria:
  - AC1: Player can review recent progression and reward history in one coherent view.
  - AC2: Player can see upcoming reward opportunities tied to current progression state.
- Blocked By:
  - US-2.2.1
  - US-0.2.1
- Notes / Assumptions (if any): Assumes history uses the same trusted point and reward records.

---

#### Phase 3: Enhancement (Optional)

##### Epic 3.1: Live quality program

**US-3.1.1: Stable live gameplay quality and fairness perception**

- Description: As a player, I want consistent rule enforcement and settlement outcomes in live sessions so gameplay feels fair and reliable.
- Acceptance Criteria:
  - AC1: Live sessions maintain consistent application of entry, betting, and settlement rules.
  - AC2: Players receive clear feedback when enforcement actions affect their session.
- Blocked By:
  - US-2.1.2
  - US-2.2.2
- Notes / Assumptions (if any): Assumes fairness perception is supported by clear communication, not only outcomes.

**US-3.1.2: Operational quality visibility for product team**

- Description: As a product operator, I want visibility into critical gameplay quality signals so issues can be addressed before broad player impact.
- Acceptance Criteria:
  - AC1: Product team can monitor a defined set of live quality signals tied to gameplay reliability.
  - AC2: Product team can identify and prioritize quality incidents that affect player trust.
- Blocked By:
  - US-3.1.1
- Notes / Assumptions (if any): Assumes quality signals are aligned with player-facing reliability outcomes.

---

### Tiếng Việt

#### Tổng quan User Stories

- Tên sản phẩm: Bau Cua Online Game
- Product slug: bau-cua-online-game
- Phạm vi (các phase): Phase 0, Phase 1, Phase 2, Phase 3

---

#### Phase 0: Nền tảng sản phẩm

##### Epic 0.0: Bootstrap môi trường FE/BE

**US-0.0.1: Baseline chạy local FE/BE thống nhất**

- Mô tả: Là một thành viên đội phát triển, tôi muốn có một luồng khởi chạy local thống nhất cho frontend và backend để mọi người cùng làm việc trên một baseline.
- Tiêu chí nghiệm thu:
  - AC1: Thành viên mới có thể làm theo một luồng setup được tài liệu hóa để chạy cả frontend và backend ở local.
  - AC2: Các thông tin môi trường bắt buộc được mô tả đủ rõ để setup mà không cần hướng dẫn thủ công thêm.
- Bị chặn bởi:
  - None
- Ghi chú / Giả định (nếu có): Giả định đội đã thống nhất các điều kiện tiên quyết cho môi trường local.

**US-0.0.2: Baseline kiểm tra kết nối FE-BE local**

- Mô tả: Là một QA engineer, tôi muốn có baseline kiểm tra lặp lại được cho kết nối FE-BE và chuyển phiên để việc test tính năng luôn bắt đầu từ môi trường đúng.
- Tiêu chí nghiệm thu:
  - AC1: Frontend có thể kết nối backend từ môi trường local qua luồng vào ứng dụng đã được phê duyệt.
  - AC2: Có thể xác minh chuyển phiên đăng nhập cơ bản trong bộ kiểm tra baseline local.
- Bị chặn bởi:
  - US-0.0.1
- Ghi chú / Giả định (nếu có): Giả định phần kiểm tra chỉ ở mức năng lực sản phẩm, không đi vào chi tiết triển khai.

##### Epic 0.1: Onboarding tài khoản và phiên chơi đầu tiên

**US-0.1.1: Cấp điểm khởi tạo sau onboarding đầu tiên**

- Mô tả: Là người chơi mới, tôi muốn nhận 1000 điểm khởi tạo sau khi onboarding tài khoản thành công để có thể vào tiến trình game ngay.
- Tiêu chí nghiệm thu:
  - AC1: Người chơi mới nhận đúng 1000 điểm khởi tạo một lần duy nhất.
  - AC2: Điểm khởi tạo hiển thị trong phần số dư trước khi vào phòng.
- Bị chặn bởi:
  - US-0.0.2
- Ghi chú / Giả định (nếu có): Giả định mỗi tài khoản chỉ được nhận một lần điểm khởi tạo.

**US-0.1.2: Đăng nhập lại với trạng thái người chơi rõ ràng**

- Mô tả: Là người chơi quay lại, tôi muốn đăng nhập và thấy trạng thái hồ sơ cùng tóm tắt điểm hiện tại để quyết định hành động tiếp theo nhanh hơn.
- Tiêu chí nghiệm thu:
  - AC1: Người chơi quay lại có thể vào tài khoản và thấy tóm tắt số dư hiện tại.
  - AC2: Danh tính và trạng thái phiên của người chơi hiển thị trước luồng vào phòng.
- Bị chặn bởi:
  - US-0.0.2
  - US-0.1.1
- Ghi chú / Giả định (nếu có): Giả định trạng thái hiển thị cho người chơi nhất quán giữa các phiên.

##### Epic 0.2: Nền tảng toàn vẹn điểm và truy vết hoạt động

**US-0.2.1: Lịch sử giao dịch điểm minh bạch**

- Mô tả: Là người chơi, tôi muốn mỗi thay đổi điểm đều có lý do và thời gian để tin tưởng tiến trình và phần thưởng.
- Tiêu chí nghiệm thu:
  - AC1: Mỗi lần tăng hoặc giảm điểm đều có lý do dễ hiểu.
  - AC2: Mỗi thay đổi điểm đều có thời gian hiển thị rõ ràng.
- Bị chặn bởi:
  - US-0.1.1
- Ghi chú / Giả định (nếu có): Giả định lịch sử điểm được hiển thị cho người chơi và dễ hiểu.

**US-0.2.2: Số dư nhất quán với lịch sử giao dịch**

- Mô tả: Là người chơi, tôi muốn số dư hiển thị luôn nhất quán với lịch sử giao dịch để tin tưởng kết quả quyết toán.
- Tiêu chí nghiệm thu:
  - AC1: Số dư sau các sự kiện thay đổi điểm luôn nhất quán với giao dịch đã ghi nhận.
  - AC2: Người chơi không thấy số dư mâu thuẫn giữa các màn hình chính trong cùng một phiên.
- Bị chặn bởi:
  - US-0.2.1
- Ghi chú / Giả định (nếu có): Giả định số dư được suy ra từ dữ liệu điểm có tính thẩm quyền.

##### Epic 0.3: Nền tảng chính sách vào phòng

**US-0.3.1: Chủ phòng thiết lập hiển thị và điều kiện vào phòng**

- Mô tả: Là chủ phòng, tôi muốn cấu hình hiển thị phòng và ngưỡng điểm tối thiểu để kỳ vọng truy cập phòng được rõ ràng.
- Tiêu chí nghiệm thu:
  - AC1: Chủ phòng có thể chọn phòng công khai hoặc riêng tư khi tạo phòng.
  - AC2: Chủ phòng có thể đặt ngưỡng điểm tối thiểu để vào phòng và ở lại phòng.
- Bị chặn bởi:
  - US-0.1.2
- Ghi chú / Giả định (nếu có): Giả định phần thiết lập luật hiển thị rõ trước khi phòng cho phép tham gia.

**US-0.3.2: Thực thi điều kiện tham gia với phản hồi rõ ràng**

- Mô tả: Là người chơi, tôi muốn điều kiện vào và ở lại phòng được thực thi nhất quán cùng thông báo rõ ràng để hiểu vì sao được vào, ở lại hoặc bị loại.
- Tiêu chí nghiệm thu:
  - AC1: Người chơi không đủ điều kiện vào phòng sẽ không thể tham gia.
  - AC2: Người chơi tụt dưới ngưỡng ở lại phòng sẽ bị loại và nhận thông báo lý do rõ ràng.
- Bị chặn bởi:
  - US-0.3.1
  - US-0.2.2
- Ghi chú / Giả định (nếu có): Giả định việc thực thi điều kiện được nhìn nhận là server-authoritative từ phía người chơi.

---

#### Phase 1: MVP

##### Epic 1.1: Vòng đời phòng cho chủ phòng và người chơi

**US-1.1.1: Chủ phòng quản lý vòng đời phiên phòng**

- Mô tả: Là chủ phòng, tôi muốn tạo và quản lý trạng thái sẵn sàng của phòng để người chơi có thể tập trung và bắt đầu chơi mượt.
- Tiêu chí nghiệm thu:
  - AC1: Chủ phòng có thể tạo phòng và mở phòng theo đúng luật phòng đã cấu hình.
  - AC2: Chủ phòng có thể quản lý trạng thái sẵn sàng của phòng trước khi bắt đầu các ván.
- Bị chặn bởi:
  - US-0.3.1
- Ghi chú / Giả định (nếu có): Giả định quyền của chủ phòng bám theo baseline chính sách phòng.

**US-1.1.2: Luồng tham gia và rời phòng của người chơi**

- Mô tả: Là người chơi, tôi muốn vào và rời các phòng đủ điều kiện, đồng thời thấy trạng thái thành viên hiện tại để chọn nơi chơi phù hợp.
- Tiêu chí nghiệm thu:
  - AC1: Người chơi đủ điều kiện có thể vào phòng và thấy cập nhật hiện diện thành viên.
  - AC2: Người chơi có thể rời phòng an toàn mà không mất trạng thái tài khoản.
- Bị chặn bởi:
  - US-1.1.1
  - US-0.3.2
- Ghi chú / Giả định (nếu có): Giả định cập nhật thành viên phòng đủ kịp thời cho người tham gia.

##### Epic 1.2: Vòng lặp ván chơi cốt lõi

**US-1.2.1: Đặt cược với xác nhận rõ ràng**

- Mô tả: Là người chơi, tôi muốn đặt cược trong khoảng thời gian hợp lệ của ván và nhận xác nhận để tin rằng cược của tôi đã được ghi nhận.
- Tiêu chí nghiệm thu:
  - AC1: Người chơi có thể đặt cược hợp lệ trong thời gian mở cược của ván.
  - AC2: Người chơi nhận xác nhận rõ ràng cho cược đã được chấp nhận.
- Bị chặn bởi:
  - US-1.1.2
  - US-0.2.2
- Ghi chú / Giả định (nếu có): Giả định tính hợp lệ của cược tuân theo luật phòng và luật số dư.

**US-1.2.2: Hiển thị kết quả ván và quyết toán điểm**

- Mô tả: Là người chơi, tôi muốn thấy kết quả từng ván và thay đổi điểm tương ứng để hiểu rõ thắng thua.
- Tiêu chí nghiệm thu:
  - AC1: Kết quả ván hoàn tất được hiển thị rõ cho người tham gia phòng.
  - AC2: Ảnh hưởng quyết toán điểm hiển thị sau khi ván kết thúc.
- Bị chặn bởi:
  - US-1.2.1
  - US-0.2.2
- Ghi chú / Giả định (nếu có): Giả định hiển thị quyết toán dùng cùng mô hình điểm có tính thẩm quyền.

##### Epic 1.3: Vòng lặp quay lại hằng ngày

**US-1.3.1: Nhận thưởng đăng nhập hằng ngày**

- Mô tả: Là người chơi, tôi muốn nhận thưởng đăng nhập mỗi ngày một lần với trạng thái đủ điều kiện rõ ràng để duy trì tiến trình đều đặn.
- Tiêu chí nghiệm thu:
  - AC1: Người chơi chỉ nhận thưởng đăng nhập khi đủ điều kiện trong ngày hiện tại.
  - AC2: Người chơi nhìn thấy rõ trạng thái đã nhận hoặc còn có thể nhận thưởng.
- Bị chặn bởi:
  - US-0.1.2
  - US-0.2.1
- Ghi chú / Giả định (nếu có): Giả định trạng thái thưởng ngày được hiển thị rõ trước thao tác nhận.

**US-1.3.2: Tiến trình nhiệm vụ ngày và cấp thưởng**

- Mô tả: Là người chơi, tôi muốn tiến trình nhiệm vụ và thưởng nhiệm vụ cập nhật theo gameplay để có lý do quay lại mỗi ngày.
- Tiêu chí nghiệm thu:
  - AC1: Bộ đếm nhiệm vụ theo số ván, số thắng, tổng cược cập nhật theo gameplay hoàn tất.
  - AC2: Thưởng nhiệm vụ được cấp khi người chơi đạt điều kiện nhiệm vụ và thao tác nhận hợp lệ.
- Bị chặn bởi:
  - US-1.2.2
  - US-1.3.1
- Ghi chú / Giả định (nếu có): Giả định thưởng nhiệm vụ tuân theo cùng quy tắc toàn vẹn điểm.

---

#### Phase 2: Mở rộng

##### Epic 2.1: Cải thiện liên tục phiên chơi và tìm phòng

**US-2.1.1: Tìm phòng với điều kiện tham gia rõ ràng**

- Mô tả: Là người chơi, tôi muốn duyệt các phòng khả dụng cùng điều kiện tham gia để chọn phòng phù hợp nhanh hơn.
- Tiêu chí nghiệm thu:
  - AC1: Người chơi xem được danh sách phòng cùng thông tin hiển thị và ngưỡng điểm tối thiểu.
  - AC2: Danh sách phòng cung cấp đủ ngữ cảnh để đánh giá khả năng tham gia trước khi thử vào phòng.
- Bị chặn bởi:
  - US-1.1.2
  - US-0.3.1
- Ghi chú / Giả định (nếu có): Giả định luật hiển thị phòng luôn nhất quán với cấu hình của chủ phòng.

**US-2.1.2: Luồng quay lại chơi liền mạch**

- Mô tả: Là người chơi quay lại, tôi muốn có luồng quay lại chơi mượt hơn để tiếp tục gameplay với ít thao tác hơn.
- Tiêu chí nghiệm thu:
  - AC1: Người chơi quay lại có thể vào lại luồng chơi với trạng thái phiên và phòng rõ ràng.
  - AC2: Nếu không còn ngữ cảnh phòng trước đó, người chơi nhận hướng dẫn rõ ràng cho bước tiếp theo.
- Bị chặn bởi:
  - US-2.1.1
  - US-1.2.2
- Ghi chú / Giả định (nếu có): Giả định ưu tiên tính rõ ràng của trải nghiệm hơn tự động hóa khó hiểu.

##### Epic 2.2: Mở rộng chiều sâu tiến trình

**US-2.2.1: Mẫu nhiệm vụ và phần thưởng mở rộng**

- Mô tả: Là người chơi, tôi muốn có thêm mẫu nhiệm vụ và phần thưởng để tiến trình hấp dẫn hơn sau vòng lặp MVP.
- Tiêu chí nghiệm thu:
  - AC1: Người chơi truy cập được tập nhiệm vụ hoặc phần thưởng mở rộng ngoài bộ MVP ban đầu.
  - AC2: Tiến trình mở rộng vẫn tuân thủ kinh tế chỉ dùng điểm và không nạp điểm.
- Bị chặn bởi:
  - US-1.3.2
- Ghi chú / Giả định (nếu có): Giả định phần mở rộng vẫn nằm trong phạm vi roadmap đã phê duyệt.

**US-2.2.2: Hiển thị lịch sử tiến trình và cơ hội thưởng kế tiếp**

- Mô tả: Là người chơi, tôi muốn xem lịch sử tiến trình và cơ hội thưởng sắp tới để chủ động lên kế hoạch phiên chơi.
- Tiêu chí nghiệm thu:
  - AC1: Người chơi xem được lịch sử tiến trình và phần thưởng gần đây trong một màn hình thống nhất.
  - AC2: Người chơi thấy được cơ hội thưởng tiếp theo dựa trên trạng thái tiến trình hiện tại.
- Bị chặn bởi:
  - US-2.2.1
  - US-0.2.1
- Ghi chú / Giả định (nếu có): Giả định lịch sử hiển thị dựa trên dữ liệu điểm và thưởng đáng tin cậy.

---

#### Phase 3: Hoàn thiện (Tuỳ chọn)

##### Epic 3.1: Chương trình nâng chất lượng vận hành live

**US-3.1.1: Chất lượng chơi live ổn định và cảm nhận công bằng**

- Mô tả: Là người chơi, tôi muốn luật chơi và kết quả quyết toán được thực thi nhất quán trong môi trường live để cảm thấy công bằng và đáng tin cậy.
- Tiêu chí nghiệm thu:
  - AC1: Phiên live duy trì thực thi nhất quán các luật vào phòng, đặt cược và quyết toán.
  - AC2: Người chơi nhận phản hồi rõ ràng khi thao tác thực thi ảnh hưởng tới phiên chơi.
- Bị chặn bởi:
  - US-2.1.2
  - US-2.2.2
- Ghi chú / Giả định (nếu có): Giả định cảm nhận công bằng đến từ cả kết quả lẫn cách truyền đạt trong sản phẩm.

**US-3.1.2: Quan sát chất lượng vận hành cho đội sản phẩm**

- Mô tả: Là product operator, tôi muốn có khả năng quan sát các tín hiệu chất lượng gameplay quan trọng để xử lý vấn đề trước khi ảnh hưởng rộng tới người chơi.
- Tiêu chí nghiệm thu:
  - AC1: Đội sản phẩm theo dõi được bộ tín hiệu chất lượng live đã định nghĩa gắn với độ tin cậy gameplay.
  - AC2: Đội sản phẩm nhận diện và ưu tiên được sự cố chất lượng ảnh hưởng đến niềm tin người chơi.
- Bị chặn bởi:
  - US-3.1.1
- Ghi chú / Giả định (nếu có): Giả định các tín hiệu chất lượng bám sát outcome người chơi.
