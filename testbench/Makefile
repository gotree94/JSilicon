# Makefile for Xcelsium (Verilog-1995) Simulation
# Jsilicon Design Testbenches

# Compiler settings
VCS = xrun
VCSFLAGS = -sv -access +rwc -linedebug -gui
VLOGFLAGS = +v2k -access +rwc

# Source files directory
SRC_DIR = ..
TB_DIR = .

# Design source files
ALU_SRC = $(SRC_DIR)/alu.v
UART_SRC = $(SRC_DIR)/uart.v
PC_SRC = $(SRC_DIR)/pc.v
INST_SRC = $(SRC_DIR)/inst.v
REG_SRC = $(SRC_DIR)/regfile.v
SWITCH_SRC = $(SRC_DIR)/switch.v
FSM_SRC = $(SRC_DIR)/fsm.v
TOP_SRC = $(SRC_DIR)/jsilicon.v

# Testbench files
TB_ALU = ../tb_alu.v
TB_UART = ../tb_uart.v
TB_PC = ../tb_pc.v
TB_DECODER = ../tb_decoder.v
TB_REG = ../tb_reg.v
TB_SWITCH = ../tb_switch.v
TB_FSM = ../tb_fsm.v
TB_TOP = ../tb_jsilicon_top.v

# Default target
all: help

help:
	@echo "=========================================="
	@echo "Jsilicon Testbench Simulation Makefile"
	@echo "=========================================="
	@echo "Available targets:"
	@echo "  make alu       - Simulate ALU module"
	@echo "  make uart      - Simulate UART module"
	@echo "  make pc        - Simulate PC module"
	@echo "  make decoder   - Simulate DECODER module"
	@echo "  make reg       - Simulate REG module"
	@echo "  make switch    - Simulate SWITCH module"
	@echo "  make fsm       - Simulate FSM module"
	@echo "  make top       - Simulate TOP module (full system)"
	@echo "  make all_tests - Run all testbenches"
	@echo "  make clean     - Clean simulation files"
	@echo "=========================================="

# Individual module simulations
alu:
	@echo "Running ALU testbench..."
	$(VCS) $(VLOGFLAGS) $(ALU_SRC) $(TB_ALU) -o alu_sim
	./alu_sim

uart:
	@echo "Running UART testbench..."
	$(VCS) $(VLOGFLAGS) $(UART_SRC) $(TB_UART) -o uart_sim
	./uart_sim

pc:
	@echo "Running PC testbench..."
	$(VCS) $(VLOGFLAGS) $(PC_SRC) $(TB_PC) -o pc_sim
	./pc_sim

decoder:
	@echo "Running DECODER testbench..."
	$(VCS) $(VLOGFLAGS) $(INST_SRC) $(TB_DECODER) -o decoder_sim
	./decoder_sim

reg:
	@echo "Running REG testbench..."
	$(VCS) $(VLOGFLAGS) $(REG_SRC) $(TB_REG) -o reg_sim
	./reg_sim

switch:
	@echo "Running SWITCH testbench..."
	$(VCS) $(VLOGFLAGS) $(SWITCH_SRC) $(TB_SWITCH) -o switch_sim
	./switch_sim

fsm:
	@echo "Running FSM testbench..."
	$(VCS) $(VLOGFLAGS) $(ALU_SRC) $(UART_SRC) $(FSM_SRC) $(TB_FSM) -o fsm_sim
	./fsm_sim

top:
	@echo "Running TOP module testbench..."
	$(VCS) $(VLOGFLAGS) $(ALU_SRC) $(UART_SRC) $(PC_SRC) $(INST_SRC) \
	       $(REG_SRC) $(SWITCH_SRC) $(FSM_SRC) $(TOP_SRC) $(TB_TOP) -o top_sim
	./top_sim

# Run all tests
all_tests: alu uart pc decoder reg switch fsm top
	@echo "=========================================="
	@echo "All testbenches completed!"
	@echo "=========================================="

# Clean targets
clean:
	@echo "Cleaning simulation files..."
	rm -rf *.log *.vcd *.key *_sim
	rm -rf xcelium.d simv* csrc *.daidir
	rm -rf INCA_libs waves.shm
	@echo "Clean complete!"

.PHONY: all help alu uart pc decoder reg switch fsm top all_tests clean
