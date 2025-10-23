# ============================================================================
# Makefile for JSilicon Project - Cadence Xcelium Simulation
# ============================================================================
# Project Structure:
#   src/    - RTL design files (Verilog)
#   sim/    - Verilog testbenches
#   svsim/  - SystemVerilog UVM testbenches
#   work/   - Working directory for simulation outputs
# ============================================================================

# ============================================================================
# Directory Definitions
# ============================================================================
SRC_DIR     = src
SIM_DIR     = sim
SVSIM_DIR   = svsim
WORK_DIR    = work
LOG_DIR     = $(WORK_DIR)/logs
WAVE_DIR    = $(WORK_DIR)/waves

# ============================================================================
# Tool Settings
# ============================================================================
XRUN        = xrun
SIMVISION   = simvision

# ============================================================================
# Compiler Flags
# ============================================================================
# Common flags
COMMON_FLAGS = -access +rwc \
               -errormax 15 \
               -status

# Verilog-specific flags
VLOG_FLAGS  = $(COMMON_FLAGS) \
              -v93

# SystemVerilog UVM flags
SV_FLAGS    = $(COMMON_FLAGS) \
              -uvm \
              -uvmhome CDNS-1.2 \
              -64bit \
              -sv

# ============================================================================
# Simulation Flags
# ============================================================================
SIM_GUI_FLAGS = -gui

# UVM test configuration
UVM_TESTNAME  = jsilicon_test
UVM_VERBOSITY = UVM_MEDIUM

# ============================================================================
# File Lists
# ============================================================================
# RTL source files
RTL_FILES = $(SRC_DIR)/alu.v \
            $(SRC_DIR)/fsm.v \
            $(SRC_DIR)/inst.v \
            $(SRC_DIR)/pc.v \
            $(SRC_DIR)/regfile.v \
            $(SRC_DIR)/switch.v \
            $(SRC_DIR)/uart.v \
            $(SRC_DIR)/jsilicon.v

# Verilog testbench files
VLOG_TB_FILES = $(SIM_DIR)/alu_tb.v \
                $(SIM_DIR)/fsm_tb.v \
                $(SIM_DIR)/inst_tb.v \
                $(SIM_DIR)/pc_tb.v \
                $(SIM_DIR)/regfile_tb.v \
                $(SIM_DIR)/switch_tb.v \
                $(SIM_DIR)/uart_tb.v \
                $(SIM_DIR)/jsilicon_tb.v

# SystemVerilog UVM files (order matters for compilation)
SV_FILES = $(SVSIM_DIR)/jsilicon_if.sv \
           $(SVSIM_DIR)/jsilicon_transaction.sv \
           $(SVSIM_DIR)/jsilicon_sequences.sv \
           $(SVSIM_DIR)/jsilicon_driver.sv \
           $(SVSIM_DIR)/jsilicon_monitor.sv \
           $(SVSIM_DIR)/jsilicon_agent.sv \
           $(SVSIM_DIR)/jsilicon_scoreboard.sv \
           $(SVSIM_DIR)/jsilicon_env.sv \
           $(SVSIM_DIR)/jsilicon_test.sv \
           $(SVSIM_DIR)/jsilicon_pkg.sv \
           $(SVSIM_DIR)/jsilicon_tb_top.sv

# ============================================================================
# Default Target
# ============================================================================
.PHONY: all
all: help

# ============================================================================
# Help Target
# ============================================================================
.PHONY: help
help:
	@echo "========================================================================"
	@echo "  JSilicon Project - Cadence Xcelium Simulation Makefile"
	@echo "========================================================================"
	@echo ""
	@echo "Directory Structure:"
	@echo "  src/    - RTL design files"
	@echo "  sim/    - Verilog testbenches"
	@echo "  svsim/  - SystemVerilog UVM testbenches"
	@echo "  work/   - Simulation outputs (logs, waves)"
	@echo ""
	@echo "========================================================================"
	@echo "Available Targets:"
	@echo "========================================================================"
	@echo ""
	@echo "Setup:"
	@echo "  make setup          - Create directory structure"
	@echo ""
	@echo "Individual Module Tests (Verilog):"
	@echo "  make sim_alu        - Simulate ALU module"
	@echo "  make sim_fsm        - Simulate FSM module"
	@echo "  make sim_inst       - Simulate Instruction module"
	@echo "  make sim_pc         - Simulate Program Counter"
	@echo "  make sim_regfile    - Simulate Register File"
	@echo "  make sim_switch     - Simulate Switch module"
	@echo "  make sim_uart       - Simulate UART module"
	@echo ""
	@echo "GUI Mode (with waveform viewer):"
	@echo "  make sim_alu_gui    - Simulate ALU with GUI"
	@echo "  make sim_fsm_gui    - Simulate FSM with GUI"
	@echo "  make sim_uart_gui   - Simulate UART with GUI"
	@echo ""
	@echo "System-Level Tests:"
	@echo "  make sim_jsilicon   - Simulate JSilicon (Verilog TB)"
	@echo "  make sim_sv         - Simulate JSilicon (SystemVerilog UVM)"
	@echo "  make sim_sv_gui     - Simulate JSilicon (SV UVM with GUI)"
	@echo ""
	@echo "Batch Simulations:"
	@echo "  make sim_all        - Run all Verilog module tests"
	@echo "  make regression     - Run complete regression (Verilog + SV)"
	@echo ""
	@echo "Python-based Testing (Cocotb):"
	@echo "  make cocotb_help    - Show Cocotb usage information"
	@echo "  make -f Makefile.cocotb - Run Cocotb tests (requires cocotb)"
	@echo ""
	@echo "Utilities:"
	@echo "  make view_wave      - Open waveform viewer"
	@echo "  make clean          - Clean simulation files"
	@echo "  make clean_all      - Clean all generated files"
	@echo "  make clean_vcd      - Clean only VCD files"
	@echo "  make clean_logs     - Clean only log files"
	@echo "  make list_files     - List all source files"
	@echo ""
	@echo "========================================================================"

# ============================================================================
# Setup Target - Create Directory Structure
# ============================================================================
.PHONY: setup
setup:
	@echo "Creating directory structure..."
	@mkdir -p $(SRC_DIR)
	@mkdir -p $(SIM_DIR)
	@mkdir -p $(SVSIM_DIR)
	@mkdir -p $(WORK_DIR)
	@mkdir -p $(LOG_DIR)
	@mkdir -p $(WAVE_DIR)
	@echo "Directory structure created successfully!"
	@echo ""
	@echo "Please place your files in the following directories:"
	@echo "  - RTL files      -> $(SRC_DIR)/"
	@echo "  - Verilog TBs    -> $(SIM_DIR)/"
	@echo "  - SystemVerilog  -> $(SVSIM_DIR)/"

# ============================================================================
# Individual Verilog Module Simulations
# ============================================================================
# NOTE: Module dependencies and compilation order:
#   - FSM depends on UART_TX (uart.v must be compiled first)
#   - jsilicon depends on all other modules
# ============================================================================

.PHONY: sim_alu
sim_alu: $(WORK_DIR)
	@echo "========================================"
	@echo "Running ALU Simulation..."
	@echo "========================================"
	cd $(WORK_DIR) && $(XRUN) $(VLOG_FLAGS) \
		../$(SRC_DIR)/alu.v \
		../$(SIM_DIR)/alu_tb.v \
		-top ALU_tb \
		-log $(LOG_DIR)/alu_sim.log

.PHONY: sim_fsm
sim_fsm: $(WORK_DIR)
	@echo "========================================"
	@echo "Running FSM Simulation..."
	@echo "========================================"
	@echo "Note: Compiling UART first (FSM dependency)"
	cd $(WORK_DIR) && $(XRUN) $(VLOG_FLAGS) \
		../$(SRC_DIR)/uart.v \
		../$(SRC_DIR)/fsm.v \
		../$(SIM_DIR)/fsm_tb.v \
		-log $(LOG_DIR)/fsm_sim.log

.PHONY: sim_inst
sim_inst: $(WORK_DIR)
	@echo "========================================"
	@echo "Running Instruction Module Simulation..."
	@echo "========================================"
	cd $(WORK_DIR) && $(XRUN) $(VLOG_FLAGS) \
		../$(SRC_DIR)/inst.v \
		../$(SIM_DIR)/inst_tb.v \
		-log $(LOG_DIR)/inst_sim.log

.PHONY: sim_pc
sim_pc: $(WORK_DIR)
	@echo "========================================"
	@echo "Running Program Counter Simulation..."
	@echo "========================================"
	cd $(WORK_DIR) && $(XRUN) $(VLOG_FLAGS) \
		../$(SRC_DIR)/pc.v \
		../$(SIM_DIR)/pc_tb.v \
		-log $(LOG_DIR)/pc_sim.log

.PHONY: sim_regfile
sim_regfile: $(WORK_DIR)
	@echo "========================================"
	@echo "Running Register File Simulation..."
	@echo "========================================"
	cd $(WORK_DIR) && $(XRUN) $(VLOG_FLAGS) \
		../$(SRC_DIR)/regfile.v \
		../$(SIM_DIR)/regfile_tb.v \
		-log $(LOG_DIR)/regfile_sim.log

.PHONY: sim_switch
sim_switch: $(WORK_DIR)
	@echo "========================================"
	@echo "Running Switch Simulation..."
	@echo "========================================"
	cd $(WORK_DIR) && $(XRUN) $(VLOG_FLAGS) \
		../$(SRC_DIR)/switch.v \
		../$(SIM_DIR)/switch_tb.v \
		-log $(LOG_DIR)/switch_sim.log

.PHONY: sim_uart
sim_uart: $(WORK_DIR)
	@echo "========================================"
	@echo "Running UART Simulation..."
	@echo "========================================"
	cd $(WORK_DIR) && $(XRUN) $(VLOG_FLAGS) \
		../$(SRC_DIR)/uart.v \
		../$(SIM_DIR)/uart_tb.v \
		-log $(LOG_DIR)/uart_sim.log

# ============================================================================
# GUI Mode Simulations (with waveform viewer)
# ============================================================================
.PHONY: sim_alu_gui
sim_alu_gui: $(WORK_DIR)
	@echo "========================================"
	@echo "Running ALU Simulation (GUI Mode)..."
	@echo "========================================"
	cd $(WORK_DIR) && $(XRUN) $(VLOG_FLAGS) \
		-gui \
		../$(SRC_DIR)/alu.v \
		../$(SIM_DIR)/alu_tb.v \
		-top ALU_tb \
		-log $(LOG_DIR)/alu_sim_gui.log

.PHONY: sim_fsm_gui
sim_fsm_gui: $(WORK_DIR)
	@echo "========================================"
	@echo "Running FSM Simulation (GUI Mode)..."
	@echo "========================================"
	cd $(WORK_DIR) && $(XRUN) $(VLOG_FLAGS) \
		-gui \
		../$(SRC_DIR)/uart.v \
		../$(SRC_DIR)/fsm.v \
		../$(SIM_DIR)/fsm_tb.v \
		-log $(LOG_DIR)/fsm_sim_gui.log

.PHONY: sim_uart_gui
sim_uart_gui: $(WORK_DIR)
	@echo "========================================"
	@echo "Running UART Simulation (GUI Mode)..."
	@echo "========================================"
	cd $(WORK_DIR) && $(XRUN) $(VLOG_FLAGS) \
		-gui \
		../$(SRC_DIR)/uart.v \
		../$(SIM_DIR)/uart_tb.v \
		-log $(LOG_DIR)/uart_sim_gui.log

# ============================================================================
# System-Level Verilog Simulation
# ============================================================================
.PHONY: sim_jsilicon
sim_jsilicon: $(WORK_DIR)
	@echo "========================================"
	@echo "Running JSilicon System Simulation (Verilog)..."
	@echo "========================================"
	cd $(WORK_DIR) && $(XRUN) $(VLOG_FLAGS) \
		$(addprefix ../,$(RTL_FILES)) \
		../$(SIM_DIR)/jsilicon_tb.v \
		-log $(LOG_DIR)/jsilicon_sim.log

# ============================================================================
# SystemVerilog UVM Simulation
# ============================================================================
.PHONY: sim_sv
sim_sv: $(WORK_DIR)
	@echo "========================================"
	@echo "Running JSilicon SystemVerilog UVM Simulation..."
	@echo "========================================"
	cd $(WORK_DIR) && $(XRUN) $(SV_FLAGS) \
		$(addprefix ../,$(RTL_FILES)) \
		$(addprefix ../,$(SV_FILES)) \
		-top jsilicon_tb_top \
		+UVM_TESTNAME=$(UVM_TESTNAME) \
		+UVM_VERBOSITY=$(UVM_VERBOSITY) \
		-log $(LOG_DIR)/jsilicon_sv_sim.log

.PHONY: sim_sv_gui
sim_sv_gui: $(WORK_DIR)
	@echo "========================================"
	@echo "Running JSilicon SystemVerilog UVM Simulation (GUI)..."
	@echo "========================================"
	cd $(WORK_DIR) && $(XRUN) $(SV_FLAGS) \
		-gui \
		$(addprefix ../,$(RTL_FILES)) \
		$(addprefix ../,$(SV_FILES)) \
		-top jsilicon_tb_top \
		+UVM_TESTNAME=$(UVM_TESTNAME) \
		+UVM_VERBOSITY=$(UVM_VERBOSITY) \
		-log $(LOG_DIR)/jsilicon_sv_gui.log

.PHONY: sim_sv_debug
sim_sv_debug: $(WORK_DIR)
	@echo "========================================"
	@echo "Running JSilicon SV Simulation (Debug Mode)..."
	@echo "========================================"
	cd $(WORK_DIR) && $(XRUN) $(SV_FLAGS) \
		-gui \
		$(addprefix ../,$(RTL_FILES)) \
		$(addprefix ../,$(SV_FILES)) \
		-top jsilicon_tb_top \
		+UVM_TESTNAME=$(UVM_TESTNAME) \
		+UVM_VERBOSITY=UVM_HIGH \
		-log $(LOG_DIR)/jsilicon_sv_debug.log

# ============================================================================
# Coverage Simulation
# ============================================================================
.PHONY: sim_sv_cov
sim_sv_cov: $(WORK_DIR)
	@echo "========================================"
	@echo "Running SV Simulation with Coverage..."
	@echo "========================================"
	cd $(WORK_DIR) && $(XRUN) $(SV_FLAGS) \
		-coverage all \
		-covoverwrite \
		$(addprefix ../,$(RTL_FILES)) \
		$(addprefix ../,$(SV_FILES)) \
		-top jsilicon_tb_top \
		+UVM_TESTNAME=$(UVM_TESTNAME) \
		-log $(LOG_DIR)/jsilicon_sv_cov.log

# ============================================================================
# Cocotb Python-based Testing
# ============================================================================
# Cocotb uses Python to drive the simulation
# Requirements: cocotb, pytest (install via: pip install cocotb pytest)
#
# Files needed:
#   - tb.v: Verilog wrapper for Cocotb
#   - test.py: Python test script
#   - Makefile.cocotb: Cocotb-specific Makefile (optional)

.PHONY: sim_cocotb
sim_cocotb:
	@echo "========================================"
	@echo "Running Cocotb Python-based Test..."
	@echo "========================================"
	@if [ ! -f "tb.v" ] || [ ! -f "test.py" ]; then \
		echo "Error: Cocotb files not found!"; \
		echo "Required files:"; \
		echo "  - tb.v (Verilog wrapper)"; \
		echo "  - test.py (Python test)"; \
		exit 1; \
	fi
	@echo "Note: Cocotb requires separate installation"
	@echo "Install with: pip install cocotb"
	@echo ""
	@echo "To run Cocotb tests, use:"
	@echo "  make -f Makefile.cocotb"
	@echo "Or manually:"
	@echo "  cocotb-run --verilog-sources=tb.v,src/*.v --python-test=test.py"

.PHONY: cocotb_help
cocotb_help:
	@echo "========================================"
	@echo "Cocotb Testing Information"
	@echo "========================================"
	@echo ""
	@echo "Cocotb is a Python-based verification framework."
	@echo ""
	@echo "Setup:"
	@echo "  1. Install Cocotb: pip install cocotb"
	@echo "  2. Place tb.v in project root"
	@echo "  3. Place test.py in project root"
	@echo ""
	@echo "Running Cocotb with Xcelium:"
	@echo "  export SIM=xcelium"
	@echo "  make -f Makefile.cocotb"
	@echo ""
	@echo "Output:"
	@echo "  - tb.vcd: Waveform file (view with gtkwave)"
	@echo "  - results.xml: Test results"
	@echo ""
	@echo "More info: https://docs.cocotb.org"
	@echo "========================================"

# ============================================================================
# Batch Simulations
# ============================================================================
.PHONY: sim_all
sim_all: sim_alu sim_fsm sim_inst sim_pc sim_regfile sim_switch sim_uart sim_jsilicon
	@echo ""
	@echo "========================================"
	@echo "All Verilog Simulations Completed!"
	@echo "========================================"
	@echo "Check logs in: $(LOG_DIR)/"

.PHONY: regression
regression: sim_all sim_sv
	@echo ""
	@echo "========================================"
	@echo "Complete Regression Test Completed!"
	@echo "========================================"
	@echo "Verilog Tests: DONE"
	@echo "SystemVerilog UVM Tests: DONE"
	@echo ""
	@echo "All logs available in: $(LOG_DIR)/"

# ============================================================================
# Utilities
# ============================================================================
.PHONY: view_wave
view_wave:
	@echo "========================================"
	@echo "Opening Waveform Viewer..."
	@echo "========================================"
	@if [ -d "$(WORK_DIR)/xcelium.d" ] || [ -d "$(WORK_DIR)/waves.shm" ]; then \
		echo "Opening SimVision..."; \
		cd $(WORK_DIR) && $(SIMVISION) &; \
	else \
		echo "Error: No simulation database found!"; \
		echo "Please run a GUI simulation first:"; \
		echo "  make sim_alu_gui"; \
		echo "  make sim_fsm_gui"; \
		echo "  make sim_sv_gui"; \
	fi

.PHONY: list_files
list_files:
	@echo "========================================"
	@echo "RTL Source Files ($(SRC_DIR)):"
	@echo "========================================"
	@ls -1 $(SRC_DIR)/*.v 2>/dev/null || echo "No files found"
	@echo ""
	@echo "========================================"
	@echo "Verilog Testbenches ($(SIM_DIR)):"
	@echo "========================================"
	@ls -1 $(SIM_DIR)/*_tb.v 2>/dev/null || echo "No files found"
	@echo ""
	@echo "========================================"
	@echo "SystemVerilog Files ($(SVSIM_DIR)):"
	@echo "========================================"
	@ls -1 $(SVSIM_DIR)/*.sv 2>/dev/null || echo "No files found"

.PHONY: check_files
check_files:
	@echo "Checking for missing files..."
	@echo ""
	@echo "RTL Files:"
	@for file in $(RTL_FILES); do \
		if [ -f "$$file" ]; then \
			echo "  ✓ $$file"; \
		else \
			echo "  ✗ $$file (MISSING)"; \
		fi; \
	done
	@echo ""
	@echo "Verilog Testbenches:"
	@for file in $(VLOG_TB_FILES); do \
		if [ -f "$$file" ]; then \
			echo "  ✓ $$file"; \
		else \
			echo "  ✗ $$file (MISSING)"; \
		fi; \
	done
	@echo ""
	@echo "SystemVerilog Files:"
	@for file in $(SV_FILES); do \
		if [ -f "$$file" ]; then \
			echo "  ✓ $$file"; \
		else \
			echo "  ✗ $$file (MISSING)"; \
		fi; \
	done

# ============================================================================
# Clean Targets
# ============================================================================
.PHONY: clean
clean:
	@echo "Cleaning simulation files..."
	rm -rf $(WORK_DIR)/xcelium.d
	rm -rf $(WORK_DIR)/INCA_libs
	rm -rf $(WORK_DIR)/waves.shm
	rm -rf $(WORK_DIR)/.simvision
	rm -rf $(WORK_DIR)/work
	rm -f $(WORK_DIR)/*.log
	rm -f $(WORK_DIR)/*.key
	rm -f $(WORK_DIR)/*.vcd
	rm -f $(WORK_DIR)/xrun.history
	@echo "Simulation files cleaned."

.PHONY: clean_all
clean_all: clean
	@echo "Cleaning all generated files..."
	rm -rf $(WORK_DIR)
	rm -rf cov_work
	rm -f *.vcd
	rm -f *.fsdb
	rm -f xrun.log
	rm -f xrun.history
	@echo "All generated files cleaned."

.PHONY: clean_vcd
clean_vcd:
	@echo "Cleaning VCD files..."
	rm -f $(WORK_DIR)/*.vcd
	rm -f *.vcd
	@echo "VCD files cleaned."

.PHONY: clean_logs
clean_logs:
	@echo "Cleaning log files..."
	rm -rf $(LOG_DIR)/*.log
	rm -f $(WORK_DIR)/*.log
	rm -f *.log
	@echo "Log files cleaned."

# ============================================================================
# Work Directory Creation
# ============================================================================
$(WORK_DIR):
	@mkdir -p $(WORK_DIR)
	@mkdir -p $(LOG_DIR)
	@mkdir -p $(WAVE_DIR)

# ============================================================================
# Debug Information
# ============================================================================
.PHONY: debug_info
debug_info:
	@echo "========================================"
	@echo "Makefile Configuration"
	@echo "========================================"
	@echo "SRC_DIR    = $(SRC_DIR)"
	@echo "SIM_DIR    = $(SIM_DIR)"
	@echo "SVSIM_DIR  = $(SVSIM_DIR)"
	@echo "WORK_DIR   = $(WORK_DIR)"
	@echo "LOG_DIR    = $(LOG_DIR)"
	@echo "WAVE_DIR   = $(WAVE_DIR)"
	@echo ""
	@echo "XRUN       = $(XRUN)"
	@echo "VLOG_FLAGS = $(VLOG_FLAGS)"
	@echo "SV_FLAGS   = $(SV_FLAGS)"
	@echo ""
	@echo "RTL Files  = $(words $(RTL_FILES)) files"
	@echo "TB Files   = $(words $(VLOG_TB_FILES)) files"
	@echo "SV Files   = $(words $(SV_FILES)) files"
	@echo "========================================"

# ============================================================================
# End of Makefile
# ============================================================================
