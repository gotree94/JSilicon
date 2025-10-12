# ========================================
# Jsilicon Verification Makefile
# ========================================

# 디렉토리 설정
SRC_DIR = src
SIM_DIR = sim
LOG_DIR = logs
WAVE_DIR = waves

# 시뮬레이터 설정
XRUN = xrun
XRUN_FLAGS = -access +rwc
XRUN_GUI = -gui
XRUN_SV = -sv
XRUN_LOG = -log

# 타임스케일
TIMESCALE = -timescale 1ns/1ps

# 공통 의존성 파일들
ALU_DEP = $(SRC_DIR)/alu.v
UART_DEP = $(SRC_DIR)/uart.v
DECODER_DEP = $(SRC_DIR)/inst.v
PC_DEP = $(SRC_DIR)/pc.v
REG_DEP = $(SRC_DIR)/regfile.v
SWITCH_DEP = $(SRC_DIR)/switch.v
FSM_DEP = $(SRC_DIR)/fsm.v $(ALU_DEP) $(UART_DEP)
TOP_DEP = $(SRC_DIR)/jsilicon.v $(ALU_DEP) $(UART_DEP) $(DECODER_DEP) \
          $(PC_DEP) $(REG_DEP) $(SWITCH_DEP) $(FSM_DEP)

# SystemVerilog UVM 파일들
UVM_FILES = $(SIM_DIR)/jsilicon_pkg.sv \
            $(SIM_DIR)/jsilicon_if.sv \
            $(SIM_DIR)/jsilicon_tb_top.sv

# ========================================
# 기본 타겟
# ========================================

.PHONY: all clean help list

all: help

help:
	@echo "========================================="
	@echo "Jsilicon 시뮬레이션 Makefile"
	@echo "========================================="
	@echo "사용법: make <target>"
	@echo ""
	@echo "=== Verilog Testbench (기본) ==="
	@echo "  alu         - ALU 모듈 테스트"
	@echo "  uart        - UART_TX 모듈 테스트"
	@echo "  decoder     - Decoder 모듈 테스트"
	@echo "  pc          - Program Counter 테스트"
	@echo "  reg         - Register File 테스트"
	@echo "  switch      - Mode Switch 테스트"
	@echo "  fsm         - FSM 통합 테스트"
	@echo "  top         - 최상위 모듈 테스트"
	@echo ""
	@echo "=== GUI 모드 ==="
	@echo "  alu-gui     - ALU GUI 시뮬레이션"
	@echo "  uart-gui    - UART GUI 시뮬레이션"
	@echo "  decoder-gui - Decoder GUI 시뮬레이션"
	@echo "  pc-gui      - PC GUI 시뮬레이션"
	@echo "  reg-gui     - Register File GUI 시뮬레이션"
	@echo "  switch-gui  - Switch GUI 시뮬레이션"
	@echo "  fsm-gui     - FSM GUI 시뮬레이션"
	@echo "  top-gui     - 최상위 GUI 시뮬레이션"
	@echo ""
	@echo "=== SystemVerilog UVM ==="
	@echo "  uvm         - UVM 테스트벤치 실행"
	@echo "  uvm-gui     - UVM GUI 시뮬레이션"
	@echo ""
	@echo "=== 일괄 실행 ==="
	@echo "  test-all    - 모든 Verilog TB 실행"
	@echo "  regression  - 회귀 테스트 (전체)"
	@echo ""
	@echo "=== 유틸리티 ==="
	@echo "  clean       - 생성된 파일 삭제"
	@echo "  list        - 사용 가능한 모든 타겟 표시"
	@echo "  waves       - 파형 파일 정리"
	@echo "========================================="

list:
	@echo "사용 가능한 타겟:"
	@$(MAKE) -pRrq -f $(lastword $(MAKEFILE_LIST)) : 2>/dev/null | \
		awk -v RS= -F: '/^# File/,/^# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' | \
		sort | egrep -v -e '^[^[:alnum:]]' -e '^$@$$'

# ========================================
# Verilog Testbench 시뮬레이션
# ========================================

alu:
	@mkdir -p $(LOG_DIR)
	$(XRUN) $(XRUN_FLAGS) $(TIMESCALE) \
		$(ALU_DEP) $(SRC_DIR)/alu_tb.v \
		$(XRUN_LOG) $(LOG_DIR)/alu.log
	@echo "✓ ALU 테스트 완료 - 로그: $(LOG_DIR)/alu.log"

uart:
	@mkdir -p $(LOG_DIR)
	$(XRUN) $(XRUN_FLAGS) $(TIMESCALE) \
		$(UART_DEP) $(SRC_DIR)/uart_tb.v \
		$(XRUN_LOG) $(LOG_DIR)/uart.log
	@echo "✓ UART 테스트 완료 - 로그: $(LOG_DIR)/uart.log"

decoder:
	@mkdir -p $(LOG_DIR)
	$(XRUN) $(XRUN_FLAGS) $(TIMESCALE) \
		$(DECODER_DEP) $(SRC_DIR)/inst_tb.v \
		$(XRUN_LOG) $(LOG_DIR)/decoder.log
	@echo "✓ Decoder 테스트 완료 - 로그: $(LOG_DIR)/decoder.log"

pc:
	@mkdir -p $(LOG_DIR)
	$(XRUN) $(XRUN_FLAGS) $(TIMESCALE) \
		$(PC_DEP) $(SRC_DIR)/pc_tb.v \
		$(XRUN_LOG) $(LOG_DIR)/pc.log
	@echo "✓ PC 테스트 완료 - 로그: $(LOG_DIR)/pc.log"

reg:
	@mkdir -p $(LOG_DIR)
	$(XRUN) $(XRUN_FLAGS) $(TIMESCALE) \
		$(REG_DEP) $(SRC_DIR)/regfile_tb.v \
		$(XRUN_LOG) $(LOG_DIR)/reg.log
	@echo "✓ Register File 테스트 완료 - 로그: $(LOG_DIR)/reg.log"

switch:
	@mkdir -p $(LOG_DIR)
	$(XRUN) $(XRUN_FLAGS) $(TIMESCALE) \
		$(SWITCH_DEP) $(SRC_DIR)/switch_tb.v \
		$(XRUN_LOG) $(LOG_DIR)/switch.log
	@echo "✓ Switch 테스트 완료 - 로그: $(LOG_DIR)/switch.log"

fsm:
	@mkdir -p $(LOG_DIR)
	$(XRUN) $(XRUN_FLAGS) $(TIMESCALE) \
		$(FSM_DEP) $(SRC_DIR)/fsm_tb.v \
		$(XRUN_LOG) $(LOG_DIR)/fsm.log
	@echo "✓ FSM 테스트 완료 - 로그: $(LOG_DIR)/fsm.log"

top:
	@mkdir -p $(LOG_DIR)
	$(XRUN) $(XRUN_FLAGS) $(TIMESCALE) \
		$(TOP_DEP) $(SRC_DIR)/jsilicon_tb.v \
		$(XRUN_LOG) $(LOG_DIR)/top.log
	@echo "✓ Top 모듈 테스트 완료 - 로그: $(LOG_DIR)/top.log"

# ========================================
# GUI 모드 시뮬레이션
# ========================================

alu-gui:
	@mkdir -p $(LOG_DIR) $(WAVE_DIR)
	$(XRUN) $(XRUN_FLAGS) $(XRUN_GUI) $(TIMESCALE) \
		$(ALU_DEP) $(SRC_DIR)/alu_tb.v \
		$(XRUN_LOG) $(LOG_DIR)/alu_gui.log

uart-gui:
	@mkdir -p $(LOG_DIR) $(WAVE_DIR)
	$(XRUN) $(XRUN_FLAGS) $(XRUN_GUI) $(TIMESCALE) \
		$(UART_DEP) $(SRC_DIR)/uart_tb.v \
		$(XRUN_LOG) $(LOG_DIR)/uart_gui.log

decoder-gui:
	@mkdir -p $(LOG_DIR) $(WAVE_DIR)
	$(XRUN) $(XRUN_FLAGS) $(XRUN_GUI) $(TIMESCALE) \
		$(DECODER_DEP) $(SRC_DIR)/inst_tb.v \
		$(XRUN_LOG) $(LOG_DIR)/decoder_gui.log

pc-gui:
	@mkdir -p $(LOG_DIR) $(WAVE_DIR)
	$(XRUN) $(XRUN_FLAGS) $(XRUN_GUI) $(TIMESCALE) \
		$(PC_DEP) $(SRC_DIR)/pc_tb.v \
		$(XRUN_LOG) $(LOG_DIR)/pc_gui.log

reg-gui:
	@mkdir -p $(LOG_DIR) $(WAVE_DIR)
	$(XRUN) $(XRUN_FLAGS) $(XRUN_GUI) $(TIMESCALE) \
		$(REG_DEP) $(SRC_DIR)/regfile_tb.v \
		$(XRUN_LOG) $(LOG_DIR)/reg_gui.log

switch-gui:
	@mkdir -p $(LOG_DIR) $(WAVE_DIR)
	$(XRUN) $(XRUN_FLAGS) $(XRUN_GUI) $(TIMESCALE) \
		$(SWITCH_DEP) $(SRC_DIR)/switch_tb.v \
		$(XRUN_LOG) $(LOG_DIR)/switch_gui.log

fsm-gui:
	@mkdir -p $(LOG_DIR) $(WAVE_DIR)
	$(XRUN) $(XRUN_FLAGS) $(XRUN_GUI) $(TIMESCALE) \
		$(FSM_DEP) $(SRC_DIR)/fsm_tb.v \
		$(XRUN_LOG) $(LOG_DIR)/fsm_gui.log

top-gui:
	@mkdir -p $(LOG_DIR) $(WAVE_DIR)
	$(XRUN) $(XRUN_FLAGS) $(XRUN_GUI) $(TIMESCALE) \
		$(TOP_DEP) $(SRC_DIR)/jsilicon_tb.v \
		$(XRUN_LOG) $(LOG_DIR)/top_gui.log

# ========================================
# SystemVerilog UVM 시뮬레이션
# ========================================

uvm:
	@mkdir -p $(LOG_DIR)
	$(XRUN) $(XRUN_FLAGS) $(XRUN_SV) $(TIMESCALE) \
		-uvmhome CDNS-1.2 \
		$(TOP_DEP) \
		$(UVM_FILES) \
		+UVM_TESTNAME=jsilicon_test \
		$(XRUN_LOG) $(LOG_DIR)/uvm.log
	@echo "✓ UVM 테스트 완료 - 로그: $(LOG_DIR)/uvm.log"

uvm-gui:
	@mkdir -p $(LOG_DIR) $(WAVE_DIR)
	$(XRUN) $(XRUN_FLAGS) $(XRUN_GUI) $(XRUN_SV) $(TIMESCALE) \
		-uvmhome CDNS-1.2 \
		$(TOP_DEP) \
		$(UVM_FILES) \
		+UVM_TESTNAME=jsilicon_test \
		$(XRUN_LOG) $(LOG_DIR)/uvm_gui.log

# ========================================
# 일괄 실행 타겟
# ========================================

test-all: alu uart decoder pc reg switch fsm top
	@echo ""
	@echo "========================================="
	@echo "모든 Verilog 테스트 완료!"
	@echo "========================================="
	@echo "로그 파일 위치: $(LOG_DIR)/"
	@ls -lh $(LOG_DIR)/*.log

regression:
	@echo "========================================="
	@echo "회귀 테스트 시작..."
	@echo "========================================="
	@mkdir -p $(LOG_DIR)
	@echo ""
	@echo "[1/9] ALU 테스트..."
	@$(MAKE) alu
	@echo ""
	@echo "[2/9] UART 테스트..."
	@$(MAKE) uart
	@echo ""
	@echo "[3/9] Decoder 테스트..."
	@$(MAKE) decoder
	@echo ""
	@echo "[4/9] PC 테스트..."
	@$(MAKE) pc
	@echo ""
	@echo "[5/9] Register File 테스트..."
	@$(MAKE) reg
	@echo ""
	@echo "[6/9] Switch 테스트..."
	@$(MAKE) switch
	@echo ""
	@echo "[7/9] FSM 테스트..."
	@$(MAKE) fsm
	@echo ""
	@echo "[8/9] Top 모듈 테스트..."
	@$(MAKE) top
	@echo ""
	@echo "[9/9] UVM 테스트..."
	@$(MAKE) uvm
	@echo ""
	@echo "========================================="
	@echo "회귀 테스트 완료!"
	@echo "========================================="
	@grep -H "PASS\|FAIL" $(LOG_DIR)/*.log || true

# ========================================
# 유틸리티 타겟
# ========================================

clean:
	@echo "생성된 파일 삭제 중..."
	rm -rf $(LOG_DIR)
	rm -rf $(WAVE_DIR)
	rm -rf INCA_libs
	rm -rf xcelium.d
	rm -f *.shm
	rm -f *.vcd
	rm -f *.log
	rm -f *.key
	rm -f .simvision
	rm -f *~
	rm -rf $(SRC_DIR)/*~
	rm -rf $(SIM_DIR)/*~
	@echo "✓ 삭제 완료"

waves:
	@mkdir -p $(WAVE_DIR)
	@mv *.vcd $(WAVE_DIR)/ 2>/dev/null || true
	@mv *.shm $(WAVE_DIR)/ 2>/dev/null || true
	@echo "✓ 파형 파일을 $(WAVE_DIR)/ 로 이동"

# ========================================
# 개별 모듈 컴파일 (의존성 체크용)
# ========================================

compile-alu:
	$(XRUN) -compile $(TIMESCALE) $(ALU_DEP)

compile-uart:
	$(XRUN) -compile $(TIMESCALE) $(UART_DEP)

compile-all:
	$(XRUN) -compile $(TIMESCALE) $(TOP_DEP)

# ========================================
# 문법 체크
# ========================================

syntax-check:
	@echo "문법 검사 중..."
	@$(XRUN) -compile $(TIMESCALE) $(ALU_DEP) 2>&1 | grep -i error || echo "✓ ALU 통과"
	@$(XRUN) -compile $(TIMESCALE) $(UART_DEP) 2>&1 | grep -i error || echo "✓ UART 통과"
	@$(XRUN) -compile $(TIMESCALE) $(DECODER_DEP) 2>&1 | grep -i error || echo "✓ Decoder 통과"
	@$(XRUN) -compile $(TIMESCALE) $(PC_DEP) 2>&1 | grep -i error || echo "✓ PC 통과"
	@$(XRUN) -compile $(TIMESCALE) $(REG_DEP) 2>&1 | grep -i error || echo "✓ Register File 통과"
	@$(XRUN) -compile $(TIMESCALE) $(SWITCH_DEP) 2>&1 | grep -i error || echo "✓ Switch 통과"
	@echo "✓ 문법 검사 완료"

.PHONY: alu uart decoder pc reg switch fsm top \
        alu-gui uart-gui decoder-gui pc-gui reg-gui switch-gui fsm-gui top-gui \
        uvm uvm-gui test-all regression clean waves \
        compile-alu compile-uart compile-all syntax-check