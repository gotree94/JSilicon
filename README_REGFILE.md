# REG — 내부 레지스터 파일 (2R 구조 기반)

> Module: `REG`  
> Timescale: `1ns/1ps`  
> Nettype: ``default_nettype none``  
> Design Type: **Dual 8-bit Register File (R0, R1)**

---

## 📘 1. Register File 개요
**Register File**은 CPU의 핵심 구성 요소로, 데이터 임시 저장 및 연산 중간값 유지에 사용됩니다.  
이 모듈은 단순한 **2-Register 구조 (R0, R1)** 로, **Opcode**에 따라 데이터를 저장하거나 이동하는 기능을 수행합니다.

```
[PC] → [ROM] → [Decoder] → [REG] → [ALU] → [FSM + UART]
```

> 즉, 이 모듈은 디코더와 ALU 사이의 **데이터 허브(Data Hub)** 역할을 합니다.

---

## 🧭 2. Register File 이론 및 배경

### 🧩 Register File의 발전
- 초기 CPU(예: Intel 4004)는 단일 누산기(accumulator) 구조만을 사용했습니다.
- RISC 아키텍처(Reduced Instruction Set Computer)의 등장 이후, **범용 레지스터(General Purpose Register)** 구조가 표준이 되었습니다.
- 현대 CPU에서는 16~64개 이상의 레지스터 뱅크를 두며, 동시 접근(2R1W) 구조를 사용합니다.

### ⚙️ 역할 요약
| 구성 요소 | 역할 |
|------------|------|
| **Decoder** | 명령어 해독 후 레지스터 선택 제어 |
| **Register File** | 연산 데이터 임시 저장 |
| **ALU** | 연산 수행 |
| **FSM(Control Unit)** | 명령 실행 순서 제어 |

> 본 설계에서는 단순한 2개 레지스터 구조이지만, FSM 및 ALU와 직접 연결되어 **마이크로 연산 레벨 제어**를 수행합니다.

---

## 🔧 3. 포트 설명

| 이름 | 방향 | 폭 | 설명 |
|------|------|----|------|
| `clock` | 입력 | 1 | 시스템 클럭 |
| `reset` | 입력 | 1 | 비동기 리셋 |
| `ena` | 입력 | 1 | Enable 신호 (1일 때만 동작) |
| `opcode` | 입력 | 3 | 동작 명령 코드 |
| `data_in` | 입력 | 8 | 저장할 데이터 |
| `R0_out` | 출력 | 8 | 레지스터 R0의 현재 값 |
| `R1_out` | 출력 | 8 | 레지스터 R1의 현재 값 |

---

## 🧮 4. Opcode 기반 동작 정의

| Opcode | 명령 | 설명 |
|--------|------|------|
| `000` | LOAD R0 | `R0 <= data_in` |
| `001` | LOAD R1 | `R1 <= data_in` |
| `010` | MOV R1,R0 | `R1 <= R0` |
| `011` | MOV R0,R1 | `R0 <= R1` |
| `100~111` | NOP | 동작 없음 (유지) |

> 본 구조에서는 OUT 명령(`data_out`)은 직접 사용하지 않고, **ALU나 FSM**이 `R0_out`, `R1_out` 신호를 참조합니다.

---

## 🧠 5. 설계 구조 및 동작 원리

### 전체 블록 개요

```
                +-----------------------+
   data_in ---> |                       | ---> R0_out
        +------>|       REG Module      |
        |       |  +-------+   +------+ |
        |       |  |  R0   |   |  R1  | |
        |       |  +---+---+   +---+--+ |
        |       |      ^         ^      |
        |       |      |         |      |
        |       |   Decoder(opcode)     |
        |       +-----------------------+
        |              |
        +--------------+ (ena)
```

- `reset`: 두 레지스터를 초기화 (`0x00`)  
- `ena=1`일 때만 opcode 수행  
- `opcode`에 따라 R0, R1 업데이트  
- 모든 레지스터는 클럭 상승 에지에서 갱신

---

## ⚙️ 6. Verilog 코드 요약

```verilog
(* keep_hierarchy *)
module REG (
    input wire clock, reset, ena,
    input wire [2:0] opcode,
    input wire [7:0] data_in,
    output wire [7:0] R0_out, R1_out
);
    reg [7:0] R0, R1;

    always @(posedge clock or posedge reset) begin
        if (reset) begin
            R0 <= 8'd0; R1 <= 8'd0;
        end else if (ena) begin
            case (opcode)
                3'b000: R0 <= data_in;   // LOAD R0
                3'b001: R1 <= data_in;   // LOAD R1
                3'b010: R1 <= R0;        // MOV R1,R0
                3'b011: R0 <= R1;        // MOV R0,R1
                default: ;               // NOP
            endcase
        end
    end

    assign R0_out = R0;
    assign R1_out = R1;
endmodule
```

---

## ⏱ 7. 동작 타이밍 예시

| Cycle | ena | opcode | data_in | R0 | R1 | 설명 |
|--------|------|--------|---------|----|----|------|
| 1 | 1 | 000 | 0x12 | 0x12 | 0x00 | R0 ← 0x12 |
| 2 | 1 | 001 | 0x34 | 0x12 | 0x34 | R1 ← 0x34 |
| 3 | 1 | 010 | — | 0x12 | 0x12 | R1 ← R0 |
| 4 | 1 | 011 | — | 0x12 | 0x12 | R0 ← R1 |
| 5 | 0 | — | — | 유지 | 유지 | 동작 정지 |

---

## 🧪 8. Testbench 예시

```verilog
`timescale 1ns/1ps
module tb_reg;
  reg clk=0, rst=0, ena=0;
  reg [2:0] opcode;
  reg [7:0] data_in;
  wire [7:0] R0_out, R1_out;

  REG uut(.clock(clk), .reset(rst), .ena(ena),
          .opcode(opcode), .data_in(data_in),
          .R0_out(R0_out), .R1_out(R1_out));

  always #5 clk = ~clk;

  initial begin
    rst=1; #10; rst=0;
    ena=1;

    opcode=3'b000; data_in=8'hAA; @(posedge clk);
    opcode=3'b001; data_in=8'h55; @(posedge clk);
    opcode=3'b010; @(posedge clk); // MOV R1,R0
    opcode=3'b011; @(posedge clk); // MOV R0,R1

    ena=0; repeat(2) @(posedge clk);
    $display("R0=%h R1=%h", R0_out, R1_out);
    $finish;
  end
endmodule
```

---

## 🧩 9. 설계적 고찰

1. **Reset 안정화**: 모든 레지스터는 초기화되어야 한다.  
2. **Enable 제어**: FSM에서 타이밍을 맞춰 `ena`를 gating하는 것이 중요.  
3. **Opcode 관리**: Decoder에서 전달받는 opcode는 ALU/Control Unit과 일관되어야 한다.  
4. **확장 가능성**: R0~R7 구조(3-bit addressable)로 확장 시 `case` → `regfile[addr]`로 전환.  
5. **Synthesis 최적화**: 두 개 레지스터만 존재하므로 LUT 자원 소모가 매우 작다.

---

## 📂 10. 프로젝트 구조 예시

```
├─ rtl/
│  └─ REG.v
├─ sim/
│  └─ tb_reg.v
└─ docs/
   └─ README_REG_FULL.md
```

---

**작성자:** MultiMix Tech (NAMWOO KIM)  
**버전:** 1.0 (2-Register 구조)  
**업데이트:** 2025-11-12 22:44
