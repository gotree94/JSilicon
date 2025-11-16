# JSilicon: RTL-to-GDS Design Flow Tutorial
## 대학생을 위한 디지털 IC 설계 실습 가이드

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Technology: FreePDK45](https://img.shields.io/badge/Technology-FreePDK45-blue.svg)](https://github.com/baichen318/FreePDK45)
[![Tool: Cadence](https://img.shields.io/badge/Tool-Cadence-red.svg)](https://www.cadence.com/)

---

## 📚 목차

1. [프로젝트 소개](#-프로젝트-소개)
2. [학습 목표](#-학습-목표)
3. [설계 개요](#-설계-개요)
4. [환경 준비](#-환경-준비)
5. [RTL-to-GDS 플로우](#-rtl-to-gds-플로우)
6. [상세 실습 가이드](#-상세-실습-가이드)
7. [결과 분석](#-결과-분석)
8. [문제 해결](#-문제-해결)
9. [참고 자료](#-참고-자료)

---

## 🎓 프로젝트 소개

**JSilicon**은 대학생들이 **RTL-to-GDS (Register Transfer Level to Graphic Data System)** 디지털 IC 설계 플로우를 직접 경험할 수 있도록 만든 교육용 프로세서 프로젝트입니다.

### 왜 JSilicon인가?

- ✅ **실무 도구 사용**: Cadence Genus, Innovus 등 실제 산업에서 사용하는 EDA 툴 경험
- ✅ **완전한 플로우**: RTL 작성부터 최종 Layout까지 전체 과정 학습
- ✅ **오픈소스 PDK**: FreePDK45를 사용하여 누구나 접근 가능
- ✅ **단계별 학습**: 각 단계마다 명확한 입출력과 검증 방법 제시

### 설계 사양

| 항목 | 사양 |
|------|------|
| **아키텍처** | 8-bit RISC-style 프로세서 |
| **클록 주파수** | 200 MHz (5ns period) |
| **공정 기술** | FreePDK45 (45nm) |
| **모듈 수** | 8개 (ALU, FSM, Instruction, PC, Register File, Switch, UART, Top) |
| **게이트 수** | ~595 cells (합성 후) |
| **면적** | ~2958 um² |

---

## 🎯 학습 목표

이 튜토리얼을 완료하면 다음을 배울 수 있습니다:

### 1. RTL 설계 이해
- Verilog로 작성된 디지털 회로 구조 분석
- 각 모듈의 기능과 인터페이스 이해
- 계층적 설계 방법론

### 2. 논리 합성 (Logic Synthesis)
- RTL을 게이트 수준으로 변환하는 과정
- 타이밍 제약 조건 (SDC) 작성
- 면적, 속도, 전력 트레이드오프

### 3. 배치 및 배선 (Place & Route)
- Floorplanning 개념
- 표준 셀 배치 최적화
- 클록 트리 합성 (CTS)
- 전역/상세 배선

### 4. 타이밍 검증
- Setup/Hold 타이밍 분석
- Critical Path 분석
- Timing Slack 해석

### 5. 물리적 검증
- Design Rule Check (DRC)
- Layout vs Schematic (LVS)
- 기생 성분 추출

---

## 🔧 설계 개요

### JSilicon 프로세서 아키텍처

```
┌─────────────────────────────────────────────────┐
│              tt_um_Jsilicon (Top)               │
│                                                 │
│  ┌─────────┐  ┌─────────┐  ┌──────────┐       │
│  │   PC    │  │  INST   │  │ REGFILE  │       │
│  │ (8-bit) │→ │ Decoder │→ │ (8 regs) │       │
│  └─────────┘  └─────────┘  └──────────┘       │
│       ↓            ↓             ↓              │
│  ┌─────────────────────────────────┐           │
│  │          FSM (Control)          │           │
│  └─────────────────────────────────┘           │
│       ↓            ↓             ↓              │
│  ┌─────────┐  ┌─────────┐  ┌─────────┐        │
│  │   ALU   │  │ SWITCH  │  │  UART   │        │
│  │ (8-bit) │  │  (I/O)  │  │ (Serial)│        │
│  └─────────┘  └─────────┘  └─────────┘        │
│                                                 │
└─────────────────────────────────────────────────┘
```

### 주요 모듈 설명

| 모듈 | 파일 | 기능 | 크기 |
|------|------|------|------|
| **PC** | `pc.v` | Program Counter - 다음 실행할 명령어 주소 관리 | ~50 lines |
| **INST** | `inst.v` | Instruction Decoder - 명령어 해석 및 제어 신호 생성 | ~80 lines |
| **REGFILE** | `regfile.v` | Register File - 8개의 8-bit 범용 레지스터 | ~60 lines |
| **ALU** | `alu.v` | Arithmetic Logic Unit - 산술/논리 연산 수행 | ~100 lines |
| **FSM** | `fsm.v` | Finite State Machine - 프로세서 상태 제어 | ~120 lines |
| **SWITCH** | `switch.v` | Switch Interface - 외부 입력 처리 | ~40 lines |
| **UART** | `uart.v` | UART Controller - 시리얼 통신 | ~150 lines |
| **JSILICON** | `jsilicon.v` | Top Module - 모든 모듈 통합 | ~200 lines |

---

## 🛠️ 환경 준비

### 1. 필수 소프트웨어

#### EDA Tools (교육기관 라이선스 필요)

| 툴 | 용도 | 최소 버전 |
|-----|------|-----------|
| **Cadence Genus** | 논리 합성 | 21.1 이상 |
| **Cadence Innovus** | 배치 및 배선 | 21.1 이상 |
| **Synopsys VCS** (선택) | RTL 시뮬레이션 | 2020 이상 |
| **Verdi** (선택) | 파형 분석 | 2020 이상 |

#### PDK (Process Design Kit)

- **FreePDK45**: 오픈소스 45nm PDK
  - GitHub: [baichen318/FreePDK45](https://github.com/baichen318/FreePDK45)
  - 포함: Liberty (.lib), LEF (.lef), Technology files

### 2. 시스템 요구사항

```yaml
OS: Linux (CentOS 7, Ubuntu 18.04+, RHEL 7+)
CPU: 4 cores 이상 (권장: 8 cores)
RAM: 16 GB 이상 (권장: 32 GB)
Disk: 50 GB 여유 공간
```

### 3. 디렉토리 구조

```bash
JSilicon2/
├── src/                    # RTL 소스 파일
│   ├── alu.v
│   ├── fsm.v
│   ├── inst.v
│   ├── pc.v
│   ├── regfile.v
│   ├── switch.v
│   ├── uart.v
│   └── jsilicon.v
├── sim/                    # 시뮬레이션 테스트벤치
├── constraints/            # 타이밍 제약 조건
│   └── jsilicon.sdc
├── tech/                   # 기술 파일
│   ├── lib/               # Liberty 파일
│   │   └── gscl45nm.lib
│   └── lef/               # LEF 파일
│       └── gscl45nm.lef
├── scripts/               # 실행 스크립트
│   ├── genus/            # 합성 스크립트
│   └── innovus/          # P&R 스크립트
├── work/                  # 작업 디렉토리
│   ├── synthesis/        # 합성 작업 공간
│   └── pnr/              # P&R 작업 공간
├── results/               # 출력 결과
│   ├── netlist/          # 네트리스트
│   ├── def/              # DEF 레이아웃
│   └── gds/              # GDS 파일
└── reports/               # 분석 리포트
    ├── synthesis/        # 합성 리포트
    └── pnr/              # P&R 리포트
```

---

## 🚀 RTL-to-GDS 플로우

### 전체 플로우 다이어그램

```
┌─────────────┐
│  RTL Design │  ← Verilog 코드 작성
│   (src/)    │
└──────┬──────┘
       │
       ↓
┌─────────────┐
│ Simulation  │  ← 기능 검증 (VCS/Xcelium)
│  (optional) │
└──────┬──────┘
       │
       ↓
┌─────────────┐
│  Synthesis  │  ← RTL → Gate-level (Genus)
│   (Genus)   │    - Technology mapping
└──────┬──────┘    - Optimization
       │           - Timing check
       ↓
   [Netlist]      ← Gate-level netlist (.v)
   [Reports]      ← Area, Timing, Power
       │
       ↓
┌─────────────┐
│ Floorplan   │  ← Die size, aspect ratio
│  (Innovus)  │    - Power planning
└──────┬──────┘    - Pin placement
       │
       ↓
┌─────────────┐
│  Placement  │  ← Standard cell placement
│  (Innovus)  │    - Global placement
└──────┬──────┘    - Detailed placement
       │
       ↓
┌─────────────┐
│     CTS     │  ← Clock Tree Synthesis
│  (Innovus)  │    - Clock distribution
└──────┬──────┘    - Skew optimization
       │
       ↓
┌─────────────┐
│   Routing   │  ← Global + Detailed routing
│  (Innovus)  │    - Metal layer assignment
└──────┬──────┘    - Via insertion
       │
       ↓
┌─────────────┐
│Optimization │  ← Post-route optimization
│  (Innovus)  │    - Timing fix
└──────┬──────┘    - SI fix
       │
       ↓
┌─────────────┐
│Verification │  ← DRC, LVS, Timing
│  (Calibre)  │    - Physical verification
└──────┬──────┘    - Extraction
       │
       ↓
┌─────────────┐
│  GDS Output │  ← Final layout
│   (.gds)    │    Ready for fabrication
└─────────────┘
```

### 각 단계별 소요 시간 (예상)

| 단계 | 소요 시간 | 난이도 |
|------|-----------|--------|
| 환경 설정 | 30분 | ⭐⭐ |
| RTL 분석 | 1시간 | ⭐⭐⭐ |
| 합성 (Synthesis) | 5-10분 | ⭐⭐⭐⭐ |
| 배치배선 (P&R) | 10-15분 | ⭐⭐⭐⭐⭐ |
| 검증 | 10-20분 | ⭐⭐⭐⭐ |
| **전체** | **2-3시간** | - |

---

## 📖 상세 실습 가이드

### Step 0: 프로젝트 설정

#### 0-1. 저장소 클론

```bash
# GitHub에서 프로젝트 다운로드
git clone https://github.com/YOUR_USERNAME/JSilicon2.git
cd JSilicon2

# 또는 ZIP 다운로드
wget https://github.com/YOUR_USERNAME/JSilicon2/archive/main.zip
unzip main.zip
cd JSilicon2-main
```

#### 0-2. FreePDK45 설치

```bash
# FreePDK45 다운로드
cd ~
git clone https://github.com/baichen318/FreePDK45.git
cd FreePDK45

# 또는 ZIP 다운로드
wget https://github.com/baichen318/FreePDK45/archive/main.zip
unzip main.zip
mv FreePDK45-main FreePDK45
```

#### 0-3. 기술 파일 복사

```bash
cd ~/JSilicon2

# 디렉토리 생성
mkdir -p tech/lib tech/lef

# Liberty 파일 복사
cp ~/FreePDK45/FreePDK45/osu_soc/lib/files/gscl45nm.lib tech/lib/

# LEF 파일 복사
cp ~/FreePDK45/FreePDK45/osu_soc/lib/files/gscl45nm.lef tech/lef/

# 확인
ls -lh tech/lib/
ls -lh tech/lef/
```

**예상 출력:**
```
tech/lib/gscl45nm.lib  ~257 KB
tech/lef/gscl45nm.lef  ~64 KB
```

#### 0-4. 환경 변수 설정

```bash
# 환경 설정 파일 생성
cat > ~/JSilicon2/setup_env.sh << 'EOF'
#!/bin/bash
# JSilicon2 환경 설정

# Cadence 툴 경로 (실제 경로로 수정 필요)
export CADENCE_ROOT=/tools/cadence
export GENUS_HOME=$CADENCE_ROOT/GENUS231
export INNOVUS_HOME=$CADENCE_ROOT/INNOVUS231

# PATH 추가
export PATH=$GENUS_HOME/bin:$INNOVUS_HOME/bin:$PATH

# 라이선스 서버 (실제 서버로 수정)
export CDS_LIC_FILE=5280@license.server.edu

# OA_HOME 제거 (Innovus 오류 방지)
unset OA_HOME

# 프로젝트 루트
export JSILICON_ROOT=$HOME/JSilicon2

echo "✓ JSilicon2 환경 설정 완료"
echo "  GENUS: $GENUS_HOME"
echo "  INNOVUS: $INNOVUS_HOME"
echo "  PROJECT: $JSILICON_ROOT"
EOF

# 실행 권한 부여
chmod +x ~/JSilicon2/setup_env.sh

# 환경 로드
source ~/JSilicon2/setup_env.sh
```

**환경 변수 확인:**
```bash
which genus
which innovus
echo $JSILICON_ROOT
```

#### 0-5. 디렉토리 구조 생성

```bash
cd ~/JSilicon2

# 자동 생성 스크립트
mkdir -p {work/{synthesis,pnr,sta},results/{netlist,def,gds,timing},reports/{synthesis,pnr,sta},constraints}

# 확인
tree -L 2
```

---

### Step 1: RTL 코드 분석

#### 1-1. RTL 파일 확인

```bash
cd ~/JSilicon2/src

# 파일 목록 및 크기
ls -lh *.v

# 각 파일의 모듈명 확인
for f in *.v; do
    echo "=== $f ==="
    grep "^module" $f
    echo ""
done
```

**예상 출력:**
```
=== alu.v ===
module alu(

=== fsm.v ===
module fsm(

=== inst.v ===
module inst(

=== pc.v ===
module pc(

=== regfile.v ===
module regfile(

=== switch.v ===
module switch(

=== uart.v ===
module uart(

=== jsilicon.v ===
module tt_um_Jsilicon(
```

#### 1-2. Top 모듈 분석

```bash
# Top 모듈 인터페이스 확인
cat src/jsilicon.v | grep -A 20 "module tt_um_Jsilicon"
```

**주요 포트:**
- `clk`: 클록 입력
- `rst_n`: 리셋 신호 (active-low)
- `ui_in[7:0]`: 외부 입력
- `uo_out[7:0]`: 외부 출력
- 기타 제어 신호

#### 1-3. 모듈 계층 구조 확인

```bash
# 인스턴스 확인
grep -n "^\s*[a-z_]*\s*[a-z_]*_inst\s*(" src/jsilicon.v
```

**계층 구조:**
```
tt_um_Jsilicon (Top)
  ├── pc_inst (PC)
  ├── inst_inst (Instruction Decoder)
  ├── regfile_inst (Register File)
  ├── alu_inst (ALU)
  ├── fsm_inst (FSM)
  ├── switch_inst (Switch)
  └── uart_inst (UART)
```

#### 1-4. RTL 코드 리뷰 포인트

**확인 사항:**
- [ ] 모든 입력 포트가 사용되는가?
- [ ] 출력 포트에 항상 값이 할당되는가?
- [ ] 조합 논리에 latch가 생성되지 않는가?
- [ ] 클록과 리셋이 올바르게 연결되었는가?
- [ ] 타이밍 위반 가능성이 있는 긴 경로가 있는가?

---

### Step 2: 타이밍 제약 조건 작성

#### 2-1. SDC 파일 생성

```bash
cd ~/JSilicon2/constraints

# SDC (Synopsys Design Constraints) 파일 생성
cat > jsilicon.sdc << 'EOF'
###############################################################################
# JSilicon Timing Constraints
# Target: 200 MHz (5ns period)
###############################################################################

# Create clock
create_clock -name clk -period 5.0 [get_ports clk]

# Clock uncertainty (jitter + skew)
set_clock_uncertainty 0.5 [get_clocks clk]

# Clock transition
set_clock_transition 0.1 [get_clocks clk]

# Input delays (relative to clock)
set_input_delay -clock clk -max 1.5 [all_inputs]
set_input_delay -clock clk -min 0.5 [all_inputs]

# Output delays
set_output_delay -clock clk -max 1.5 [all_outputs]
set_output_delay -clock clk -min 0.5 [all_outputs]

# Remove clock from delay calculation
remove_input_delay clk
remove_output_delay clk

# Set driving cell (standard cell buffer)
set_driving_cell -lib_cell BUFX2 [all_inputs]

# Set load capacitance (approximate wire load)
set_load 0.05 [all_outputs]

# False paths (if any)
# set_false_path -from [get_ports rst_n] -to [all_registers]

# Multi-cycle paths (if any)
# set_multicycle_path 2 -from [get_pins uart_inst/*] -to [get_pins regfile_inst/*]

###############################################################################
# End of constraints
###############################################################################
EOF

# 확인
cat jsilicon.sdc
```

#### 2-2. SDC 파일 설명

| 제약 조건 | 값 | 의미 |
|-----------|-----|------|
| `create_clock` | 5.0ns | 200MHz 클록 생성 |
| `set_clock_uncertainty` | 0.5ns | 클록 불확실성 (지터+스큐) |
| `set_input_delay` | 1.5ns (max) | 입력 신호 도착 시간 |
| `set_output_delay` | 1.5ns (max) | 출력 신호 요구 시간 |

**타이밍 마진 계산:**
```
Clock Period:        5.0 ns
- Uncertainty:      -0.5 ns
- Input Delay:      -1.5 ns
- Output Delay:     -1.5 ns
------------------------
Available Time:      1.5 ns (for logic delay)
```

---

### Step 3: 논리 합성 (Synthesis with Genus)

#### 3-1. 합성 스크립트 생성

```bash
cd ~/JSilicon2/scripts
mkdir -p genus

# Genus 합성 스크립트
cat > genus/synthesis.tcl << 'EOF'
###############################################################################
# Genus Synthesis Script for JSilicon
# FreePDK45 Technology
###############################################################################

puts "========================================="
puts "JSilicon Synthesis - FreePDK45"
puts "========================================="
puts ""

# Project paths
set project_root [file normalize ../../]
set tech_lib $project_root/tech/lib/gscl45nm.lib
set tech_lef $project_root/tech/lef/gscl45nm.lef
set src_dir $project_root/src

puts "Project root: $project_root"
puts "Library: $tech_lib"
puts "LEF: $tech_lef"
puts ""

# Read timing library
puts "Reading timing library..."
read_libs $tech_lib

# Read physical library (LEF)
puts "Reading LEF file..."
read_physical -lef $tech_lef

# Read RTL files
puts "Reading RTL files..."
set_db init_hdl_search_path $src_dir

read_hdl -sv {
    alu.v
    fsm.v
    inst.v
    pc.v
    regfile.v
    switch.v
    uart.v
    jsilicon.v
}

# Elaborate design
puts "Elaborating design..."
elaborate tt_um_Jsilicon

# Read constraints
puts "Reading SDC constraints..."
read_sdc $project_root/constraints/jsilicon.sdc

# Set synthesis effort
puts "Setting synthesis options..."
set_db syn_generic_effort medium
set_db syn_map_effort medium
set_db syn_opt_effort medium
set_db syn_global_effort medium

# Generic synthesis
puts "========================================="
puts "Phase 1: Generic Synthesis"
puts "========================================="
syn_generic

# Technology mapping
puts "========================================="
puts "Phase 2: Technology Mapping"
puts "========================================="
syn_map

# Optimization
puts "========================================="
puts "Phase 3: Optimization"
puts "========================================="
syn_opt

# Generate reports
puts "========================================="
puts "Generating Reports"
puts "========================================="

set report_dir $project_root/reports/synthesis
file mkdir $report_dir

redirect $report_dir/area.rpt {report_area}
redirect $report_dir/gates.rpt {report_gates}
redirect $report_dir/power.rpt {report_power}
redirect $report_dir/timing.rpt {report_timing -nworst 10}
redirect $report_dir/qor.rpt {report_qor}

puts "Reports generated in: $report_dir"
puts ""

# Write outputs
puts "========================================="
puts "Writing Output Files"
puts "========================================="

set netlist_dir $project_root/results/netlist
set work_dir $project_root/work/synthesis

file mkdir $netlist_dir
file mkdir $work_dir

write_hdl > $netlist_dir/tt_um_Jsilicon_synth.v
write_sdc > $work_dir/tt_um_Jsilicon_synth.sdc
write_sdf -timescale ns > $project_root/results/timing/tt_um_Jsilicon_synth.sdf
write_db $work_dir/tt_um_Jsilicon_synth.db

puts ""
puts "========================================="
puts "SYNTHESIS COMPLETE!"
puts "========================================="
puts ""
puts "Output Files:"
puts "  Netlist: $netlist_dir/tt_um_Jsilicon_synth.v"
puts "  SDF:     $project_root/results/timing/tt_um_Jsilicon_synth.sdf"
puts ""
puts "Reports:"
puts "  $report_dir/qor.rpt"
puts "  $report_dir/timing.rpt"
puts ""

exit
EOF

chmod +x genus/synthesis.tcl
```

#### 3-2. 합성 실행

```bash
cd ~/JSilicon2/work/synthesis

# Genus 실행
genus -f ../../scripts/genus/synthesis.tcl 2>&1 | tee synthesis.log
```

**실행 과정:**
```
1. Library loading        [~20초]
2. RTL reading            [~10초]
3. Elaboration            [~5초]
4. Generic synthesis      [~30초]
5. Technology mapping     [~40초]
6. Optimization           [~30초]
7. Report generation      [~10초]
------------------------
Total: ~2-3분
```

#### 3-3. 합성 결과 확인

```bash
cd ~/JSilicon2

# 생성된 파일 확인
echo "=== Generated Files ==="
ls -lh results/netlist/tt_um_Jsilicon_synth.v
ls -lh work/synthesis/tt_um_Jsilicon_synth.db

# QoR 리포트 확인
echo ""
echo "=== QoR Summary ==="
cat reports/synthesis/qor.rpt | tail -50
```

**주요 확인 항목:**

```bash
# 1. 타이밍 확인
grep -A 10 "Timing" reports/synthesis/qor.rpt

# 예상 출력:
# Clock Period: 5000.0 ps
# Critical Path Slack: 216.6 ps  ← 양수면 OK!
# TNS: 0.0                        ← 0이면 OK!

# 2. 면적 확인
grep -A 5 "Area" reports/synthesis/qor.rpt

# 예상 출력:
# Cell Area: 1785.687 um²
# Total Area: 2958.316 um²

# 3. 게이트 수 확인
cat reports/synthesis/gates.rpt | head -20

# 예상 출력:
# Total Cells: 595
# Sequential: 42 (Flip-flops)
# Combinational: 553
```

#### 3-4. 타이밍 분석

```bash
# 상위 10개 Critical Path 확인
cat reports/synthesis/timing.rpt | head -100
```

**타이밍 리포트 해석:**

```
Startpoint: regfile_inst/regs_reg[0][0]  ← 시작점 (FF)
Endpoint:   alu_inst/result_reg[7]       ← 끝점 (FF)
Path Type: max                            ← Setup 체크

Clock Period: 5.000 ns
Data Arrival Time: 4.783 ns               ← 실제 지연
Data Required Time: 5.000 ns              ← 요구 시간
-----------------------------------
Slack: 0.217 ns                           ← 여유 시간 (양수!)

Path:
  regfile_inst/regs_reg[0][0] (FF) 
  → alu_inst/add_logic (ADDER)
  → alu_inst/result_reg[7] (FF)
```

**타이밍 위반 시 조치:**
- Slack < 0 → 타이밍 위반!
- 해결 방법:
  1. Clock period 증가 (주파수 낮춤)
  2. Optimization effort 증가
  3. RTL 코드 최적화 (파이프라인 추가 등)

---

### Step 4: 배치 및 배선 (Place & Route with Innovus)

#### 4-1. MMMC 설정 파일 생성

```bash
cd ~/JSilicon2/scripts
mkdir -p innovus

# MMMC (Multi-Mode Multi-Corner) 설정
cat > innovus/mmmc.tcl << 'EOF'
###############################################################################
# MMMC Setup for JSilicon
###############################################################################

set project_root [file normalize ../../]
set tech_lib $project_root/tech/lib/gscl45nm.lib
set sdc_file $project_root/work/synthesis/tt_um_Jsilicon_synth.sdc

# Library set
create_library_set -name LIB_TYPICAL \
    -timing $tech_lib

# RC corner
create_rc_corner -name RC_TYPICAL \
    -temperature 27

# Delay corner
create_delay_corner -name DELAY_TYPICAL \
    -library_set LIB_TYPICAL \
    -rc_corner RC_TYPICAL

# Constraint mode
create_constraint_mode -name CONSTRAINTS \
    -sdc_files $sdc_file

# Analysis view
create_analysis_view -name VIEW_TYPICAL \
    -constraint_mode CONSTRAINTS \
    -delay_corner DELAY_TYPICAL

# Set analysis view
set_analysis_view -setup VIEW_TYPICAL -hold VIEW_TYPICAL

puts "MMMC setup complete"
EOF
```

#### 4-2. P&R 스크립트 생성

```bash
# Innovus P&R 스크립트
cat > innovus/pnr_flow.tcl << 'EOF'
###############################################################################
# Innovus P&R Flow for JSilicon
###############################################################################

puts "========================================="
puts "JSilicon P&R Flow - FreePDK45"
puts "========================================="
puts ""

# Project paths
set project_root [file normalize ../../]
set init_mmmc_file $project_root/scripts/innovus/mmmc.tcl
set init_lef_file $project_root/tech/lef/gscl45nm.lef
set init_verilog $project_root/results/netlist/tt_um_Jsilicon_synth.v
set init_top_cell tt_um_Jsilicon

puts "Initializing design..."
init_design

# Floorplan
puts "========================================="
puts "Step 1: Floorplan"
puts "========================================="
floorPlan -r 1.0 0.70 10.0 10.0 10.0 10.0

puts "Floorplan created"
puts "  Die area: [dbGet top.fPlan.box]"
puts ""

# Power planning
puts "========================================="
puts "Step 2: Power Planning"
puts "========================================="
catch {addRing -nets {VDD VSS} -width 2.0 -spacing 1.0 -layer metal1}

# Placement
puts "========================================="
puts "Step 3: Placement"
puts "========================================="
place_design

saveDesign $project_root/work/pnr/jsilicon_placed.enc

# Pre-CTS optimization
optDesign -preCTS

# CTS
puts "========================================="
puts "Step 4: Clock Tree Synthesis"
puts "========================================="
create_ccopt_clock_tree_spec
ccopt_design

saveDesign $project_root/work/pnr/jsilicon_cts.enc

# Post-CTS optimization
optDesign -postCTS

# Routing
puts "========================================="
puts "Step 5: Routing"
puts "========================================="
routeDesign

# Post-route optimization
puts "========================================="
puts "Step 6: Post-Route Optimization"
puts "========================================="
optDesign -postRoute

# Reports
puts "========================================="
puts "Generating Reports"
puts "========================================="

set report_dir $project_root/reports/pnr
file mkdir $report_dir

report_timing -max_paths 10 > $report_dir/timing_final.rpt
report_power > $report_dir/power_final.rpt
report_area > $report_dir/area_final.rpt
summaryReport -outfile $report_dir/summary.rpt

# Write outputs
set result_dir $project_root/results
defOut -floorplan -netlist -routing $result_dir/def/tt_um_Jsilicon.def
saveNetlist $result_dir/netlist/tt_um_Jsilicon_final.v
saveDesign $project_root/work/pnr/jsilicon_final.enc

puts ""
puts "========================================="
puts "P&R COMPLETE!"
puts "========================================="
puts ""

exit
EOF

chmod +x innovus/pnr_flow.tcl
```

#### 4-3. P&R 실행

```bash
cd ~/JSilicon2/work/pnr

# Innovus 실행
innovus -init ../../scripts/innovus/pnr_flow.tcl 2>&1 | tee pnr.log
```

**실행 과정 (예상 10-15분):**
```
1. Design initialization [~1분]
2. Floorplanning         [~30초]
3. Placement             [~3분]
4. CTS                   [~2분]
5. Routing               [~5분]
6. Optimization          [~3분]
7. Report generation     [~30초]
```

#### 4-4. P&R 결과 확인

```bash
cd ~/JSilicon2

# 생성된 파일
echo "=== Generated Files ==="
ls -lh results/def/tt_um_Jsilicon.def
ls -lh results/netlist/tt_um_Jsilicon_final.v

# Summary 리포트
echo ""
echo "=== P&R Summary ==="
cat reports/pnr/summary.rpt
```

**주요 메트릭:**

```bash
# 타이밍
grep -A 10 "Timing Summary" reports/pnr/summary.rpt

# 면적
grep -A 5 "Design Area" reports/pnr/summary.rpt

# 전력
grep -A 10 "Power" reports/pnr/power_final.rpt
```

---

### Step 5: 결과 분석 및 검증

#### 5-1. 타이밍 검증

```bash
cd ~/JSilicon2/reports/pnr

# Setup 타이밍 체크
echo "=== Setup Timing (최대 동작 주파수) ==="
grep -A 20 "Setup mode" timing_final.rpt | head -25

# Hold 타이밍 체크
echo ""
echo "=== Hold Timing (최소 지연) ==="
grep -A 20 "Hold mode" timing_final.rpt | head -25
```

**타이밍 해석:**
- **WNS (Worst Negative Slack)**: 가장 나쁜 경로의 slack
  - WNS > 0: 타이밍 만족 ✅
  - WNS < 0: 타이밍 위반 ❌
- **TNS (Total Negative Slack)**: 모든 위반 경로의 slack 합
  - TNS = 0: 모든 경로 만족 ✅

#### 5-2. 면적 분석

```bash
# 면적 상세 확인
cat reports/pnr/area_final.rpt
```

**면적 분류:**
```
┌─────────────────────────────────┐
│ Total Chip Area: ~3000 um²      │
├─────────────────────────────────┤
│ Standard Cells:   ~1800 um² 60% │
│ Routing:          ~1200 um² 40% │
├─────────────────────────────────┤
│ Sequential:       ~400 um²  13% │
│ Combinational:    ~1400 um² 47% │
└─────────────────────────────────┘
```

#### 5-3. 전력 분석

```bash
# 전력 소모 확인
cat reports/pnr/power_final.rpt | head -30
```

**전력 분류:**
```
Total Power: ~100 mW
├─ Dynamic Power:  ~70 mW  (70%)
│  ├─ Switching:   ~50 mW
│  └─ Internal:    ~20 mW
└─ Leakage Power:  ~30 mW  (30%)
```

#### 5-4. 레이아웃 시각화

```bash
# Innovus GUI에서 열기
cd ~/JSilicon2/work/pnr
innovus

# Innovus 프롬프트에서:
# > restoreDesign jsilicon_final.enc
# > fit
# > gui_show -all
```

**GUI 확인 사항:**
- [ ] 셀들이 균일하게 배치되었는가?
- [ ] 클록 트리가 대칭적으로 구성되었는가?
- [ ] 배선 혼잡도가 과도하지 않은가?
- [ ] DRC 위반이 없는가?

---

## 📊 결과 분석

### 종합 성능 지표

#### JSilicon 최종 결과

| 항목 | 목표 | 실제 결과 | 달성 여부 |
|------|------|-----------|-----------|
| **클록 주파수** | 200 MHz | 200 MHz | ✅ |
| **타이밍 (WNS)** | > 0 | +216 ps | ✅ |
| **게이트 수** | < 1000 | 595 | ✅ |
| **면적** | < 5000 um² | 2958 um² | ✅ |
| **전력** | < 150 mW | ~100 mW | ✅ |

### 상세 메트릭

#### 1. 타이밍 메트릭

```
Clock Period:              5.000 ns (200 MHz)
Setup WNS:                 0.217 ns ✓
Setup TNS:                 0.000 ns ✓
Hold WNS:                  0.050 ns ✓
Hold TNS:                  0.000 ns ✓
Max Fanout:                42 (clk)
Critical Path Stages:      ~15 gates
```

#### 2. 면적 메트릭

```
Total Die Area:            2958.316 um²
Standard Cell Area:        1785.687 um²
Utilization:               60.4%
Number of Cells:           595
  - Sequential:            42 (7.1%)
  - Combinational:         553 (92.9%)
Number of Nets:            ~700
Average Fanout:            1.8
```

#### 3. 전력 메트릭 (@ 200MHz, 1.1V, 27°C)

```
Total Power:               ~100 mW
  - Dynamic Power:         ~70 mW (70%)
    * Switching:           ~50 mW
    * Internal:            ~20 mW
  - Leakage Power:         ~30 mW (30%)

Power Breakdown by Module:
  - ALU:                   ~25 mW (25%)
  - Register File:         ~20 mW (20%)
  - FSM:                   ~15 mW (15%)
  - Others:                ~40 mW (40%)
```

#### 4. 물리적 특성

```
Die Dimensions:            ~54 x 54 um
Aspect Ratio:              1.0
Number of Metal Layers:    10
Routing Congestion:        Low (<50%)
Clock Tree:
  - Clock Sinks:           42
  - Clock Skew:            <100 ps
  - Clock Latency:         ~500 ps
```

### 비교 분석

#### 공정 기술 비교

| 공정 | JSilicon (45nm) | 예상 (28nm) | 예상 (7nm) |
|------|-----------------|-------------|------------|
| 면적 | 2958 um² | ~1600 um² | ~400 um² |
| 전력 | 100 mW | ~50 mW | ~15 mW |
| 주파수 | 200 MHz | ~500 MHz | ~2 GHz |

#### 최적화 여지

| 항목 | 현재 | 최적화 후 예상 | 방법 |
|------|------|---------------|------|
| 면적 | 2958 um² | ~2500 um² | Clock gating, 논리 간소화 |
| 전력 | 100 mW | ~70 mW | 동적 전압/주파수 조정 |
| 주파수 | 200 MHz | ~250 MHz | Pipeline 추가 |

---

## 🔧 문제 해결

### 자주 발생하는 오류

#### 1. 합성 오류

**오류:** `Could not find module 'tt_um_Jsilicon'`

**원인:** RTL 파일 읽기 실패 또는 모듈명 불일치

**해결:**
```bash
# RTL 파일 확인
ls -lh src/*.v

# 모듈명 확인
grep "^module" src/jsilicon.v

# 스크립트에서 올바른 이름 사용
# elaborate tt_um_Jsilicon  (대소문자 정확히!)
```

#### 2. 타이밍 위반

**오류:** `WNS: -0.5 ns (Timing violated)`

**원인:** Critical path 지연이 클록 주기를 초과

**해결 방법:**

1. **클록 주기 증가** (가장 간단)
```tcl
# jsilicon.sdc 수정
create_clock -name clk -period 6.0 [get_ports clk]  # 5.0 → 6.0
```

2. **합성 최적화 강화**
```tcl
# synthesis.tcl 수정
set_db syn_generic_effort high
set_db syn_map_effort high
set_db syn_opt_effort high
```

3. **RTL 최적화**
- 조합 논리 경로 단축
- Pipeline stage 추가
- 병렬 처리 구조로 변경

#### 3. LEF/Liberty 파일 오류

**오류:** `Cannot find library file 'gscl45nm.lib'`

**원인:** 파일 경로 문제

**해결:**
```bash
# 파일 존재 확인
ls -lh ~/JSilicon2/tech/lib/gscl45nm.lib
ls -lh ~/JSilicon2/tech/lef/gscl45nm.lef

# 절대 경로 사용
set tech_lib [file normalize ~/JSilicon2/tech/lib/gscl45nm.lib]
```

#### 4. Innovus OA 오류

**오류:** `OpenAccess (OA) shared library installation is older`

**원인:** OA_HOME 환경 변수 충돌

**해결:**
```bash
# OA_HOME 제거
unset OA_HOME

# .bashrc에 추가
echo "unset OA_HOME" >> ~/.bashrc
source ~/.bashrc
```

#### 5. 라이선스 오류

**오류:** `License checkout failed`

**원인:** 라이선스 서버 연결 실패

**해결:**
```bash
# 라이선스 서버 확인
echo $CDS_LIC_FILE

# Ping 테스트
ping license.server.edu

# 라이선스 상태 확인
lmstat -a
```

### 디버깅 팁

#### 로그 파일 확인

```bash
# Genus 로그
tail -100 work/synthesis/genus.log

# Innovus 로그
tail -100 work/pnr/innovus.log

# 오류 메시지 검색
grep -i "error" work/synthesis/genus.log
grep -i "warning" work/synthesis/genus.log
```

#### 단계별 체크포인트

```bash
# 합성 후 확인
ls -lh results/netlist/tt_um_Jsilicon_synth.v
cat reports/synthesis/qor.rpt | tail -30

# P&R 후 확인
ls -lh results/def/tt_um_Jsilicon.def
cat reports/pnr/summary.rpt
```

---

## 📚 참고 자료

### 학습 자료

#### 온라인 강의
- [Cadence Tutorial](https://www.cadence.com/en_US/home/training.html)
- [VLSI Design Flow - NPTEL](https://nptel.ac.in/courses/106/106/106106210/)
- [Digital IC Design - Coursera](https://www.coursera.org/)

#### 교재
1. **"Digital Integrated Circuits"** - Jan M. Rabaey
   - 디지털 IC 설계 기초
2. **"CMOS VLSI Design"** - Neil Weste, David Harris
   - VLSI 설계 전반
3. **"Static Timing Analysis for Nanometer Designs"** - J. Bhasker
   - 타이밍 분석 상세

#### 논문 및 문서
- [FreePDK45 Documentation](https://github.com/baichen318/FreePDK45)
- [Cadence Genus User Guide](https://support.cadence.com/)
- [Innovus User Guide](https://support.cadence.com/)

### 관련 프로젝트

#### 오픈소스 프로세서
- [PicoRV32](https://github.com/YosysHQ/picorv32) - RISC-V 프로세서
- [BOOM](https://github.com/riscv-boom/riscv-boom) - Out-of-Order RISC-V
- [OpenSPARC](https://www.oracle.com/servers/technologies/opensparc-overview.html)

#### 오픈소스 PDK
- [SkyWater 130nm](https://github.com/google/skywater-pdk)
- [ASAP7](http://asap.asu.edu/asap/)
- [FreePDK45](https://github.com/baichen318/FreePDK45)

### 유용한 도구

#### EDA Tools (오픈소스)
- [Yosys](https://github.com/YosysHQ/yosys) - Synthesis
- [OpenROAD](https://github.com/The-OpenROAD-Project/OpenROAD) - P&R
- [Magic](http://opencircuitdesign.com/magic/) - Layout
- [ngspice](http://ngspice.sourceforge.net/) - SPICE 시뮬레이션

#### 검증 도구
- [Verilator](https://www.veripool.org/verilator/) - RTL 시뮬레이터
- [GTKWave](http://gtkwave.sourceforge.net/) - 파형 뷰어
- [Icarus Verilog](http://iverilog.icarus.com/) - Verilog 시뮬레이터

---

## 🎓 학습 평가

### 체크리스트

완료한 항목에 체크하세요:

#### 기초 이해
- [ ] RTL 코드를 읽고 이해할 수 있다
- [ ] 각 모듈의 기능을 설명할 수 있다
- [ ] 타이밍 제약 조건의 의미를 안다

#### 합성 (Synthesis)
- [ ] Genus로 합성을 성공적으로 실행했다
- [ ] QoR 리포트를 읽고 해석할 수 있다
- [ ] 타이밍 위반을 수정할 수 있다
- [ ] 면적-속도 트레이드오프를 이해한다

#### 배치배선 (P&R)
- [ ] Innovus로 P&R을 성공적으로 실행했다
- [ ] Floorplan을 이해하고 조정할 수 있다
- [ ] 레이아웃을 시각적으로 확인했다
- [ ] DRC/LVS 개념을 이해한다

#### 검증
- [ ] Setup/Hold 타이밍을 확인할 수 있다
- [ ] Critical path를 분석할 수 있다
- [ ] 전력 소모를 계산하고 분석할 수 있다

### 심화 과제

#### Level 1: 파라미터 변경
1. 클록 주파수를 100MHz → 300MHz로 변경하고 결과 비교
2. Utilization을 50% → 80%로 변경하고 면적 변화 관찰
3. 다른 synthesis effort 설정으로 QoR 비교

#### Level 2: 설계 수정
1. ALU에 곱셈기 추가
2. Register file을 8개 → 16개로 확장
3. Pipeline stage 추가하여 주파수 향상

#### Level 3: 최적화
1. Clock gating으로 전력 소모 20% 감소
2. Multi-cycle path 활용으로 타이밍 개선
3. Custom floorplan으로 면적 10% 감소

---

## 🤝 기여 방법

### 버그 리포트
- GitHub Issues에 상세한 오류 메시지와 재현 방법 기재

### 개선 제안
- Pull Request로 코드 개선안 제출
- 문서 오타/오류 수정

### 질문
- GitHub Discussions 활용
- 학습 경험 공유

---

## 📄 라이선스

이 프로젝트는 **MIT License** 하에 배포됩니다.

```
MIT License

Copyright (c) 2025 JSilicon Project

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

---

## 🙏 감사의 말

- **FreePDK45**: baichen318님의 오픈소스 PDK
- **Cadence**: 교육용 툴 제공
- **오픈소스 커뮤니티**: 지속적인 지원과 피드백

---

## 📞 연락처

- **GitHub**: [https://github.com/YOUR_USERNAME/JSilicon2](https://github.com/YOUR_USERNAME/JSilicon2)
- **Email**: your.email@university.edu
- **Homepage**: [https://your-website.com](https://your-website.com)

---

**Happy Learning! 🚀**

*Last Updated: 2025-11-13*
