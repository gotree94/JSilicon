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
// mode=1, program counter + rom
// 프로그램 카운터 + 롬 ( CPU 모드 1 인 경우 )

`define default_netname none

(* keep_hierarchy *)
module PC (
    input wire clock,
    input wire reset,
    input wire ena,

    // 디버그 포트 - JSilicon.v (TOP)에서 사용하지 않도록 설정하여 제거
    // output wire [3:0] pc_out,
    output wire [7:0] instr_out

    );

    reg [3:0] pc;
    // 하드코딩 롬 지정
    // wire 선언시 오류 발생 > reg로 수정
    reg [7:0] rom [0:15];

    // 내장 롬 명령어 지시 (프로그램)
    // 명령구조 : [7:5] = opcode, [4:0]=operand 
    // ex, ADD 3  = [000](opcode) + [00011](operand)
    // todo - FSM 명령어 추가하기 (25.10.06)  

    // 루프 변수 추가
    integer i; 
    initial begin
        // ADD 3
        rom[0] = 8'b00000011;
        // SUB 2
        rom[1] = 8'b00100010;
        // MUL 5
        rom[2] = 8'b01000101;
        // NOP
        rom[3] = 8'b00000000;

        //  Sky130 합성에 맞춰서 조정
        for (i = 4; i < 16; i = i + 1)
            // 데이터를 쓰기 전에는 0으로 채워두기
            rom[i] = 8'b00000000;
    end

    always @(posedge clock or posedge reset) begin
        // 명시적 비트폭(합성 경고 해결)로 지정
        if (reset) pc <= 4'd0;
        else if (ena) begin
            // 롬 명령어 끝까지 도달하면 0으로 로드
            if (pc == 4'd3)
                pc <= 4'd0;
            else
                pc <= pc + 1;
        end
    end

    // 포트명 오류 수정
    assign instr_out = rom[pc];

    // 디버그 포트 - 합성 과정에서 pc_out 포트 제거로 인한 제거
    // assign pc_out = pc;

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
// PC (Program Counter + ROM) Testbench for Xcelsium (Verilog-1995)
// Tests program counter and ROM instruction fetch

`timescale 1ns/1ps

module tb_pc;

    // Inputs
    reg clock;
    reg reset;
    reg ena;

    // Outputs
    wire [7:0] instr_out;

    // Clock period (12 MHz = 83.33ns)
    parameter CLK_PERIOD = 83.33;

    // Instantiate the PC
    PC uut (
        .clock(clock),
        .reset(reset),
        .ena(ena),
        .instr_out(instr_out)
    );

    // Clock generation
    initial begin
        clock = 0;
        forever #(CLK_PERIOD/2) clock = ~clock;
    end

    // Test procedure
    initial begin
        // Initialize VCD dump
        $dumpfile("pc_wave.vcd");
        $dumpvars(0, tb_pc);

        // Display header
        $display("========================================");
        $display("PC (Program Counter + ROM) Testbench");
        $display("========================================");
        $display("Time\t PC\t Instruction\t Opcode\t Operand\t Description");
        $display("------------------------------------------------------------------------");

        // Initialize inputs
        reset = 1;
        ena = 0;
        #(CLK_PERIOD*5);

        // Release reset
        reset = 0;
        #(CLK_PERIOD*5);

        // Enable PC
        ena = 1;
        #(CLK_PERIOD*2);

        // Run through one complete cycle (4 instructions)
        repeat(4) begin
            #(CLK_PERIOD);
            $display("%0t\t %d\t 8'b%b\t %b\t %b\t\t %s", 
                     $time, 
                     uut.pc, 
                     instr_out, 
                     instr_out[7:5],
                     instr_out[3:0],
                     decode_instruction(instr_out));
        end

        // Run one more cycle to verify wrap-around
        $display("\n--- Testing PC wrap-around ---");
        repeat(4) begin
            #(CLK_PERIOD);
            $display("%0t\t %d\t 8'b%b\t %b\t %b\t\t %s", 
                     $time, 
                     uut.pc, 
                     instr_out, 
                     instr_out[7:5],
                     instr_out[3:0],
                     decode_instruction(instr_out));
        end

        // Test enable control
        $display("\n--- Testing Enable Control (ena=0) ---");
        ena = 0;
        #(CLK_PERIOD*5);
        $display("%0t\t %d\t 8'b%b\t %b\t %b\t\t ENA=0 (PC should not change)", 
                 $time, uut.pc, instr_out, instr_out[7:5], instr_out[3:0]);

        // Re-enable
        ena = 1;
        #(CLK_PERIOD);
        $display("%0t\t %d\t 8'b%b\t %b\t %b\t\t ENA=1 (PC resumed)", 
                 $time, uut.pc, instr_out, instr_out[7:5], instr_out[3:0]);

        // Test reset during operation
        $display("\n--- Testing Reset during operation ---");
        #(CLK_PERIOD*2);
        reset = 1;
        #(CLK_PERIOD*2);
        $display("%0t\t %d\t 8'b%b\t %b\t %b\t\t RESET (PC should go to 0)", 
                 $time, uut.pc, instr_out, instr_out[7:5], instr_out[3:0]);
        
        reset = 0;
        #(CLK_PERIOD*2);

        // End simulation
        $display("\n========================================");
        $display("PC Testbench Complete");
        $display("========================================");
        #(CLK_PERIOD*5);
        $finish;
    end

    // Function to decode instruction
    function [255:0] decode_instruction;
        input [7:0] instr;
        reg [2:0] opcode;
        reg [3:0] operand;
        begin
            opcode = instr[7:5];
            operand = instr[3:0];
            
            case(opcode)
                3'b000: decode_instruction = "ADD";
                3'b001: decode_instruction = "SUB";
                3'b010: decode_instruction = "MUL";
                3'b011: decode_instruction = "DIV";
                3'b100: decode_instruction = "MOD";
                3'b101: decode_instruction = "CMP";
                3'b110: decode_instruction = "GT";
                3'b111: decode_instruction = "LT";
                default: decode_instruction = "UNKNOWN";
            endcase
        end
    endfunction

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
