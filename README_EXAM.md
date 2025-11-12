# PC — Program Counter + ROM (CPU mode)

> Module: `PC`  
> Role: **Instruction fetch** (4‑bit PC indexing an internal 16×8 ROM)  
> Nettype: ``default_nettype none``  
> Style: **TinyTapeout top**와 호환되는 단순 IF(Stage)

---

## 📘 1) 개요 (Overview)
`PC` 모듈은 4‑bit 프로그램 카운터를 사용해 **내장 ROM(16×8)** 에서 8‑bit 명령어를 읽어 `instr_out`으로 내보냅니다.  
`ena=1`인 사이클마다 PC가 1씩 증가하며, 지정된 **끝 주소(예: 3)**에 도달하면 **0으로 랩어라운드**합니다.

데이터 경로:
```
clk, reset, ena ──> [ PC (4b) ] ──> rom[pc] ──> instr_out[7:0]
```

---

## 🧠 2) 명령어 포맷(ISA fragment)
본 프로젝트의 공통 포맷을 따릅니다.
```
[7:5]=opcode, [4]=reg_sel, [3:0]=imm4
```
- 예) `ADD 3` ⇒ `8'b000_0_0011`  
- 현재 ROM 초기값 예시:
  - `rom[0] = 8'b00000011; // ADD 3`
  - `rom[1] = 8'b00100010; // SUB 2`
  - `rom[2] = 8'b01000101; // MUL 5`
  - `rom[3] = 8'b00000000; // NOP`
  - `rom[4..15] = 8'b00000000` (클리어)

---

## 🔌 3) 인터페이스

### 입력
| 이름 | 폭 | 설명 |
|------|---:|------|
| `clock` | 1 | 시스템 클럭 |
| `reset` | 1 | 비동기 High 리셋 |
| `ena` | 1 | Enable (1일 때 PC 진행) |

### 출력
| 이름 | 폭 | 설명 |
|------|---:|------|
| `instr_out` | 8 | ROM에서 페치한 명령 바이트 |

---

## 🔧 4) 코드 핵심

```verilog
reg [3:0] pc;
reg [7:0] rom [0:15];

initial begin
  rom[0] = 8'b00000011; // ADD 3
  rom[1] = 8'b00100010; // SUB 2
  rom[2] = 8'b01000101; // MUL 5
  rom[3] = 8'b00000000; // NOP
  integer i;
  for (i=4; i<16; i=i+1) rom[i] = 8'b00000000;
end

always @(posedge clock or posedge reset) begin
  if (reset) pc <= 4'd0;
  else if (ena) begin
    if (pc == 4'd3) pc <= 4'd0;  // 프로그램 끝 → 0으로 랩
    else pc <= pc + 1;
  end
end

assign instr_out = rom[pc];
```

특징
- **간결한 IF 스테이지**: 분기/점프 없이 선형 실행 패턴
- **명시적 폭 지정**: `pc`는 4‑bit로 제한, 합성 경고 방지
- **내장 ROM**: 초기블록(`initial`)로 기본 프로그램 탑재

---

## ⏱ 5) 타이밍/합성 메모
- ROM은 합성 시 **LUT ROM/분산 RAM** 또는 **register init**로 매핑됩니다. (FPGA/PDK에 따라 다름)
- `instr_out`은 **동기 1‑cycle 지연**처럼 사용하세요: `pc`가 증가한 **다음 클럭**에 해당 인스트럭션을 상위(DECODER)가 샘플링하도록 설계하면 안전합니다.
- 프로그램 길이를 바꿀 경우 `pc == 4'd3` 비교 상수를 **끝 주소로 수정**하세요.

---

## 🧪 6) 제공된 테스트벤치(`tb_pc`)

### 테스트 항목
- **리셋/랩어라운드**: `pc`가 0→1→2→3→0 순환하는지
- **ENA 제어**: `ena=0`일 때 `pc`가 정지하는지
- **동작 중 리셋**: 동작 중 `reset=1` 시 `pc=0`으로 복귀

### 실행 예시
Icarus Verilog
```sh
iverilog -g2012 -o pc_tb.out pc.v tb_pc.v
vvp pc_tb.out
gtkwave pc_wave.vcd &
```

ModelSim/Questa
```sh
vlog pc.v tb_pc.v
vsim -c tb_pc -do "run -all; quit"
```

> TB는 내부 `uut.pc` 접근을 통해 현재 PC 값을 인쇄합니다. 합성 대상에서는 이 포트를 노출하지 않는 게 일반적입니다.

---

## 🛠 7) 커스터마이즈 포인트
1. **프로그램 길이 변경**: `pc` 비교 상수(여기서는 `4'd3`)를 원하는 끝 주소로 변경
2. **분기/점프**: 분기 명령을 도입한다면, DECODER/CTRL에서 `pc_next`를 산출하여 `pc <= pc_next` 형태로 확장
3. **외부 ROM로 분리**: 대규모 프로그램은 별도 `IMEM` 모듈(초기화 파일 `.hex/.mem`)을 사용
4. **리셋 정책**: 동기 리셋으로 바꾸고 싶다면 `if (reset)` 분기를 동기식으로 이동
5. **TinyTapeout 제약**: 게이트/플롭 수를 줄이려면 프로그램을 더 짧게 하고 ROM 초기값을 최소화

---

## 📂 8) 디렉토리 구조(권장)
```
├─ rtl/
│  └─ pc.v
├─ sim/
│  └─ tb_pc.v
└─ docs/
   └─ README_PC_FULL.md
```

---

**작성자:** MultiMix Tech (NAMWOO KIM)  
**버전:** 1.0 (PC + Internal ROM)  
**업데이트:** 2025-11-12 23:09
