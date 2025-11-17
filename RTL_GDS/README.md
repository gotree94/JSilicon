# JSilicon: RTL-to-GDS Design Flow Tutorial

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

**JSilicon**은 **RTL-to-GDS (Register Transfer Level to Graphic Data System)** 디지털 IC 설계 플로우를 직접 경험할 수 있도록 만든 교육용 프로세서 프로젝트입니다.

### 왜 JSilicon인가?

- ✅ **실무 도구 사용**: Cadence Genus, Innovus 등 실제 산업에서 사용하는 EDA 툴 경험
- ✅ **완전한 플로우**: RTL 작성부터 최종 Layout까지 전체 과정 학습
- ✅ **오픈소스 PDK**: FreePDK45를 사용하여 누구나 접근 가능
- ✅ **단계별 학습**: 각 단계마다 명확한 입출력과 검증 방법 제시

### 설계 사양

| 항목 | 사양 |
|------|------|
| **아키텍처** | 8-bit RISC-style 프로세서 |
| **클록 주파수** | 12 MHz (검토결과 200MHz - 5ns period) |
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

```
vi ~/.cshrc

setenv PATH /tools/cadence/XCELIUMMAIN2409/tools/bin:${PATH}
setenv PATH /home/student001/miniconda3/bin:${PATH}
setenv PATH /tools/cadence/DDI231/GENUS231/bin:${PATH}
setenv PATH /tools/cadence/DDI231/INNOVUS231/bin:${PATH}
```

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
tech/lef/gscl45nm.lef  (예상 크기 : ~64 KB)
tech/lib/gscl45nm.lib  (예상 크기 : ~257 KB)
```

* LEF (.lef)      ← 물리적 정보 (레이아웃)
* Liberty (.lib)  ← 타이밍, 전력 (논리적)

* 두 파일의 관계

| 항목 | LEF | LIB |
|:----:|:----:|:----:| 
| 용도 | Physical Design | Logic Synthesis & STA|
| 정보 | 셀 크기, 핀 위치, 금속층 | 타이밍, 전력, 논리 기능|
| 툴| Innovus, ICC2 | Genus, DC, PrimeTime| 

* 워크플로우:
  * Synthesis: LIB로 논리 최적화 → netlist 생성
  * P&R: LEF로 물리 배치/배선
  * STA: LIB로 타이밍 검증

#### * gscl45nm.lef (Library Exchange Format)
* LEF 파일은 물리적 레이아웃 정보를 담고 있습니다. Place & Route 툴에서 사용됩니다.
* 📌 Metal Layer 예시 (metal1)
```lef
  LAYER metal1
  TYPE ROUTING ;
  DIRECTION HORIZONTAL ;
  PITCH 0.19 ;
  WIDTH 0.065 ;
  SPACING 0.065 ;
  RESISTANCE RPERSQ 0.38 ;
END metal1
```

* 설명:
  * TYPE ROUTING: 배선용 레이어
  * DIRECTION HORIZONTAL: metal1은 수평 방향 우선 배선
  * PITCH 0.19 µm: 인접 트랙 간격
  * WIDTH 0.065 µm: 최소 배선 폭
  * SPACING 0.065 µm: 최소 배선 간격 (DRC 규칙)
  * RESISTANCE 0.38 Ω/□: Sheet resistance (IR drop 계산용)

* 📌 Standard Cell 예시 (AND2X1)
```lef
MACRO AND2X1
  CLASS CORE ;
  SIZE 1.14 BY 2.47 ;
  SYMMETRY X Y ;
  PIN A
    DIRECTION INPUT ;
    PORT
      LAYER metal1 ;
        RECT 0.1475 1.2275 0.2825 1.3625 ;
    END
  END A
  PIN Y
    DIRECTION OUTPUT ;
    ...
END AND2X1
```

* 설명:
   * SIZE 1.14 × 2.47 µm: 셀의 물리적 크기
   * SYMMETRY X Y: 좌우/상하 대칭 가능 (placement 최적화)
   * PIN A RECT: 입력 핀 A의 metal1 상의 좌표 (µm)
   * Place & Route 시 이 좌표로 net을 연결합니다

#### * gscl45nm.lib (Liberty Format)
* LIB 파일은 타이밍, 전력, 기능 정보를 담고 있습니다. Synthesis와 STA에서 사용됩니다.
* 📌 라이브러리 공통 정보
```lib
  ertylibrary(gscl45nm) {
  time_unit : "1ns";
  voltage_unit : "1V";
  nom_voltage : 1.1;
  nom_temperature : 27;
  
  operating_conditions ( typical ) {
     process : 1;
     voltage : 1.1;
     temperature : 27;
  }
```

* 설명:
  * nominal voltage 1.1V, 27°C 조건
  * typical corner (TT) 기준 characterization

* 📌 Cell 타이밍 예시 (AND2X1)
```lib
  ertycell (AND2X1) {
  area : 2.346500;
  cell_leakage_power : 15.6059;
  
  pin(A) {
    direction : input;
    capacitance : 0.00229149;  /* pF */
  }
  
  pin(Y) {
    direction : output;
    max_capacitance : 0.137429;
    function : "(A B)";
    
    timing() {
      related_pin : "A";
      cell_rise(delay_template_6x6) {
        index_1 ("0.1, 0.5, 1.2, 3, 4, 5");      /* input slew */
        index_2 ("0.06, 0.24, 0.48, 0.9, 1.2, 1.8"); /* load cap */
        values (
          "0.335, 0.333, 0.278, ...",  /* ns */
          ...
        );
      }
    }
  }
}
```

* 설명:
  * area: 셀 면적 (µm²)
  * leakage_power: 정적 소비 전력 (nW)
  * capacitance: 입력 핀 부하 (pF) - fanout 계산에 사용
  * function: Boolean 논리식 Y = A & B
  * cell_rise: 6×6 lookup table
      * index_1: 입력 slew (ns)
      * index_2: 출하 부하 (pF)
      * values: 전파 지연 시간 (ns)
      * 예: input slew 0.1ns, load 0.06pF → delay 0.335ns

#### 0-4. 환경 변수 설정

```csh
[student001@gjchamber ~/JSilicon2]$ vi ~/JSilicon2/setup_env.sh
```

```csh
#!/bin/csh
###############################################################################
# JSilicon2 환경 설정 파일 (C Shell / tcsh 용)
# Cadence Tools Environment Setup for C Shell
###############################################################################

#==============================================================================
# 1. Cadence 툴 경로 설정
#==============================================================================
# ⚠️ 중요: 실제 환경에 맞게 아래 경로를 수정하세요!

setenv CADENCE_ROOT /tools/cadence/DDI231

#==============================================================================
# 2. Genus (논리 합성 툴)
#==============================================================================
setenv GENUS_HOME ${CADENCE_ROOT}/GENUS231

# 다른 버전 예시:
# setenv GENUS_HOME ${CADENCE_ROOT}/GENUS221
# setenv GENUS_HOME ${CADENCE_ROOT}/GENUS201

#==============================================================================
# 3. Innovus (P&R 툴)
#==============================================================================
setenv INNOVUS_HOME ${CADENCE_ROOT}/INNOVUS231

# 다른 버전 예시:
# setenv INNOVUS_HOME ${CADENCE_ROOT}/INNOVUS221
# setenv INNOVUS_HOME ${CADENCE_ROOT}/INNOVUS201

#==============================================================================
# 4. PATH 환경 변수 추가
#==============================================================================
setenv PATH ${GENUS_HOME}/bin:${INNOVUS_HOME}/bin:${PATH}

#==============================================================================
# 5. 라이선스 서버 설정
#==============================================================================
# ⚠️ 중요: 실제 라이선스 서버 정보로 수정하세요!

setenv CDS_LIC_FILE 5280@license.gjchamber.ac.kr

# 여러 라이선스 서버:
# setenv CDS_LIC_FILE 5280@server1.edu:5280@server2.edu

#==============================================================================
# 6. OA_HOME 제거
#==============================================================================
unsetenv OA_HOME

#==============================================================================
# 7. 프로젝트 루트
#==============================================================================
setenv JSILICON_ROOT ${HOME}/JSilicon2

#==============================================================================
# 8. 확인 메시지
#==============================================================================
echo ""
echo "=========================================="
echo " JSilicon2 환경 설정 완료 (C Shell)"
echo "=========================================="
echo "  CADENCE_ROOT: ${CADENCE_ROOT}"
echo "  GENUS:        ${GENUS_HOME}"
echo "  INNOVUS:      ${INNOVUS_HOME}"
echo "  PROJECT:      ${JSILICON_ROOT}"
echo "  LICENSE:      ${CDS_LIC_FILE}"
echo "=========================================="
echo ""

#==============================================================================
# 9. 툴 존재 확인
#==============================================================================
if ( -d ${GENUS_HOME} ) then
    echo "✓ Genus found at ${GENUS_HOME}"
    if ( -x ${GENUS_HOME}/bin/genus ) then
        echo "  ✓ genus executable found"
    else
        echo "  ⚠ genus executable not found"
    endif
else
    echo "✗ Genus NOT found at ${GENUS_HOME}"
    echo "  → 경로를 확인하고 수정하세요!"
endif

if ( -d ${INNOVUS_HOME} ) then
    echo "✓ Innovus found at ${INNOVUS_HOME}"
    if ( -x ${INNOVUS_HOME}/bin/innovus ) then
        echo "  ✓ innovus executable found"
    else
        echo "  ⚠ innovus executable not found"
    endif
else
    echo "✗ Innovus NOT found at ${INNOVUS_HOME}"
    echo "  → 경로를 확인하고 수정하세요!"
endif

echo ""
echo "사용 방법:"
echo "  1. 환경 로드:  source ~/JSilicon2/setup_env.csh"
echo "  2. Genus 실행: genus"
echo "  3. Innovus 실행: innovus"
echo ""

###############################################################################
# End of setup_env.csh
###############################################################################
```

**환경 변수 확인:**
```csh
[student001@gjchamber ~/JSilicon2]$ chmod +x ~/JSilicon2/setup_env.sh
[student001@gjchamber ~/JSilicon2]$ ~/JSilicon2/setup_env.sh

==========================================
 JSilicon2 환경 설정 완료 (C Shell)
==========================================
  CADENCE_ROOT: /tools/cadence/DDI231
  GENUS:        /tools/cadence/DDI231/GENUS231
  INNOVUS:      /tools/cadence/DDI231/INNOVUS231
  PROJECT:      /home/student001/JSilicon2
  LICENSE:      5280@license.gjchamber.ac.kr
==========================================

✓ Genus found at /tools/cadence/DDI231/GENUS231
  ✓ genus executable found
✓ Innovus found at /tools/cadence/DDI231/INNOVUS231
  ✓ innovus executable found

사용 방법:
  1. 환경 로드:  source ~/JSilicon2/setup_env.csh
  2. Genus 실행: genus
  3. Innovus 실행: innovus
```

#### 0-5. 디렉토리 구조 생성

```csh
cd ~/JSilicon2

# 자동 생성 스크립트
mkdir -p {work/{synthesis,pnr,sta},results/{netlist,def,gds,timing},reports/{synthesis,pnr,sta},constraints}
```


```
# 확인용 프로그램 만들기 : Centos tree 설치를 못해서(Admin 계정 필요)
vi tree.sh
```

```
#!/bin/bash

# tree 명령어와 유사한 기능을 하는 스크립트
# 사용법: ./tree.sh [디렉토리] [깊이]

# 색상 정의
COLOR_DIR='\033[1;34m'      # 파란색 (디렉토리)
COLOR_EXEC='\033[1;32m'     # 초록색 (실행파일)
COLOR_LINK='\033[1;36m'     # 청록색 (심볼릭 링크)
COLOR_RESET='\033[0m'       # 색상 리셋

# 전역 변수
total_dirs=0
total_files=0
declare -A visited_inodes  # 방문한 inode 추적 (순환 참조 방지)

# 파일 타입에 따른 색상 반환
get_color() {
    local path="$1"
    
    if [ -L "$path" ]; then
        echo -e "${COLOR_LINK}"
    elif [ -d "$path" ]; then
        echo -e "${COLOR_DIR}"
    elif [ -x "$path" ]; then
        echo -e "${COLOR_EXEC}"
    else
        echo -e "${COLOR_RESET}"
    fi
}

# 디렉토리 트리 출력 함수
print_tree() {
    local dir="$1"
    local prefix="$2"
    local max_depth="$3"
    local current_depth="$4"
    
    # 최대 깊이 체크
    if [ -n "$max_depth" ] && [ "$current_depth" -ge "$max_depth" ]; then
        return
    fi
    
    # 디렉토리 접근 권한 체크
    if [ ! -r "$dir" ]; then
        echo "${prefix}[권한 없음]"
        return
    fi
    
    # inode 가져오기 (순환 참조 방지)
    local inode=$(stat -c '%i' "$dir" 2>/dev/null)
    if [ -n "$inode" ] && [ -n "${visited_inodes[$inode]}" ]; then
        return  # 이미 방문한 디렉토리
    fi
    visited_inodes[$inode]=1
    
    # 파일 목록 가져오기 (숨김 파일 포함)
    local items=()
    while IFS= read -r -d '' item; do
        items+=("$(basename "$item")")
    done < <(find "$dir" -mindepth 1 -maxdepth 1 -print0 2>/dev/null | sort -z)
    
    local count=${#items[@]}
    
    # 각 항목 처리
    for ((i=0; i<count; i++)); do
        local item="${items[$i]}"
        local path="$dir/$item"
        local is_last=false
        
        # 마지막 항목인지 확인
        if [ $i -eq $((count-1)) ]; then
            is_last=true
        fi
        
        # 트리 구조 문자
        if $is_last; then
            local branch="└── "
            local extension="    "
        else
            local branch="├── "
            local extension="│   "
        fi
        
        # 색상 적용
        local color=$(get_color "$path")
        
        # 심볼릭 링크 처리
        if [ -L "$path" ]; then
            local target=$(readlink "$path")
            echo -e "${prefix}${branch}${color}${item}${COLOR_RESET} -> ${target}"
            ((total_files++))
        # 디렉토리 처리
        elif [ -d "$path" ]; then
            echo -e "${prefix}${branch}${color}${item}/${COLOR_RESET}"
            ((total_dirs++))
            # 재귀 호출
            print_tree "$path" "${prefix}${extension}" "$max_depth" $((current_depth+1))
        # 일반 파일 처리
        else
            echo -e "${prefix}${branch}${color}${item}${COLOR_RESET}"
            ((total_files++))
        fi
    done
}

# 사용법 출력
usage() {
    echo "사용법: $0 [디렉토리] [옵션]"
    echo ""
    echo "옵션:"
    echo "  -L [깊이]    최대 디렉토리 깊이 지정"
    echo "  -d           디렉토리만 표시"
    echo "  -a           숨김 파일 포함 (기본값)"
    echo "  -h, --help   도움말 표시"
    echo ""
    echo "예제:"
    echo "  $0                    # 현재 디렉토리"
    echo "  $0 /home/user         # 특정 디렉토리"
    echo "  $0 /home/user -L 2    # 깊이 2까지만"
    exit 1
}

# 메인 실행 부분
main() {
    local target_dir="."
    local max_depth=""
    local dir_only=false
    
    # 인자 파싱
    while [ $# -gt 0 ]; do
        case "$1" in
            -h|--help)
                usage
                ;;
            -L)
                shift
                max_depth="$1"
                if ! [[ "$max_depth" =~ ^[0-9]+$ ]]; then
                    echo "오류: 깊이는 숫자여야 합니다."
                    exit 1
                fi
                ;;
            -d)
                dir_only=true
                ;;
            -a)
                # 이미 기본값이므로 무시
                ;;
            -*)
                echo "알 수 없는 옵션: $1"
                usage
                ;;
            *)
                target_dir="$1"
                ;;
        esac
        shift
    done
    
    # 디렉토리 존재 확인
    if [ ! -d "$target_dir" ]; then
        echo "오류: '$target_dir'는 디렉토리가 아닙니다."
        exit 1
    fi
    
    # 절대 경로로 변환
    target_dir=$(cd "$target_dir" && pwd)
    
    # 루트 디렉토리 출력
    echo -e "${COLOR_DIR}${target_dir}/${COLOR_RESET}"
    
    # 트리 출력
    print_tree "$target_dir" "" "$max_depth" 0
    
    # 통계 출력
    echo ""
    echo "$total_dirs directories, $total_files files"
}

# 스크립트 실행
main "$@"
```

```
# 확인
[student001@gjchamber ~]$ ./tree.sh JSilicon2
/home/student001/JSilicon2/
├── constraints/
├── reports/
│   ├── pnr/
│   ├── sta/
│   ├── sta/
│   └── synthesis/
│   ├── sta/
│   └── synthesis/
├── sim/
│   ├── tb_alu.v
│   ├── tb_decoder.v
│   ├── tb_fsm.v
│   ├── tb_jsilicon_top.v
│   ├── tb_pc.v
│   ├── tb_reg.v
│   ├── tb_switch.v
│   └── tb_uart.v

9 directories, 8 files

```

---

### Step 1: RTL 코드 분석

#### 1-1. RTL 파일 확인

```csh
cd ~/JSilicon2/src

# 파일 목록 및 크기
ls -lh *.v

# 각 파일의 모듈명 확인
foreach f (*.v)
    echo "=== $f ==="
    grep "^module" $f
    echo ""
end
```

**출력:**
```
[student001@gjchamber src]$ foreach f (*.v)
foreach?     echo "=== $f ==="
foreach?     grep "^module" $f
foreach?     echo ""
foreach? end
=== alu.v ===
module ALU(

=== fsm.v ===
module FSM (

=== inst.v ===
module DECODER (

=== jsilicon.v ===
module tt_um_Jsilicon(

=== pc.v ===
module PC (

=== regfile.v ===
module REG (

=== switch.v ===
module SWITCH (

=== uart.v ===
module UART_TX(

```

#### 1-2. Top 모듈 분석

```csh
# Top 모듈 인터페이스 확인
cd ~/JSilicon2/

cat src/jsilicon.v | grep -A 20 "module tt_um_Jsilicon"

module tt_um_Jsilicon(
    // Tinytapeout 요구 변수명으로 수정
    input wire clk,
    input wire rst_n,

    // 사용자 입력 기능 추가
    input wire [7:0] ui_in,
    input wire [7:0] uio_in,

    // Enable Input 추가
    input wire ena,

    // 출력핀 재지정
    output wire [7:0] uio_oe,

    // 사용자 출력 추가
    output wire [7:0] uo_out,
    output wire [7:0] uio_out
    );

    // 초기화 동기화

```

**주요 포트:**
- `clk`: 클록 입력
- `rst_n`: 리셋 신호 (active-low)
- `ui_in[7:0]`: 외부 입력
- `uo_out[7:0]`: 외부 출력
- 기타 제어 신호

#### 1-3. 모듈 계층 구조 확인

```
vi dishi
```

```
#!/bin/csh
###############################################################################
# JSilicon 모듈 완전 분석 (간단 버전)
# analyze_modules.csh
###############################################################################

set SRC_DIR = "src"

if ( ! -d $SRC_DIR ) then
    echo "Error: src directory not found"
    exit 1
endif

echo "=========================================="
echo " JSilicon 모듈 분석"
echo "=========================================="
echo ""

# 1. 모든 .v 파일 목록
echo "1. Verilog 파일 목록:"
echo ""
set files = `find $SRC_DIR -name "*.v" -type f | sort`
set count = 1
foreach file ( $files )
    echo "  [$count] `basename $file`"
    @ count++
end

echo ""
echo "총 $#files 개 파일"
echo ""

# 2. 각 파일의 모듈명과 인스턴스
echo "=========================================="
echo "2. 모듈별 상세 정보"
echo "=========================================="
echo ""

foreach file ( $files )
    set module = `grep "^module" $file | head -1 | awk '{print $2}' | sed 's/(.*$//'`
    if ( "$module" != "" ) then
        echo "파일: `basename $file`"
        echo "모듈: $module"
        
        # 인스턴스 찾기
        set inst_count = `grep -c '_inst *(' $file`
        if ( $inst_count > 0 ) then
            echo "인스턴스 ($inst_count):"
            grep "_inst *(" $file | sed 's/^[ \t]*//' | awk '{printf "  - %-20s <- %s\n", $2, $1}' | sed 's/(.*$//'
        else
            echo "인스턴스: 없음 (Leaf 모듈)"
        endif
        echo ""
    endif
end

# 3. Top 모듈의 계층 구조
echo "=========================================="
echo "3. Top 모듈 계층 구조"
echo "=========================================="
echo ""

# Top 파일 찾기
set top_file = ""
foreach file ( $files )
    set basename = `basename $file`
    if ( "$basename" =~ *top* || "$basename" =~ *jsilicon* || "$basename" =~ *tt_um* ) then
        set top_file = $file
        break
    endif
end

if ( "$top_file" == "" ) then
    set top_file = $files[1]
endif

set top_module = `grep "^module" $top_file | head -1 | awk '{print $2}' | sed 's/(.*$//'`

echo "$top_module (Top)"
echo ""

# Level 1 인스턴스
echo "Level 1 인스턴스:"
grep "_inst *(" $top_file | sed 's/^[ \t]*//' | awk '{printf "  ├── %-20s <- %s\n", $2, $1}' | sed 's/($//' | sed '$ s/├──/└──/'

echo ""

# 각 Level 1 모듈의 하위 확인
echo "Level 2+ 인스턴스:"
echo ""

set level1_modules = `grep "_inst *(" $top_file | awk '{print $1}'`

foreach l1_module ( $level1_modules )
    # 해당 모듈 파일 찾기
    set module_file = ""
    foreach file ( $files )
        set check_module = `grep "^module $l1_module" $file`
        if ( "$check_module" != "" ) then
            set module_file = $file
            break
        endif
    end
    
    if ( "$module_file" != "" ) then
        set sub_inst_count = `grep -c '_inst *(' $module_file`
        if ( $sub_inst_count > 0 ) then
            echo "  $l1_module 의 하위 인스턴스:"
            grep "_inst *(" $module_file | sed 's/^[ \t]*//' | awk '{printf "    ├── %-20s <- %s\n", $2, $1}' | sed 's/($//' | sed '$ s/├──/└──/'
            echo ""
        endif
    endif
end

echo "=========================================="
```


**계층 구조:**
* _inst를 찾아서 계측을 확인하기 때문에 일부 코드에서 수정이 필요.
   * jsilicon.v
   * fsm.v

```
[student001@gjchamber ~/JSilicon2]$ ./dishi
==========================================
 JSilicon 모듈 분석
==========================================

1. Verilog 파일 목록:

  [1] alu.v
  [2] fsm.v
  [3] inst.v
  [4] jsilicon.v
  [5] pc.v
  [6] regfile.v
  [7] switch.v
  [8] uart.v

총 8 개 파일

==========================================
2. 모듈별 상세 정보
==========================================

파일: alu.v
모듈: ALU
인스턴스: 없음 (Leaf 모듈)

파일: fsm.v
모듈: FSM
인스턴스 (2):
  - alu_inst             <- ALU
  - uart_inst

파일: inst.v
모듈: DECODER
인스턴스: 없음 (Leaf 모듈)

파일: jsilicon.v
모듈: tt_um_Jsilicon
인스턴스 (5):
  - pc_inst              <- PC
  - dec_inst             <- DECODER
  - reg_inst             <- REG
  - switch_inst          <- SWITCH
  - core_inst            <- FSM

파일: pc.v
모듈: PC
인스턴스: 없음 (Leaf 모듈)

파일: regfile.v
모듈: REG
인스턴스: 없음 (Leaf 모듈)

파일: switch.v
모듈: SWITCH
인스턴스: 없음 (Leaf 모듈)

파일: uart.v
모듈: UART_TX
인스턴스: 없음 (Leaf 모듈)

==========================================
3. Top 모듈 계층 구조
==========================================

tt_um_Jsilicon (Top)

Level 1 인스턴스:
  ├── pc_inst              <- PC
  ├── dec_inst             <- DECODER
  ├── reg_inst             <- REG
  ├── switch_inst          <- SWITCH
  └── core_inst            <- FSM

Level 2+ 인스턴스:

  FSM 의 하위 인스턴스:
    ├── alu_inst             <- ALU
    └── uart_inst(           <- UART_TX

==========================================
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

```
cd ~/JSilicon2/constraints
```

```
vi jsilicon.sdc
```

* # SDC (Synopsys Design Constraints) 파일 생성 : Cadence도 동일함

```csh
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

* 라이센스 확인

```
printenv | egrep 'CDS|LM_LICENSE'
```

* 실행 결과

```
CDS_LIC_FILE=5280@10.10.20.247
LM_LICENSE_FILE=5280@10.10.20.247
CDS_LIC_ONLY=1
CDS_ROOT=/tools/cadence
CDS_INST_DIR=/tools/cadence/IC618
CDSHOME=/tools/cadence/IC618
CDS_Netlisting_Mode=Analog
CDS_AUTO_64BIT_ALL=
CDS_PALETTE_TYPE=MultiAssistance
```

```
mkdir ~/JSilicon2/scripts
cd ~/JSilicon2/scripts
mkdir -p genus
```

* # Genus 합성 스크립트

```
vi genus/synthesis.tcl
```

```
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
```

```
chmod +x genus/synthesis.tcl
```

#### 3-2. 합성 실행

```
cd ~/JSilicon2/work/synthesis

# Genus 실행
genus -f ../../scripts/genus/synthesis.tcl |& tee synthesis.log
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

```
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

```
=== QoR Summary ===
[student001@gjchamber ~/JSilicon2]$ cat reports/synthesis/qor.rpt | tail -50
  Generated by:           Genus(TM) Synthesis Solution 23.13-s073_1
  Generated on:           Nov 18 2025  07:22:45 am
  Module:                 tt_um_Jsilicon
  Operating conditions:   typical
  Interconnect mode:      global
  Area mode:              physical library
============================================================

Timing
--------

Clock Period
-------------
clk   5000.0


  Cost    Critical         Violating
 Group   Path Slack  TNS     Paths
-------------------------------------
clk             2.9   0.0          0
default    No paths   0.0
-------------------------------------
Total                 0.0          0

Instance Count
--------------
Leaf Instance Count             669
Physical Instance count           0
Sequential Instance Count        42
Combinational Instance Count    627
Hierarchical Instance Count       2

Area
----
Cell Area                          1982.793
Physical Cell Area                 0.000
Total Cell Area (Cell+Physical)    1982.793
Net Area                           1319.789
Total Area (Cell+Physical+Net)     3302.582

Max Fanout                         42 (clk)
Min Fanout                         0 (n_4)
Average Fanout                     1.8
Terms to net ratio                 2.8428
Terms to instance ratio            3.0807
Runtime                            122.600606 seconds
Elapsed Runtime                    141 seconds
Genus peak memory usage            1982.35
Innovus peak memory usage          no_value
Hostname                           localhost

```

**주요 확인 항목:**

```
# 1. 타이밍 확인
grep -A 10 "Timing" reports/synthesis/qor.rpt

# 출력:
# Timing
# --------
# 
# Clock Period
# -------------
# clk   5000.0
# 
# 
#  Cost    Critical         Violating
# Group   Path Slack  TNS     Paths
# -------------------------------------


# 2. 면적 확인
grep -A 5 "Area" reports/synthesis/qor.rpt

# 출력:
#  Area mode:              physical library
#============================================================
#
#Timing
#--------
#
#--
#Area
#----
#Cell Area                          1982.793
#Physical Cell Area                 0.000
#Total Cell Area (Cell+Physical)    1982.793
#Net Area                           1319.789
#Total Area (Cell+Physical+Net)     3302.582
#
#Max Fanout                         42 (clk)
#Min Fanout                         0 (n_4)
#Average Fanout                     1.8
#Terms to net ratio                 2.8428


# 3. 게이트 수 확인
cat reports/synthesis/gates.rpt | head -20

# 출력:
# ============================================================
#   Generated by:           Genus(TM) Synthesis Solution 23.13-s073_1
#   Generated on:           Nov 18 2025  07:22:45 am
#   Module:                 tt_um_Jsilicon
#   Technology libraries:   gscl45nm
#                           physical_cells
#                           gscl45nm
#                           physical_cells
#   Operating conditions:   typical
#   Interconnect mode:      global
#   Area mode:              physical library
# ============================================================
# 
# 
#   Gate    Instances    Area     Library
# ------------------------------------------
# AND2X2           84   197.106    gscl45nm
# AOI21X1          14    32.851    gscl45nm
# AOI22X1          10    28.158    gscl45nm
# BUFX2            73   137.036    gscl45nm

```

#### 3-4. 타이밍 분석

```
# 상위 10개 Critical Path 확인
cat reports/synthesis/timing.rpt | head -100
```

```

============================================================
  Generated by:           Genus(TM) Synthesis Solution 23.13-s073_1
  Generated on:           Nov 18 2025  07:22:45 am
  Module:                 tt_um_Jsilicon
  Operating conditions:   typical
  Interconnect mode:      global
  Area mode:              physical library
============================================================


Path 1: MET (3 ps) Setup Check with Pin core_inst_uart_inst/data_reg_reg[0]/CLK->D
          Group: clk
     Startpoint: (R) uio_in[4]
          Clock: (R) clk
       Endpoint: (R) core_inst_uart_inst/data_reg_reg[0]/D
          Clock: (R) clk

                     Capture       Launch
        Clock Edge:+    5000            0
        Drv Adjust:+       0           16
       Src Latency:+       0            0
       Net Latency:+       0 (I)        0 (I)
           Arrival:=    5000           16

             Setup:-    1438
       Uncertainty:-     500
     Required Time:=    3062
      Launch Clock:-      16
       Input Delay:-    1500
         Data Path:-    1544
             Slack:=       3

Exceptions/Constraints:
  input_delay             1500            jsilicon.sdc_line_16_12_1

#---------------------------------------------------------------------------------------------------------------------
#                Timing Point                  Flags   Arc   Edge   Cell     Fanout Load Trans Delay Arrival Instance
#                                                                                   (fF)  (ps)  (ps)   (ps)  Location
#---------------------------------------------------------------------------------------------------------------------
  uio_in[4]                                    -       -     R     (arrival)      2  9.8    23     0    1516    (-,-)
  g2013/Y                                      -       A->Y  F     INVX2          9 34.8    40    48    1563    (-,-)
  g1991__6161/Y                                -       B->Y  R     NAND2X1        1  4.7    45    30    1594    (-,-)
  drc_bufs20986/Y                              -       A->Y  R     BUFX2         12 64.2   155   132    1726    (-,-)
  core_inst_alu_inst_rem_39_73_g20534__4319/YC -       B->YC R     FAX1           1  5.2    33    74    1800    (-,-)
  core_inst_alu_inst_rem_39_73_g20530__2398/Y  -       C->Y  F     OAI21X1        1  5.4    18    25    1824    (-,-)
  g20831/Y                                     -       A->Y  R     NOR2X1         1  4.7    35    39    1863    (-,-)
  g20767/Y                                     -       A->Y  R     BUFX2          2  8.6    24    45    1908    (-,-)
  g21054/Y                                     -       B->Y  R     AND2X2         3 12.3    32    48    1956    (-,-)
  drc_bufs20844/Y                              -       A->Y  F     INVX1          1  5.1    19    28    1984    (-,-)
  core_inst_alu_inst_rem_39_73_g20477__1666/Y  -       B->Y  R     NAND2X1        1  4.7    46    23    2008    (-,-)
  g20795/Y                                     -       A->Y  R     BUFX2          2  8.4    25    45    2053    (-,-)
  core_inst_alu_inst_rem_39_73_g20447__9315/Y  -       B->Y  F     NAND2X1        1  4.7    27    23    2076    (-,-)
  drc_bufs20854/Y                              -       A->Y  F     BUFX2          1  5.8    10    40    2116    (-,-)
  core_inst_alu_inst_rem_39_73_g20422__8246/Y  -       A->Y  R     OAI21X1        4 17.2   112    90    2207    (-,-)
  g20803/Y                                     -       A->Y  F     INVX1          2  9.3    26    58    2265    (-,-)
  core_inst_alu_inst_rem_39_73_g20402__3680/Y  -       B->Y  F     AND2X2         3 13.2    17    53    2318    (-,-)
  core_inst_alu_inst_rem_39_73_g20383__2346/Y  -       B->Y  R     OAI21X1        2  8.7    72    62    2380    (-,-)
  core_inst_alu_inst_rem_39_73_g20373__9315/Y  -       B->Y  R     AND2X2         2  9.8    29    47    2427    (-,-)
  core_inst_alu_inst_rem_39_73_g20372/Y        -       A->Y  F     INVX2          4 21.8    30    38    2465    (-,-)
  core_inst_alu_inst_rem_39_73_g20370__4733/Y  -       A->Y  F     OR2X2          2  9.4    25    49    2514    (-,-)
  core_inst_alu_inst_rem_39_73_g20333__6260/Y  -       C->Y  R     NAND3X1        1  4.7    48    41    2555    (-,-)
  drc_bufs21070/Y                              -       A->Y  R     BUFX2          1  5.0    18    40    2595    (-,-)
  core_inst_alu_inst_rem_39_73_g20319__6161/Y  -       A->Y  R     AND2X2         1  5.2    17    38    2633    (-,-)
  core_inst_alu_inst_rem_39_73_g20317__4733/Y  -       C->Y  F     OAI21X1        2  9.8    25    27    2660    (-,-)
  core_inst_alu_inst_rem_39_73_g20308__7098/Y  -       A->Y  F     OR2X2          4 17.7    30    57    2718    (-,-)
  core_inst_alu_inst_rem_39_73_g20291__2398/Y  -       A->Y  R     AOI21X1        1  4.7    39    49    2767    (-,-)
  drc_bufs20863/Y                              -       A->Y  R     BUFX2          1  5.5    17    40    2807    (-,-)
  core_inst_alu_inst_rem_39_73_g20283__9945/Y  -       A->Y  R     OR2X2          1  5.9    20    44    2850    (-,-)
  g21052/Y                                     -       B->Y  F     AOI21X1        1  5.9    26    33    2884    (-,-)
  g3/Y                                         -       A->Y  R     INVX2          3 61.9   144   106    2990    (-,-)
  core_inst_uart_inst/g2965__3680/Y            -       A->Y  F     MUX2X1         1  4.7    22    56    3045    (-,-)
  core_inst_uart_inst/g2960/Y                  -       A->Y  R     INVX1          1  5.0     0    14    3059    (-,-)
  core_inst_uart_inst/data_reg_reg[0]/D        -       -     R     DFFPOSX1       1    -     -     0    3060    (-,-)
#---------------------------------------------------------------------------------------------------------------------



Path 2: MET (4 ps) Setup Check with Pin core_inst_uart_inst/data_reg_reg[0]/CLK->D
          Group: clk
     Startpoint: (R) uio_in[4]
          Clock: (R) clk
       Endpoint: (R) core_inst_uart_inst/data_reg_reg[0]/D
          Clock: (R) clk

                     Capture       Launch
        Clock Edge:+    5000            0
        Drv Adjust:+       0           16
       Src Latency:+       0            0
       Net Latency:+       0 (I)        0 (I)
           Arrival:=    5000           16

             Setup:-    1438
       Uncertainty:-     500
     Required Time:=    3062
      Launch Clock:-      16
       Input Delay:-    1500
         Data Path:-    1543
             Slack:=       4

Exceptions/Constraints:
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

```
cd ~/JSilicon2/scripts
mkdir -p innovus
```

```
# MMMC (Multi-Mode Multi-Corner) 설정
vi innovus/mmmc.tcl
```

```
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
```

#### 4-2. P&R 스크립트 생성

```
# Innovus P&R 스크립트
vi innovus/pnr_flow.tcl
```

```
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
```

### Final (scripts/innovus/pnr_flow.tcl)

```
################################################################################
# Innovus P&R Flow Script
# Design: tt_um_Jsilicon
# PDK: FreePDK45 (gscl45nm)
################################################################################

set DESIGN_NAME "tt_um_Jsilicon"

puts "=========================================="
puts "P&R Flow for $DESIGN_NAME"
puts "PDK: FreePDK45 (gscl45nm)"
puts "=========================================="

################################################################################
# 1. 라이브러리 설정
################################################################################
puts "\n1. Setting up libraries..."

# LEF 파일 (프로젝트 tech 디렉토리)
set lef_file "../../tech/lef/gscl45nm.lef"

if { [file exists $lef_file] } {
    read_physical -lef $lef_file
    puts "  ✓ Read LEF: $lef_file"
} else {
    puts "ERROR: LEF file not found: $lef_file"
    exit 1
}

# Timing library
set lib_file "../../tech/lib/gscl45nm.lib"

if { [file exists $lib_file] } {
    read_timing_library $lib_file
    puts "  ✓ Read timing lib: $lib_file"
} else {
    puts "ERROR: Timing library not found: $lib_file"
    exit 1
}

################################################################################
# 2. 넷리스트 읽기
################################################################################
puts "\n2. Reading netlist..."

if { ![file exists ../../results/netlist/${DESIGN_NAME}_synth.v] } {
    puts "ERROR: Synthesized netlist not found!"
    puts "Expected: ../../results/netlist/${DESIGN_NAME}_synth.v"
    exit 1
}

read_netlist ../../results/netlist/${DESIGN_NAME}_synth.v
set_top_module $DESIGN_NAME

################################################################################
# 3. 디자인 초기화
################################################################################
puts "\n3. Initializing design..."
init_design

################################################################################
# 4. Floorplan
################################################################################
puts "\n4. Creating floorplan..."

# Core utilization 0.7, aspect ratio 1.0 (정사각형)
# Margins: 10um on all sides
floorPlan -r 1.0 0.7 10.0 10.0 10.0 10.0

# I/O 핀 자동 배치
setPinAssignMode -pinEditInBatch true
assignPin

################################################################################
# 5. Power Planning
################################################################################
puts "\n5. Creating power grid..."

# Global net 연결 (gscl45nm은 vdd/gnd 사용)
globalNetConnect vdd -type pgpin -pin vdd -inst * -override
globalNetConnect gnd -type pgpin -pin gnd -inst * -override
globalNetConnect vdd -type tiehi -inst *
globalNetConnect gnd -type tielo -inst *

# Power ring 생성 (metal9, metal10 사용)
addRing -nets {vdd gnd} -type core_rings \
    -layer {metal9 metal10} \
    -width 2.0 -spacing 1.0 -offset 5.0

# Power stripes (metal8 vertical)
addStripe -nets {vdd gnd} \
    -layer metal8 \
    -direction vertical \
    -width 1.0 -spacing 10.0 -number_of_sets 3

# Special routing for power
sroute -connect {corePin} -nets {vdd gnd}

################################################################################
# 6. Placement
################################################################################
puts "\n6. Placing standard cells..."

# Placement 옵션
setPlaceMode -congEffort high -timingDriven true

# Standard cell placement with optimization
place_opt_design

# Pre-CTS optimization
optDesign -preCTS

################################################################################
# 7. Clock Tree Synthesis (CTS)
################################################################################
puts "\n7. Building clock tree..."

# Clock constraint
# FreePDK45 (45nm)는 더 빠른 클락 가능
# 10ns = 100MHz
create_clock -name clk -period 10.0 [get_ports clk]
set_clock_uncertainty 0.5 [get_clocks clk]

# Input/Output delays
set_input_delay -clock clk -max 2.0 [remove_from_collection [all_inputs] [get_ports clk]]
set_output_delay -clock clk -max 2.0 [all_outputs]

# Clock tree synthesis (최신 Innovus)
puts "Running clock tree synthesis..."
clock_opt_design

# Post-CTS optimization
optDesign -postCTS

################################################################################
# 8. Routing
################################################################################
puts "\n8. Routing design..."

# Routing 옵션
setNanoRouteMode -drouteFixAntenna true
setNanoRouteMode -droutePostRouteSwapVia true

# Detail routing
routeDesign

# Post-route optimization
optDesign -postRoute

################################################################################
# 9. Filler 추가
################################################################################
puts "\n9. Adding filler cells..."

# gscl45nm filler cells
# LEF에서 filler cell 이름 확인 필요
# 일반적으로 FILL로 시작
setFillerMode -corePrefix FILL -core "FILL*"
addFiller

################################################################################
# 10. 검증
################################################################################
puts "\n10. Running verification..."

# Geometry check
verifyGeometry -report ../../reports/pnr/geometry.rpt

# Connectivity check
verifyConnectivity -report ../../reports/pnr/connectivity.rpt

################################################################################
# 11. 타이밍 분석
################################################################################
puts "\n11. Generating timing reports..."

# Setup timing (max delay)
report_timing -max_paths 10 -nworst 1 -delay_type max \
    > ../../reports/pnr/timing_setup.rpt

# Hold timing (min delay)
report_timing -max_paths 10 -nworst 1 -delay_type min \
    > ../../reports/pnr/timing_hold.rpt

# Timing summary
report_timing_summary > ../../reports/pnr/timing_summary.rpt

# Check for violations
report_constraint -all_violators > ../../reports/pnr/violations.rpt

################################################################################
# 12. 면적 및 전력 리포트
################################################################################
puts "\n12. Generating area and power reports..."

report_area > ../../reports/pnr/area.rpt
report_power > ../../reports/pnr/power.rpt

################################################################################
# 13. 출력 파일 저장
################################################################################
puts "\n13. Saving outputs..."

# DEF 파일 저장
defOut -floorplan -netlist -routing ../../results/def/${DESIGN_NAME}.def

# Final netlist 저장
saveNetlist ../../results/netlist/${DESIGN_NAME}_final.v

# 디자인 데이터베이스 저장
saveDesign ${DESIGN_NAME}_final.enc

# Summary report
summaryReport -outFile ../../reports/pnr/summary.rpt

################################################################################
# 완료
################################################################################
puts "\n=========================================="
puts "✓ P&R Flow Completed Successfully!"
puts "=========================================="
puts "\nGenerated files:"
puts "  DEF:     ../../results/def/${DESIGN_NAME}.def"
puts "  Netlist: ../../results/netlist/${DESIGN_NAME}_final.v"
puts "  Reports: ../../reports/pnr/"
puts ""
puts "Key metrics:"
puts "-------------"

# 파일 크기 표시
if { [file exists ../../results/def/${DESIGN_NAME}.def] } {
    set def_size [file size ../../results/def/${DESIGN_NAME}.def]
    puts "  DEF size: [expr $def_size / 1024] KB"
}

if { [file exists ../../results/netlist/${DESIGN_NAME}_final.v] } {
    set netlist_size [file size ../../results/netlist/${DESIGN_NAME}_final.v]
    puts "  Netlist size: [expr $netlist_size / 1024] KB"
}

puts "\nNext steps:"
puts "  1. Check timing: tail -50 ../../reports/pnr/timing_summary.rpt"
puts "  2. Run STA: Step 3 in guide"
puts "  3. Generate GDS: Step 4 in guide"
puts "=========================================="

# GUI 모드면 화면 fit
if { [info exists gui_mode] && $gui_mode == 1 } {
    fit
}
```

```
chmod +x innovus/pnr_flow.tcl
```

#### 4-3. P&R 실행

```
cd ~/JSilicon2/work/pnr

# Innovus 실행
innovus

# GUI 모드에서 실행
cd work/pnr
# GUI에서: source ../../scripts/innovus/pnr_flow.tcl

# Innovus 실행
innovus -init ../../scripts/innovus/pnr_flow.tcl |& tee pnr.log

# Innovus 종료
innovus 3> exit

*** Memory Usage v#2 (Current mem = 3433.059M, initial mem = 839.172M) ***
*** Message Summary: 129 warning(s), 7 error(s)

--- Ending "Innovus" (totcpu=0:01:20, real=0:04:51, mem=3433.1M) ---

```



<img width="1032" height="897" alt="005" src="https://github.com/user-attachments/assets/4371ffde-a170-421f-b34f-3f917fc6ba07" />



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

```
cd ~/JSilicon2

# 생성된 파일
echo "=== Generated Files ==="
ls -lh results/def/tt_um_Jsilicon.def ✗ 없음 (아직 생성전)
ls -lh results/netlist/tt_um_Jsilicon_synth.v

# Summary 리포트
echo ""
echo "=== P&R Summary ==="
cat reports/pnr/summary.rpt
```

* DEF 파일이란?
   * DEF (Design Exchange Format) 파일은 물리적 배치 정보를 담고 있는 파일입니다.

* 주요 내용
   * 셀 배치 (Placement): 각 표준 셀의 x, y 좌표
   * 라우팅 (Routing): 금속 배선 정보
   * 핀 위치: I/O 핀의 물리적 위치
   * 다이 크기: 칩의 실제 물리적 크기
   * 전원/그라운드 네트워크: Power grid 정보


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

# 작업 자동화

* 1. run_full_flow.csh - 전체 자동화 실행

```csh
chmod +x run_full_flow.csh
./run_full_flow.csh
```

  * Synthesis → P&R → STA → GDS 생성까지 자동 실행
  * 각 단계마다 결과 확인 및 계속 여부 확인

* 2. check_status.csh - 현재 상태 확인

```csh
chmod +x check_status.csh
./check_status.csh
```

   * 각 단계별 완료 여부 체크
   * 리포트 요약 표시
   * 다음 단계 제안

* 3. generate_gds.csh - GDS 생성 및 테이프아웃 준비

```csh
chmod +x generate_gds.csh
./generate_gds.csh

- GDS 파일 생성
- DRC/LVS 준비
- 테이프아웃 체크리스트

## 🔄 완전한 설계 흐름
1. RTL Synthesis (Genus)
   ├── Input:  src/*.v
   └── Output: results/netlist/tt_um_Jsilicon_synth.v
               reports/synthesis/*.rpt

2. Place & Route (Innovus)
   ├── Input:  synthesized netlist
   └── Output: results/def/tt_um_Jsilicon.def
               results/netlist/tt_um_Jsilicon_final.v
               reports/pnr/*.rpt

3. Static Timing Analysis (Tempus)
   ├── Input:  final netlist + DEF
   └── Output: reports/sta/*.rpt

4. GDS Generation (Innovus)
   ├── Input:  placed & routed design
   └── Output: results/gds/tt_um_Jsilicon.gds
               results/tt_um_Jsilicon.lef

5. Verification (Magic/Calibre)
   ├── DRC: Design Rule Check
   ├── LVS: Layout vs Schematic
   └── Output: reports/drc/*.rpt
               reports/lvs/*.rpt

6. Tapeout Package
   └── GDS + LEF + 검증 리포트
```

* 🚀 실행 순서
```csh
# 1. 현재 상태 확인
./check_status.csh

# 2-a. 전체 자동 실행 (추천)
./run_full_flow.csh

# 또는 2-b. 단계별 수동 실행
cd work/synthesis
genus -f ../../scripts/genus/synthesis.tcl |& tee synthesis.log
cd ../pnr
innovus -init ../../scripts/innovus/pnr_flow.tcl |& tee pnr.log
cd ../..

# 3. GDS 생성 및 검증
./generate_gds.csh

# 4. 최종 상태 확인
./check_status.csh
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

## 🙏 Reference

- **FreePDK45**: baichen318님의 오픈소스 PDK
- **Cadence**: 교육용 툴 제공
- **오픈소스 커뮤니티**: 지속적인 지원과 피드백
- **GitHub**: [https://github.com/YOUR_USERNAME/JSilicon2](https://github.com/YOUR_USERNAME/JSilicon2)

---

