# PC — Program Counter (프로그램 카운터)

> Module: `PC`  
> Timescale: `1ns/1ps`  
> Nettype: ``default_nettype none``  
> Design Type: **Synchronous Up-Counter with Branch/Jump**

---

## 📘 1. Program Counter 개요

Program Counter(PC)는 CPU에서 **현재 실행 중인 명령어의 주소를 저장**하는 레지스터입니다.  
각 명령어 실행이 끝날 때마다 PC는 자동으로 증가하며, **분기(Branch)**나 **점프(Jump)** 명령이 발생하면 새로운 주소로 변경됩니다.

```
[PC] → [Instruction Memory] → [Decoder] → [ALU] → [FSM]
```

> CPU의 모든 실행 흐름은 PC 값으로 결정됩니다.  
> PC는 “어떤 명령을 다음에 실행할지”를 알려주는 **CPU의 나침반 역할**을 합니다.

---

## 🧩 2. 이론 및 동작 원리

### ⚙️ 기본 동작
1. **순차 실행(Sequential Execution)**  
   - 기본적으로 PC는 매 클럭마다 +1씩 증가합니다.  
   - 예: PC = 0x0000 → 0x0001 → 0x0002 …

2. **분기(Branch)**  
   - 조건이 참일 경우 `PC = PC + offset` 형태로 이동.  
   - 조건이 거짓일 경우 기존 순차 증가 유지.

3. **점프(Jump)**  
   - 즉시값 또는 절대 주소로 이동 (`PC = target_addr`).

4. **리셋(Reset)**  
   - 초기 PC를 0 또는 지정된 시작 주소(`RESET_ADDR`)로 복귀.

---

## 🧠 3. 구조적 이해

```
                  +-----------------------+
        +-------->|    Program Counter    |--------+
        |         +----------+------------+        |
        |                    |                     |
        |                    v                     v
     [RESET]         +---------------+      +-------------+
                     | Branch Logic  | ---> | Instruction |
                     | (Adder/MUX)   |      |   Memory    |
                     +---------------+      +-------------+
```

### 내부 동작 요약
| 우선순위 | 신호 | 동작 |
|-----------|-------|------|
| 1 | `!rst_n` | Reset: PC ← RESET_ADDR |
| 2 | `pc_load` | Jump: PC ← pc_next |
| 3 | `branch_taken` | Branch: PC ← PC + pc_offset |
| 4 | Default | Sequential: PC ← PC + STEP |

---

## 🔧 4. 코드 구조 예시

```verilog
module PC #(
    parameter PC_W = 16,          // 주소 폭
    parameter STEP = 1,           // 증가 단위
    parameter RESET_ADDR = 0      // 초기화 주소
)(
    input  wire clk,
    input  wire rst_n,
    input  wire pc_load,
    input  wire [PC_W-1:0] pc_next,
    input  wire branch_taken,
    input  wire [PC_W-1:0] pc_offset,
    output reg  [PC_W-1:0] pc_curr
);

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            pc_curr <= RESET_ADDR;
        else if (pc_load)
            pc_curr <= pc_next;
        else if (branch_taken)
            pc_curr <= pc_curr + pc_offset;
        else
            pc_curr <= pc_curr + STEP;
    end

endmodule
```

---

## ⏱ 5. 동작 타이밍 예시

| Cycle | rst_n | pc_load | branch_taken | pc_next | pc_offset | pc_curr 결과 |
|--------|--------|----------|---------------|----------|------------|----------------|
| 1 | 0 | 0 | 0 | — | — | 0x0000 (Reset) |
| 2 | 1 | 0 | 0 | — | — | 0x0001 |
| 3 | 1 | 1 | 0 | 0x0100 | — | 0x0100 (Jump) |
| 4 | 1 | 0 | 1 | — | +2 | 0x0102 (Branch) |
| 5 | 1 | 0 | 1 | — | -1 | 0x0101 (Back Branch) |

> Branch는 signed offset을 사용하므로 음수 이동도 가능합니다.

---

## 🧪 6. Testbench 예시

```verilog
`timescale 1ns/1ps
module tb_pc;
  reg clk=0, rst_n=0, pc_load=0, branch_taken=0;
  reg [15:0] pc_next=0, pc_offset=0;
  wire [15:0] pc_curr;

  PC #(.PC_W(16), .STEP(1), .RESET_ADDR(16'h0000)) uut (
    .clk(clk), .rst_n(rst_n),
    .pc_load(pc_load), .pc_next(pc_next),
    .branch_taken(branch_taken), .pc_offset(pc_offset),
    .pc_curr(pc_curr)
  );

  always #5 clk = ~clk;

  initial begin
    $display("=== PC TEST START ===");
    rst_n=0; #10; rst_n=1;
    repeat(3) @(posedge clk);
    pc_load=1; pc_next=16'h0100; @(posedge clk); pc_load=0;
    branch_taken=1; pc_offset=16'd2; @(posedge clk);
    branch_taken=1; pc_offset=-16'sd1; @(posedge clk); branch_taken=0;
    #10 $finish;
  end
endmodule
```

---

## 🧰 7. 설계적 고려사항

1. **우선순위 중요도**: Reset > Jump > Branch > Increment 순으로 정의해야 함.  
2. **Signed Offset 처리**: Branch 이동 시 2’s complement로 계산.  
3. **Pipeline 구조 확장**: IF/ID 단계 분리 시, PC 업데이트는 Fetch Stage에서 수행.  
4. **동기식 설계**: 모든 갱신은 `posedge clk`에서 일어나야 함.  
5. **Fetch Stall 처리**: Memory latency가 존재할 경우 PC Hold 로직 추가 필요.

---

## ⚙️ 8. 확장 구조

| 기능 | 설명 |
|------|------|
| **Interrupt/Exception 지원** | Interrupt 발생 시 PC ← ISR 주소 |
| **PC+4 구조** | Word 단위 명령 (32bit) CPU에서 +4 증가 |
| **Pipeline 지원** | Branch Prediction, Delay Slot 포함 가능 |
| **Dual PC** | Shadow PC, Return Address Stack 등 확장 |

---

## 📂 9. 프로젝트 구조 예시

```
├─ rtl/
│  └─ PC.v
├─ sim/
│  └─ tb_pc.v
└─ docs/
   └─ README_PC_FULL.md
```

---

**작성자:** MultiMix Tech (NAMWOO KIM)  
**버전:** 1.0 (PC with Branch/Jump)  
**업데이트:** 2025-11-12 22:46
