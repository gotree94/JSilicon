# FSM — 연산 제어 상태기계 (ALU + UART_TX 통합)

> Module: `FSM`  
> Timescale: `1ns/1ps`  
> Nettype: ``default_nettype none``  
> Design Type: **Moore-like FSM controlling ALU + UART_TX (TX-only, 8N1)**

---

## 📘 1) 개요 (Overview)

이 모듈은 간단한 **제어 FSM**으로, ALU의 연산 결과(16-bit 중 하위 8-bit)를 **UART_TX**로 송신하는 일련의 절차를 관리합니다.  
`ena`가 1일 때만 동작하며, UART 전송이 끝나면 다시 초기 상태로 복귀하여 다음 연산을 준비합니다.

데이터 경로 요약:

```
a[7:0], b[7:0], opcode[2:0] ──> [ ALU ] ──> alu_result[15:0] ──> [ UART_TX ] ──> uart_tx
                                     ^
                                  alu_ena
```

- **ALU**: `a`, `b`, `opcode` 입력 기반으로 16-bit 결과 생성
- **FSM**: UART에 start pulse를 제공하여 `alu_result[7:0]`를 직렬 송신
- **UART_TX**: 8N1 프레임으로 송신, `busy`로 진행 상태 보고

---

## 🧠 2) FSM 이론 요약 (Mealy vs Moore)

- **Moore FSM**: 출력이 **현재 상태**에만 의존 → 출력 신호의 글리치가 적고 안정적  
- **Mealy FSM**: 출력이 **현재 상태 + 입력**에 의존 → 반응이 한 사이클 빠를 수 있으나 글리치 주의  
- 본 설계는 `start_uart`를 상태에 따라 구동하는 **Moore-like** 형태로 이해할 수 있습니다.

FSM 일반 구조:

```
[State Reg] ──(posedge clk)──> [Next-State Logic] ──→ state_n
    │                                        │
    └─────────────[Output Decode] <──────────┘
```

---

## 🧩 3) 내부 구조 및 인터페이스

### 포트

| 이름 | 방향 | 폭 | 설명 |
|------|------|----|------|
| `clock` | In | 1 | 시스템 클럭 |
| `reset` | In | 1 | **비동기 High** 리셋 |
| `a`, `b` | In | 8 | ALU 피연산자 |
| `opcode` | In | 3 | ALU 연산 선택 |
| `ena` | In | 1 | FSM 동작 Enable (0이면 INIT로 유지) |
| `alu_ena` | In | 1 | ALU 연산 Enable (ALU 내부에서 사용) |
| `alu_result` | Out | 16 | ALU 결과 |
| `uart_tx` | Out | 1 | UART 직렬 송신선 |
| `uart_busy` | Out | 1 | UART 송신 중 표시 |

### 상태 정의

```verilog
localparam INIT = 2'd0;
localparam SEND = 2'd1;
localparam WAIT = 2'd2;
```

- **INIT**: 준비 상태. `start_uart`를 1로 만들어 전송 개시
- **SEND**: UART가 `busy=1`이 될 때까지 대기하면서 `start_uart`를 0으로 내림(펄스 유지 방지)
- **WAIT**: UART가 `busy=0`이 될 때까지 대기 → 완료 시 `INIT`로 복귀

### 제어 시그널

- `start_uart`: UART_TX에 **1사이클 이상의 펄스**를 제공하여 전송 개시  
  - 구현상 INIT에서 1로 세트 → `busy`가 1되면 즉시 0으로 클리어
- `uart_busy`: UART_TX 내부에서 전송 중 High로 유지
- `ena`: 0이면 **언제나 INIT + start_uart=0**으로 되돌림 (안전한 정지)

---

## 🔧 4) 코드 핵심 (요약)

```verilog
// ALU 접속
ALU alu_connect (
  .a(a), .b(b), .opcode(opcode),
  .ena(alu_ena), .result(alu_result)
);

// UART 접속 (하위 8비트 전송)
UART_TX uart_connect (
  .clock(clock), .reset(reset),
  .start(start_uart),
  .data_in(alu_result[7:0]),
  .tx(uart_tx), .busy(uart_busy)
);

always @(posedge clock or posedge reset) begin
  if (reset) begin
    state <= INIT;
    start_uart <= 1'b0;
  end else if (ena) begin
    case (state)
      INIT: begin
        start_uart <= 1'b1;  // 전송 개시
        state <= SEND;
      end
      SEND: begin
        if (uart_busy) begin // busy가 1이 되면 start를 종료
          start_uart <= 1'b0;
          state <= WAIT;
        end
      end
      WAIT: begin
        start_uart <= 1'b0;
        if (!uart_busy) state <= INIT; // 완료 후 재시작 가능
      end
      default: begin
        state <= INIT;
        start_uart <= 1'b0;
      end
    endcase
  end else begin
    state <= INIT;
    start_uart <= 1'b0;
  end
end
```

**핵심 포인트**
- `start_uart`는 **펄스 형태**로 만들어 **중복 트리거 방지**
- `ena=0`일 때 언제든 안전하게 초기화
- UART_TX는 예시로 12MHz/9600bps(`CLOCK_DIV=1250`) 설정을 사용할 수 있음

---

## ⏱ 5) 상태 전이 타이밍

```
INIT ── start_uart=1 ──> SEND ── (uart_busy=1) ──> WAIT ── (uart_busy=0) ──> INIT
             ^ 1비트 이상 유지                                            ^ 루프
```

- ALU 결과는 항상 계산되어 `alu_result`에 반영 (`alu_ena`가 1일 때)
- UART는 `alu_result[7:0]`를 8N1 프레임으로 송신

---

## 🧪 6) 제공된 Testbench 요약

테스트벤치 주요 특징:
- `CLK_PERIOD = 83.33ns` → **12 MHz** 클럭
- VCD 덤프(`fsm_wave.vcd`) 출력
- 덧셈/곱셈/뺄셈/나눗셈/비교 등 다양한 ALU 연산 시나리오
- `ena=0`/`alu_ena=0` 케이스, 동작 중 `reset`도 검증
- 각 테스트 사이클마다 `uart_busy` 상승/하강 대기 (`wait()`)

시뮬레이션 실행 예시 (Icarus Verilog):

```sh
iverilog -g2012 -o fsm_tb.out alu.v uart.v fsm.v
vvp fsm_tb.out
gtkwave fsm_wave.vcd &
```

ModelSim/Questa:

```sh
vlog alu.v uart.v fsm.v tb_fsm.v
vsim -c tb_fsm -do "run -all; quit"
```

> ⚠️ `UART_TX`의 분주기(`CLOCK_DIV=1250`)는 **12 MHz / 9600bps**에 해당합니다.  
> 테스트 클럭과 분주기 설정이 일치해야 정상적인 `uart_busy` 타이밍이 나옵니다.

---

## 🧰 7) 설계적 고찰 & 개선 포인트

1. **start 펄스 보장**: INIT에서 1로 세팅 후 `busy`가 1이 되는 즉시 0으로 내리는 방식 → **중복 트리거 방지**
2. **데이터 유효 기간**: `alu_result`는 전송 동안 안정적이어야 함 → 필요 시 송신 시작 시점에 래치(`data_latched <= alu_result[7:0]`)
3. **상태 복원력**: `ena=0`에서 INIT으로 되돌리는 정책은 안전하지만, **일시 정지/재개** 시 요구 동작을 명확히 정의 필요
4. **상위 바이트 전송**: 현 설계는 `alu_result[7:0]`만 송신. 16-bit 전송이 필요하면 **두 번의 프레임**으로 나눠 송신하거나, FSM 상태를 `SEND_LO → SEND_HI → WAIT`로 확장
5. **에러 처리**: UART 오버런, `busy` stuck 등 예외 처리 로직 추가 고려
6. **검증 Coverage**: 나눗셈 0 처리, 비교 연산의 경계값 등 코너 케이스 테스트 보강

---

## 📂 8) 권장 디렉토리 구조

```
├─ rtl/
│  ├─ alu.v
│  ├─ uart.v         // UART_TX
│  └─ fsm.v
├─ sim/
│  └─ tb_fsm.v
└─ docs/
   └─ README_FSM_FULL.md
```

---

**작성자:** MultiMix Tech (NAMWOO KIM)  
**버전:** 1.0 (ALU + UART_TX Controller)  
**업데이트:** 2025-11-12 22:49
