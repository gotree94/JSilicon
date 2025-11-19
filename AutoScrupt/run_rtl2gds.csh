#!/bin/tcsh
################################################################################
# JSilicon RTL-to-GDS Automation (Python Helper 사용)
################################################################################

set DESIGN_NAME = "tt_um_Jsilicon"

echo ""
echo "=============================================================================="
echo "  JSilicon RTL-to-GDS Automation Flow"
echo "=============================================================================="
echo ""

set PROJECT_ROOT = `pwd`
echo "Project Root: ${PROJECT_ROOT}"

if (`basename ${PROJECT_ROOT}` != "JSilicon2") then
    echo "[ERROR] Must run from JSilicon2 directory"
    exit 1
endif

set LOG_DIR = "${PROJECT_ROOT}/logs"
mkdir -p ${LOG_DIR}

set START_TIME = `date +%s`
echo "Start: `date '+%Y-%m-%d %H:%M:%S'`" | tee ${LOG_DIR}/flow_summary.log
echo ""

# 환경 확인
echo "[INFO] Checking environment..."
which genus >& /dev/null
if ($status != 0) then
    echo "[ERROR] Genus not found"
    exit 1
endif

which innovus >& /dev/null
if ($status != 0) then
    echo "[ERROR] Innovus not found"
    exit 1
endif

which python3 >& /dev/null
if ($status != 0) then
    which python >& /dev/null
    if ($status != 0) then
        echo "[ERROR] Python not found"
        exit 1
    endif
    set PYTHON = "python"
else
    set PYTHON = "python3"
endif

echo "[OK] Environment ready"
echo ""

# 디렉토리 생성
echo "Creating directories..."
mkdir -p constraints scripts/genus scripts/innovus
mkdir -p work/{synthesis,pnr,sta}
mkdir -p results/{netlist,def,gds,timing,extraction,lvs}
mkdir -p reports/{synthesis,pnr,sta,final,drc}
echo "[OK] Directories ready"
echo ""

# 파일 확인
echo "Checking files..."
set FILES_OK = 1

foreach file (alu.v fsm.v inst.v pc.v regfile.v switch.v uart.v jsilicon.v)
    if (! -f src/${file}) then
        echo "  [X] src/${file}"
        set FILES_OK = 0
    endif
end

if (! -f tech/lib/gscl45nm.lib) then
    echo "  [X] tech/lib/gscl45nm.lib"
    set FILES_OK = 0
endif

if (! -f tech/lef/gscl45nm.lef) then
    echo "  [X] tech/lef/gscl45nm.lef"
    set FILES_OK = 0
endif

if ($FILES_OK == 0) then
    echo "[ERROR] Files missing"
    exit 1
endif

echo "[OK] All files present"
echo ""

# Python 스크립트 복사
if (! -f create_scripts.py) then
    cp /home/claude/create_scripts.py .
    if ($status != 0) then
        echo "[ERROR] Cannot copy create_scripts.py"
        exit 1
    endif
endif

# TCL 스크립트 생성
echo "Creating TCL scripts..."
${PYTHON} create_scripts.py
if ($status != 0) then
    echo "[ERROR] Script generation failed"
    exit 1
endif
echo ""

# 사용자 확인
echo "=============================================================================="
echo ""
echo "Ready to run RTL-to-GDS flow"
echo ""
echo "Stages:"
echo "  1. Synthesis (Genus)      ~2-3 min"
echo "  2. P&R (Innovus)          ~10-15 min"
echo "  3. GDS Generation         ~1-2 min"
echo ""
echo "Total: ~15-20 minutes"
echo ""
echo -n "Continue? (y/n): "
set answer = $<

if ("$answer" != "y" && "$answer" != "Y") then
    echo ""
    echo "Scripts ready. Run manually:"
    echo "  cd work/synthesis"
    echo "  genus -f ../../scripts/genus/synthesis.tcl"
    exit 0
endif

################################################################################
# 합성 실행
################################################################################

echo ""
echo "=============================================================================="
echo "Stage 1: Synthesis"
echo "=============================================================================="
echo ""

cd ${PROJECT_ROOT}/work/synthesis

echo "Running Genus... (this may take 2-3 minutes)"
genus -f ../../scripts/genus/synthesis.tcl |& tee ${LOG_DIR}/synthesis.log

if ($status != 0) then
    echo "[ERROR] Synthesis failed"
    echo "Check: ${LOG_DIR}/synthesis.log"
    exit 1
endif

if (! -f ../../results/netlist/tt_um_Jsilicon_synth.v) then
    echo "[ERROR] Netlist not generated"
    exit 1
endif

echo ""
echo "[OK] Synthesis complete"
echo ""

# 합성 결과 확인
if (-f ../../reports/synthesis/qor.rpt) then
    echo "QoR Summary:"
    echo "----------------------------------------------------------------------"
    grep -A 5 "Timing" ../../reports/synthesis/qor.rpt | head -8
    echo "----------------------------------------------------------------------"
    echo ""
endif

################################################################################
# P&R 실행
################################################################################

echo "=============================================================================="
echo "Stage 2: Place & Route"
echo "=============================================================================="
echo ""

cd ${PROJECT_ROOT}/work/pnr

echo "Running Innovus... (this may take 10-15 minutes)"
innovus -init ../../scripts/innovus/pnr_flow.tcl |& tee ${LOG_DIR}/pnr.log

if ($status != 0) then
    echo "[ERROR] P&R failed"
    echo "Check: ${LOG_DIR}/pnr.log"
    exit 1
endif

if (! -f ../../results/def/tt_um_Jsilicon.def) then
    echo "[ERROR] DEF not generated"
    exit 1
endif

echo ""
echo "[OK] P&R complete"
echo ""

################################################################################
# GDS 생성
################################################################################

echo "=============================================================================="
echo "Stage 3: GDS Generation"
echo "=============================================================================="
echo ""

cd ${PROJECT_ROOT}/work/pnr

echo "Running GDS generation..."
innovus -init ../../scripts/innovus/generate_gds.tcl |& tee ${LOG_DIR}/gds.log

if ($status != 0) then
    echo "[ERROR] GDS failed"
    echo "Check: ${LOG_DIR}/gds.log"
    exit 1
endif

if (! -f ../../results/gds/tt_um_Jsilicon.gds) then
    echo "[ERROR] GDS not generated"
    exit 1
endif

echo ""
echo "[OK] GDS complete"
echo ""

################################################################################
# 최종 결과
################################################################################

cd ${PROJECT_ROOT}

set END_TIME = `date +%s`
set ELAPSED = `expr ${END_TIME} - ${START_TIME}`
set ELAPSED_MIN = `expr ${ELAPSED} / 60`
set ELAPSED_SEC = `expr ${ELAPSED} % 60`

echo ""
echo "=============================================================================="
echo "                   RTL-TO-GDS FLOW COMPLETE!"
echo "=============================================================================="
echo ""
echo "Runtime: ${ELAPSED_MIN}m ${ELAPSED_SEC}s"
echo ""

echo "DELIVERABLES:"
echo "------------------------------------------------------------------------------"
if (-f results/gds/tt_um_Jsilicon.gds) then
    ls -lh results/gds/tt_um_Jsilicon.gds
endif
if (-f results/def/tt_um_Jsilicon.def) then
    ls -lh results/def/tt_um_Jsilicon.def
endif
if (-f results/netlist/tt_um_Jsilicon_final.v) then
    ls -lh results/netlist/tt_um_Jsilicon_final.v
endif
if (-f results/extraction/tt_um_Jsilicon.spef) then
    ls -lh results/extraction/tt_um_Jsilicon.spef
endif
echo ""

echo "REPORTS:"
echo "------------------------------------------------------------------------------"
echo "  Synthesis:  reports/synthesis/qor.rpt"
echo "  P&R:        reports/pnr/summary.rpt"
echo "  Final:      reports/final/summary.rpt"
echo "  Logs:       logs/"
echo ""

echo "TIMING CHECK:"
echo "------------------------------------------------------------------------------"
if (-f reports/pnr/timing_summary.rpt) then
    head -20 reports/pnr/timing_summary.rpt
endif
echo ""

echo "=============================================================================="
echo ""

exit 0