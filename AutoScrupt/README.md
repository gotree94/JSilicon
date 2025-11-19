# JSilicon Auto Script


## 📚 목차 (Table of Contents)

1. [Miniconda 설치](#1-miniconda-설치)  
2. [사전준비](#2-사전준비)  
3. [프로젝트 생성 및 Auto Script 실행](#3-프로젝트-생성-및-auto-script-실행)


## 1. miniconda 설치

```
wget https://repo.anaconda.com/miniconda/Miniconda3-py310_23.3.1-0-Linux-x86_64.sh
```

```
--2025-11-19 11:32:11--  https://repo.anaconda.com/miniconda/Miniconda3-py310_23.3.1-0-Linux-x86_64.sh
Resolving repo.anaconda.com (repo.anaconda.com)... 104.16.191.158, 104.16.32.241, 2606:4700::6810:bf9e, ...
Connecting to repo.anaconda.com (repo.anaconda.com)|104.16.191.158|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 73134376 (70M) [application/x-sh]
Saving to: 'Miniconda3-py310_23.3.1-0-Linux-x86_64.sh'

100%[====================================================================================================================================================================>] 73,134,376  10.9MB/s   in 6.3s

2025-11-19 11:32:17 (11.1 MB/s) - 'Miniconda3-py310_23.3.1-0-Linux-x86_64.sh' saved [73134376/73134376]
```

```
[student018@gjchamber ~]$ bash Miniconda3-py310_23.3.1-0-Linux-x86_64.sh
Welcome to Miniconda3 py310_23.3.1-0

In order to continue the installation process, please review the license
agreement.
Please, press ENTER to continue
>>>

```

```
======================================
End User License Agreement - Miniconda
======================================

Copyright 2015-2023, Anaconda, Inc.

All rights reserved under the 3-clause BSD License:

This End User License Agreement (the "Agreement") is a legal agreement between you and Anaconda, Inc. ("Anaconda") and governs your use of Miniconda.

Subject to the terms of this Agreement, Anaconda hereby grants you a non-exclusive, non-transferable license to:

  * Install and use the Miniconda,
  * Modify and create derivative works of sample source code delivered in Miniconda subject to the Terms of Service for the Repository (as defined hereinafter) available at https://www.anaconda.com/terms-of
-service, and
  * Redistribute code files in source (if provided to you by Anaconda as source) and binary forms, with or without modification subject to the requirements set forth below.

Anaconda may, at its option, make available patches, workarounds or other updates to Miniconda. Unless the updates are provided with their separate governing terms, they are deemed part of Miniconda license
d to you as provided in this Agreement. This Agreement does not entitle you to any support for Miniconda.

Anaconda reserves all rights not expressly granted to you in this Agreement.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

  * Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
  * Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
  * Neither the name of Anaconda nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

You acknowledge that, as between you and Anaconda, Anaconda owns all right, title, and interest, including all intellectual property rights, in and to Miniconda and, with respect to third-party products dis
tributed with or through Miniconda, the applicable third-party licensors own all right, title and interest, including all intellectual property rights, in and to such products. If you send or transmit any c
ommunications or materials to Anaconda suggesting or recommending changes to the software or documentation, including without limitation, new features or functionality relating thereto, or any comments, que
stions, suggestions or the like ("Feedback"), Anaconda is free to use such Feedback. You hereby assign to Anaconda all right, title, and interest in, and Anaconda is free to use, without any attribution or
compensation to any party, any ideas, know-how, concepts, techniques or other intellectual property rights contained in the Feedback, for any purpose whatsoever, although Anaconda is not required to use any
 Feedback.

DISCLAIMER
==========

THIS SOFTWARE IS PROVIDED BY ANACONDA AND ITS CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULA
R PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL ANACONDA BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GO
ODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) AR
ISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

TO THE MAXIMUM EXTENT PERMITTED BY LAW, ANACONDA AND ITS AFFILIATES SHALL NOT BE LIABLE FOR ANY SPECIAL, INCIDENTAL, PUNITIVE OR CONSEQUENTIAL DAMAGES, OR ANY LOST PROFITS, LOSS OF USE, LOSS OF DATA OR LOSS
 OF GOODWILL, OR THE COSTS OF PROCURING SUBSTITUTE PRODUCTS, ARISING OUT OF OR IN CONNECTION WITH THIS AGREEMENT OR THE USE OR PERFORMANCE OF MINICONDA, WHETHER SUCH LIABILITY ARISES FROM ANY CLAIM BASED UP
ON BREACH OF CONTRACT, BREACH OF WARRANTY, TORT (INCLUDING NEGLIGENCE), PRODUCT LIABILITY OR ANY OTHER CAUSE OF ACTION OR THEORY OF LIABILITY. IN NO EVENT WILL THE TOTAL CUMULATIVE LIABILITY OF ANACONDA AND
 ITS AFFILIATES UNDER OR ARISING OUT OF THIS AGREEMENT EXCEED 10.00 U.S. DOLLARS.

Miscellaneous
=============

If you want to terminate this Agreement, you may do so by discontinuing use of Miniconda. Anaconda may, at any time, terminate this Agreement and the license granted hereunder if you fail to comply with any
 term of this Agreement. Upon any termination of this Agreement, you agree to promptly discontinue use of the Miniconda and destroy all copies in your possession or control. Upon any termination of this Agr
eement all provisions survive except for the licenses granted to you.

This Agreement is governed by and construed in accordance with the internal laws of the State of Texas without giving effect to any choice or conflict of law provision or rule that would require or permit t
he application of the laws of any jurisdiction other than those of the State of Texas. Any legal suit, action, or proceeding arising out of or related to this Agreement or the licenses granted hereunder by
--More--




You must comply with all domestic and international export laws and regulations that apply to the software, which include restrictions on destinations, end users, and end use. Miniconda includes cryptograph
ic software. The country in which you currently reside may have restrictions on the import, possession, use, and/or re-export to another country, of encryption software. BEFORE using any encryption software
, please check your country's laws, regulations and policies concerning the import, possession, or use, and re-export of encryption software, to see if this is permitted. See the Wassenaar Arrangement http:
//www.wassenaar.org/ for more information.

Anaconda has self-classified this software as Export Commodity Control Number (ECCN) EAR99, which includes mass market information security software using or performing cryptographic functions with asymmetr
ic algorithms. No license is required for export of this software to non-embargoed countries.

The Intel Math Kernel Library contained in Miniconda is classified by Intel as ECCN 5D992.c with no license required for export to non-embargoed countries.

The following packages listed on https://www.anaconda.com/cryptography are included in the Repository accessible through Miniconda that relate to cryptography.

Last updated March 21, 2022


Do you accept the license terms? [yes|no]
[no] >>> yes 

```

* 질문에 yes 및 Enter로 확인할것.

```
Do you accept the license terms? [yes|no]
[no] >>> yes <======== yes 입력

Miniconda3 will now be installed into this location:
/home/student018/miniconda3

  - Press ENTER to confirm the location
  - Press CTRL-C to abort the installation
  - Or specify a different location below

[/home/student018/miniconda3] >>> <======== Enter 입력
PREFIX=/home/student018/miniconda3
Unpacking payload ...

Installing base environment...


Downloading and Extracting Packages


Downloading and Extracting Packages

Preparing transaction: done
Executing transaction: done
installation finished.
Do you wish the installer to initialize Miniconda3
by running conda init? [yes|no]
[no] >>> yes <======== yes 입력
no change     /home/student018/miniconda3/condabin/conda
no change     /home/student018/miniconda3/bin/conda
no change     /home/student018/miniconda3/bin/conda-env
no change     /home/student018/miniconda3/bin/activate
no change     /home/student018/miniconda3/bin/deactivate
no change     /home/student018/miniconda3/etc/profile.d/conda.sh
no change     /home/student018/miniconda3/etc/fish/conf.d/conda.fish
no change     /home/student018/miniconda3/shell/condabin/Conda.psm1
no change     /home/student018/miniconda3/shell/condabin/conda-hook.ps1
no change     /home/student018/miniconda3/lib/python3.10/site-packages/xontrib/conda.xsh
no change     /home/student018/miniconda3/etc/profile.d/conda.csh
modified      /home/student018/.bashrc

==> For changes to take effect, close and re-open your current shell. <==

If you'd prefer that conda's base environment not be activated on startup,
   set the auto_activate_base parameter to false:

conda config --set auto_activate_base false

Thank you for installing Miniconda3!
[student018@gjchamber ~]$

```

* 최종확인

```
[student018@gjchamber ~]$ source ~/.cshrc
```

```
[student018@gjchamber ~]$ python --version
Python 3.10.10

```
  
## 2. 사전준비

```
vi ~/.cshrc
```

 
* 각자 위치가 다른 부분이 있으니 수정할것.
```
setenv PATH /tools/cadence/XCELIUMMAIN2409/tools/bin:${PATH}
setenv PATH /home/student001/miniconda3/bin:${PATH} <== 각자 위치가 다름
setenv PATH /tools/cadence/DDI231/GENUS231/bin:${PATH}
setenv PATH /tools/cadence/DDI231/INNOVUS231/bin:${PATH}
```

```
source ~/.cshrc
```


## 3. 프로젝트 생성 및 Auto Script 실행

```
makedir JSilicon2
tar -xvf AutoScrupt.tar
```

```
chmod +x run_rtl2gds.csh
./run_rtl2gds.csh
```

* SDC에서 Constraint를 수정하려면?

```
8번 라인:
tclcreate_clock -name clk -period 5.0 [get_ports clk]

- **Period: 5.0 ns** = 1/5ns = **200 MHz** ✓

주석(3번 라인)에도 명시되어 있습니다:

# Target: 200 MHz (5ns period)
만약 다른 주파수로 변경하고 싶으시다면:

100 MHz: period 10.0
250 MHz: period 4.0
500 MHz: period 2.0
1 GHz: period 1.0
```

* 실행방법

```
cd /home/student018/JSilicon2

# 수정된 파일들 배치
cp create_scripts.py ./
cp jsilicon.sdc constraints/
cp synthesis.tcl scripts/genus/
cp mmmc.tcl scripts/innovus/
cp pnr_flow.tcl scripts/innovus/
cp generate_gds.tcl scripts/innovus/

# 실행
python3 create_scripts.py
chmod +x run_rtl2gds.csh
./run_rtl2gds.csh
```


```

[student018@gjchamber ~/JSilicon2]$ python3 create_scripts.py
======================================================================
 JSilicon RTL-to-GDS Script Generator
 Improved Version
======================================================================

Step 1: Creating directory structure...
[OK] Directory structure created

Step 2: Creating SDC file...
[OK] SDC created: constraints/jsilicon.sdc

Step 3: Creating Genus script...
[OK] Genus script created: scripts/genus/synthesis.tcl

Step 4: Creating MMMC script...
[OK] MMMC script created: scripts/innovus/mmmc.tcl

Step 5: Creating P&R script...
[OK] P&R script created: scripts/innovus/pnr_flow.tcl

Step 6: Creating GDS script...
[OK] GDS script created: scripts/innovus/generate_gds.tcl


========================================
Verification
========================================

[OK] SDC file: constraints/jsilicon.sdc
[OK] Synthesis script: scripts/genus/synthesis.tcl
[OK] MMMC script: scripts/innovus/mmmc.tcl
[OK] P&R script: scripts/innovus/pnr_flow.tcl
[OK] GDS script: scripts/innovus/generate_gds.tcl

[OK] Liberty library: tech/lib/gscl45nm.lib
[OK] LEF file: tech/lef/gscl45nm.lef

[OK] RTL: src/alu.v
[OK] RTL: src/fsm.v
[OK] RTL: src/inst.v
[OK] RTL: src/pc.v
[OK] RTL: src/regfile.v
[OK] RTL: src/switch.v
[OK] RTL: src/uart.v
[OK] RTL: src/jsilicon.v

========================================
All scripts created successfully!

======================================================================
 SETUP COMPLETE!
======================================================================

Next steps:
  1. Ensure all tech files and RTL files are in place
  2. Run: chmod +x run_rtl2gds.csh
  3. Run: ./run_rtl2gds.csh

[student018@gjchamber ~/JSilicon2]$

```

* 중간에 진행 관련 문의가 있으니 : y 입력 후 엔터

```csh
[student001@gjchamber ~/JSilicon2]$ ./run_rtl2gds.csh

==============================================================================
  JSilicon LVS & DRC Verification
==============================================================================

[ERROR] Design database not found: work/pnr/jsilicon_final.enc.dat

Please run P&R first or check if the database exists.
[student001@gjchamber ~/JSilicon2]$ ./run_rtl2gds2.csh

==============================================================================
  JSilicon RTL-to-GDS Automation Flow
==============================================================================

Project Root: /home/student001/JSilicon2
Start: 2025-11-19 10:53:10

[INFO] Checking environment...
[OK] Environment ready

Creating directories...
[OK] Directories ready

Checking files...
[OK] All files present

Creating TCL scripts...
Creating TCL scripts...

[OK] SDC created
[OK] Genus script created
[OK] MMMC script created
[OK] P&R script created
[OK] GDS script created

[OK] All scripts created successfully!

==============================================================================

Ready to run RTL-to-GDS flow

Stages:
  1. Synthesis (Genus)      ~2-3 min
  2. P&R (Innovus)          ~10-15 min
  3. GDS Generation         ~1-2 min

Total: ~15-20 minutes

Continue? (y/n): y <== 사용자 입력

==============================================================================
Stage 1: Synthesis
==============================================================================

Running Genus... (this may take 2-3 minutes)
TMPDIR is being set to /tmp/genus_temp_93397_377b23e7-e3de-4635-b5a6-1b09b42b3d9a_gjchamber_student001_uMnA0X
Cadence Genus(TM) Synthesis Solution.
Copyright 2024 Cadence Design Systems, Inc. All rights reserved worldwide.
Cadence and the Cadence logo are registered trademarks and Genus is a trademark
of Cadence Design Systems, Inc. in the United States and other countries.

[10:53:23.132977] Configured Lic search path (23.02-s006): 5280@10.10.20.247

Version: 23.13-s073_1, built Thu Nov 07 17:01:49 PST 2024
Options: -files ../../scripts/genus/synthesis.tcl
Date:    Wed Nov 19 10:53:23 2025
Host:    gjchamber (x86_64 w/Linux 3.10.0-1160.el7.x86_64) (20cores*80cpus*2physical cpus*Intel(R) Xeon(R) Gold 6230 CPU @ 2.10GHz 28160KB) (394624500KB)
PID:     93397
OS:      CentOS Linux 7 (Core)

Checking out license: Genus_Synthesis
[10:53:23.465105] Periodic Lic check successful
[10:53:23.465120] Feature usage summary:
[10:53:23.465121] Genus_Synthesis



***********************************************************************************************************
***********************************************************************************************************



Finished executable startup (1 second elapsed).

Loading tool scripts...
Finished loading tool scripts (16 seconds elapsed).

#@ Processing -files option
@genus:root: 1> source ../../scripts/genus/synthesis.tcl
#@ Begin verbose source ../../scripts/genus/synthesis.tcl
@file(synthesis.tcl) 1: puts "========================================="
=========================================
@file(synthesis.tcl) 2: puts "JSilicon Synthesis - FreePDK45"
JSilicon Synthesis - FreePDK45
@file(synthesis.tcl) 3: puts "========================================="
=========================================
@file(synthesis.tcl) 5: set project_root [file normalize ../../]
@file(synthesis.tcl) 6: set tech_lib $project_root/tech/lib/gscl45nm.lib
@file(synthesis.tcl) 7: set tech_lef $project_root/tech/lef/gscl45nm.lef
@file(synthesis.tcl) 8: set src_dir $project_root/src
@file(synthesis.tcl) 10: puts "Reading timing library..."
Reading timing library...
@file(synthesis.tcl) 11: read_libs $tech_lib

  Message Summary for Library gscl45nm.lib:
  *****************************************
  Missing library level attribute. [LBR-516]: 1
  *****************************************

Info    : Created nominal operating condition. [LBR-412]
        : Operating condition '_nominal_' was created for the PVT values (1.000000, 1.100000, 27.000000) in library 'gscl45nm.lib'.
        : The nominal operating condition is represented, either by the nominal PVT values specified in the library source (via nom_process,nom_voltage and nom_temperature respectively), or by the default PVT values (1.0,1.0,1.0).
@file(synthesis.tcl) 13: puts "Reading LEF file..."
Reading LEF file...
@file(synthesis.tcl) 14: read_physical -lef $tech_lef
Info    : Via with no resistance will have a value of '0.0' assigned for resistance value. [PHYS-129]
        : Via 'M2_M1_via' has no resistance value.
        : If this is the expected behavior, this message can be ignored.
Info    : Via with no resistance will have a value of '0.0' assigned for resistance value. [PHYS-129]
        : Via 'M3_M2_via' has no resistance value.
Info    : Via with no resistance will have a value of '0.0' assigned for resistance value. [PHYS-129]
        : Via 'M4_M3_via' has no resistance value.
Info    : Via with no resistance will have a value of '0.0' assigned for resistance value. [PHYS-129]
        : Via 'M5_M4_via' has no resistance value.
Info    : Via with no resistance will have a value of '0.0' assigned for resistance value. [PHYS-129]
        : Via 'M6_M5_via' has no resistance value.
Info    : Via with no resistance will have a value of '0.0' assigned for resistance value. [PHYS-129]
        : Via 'M7_M6_via' has no resistance value.
Info    : Via with no resistance will have a value of '0.0' assigned for resistance value. [PHYS-129]
        : Via 'M8_M7_via' has no resistance value.
Info    : Via with no resistance will have a value of '0.0' assigned for resistance value. [PHYS-129]
        : Via 'M9_M8_via' has no resistance value.
Info    : Via with no resistance will have a value of '0.0' assigned for resistance value. [PHYS-129]
        : Via 'M10_M9_via' has no resistance value.
Info    : Via with no resistance will have a value of '0.0' assigned for resistance value. [PHYS-129]
        : Via 'M2_M1_viaB' has no resistance value.
Info    : Via with no resistance will have a value of '0.0' assigned for resistance value. [PHYS-129]
        : Via 'M2_M1_viaC' has no resistance value.
Info    : Via with no resistance will have a value of '0.0' assigned for resistance value. [PHYS-129]
        : Via 'M3_M2_viaB' has no resistance value.
Info    : Via with no resistance will have a value of '0.0' assigned for resistance value. [PHYS-129]
        : Via 'M3_M2_viaC' has no resistance value.
Info    : Via with no resistance will have a value of '0.0' assigned for resistance value. [PHYS-129]
        : Via 'M4_M3_viaB' has no resistance value.

  According to lef_library, there are total 10 routing layers [ V(5) / H(5) ]

Warning : Missing wire parameter. [PHYS-15]
        : 'EDGECAPACITANCE' parameter is missing for layer 'metal1' [line 31 in file /home/student001/JSilicon2/tech/lef/gscl45nm.lef]
        : Check the wire parameter in LEF technology files.
Warning : Missing wire parameter. [PHYS-15]
        : 'EDGECAPACITANCE' parameter is missing for layer 'metal2' [line 46 in file /home/student001/JSilicon2/tech/lef/gscl45nm.lef]
Warning : Missing wire parameter. [PHYS-15]
        : 'EDGECAPACITANCE' parameter is missing for layer 'metal3' [line 61 in file /home/student001/JSilicon2/tech/lef/gscl45nm.lef]
Warning : Missing wire parameter. [PHYS-15]
        : 'EDGECAPACITANCE' parameter is missing for layer 'metal4' [line 76 in file /home/student001/JSilicon2/tech/lef/gscl45nm.lef]
Warning : Missing wire parameter. [PHYS-15]
        : 'EDGECAPACITANCE' parameter is missing for layer 'metal5' [line 91 in file /home/student001/JSilicon2/tech/lef/gscl45nm.lef]
Warning : Missing wire parameter. [PHYS-15]
        : 'EDGECAPACITANCE' parameter is missing for layer 'metal6' [line 106 in file /home/student001/JSilicon2/tech/lef/gscl45nm.lef]
Warning : Missing wire parameter. [PHYS-15]
        : 'EDGECAPACITANCE' parameter is missing for layer 'metal7' [line 121 in file /home/student001/JSilicon2/tech/lef/gscl45nm.lef]
Warning : Missing wire parameter. [PHYS-15]
        : 'EDGECAPACITANCE' parameter is missing for layer 'metal8' [line 136 in file /home/student001/JSilicon2/tech/lef/gscl45nm.lef]
Warning : Missing wire parameter. [PHYS-15]
        : 'EDGECAPACITANCE' parameter is missing for layer 'metal9' [line 151 in file /home/student001/JSilicon2/tech/lef/gscl45nm.lef]
Warning : Missing wire parameter. [PHYS-15]
        : 'EDGECAPACITANCE' parameter is missing for layer 'metal10' [line 166 in file /home/student001/JSilicon2/tech/lef/gscl45nm.lef]
Warning : Missing wire parameter. [PHYS-15]
        : 'CPERSQDIST' parameter is missing for layer 'metal1' [line 31 in file /home/student001/JSilicon2/tech/lef/gscl45nm.lef]
Warning : Missing wire parameter. [PHYS-15]
        : 'CPERSQDIST' parameter is missing for layer 'metal2' [line 46 in file /home/student001/JSilicon2/tech/lef/gscl45nm.lef]
Warning : Missing wire parameter. [PHYS-15]
        : 'CPERSQDIST' parameter is missing for layer 'metal3' [line 61 in file /home/student001/JSilicon2/tech/lef/gscl45nm.lef]
Warning : Missing wire parameter. [PHYS-15]
        : 'CPERSQDIST' parameter is missing for layer 'metal4' [line 76 in file /home/student001/JSilicon2/tech/lef/gscl45nm.lef]
Warning : Missing wire parameter. [PHYS-15]
        : 'CPERSQDIST' parameter is missing for layer 'metal5' [line 91 in file /home/student001/JSilicon2/tech/lef/gscl45nm.lef]
Warning : Missing wire parameter. [PHYS-15]
        : 'CPERSQDIST' parameter is missing for layer 'metal6' [line 106 in file /home/student001/JSilicon2/tech/lef/gscl45nm.lef]
Warning : Missing wire parameter. [PHYS-15]
        : 'CPERSQDIST' parameter is missing for layer 'metal7' [line 121 in file /home/student001/JSilicon2/tech/lef/gscl45nm.lef]
Warning : Missing wire parameter. [PHYS-15]
        : 'CPERSQDIST' parameter is missing for layer 'metal8' [line 136 in file /home/student001/JSilicon2/tech/lef/gscl45nm.lef]
Warning : Missing wire parameter. [PHYS-15]
        : 'CPERSQDIST' parameter is missing for layer 'metal9' [line 151 in file /home/student001/JSilicon2/tech/lef/gscl45nm.lef]
Warning : Missing wire parameter. [PHYS-15]
        : 'CPERSQDIST' parameter is missing for layer 'metal10' [line 166 in file /home/student001/JSilicon2/tech/lef/gscl45nm.lef]
Warning : The variant range of wire parameters is too large. An example of wire parameters are, a WIDTH for layer, PITCH for layer, MINSPACING for layers, etc. [PHYS-12]
        : The variant range (0.065, 0.8) of 'WIDTH' for layers 'metal1' and 'metal10' is too large.
        : Check the consistency of the parameters, and see if you can ignore this message or you're using different LEF file with wrong parameters.
Warning : The variant range of wire parameters is too large. An example of wire parameters are, a WIDTH for layer, PITCH for layer, MINSPACING for layers, etc. [PHYS-12]
        : The variant range (0.065, 0.8) of 'MINSPACING' for layers 'metal1' and 'metal10' is too large.
Warning : Physical cell not defined in library. [PHYS-279]
        : The physical (LEF) cell FILL cannot be found in library.
        : Ensure that the proper library files are available and have been imported.
Warning : Physical cell not defined in library. [PHYS-279]
        : The physical (LEF) cell OAI22X1 cannot be found in library.
@file(synthesis.tcl) 16: puts "Reading RTL files..."
Reading RTL files...
@file(synthesis.tcl) 17: set_db init_hdl_search_path $src_dir
  Setting attribute of root '/': 'init_hdl_search_path' = /home/student001/JSilicon2/src
@file(synthesis.tcl) 19: read_hdl -sv {
    alu.v
    fsm.v
    inst.v
    pc.v
    regfile.v
    switch.v
    uart.v
    jsilicon.v
}
(* keep_hierarchy *)
   |
Warning : Unused attribute. [VLOGPT-506]
        : Attribute 'keep_hierarchy' in file '/home/student001/JSilicon2/src/alu.v' on line 4, column 4.
(* keep_hierarchy *)
   |
Warning : Unused attribute. [VLOGPT-506]
        : Attribute 'keep_hierarchy' in file '/home/student001/JSilicon2/src/fsm.v' on line 5, column 4.
(* keep_hierarchy *)
   |
Warning : Unused attribute. [VLOGPT-506]
        : Attribute 'keep_hierarchy' in file '/home/student001/JSilicon2/src/inst.v' on line 5, column 4.
(* keep_hierarchy *)
   |
Warning : Unused attribute. [VLOGPT-506]
        : Attribute 'keep_hierarchy' in file '/home/student001/JSilicon2/src/pc.v' on line 6, column 4.
    initial begin
          |
Warning : Ignoring unsynthesizable construct. [VLOGPT-37]
        : Initial in file '/home/student001/JSilicon2/src/pc.v' on line 30, column 11.
        : For example, the following constructs will be ignored:
    - initial block
    - final block
    - program block
    - property block
    - sequence block
    - covergroup
    - checker block
    - gate drive strength
    - system task enable
    - reg declaration with initial value
    - specify block.
(* keep_hierarchy *)
   |
Warning : Unused attribute. [VLOGPT-506]
        : Attribute 'keep_hierarchy' in file '/home/student001/JSilicon2/src/regfile.v' on line 6, column 4.
@file(synthesis.tcl) 30: puts "Elaborating design..."
Elaborating design...
@file(synthesis.tcl) 31: elaborate tt_um_Jsilicon
Info    : Elaborating Design. [ELAB-1]
        : Elaborating top-level block 'tt_um_Jsilicon' from file '/home/student001/JSilicon2/src/jsilicon.v'.
Warning : Unreachable statements for case item. [CDFG-472]
        : Case item 'default' in module 'ALU' in file '/home/student001/JSilicon2/src/alu.v' on line 33.
Warning : Undriven signal detected. [ELABUTL-125]
        : Undriven bits of signal 'rom[0]' in module 'PC' in file '/home/student001/JSilicon2/src/pc.v' on line 59, column 24, hid = 0.
        : The undriven signal handling can be controlled by setting the attribute 'hdl_unconnected_value' before syn_generic command.
Warning : Undriven signal detected. [ELABUTL-125]
        : Undriven bits of signal 'rom[1]' in module 'PC' in file '/home/student001/JSilicon2/src/pc.v' on line 59, column 24, hid = 0.
Warning : Undriven signal detected. [ELABUTL-125]
        : Undriven bits of signal 'rom[2]' in module 'PC' in file '/home/student001/JSilicon2/src/pc.v' on line 59, column 24, hid = 0.
Warning : Undriven signal detected. [ELABUTL-125]
        : Undriven bits of signal 'rom[3]' in module 'PC' in file '/home/student001/JSilicon2/src/pc.v' on line 59, column 24, hid = 0.
Warning : Undriven signal detected. [ELABUTL-125]
        : Undriven bits of signal 'rom[4]' in module 'PC' in file '/home/student001/JSilicon2/src/pc.v' on line 59, column 24, hid = 0.
Warning : Undriven signal detected. [ELABUTL-125]
        : Undriven bits of signal 'rom[5]' in module 'PC' in file '/home/student001/JSilicon2/src/pc.v' on line 59, column 24, hid = 0.
Warning : Undriven signal detected. [ELABUTL-125]
        : Undriven bits of signal 'rom[6]' in module 'PC' in file '/home/student001/JSilicon2/src/pc.v' on line 59, column 24, hid = 0.
Warning : Undriven signal detected. [ELABUTL-125]
        : Undriven bits of signal 'rom[7]' in module 'PC' in file '/home/student001/JSilicon2/src/pc.v' on line 59, column 24, hid = 0.
Warning : Undriven signal detected. [ELABUTL-125]
        : Undriven bits of signal 'rom[8]' in module 'PC' in file '/home/student001/JSilicon2/src/pc.v' on line 59, column 24, hid = 0.
Warning : Undriven signal detected. [ELABUTL-125]
        : Undriven bits of signal 'rom[9]' in module 'PC' in file '/home/student001/JSilicon2/src/pc.v' on line 59, column 24, hid = 0.
Warning : Undriven signal detected. [ELABUTL-125]
        : Undriven bits of signal 'rom[10]' in module 'PC' in file '/home/student001/JSilicon2/src/pc.v' on line 59, column 24, hid = 0.
Warning : Undriven signal detected. [ELABUTL-125]
        : Undriven bits of signal 'rom[11]' in module 'PC' in file '/home/student001/JSilicon2/src/pc.v' on line 59, column 24, hid = 0.
Warning : Undriven signal detected. [ELABUTL-125]
        : Undriven bits of signal 'rom[12]' in module 'PC' in file '/home/student001/JSilicon2/src/pc.v' on line 59, column 24, hid = 0.
Warning : Undriven signal detected. [ELABUTL-125]
        : Undriven bits of signal 'rom[13]' in module 'PC' in file '/home/student001/JSilicon2/src/pc.v' on line 59, column 24, hid = 0.
Warning : Undriven signal detected. [ELABUTL-125]
        : Undriven bits of signal 'rom[14]' in module 'PC' in file '/home/student001/JSilicon2/src/pc.v' on line 59, column 24, hid = 0.
Warning : Undriven signal detected. [ELABUTL-125]
        : Undriven bits of signal 'rom[15]' in module 'PC' in file '/home/student001/JSilicon2/src/pc.v' on line 59, column 24, hid = 0.
Info    : Done Elaborating Design. [ELAB-3]
        : Done elaborating 'tt_um_Jsilicon'.
Checking for source RTL...
Check completed for source RTL.
Running Unified Mux Engine Tricks...
Completed Unified Mux Engine Tricks

Stage: post_elab
-------------------------------------------------------
| Trick             | Accepts | Rejects | Runtime (s) |
-------------------------------------------------------
| ume_constant_bmux |       0 |       0 |        0.00 |
| ume_merge         |       0 |       0 |        0.00 |
| ume_ssm           |       0 |       0 |        0.00 |
| ume_cse           |       1 |       0 |        0.00 |
| ume_shrink        |       0 |       0 |        0.00 |
| ume_sweep         |       0 |       0 |        0.00 |
| ume_constant_bmux |       0 |       0 |        0.00 |
| ume_merge         |       0 |       0 |        0.00 |
| ume_ssm           |       0 |       0 |        0.00 |
| ume_cse           |       0 |       0 |        0.00 |
| ume_shrink        |       0 |       0 |        0.00 |
| ume_sweep         |       0 |       0 |        0.00 |
-------------------------------------------------------
Starting optimize datapath shifters [v1.0] (stage: post_elab, startdef: tt_um_Jsilicon, recur: true)
Completed optimize datapath shifters (accepts: 0, rejects: 0, runtime: 0.001s)
Starting clip mux common data inputs [v1.0] (stage: post_elab, startdef: tt_um_Jsilicon, recur: true)
Completed clip mux common data inputs (accepts: 0, rejects: 0, runtime: 0.000s)
Starting clip the non-user hierarchies [v2.0] (stage: post_elab, startdef: tt_um_Jsilicon, recur: true)
Completed clip the non-user hierarchies (accepts: 0, rejects: 0, runtime: 0.000s)
Starting basic netlist cleanup [v1.0] (stage: post_elab, startdef: tt_um_Jsilicon, recur: true)
Completed basic netlist cleanup (accepts: 0, rejects: 0, runtime: 0.000s)

Stage: post_elab
--------------------------------------------------------------------
| Transform                      | Accepts | Rejects | Runtime (s) |
--------------------------------------------------------------------
| hlo_optimize_datapath_shifters |       0 |       0 |        0.00 |
| hlo_clip_mux_input             |       0 |       0 |        0.00 |
| hlo_clip                       |       0 |       0 |        0.00 |
| hlo_cleanup                    |       0 |       0 |        0.00 |
--------------------------------------------------------------------
UM:   flow.cputime  flow.realtime  timing.setup.tns  timing.setup.wns  snapshot
UM:*                                                                   elaborate
@file(synthesis.tcl) 33: puts "Reading SDC constraints..."
Reading SDC constraints...
@file(synthesis.tcl) 34: read_sdc $project_root/constraints/jsilicon.sdc
Warning : Unsupported SDC command option. [SDC-201] [set_input_delay]
        : The set_input_delay command is not supported on ports which have a clock already defined 'port:tt_um_Jsilicon/clk'.
        : The current version does not support this SDC command option.  However, future versions may be enhanced to support this option.
Statistics for commands executed by read_sdc:
 "all_inputs"               - successful      3 , failed      0 (runtime  0.00)
 "all_outputs"              - successful      3 , failed      0 (runtime  0.00)
 "create_clock"             - successful      1 , failed      0 (runtime  0.01)
 "get_clocks"               - successful      2 , failed      0 (runtime  0.00)
 "get_ports"                - successful      1 , failed      0 (runtime  0.01)
 "set_clock_transition"     - successful      1 , failed      0 (runtime  0.00)
 "set_clock_uncertainty"    - successful      1 , failed      0 (runtime  0.00)
 "set_driving_cell"         - successful      1 , failed      0 (runtime  0.01)
 "set_input_delay"          - successful      2 , failed      0 (runtime  0.01)
 "set_load"                 - successful      1 , failed      0 (runtime  0.01)
 "set_output_delay"         - successful      2 , failed      0 (runtime  0.00)
read_sdc completed in 00:00:00 (hh:mm:ss)
@file(synthesis.tcl) 36: puts "Setting synthesis options..."
Setting synthesis options...
@file(synthesis.tcl) 37: set_db syn_generic_effort medium
  Setting attribute of root '/': 'syn_generic_effort' = medium
@file(synthesis.tcl) 38: set_db syn_map_effort medium
  Setting attribute of root '/': 'syn_map_effort' = medium
@file(synthesis.tcl) 39: set_db syn_opt_effort medium
  Setting attribute of root '/': 'syn_opt_effort' = medium
@file(synthesis.tcl) 40: set_db syn_global_effort medium
  Setting attribute of root '/': 'syn_global_effort' = medium
@file(synthesis.tcl) 42: puts "Phase 1: Generic Synthesis"
Phase 1: Generic Synthesis
@file(synthesis.tcl) 43: syn_generic
stamp 'PBS_Generic-Start' being created for table 'pbs_debug'

  Total Time (Wall) |  Stage Time (Wall)  |   % (Wall)   |    Date - Time     |  Memory   | Stage
--------------------+---------------------+--------------+--------------------+-----------+----------------------
 00:00:16(00:00:16) |  00:00:00(00:00:00) |   0.0(  0.0) |   10:53:40 (Nov19) |  424.4 MB | PBS_Generic-Start
--------------------+---------------------+--------------+--------------------+-----------+----------------------
Number of threads: 8 * 1   (id: pbs_debug, time_info v1.57)
Info: (*N*) indicates data that was populated from previously saved time_info database
Info: CPU time includes time of parent + longest thread
Info    : Undriven signal detected. [ELABUTL-130]
        : Assuming a logic '0' value for undriven bits of signal 'rom[0]' in module 'PC'.
        : The 'hdl_unconnected_value' attribute controls treatment of undriven signal.
Info    : Undriven signal detected. [ELABUTL-130]
        : Assuming a logic '0' value for undriven bits of signal 'rom[1]' in module 'PC'.
Info    : Undriven signal detected. [ELABUTL-130]
        : Assuming a logic '0' value for undriven bits of signal 'rom[2]' in module 'PC'.
Info    : Undriven signal detected. [ELABUTL-130]
        : Assuming a logic '0' value for undriven bits of signal 'rom[3]' in module 'PC'.
Info    : Undriven signal detected. [ELABUTL-130]
        : Assuming a logic '0' value for undriven bits of signal 'rom[4]' in module 'PC'.
Info    : Undriven signal detected. [ELABUTL-130]
        : Assuming a logic '0' value for undriven bits of signal 'rom[5]' in module 'PC'.
Info    : Undriven signal detected. [ELABUTL-130]
        : Assuming a logic '0' value for undriven bits of signal 'rom[6]' in module 'PC'.
Info    : Undriven signal detected. [ELABUTL-130]
        : Assuming a logic '0' value for undriven bits of signal 'rom[7]' in module 'PC'.
Info    : Undriven signal detected. [ELABUTL-130]
        : Assuming a logic '0' value for undriven bits of signal 'rom[8]' in module 'PC'.
Info    : Undriven signal detected. [ELABUTL-130]
        : Assuming a logic '0' value for undriven bits of signal 'rom[9]' in module 'PC'.
Info    : Undriven signal detected. [ELABUTL-130]
        : Assuming a logic '0' value for undriven bits of signal 'rom[10]' in module 'PC'.
Info    : Undriven signal detected. [ELABUTL-130]
        : Assuming a logic '0' value for undriven bits of signal 'rom[11]' in module 'PC'.
Info    : Undriven signal detected. [ELABUTL-130]
        : Assuming a logic '0' value for undriven bits of signal 'rom[12]' in module 'PC'.
Info    : Undriven signal detected. [ELABUTL-130]
        : Assuming a logic '0' value for undriven bits of signal 'rom[13]' in module 'PC'.
Info    : Undriven signal detected. [ELABUTL-130]
        : Assuming a logic '0' value for undriven bits of signal 'rom[14]' in module 'PC'.
Info    : Undriven signal detected. [ELABUTL-130]
        : Assuming a logic '0' value for undriven bits of signal 'rom[15]' in module 'PC'.

Stage: pre_early_cg
-----------------------------------------------
| Transform | Accepts | Rejects | Runtime (s) |
-----------------------------------------------
-----------------------------------------------
Mapping ChipWare ICG instances in tt_um_Jsilicon
Found 0 unmapped ChipWare ICG instances
Mapped 0 of 0 ChipWare ICG instances
##Generic Timing Info: typical gate delay   84.0 ps   std_slew:    2.4 ps   std_load:  4.6 fF  for library domain _default_
Starting mux data reorder optimization [v1.0] (stage: pre_to_gen_setup, startdef: tt_um_Jsilicon, recur: true)
Completed mux data reorder optimization (accepts: 0, rejects: 0, runtime: 0.000s)

Stage: pre_to_gen_setup
-----------------------------------------------------
| Transform       | Accepts | Rejects | Runtime (s) |
-----------------------------------------------------
| hlo_mux_reorder |       0 |       0 |        0.00 |
-----------------------------------------------------
Running DP early constant propagation (netlist tt_um_Jsilicon)...
Running DP early redundancy removal
Completed DP early redundancy removal on tt_um_Jsilicon (runtime = 0.0s)
Multi-threaded constant propagation [4|0] ...
Info    : Replacing a flip-flop with a logic constant 0. [GLO-12]
        : The instance is 'dec_inst/alu_opcode_reg[0]'.
        : To prevent this optimization, set the 'optimize_constant_0_flops' root attribute to 'false' or 'optimize_constant_0_seq' instance attribute to 'false'. You can also see the complete list of deleted sequential with command "report sequential -deleted" (on Reason "constant0").
Info    : Replacing a flip-flop with a logic constant 0. [GLO-12]
        : The instance is 'dec_inst/alu_opcode_reg[1]'.
Info    : Replacing a flip-flop with a logic constant 0. [GLO-12]
        : The instance is 'dec_inst/alu_opcode_reg[2]'.
Info    : Replacing a flip-flop with a logic constant 0. [GLO-12]
        : The instance is 'dec_inst/operand_reg[0]'.
Info    : Replacing a flip-flop with a logic constant 0. [GLO-12]
        : The instance is 'dec_inst/operand_reg[1]'.
Info    : Replacing a flip-flop with a logic constant 0. [GLO-12]
        : The instance is 'dec_inst/operand_reg[2]'.
Info    : Replacing a flip-flop with a logic constant 0. [GLO-12]
        : The instance is 'dec_inst/operand_reg[3]'.
Info    : Replacing a flip-flop with a logic constant 0. [GLO-12]
        : The instance is 'dec_inst/reg_sel_reg'.
Info    : Replacing a flip-flop with a logic constant 0. [GLO-12]
        : The instance is 'core_inst/uart_inst/state_reg[2]'.
Info    : Replacing the synchronous part of an always feeding back flip-flop with a logic constant. [GLO-45]
        : The instance is 'pc_inst/pc_reg[3]'. The constant is '0'.
        : To prevent this optimization, set 'optimize_constant_feedback_seqs' root attribute to 'false'. The instance attribute 'optimize_constant_feedback_seq' controls this optimization.
Info    : Replacing the synchronous part of an always feeding back flip-flop with a logic constant. [GLO-45]
        : The instance is 'pc_inst/pc_reg[2]'. The constant is '0'.
Info    : Replacing a flip-flop with a logic constant 0. [GLO-12]
        : The instance is 'pc_inst/pc_reg[2]'.
Info    : Replacing a flip-flop with a logic constant 0. [GLO-12]
        : The instance is 'pc_inst/pc_reg[3]'.
...done running DP early constant propagation (0 seconds CPU time, 1 seconds wall time, netlist tt_um_Jsilicon).
Info    : Deleting instances not driving any primary outputs. [GLO-34]
        : Deleting 11 sequential instances.
        : Optimizations such as constant propagation or redundancy removal could change the connections so a hierarchical instance does not drive any primary outputs anymore. To see the list of deleted hierarchical instances, set the 'information_level' attribute to 2 or above. If the message is truncated set the message attribute 'truncate' to false to see the complete list. To prevent this optimization, set the 'delete_unloaded_insts' root/subdesign attribute to 'false' or 'preserve' instance attribute to 'true'.
Current PLE settings:

Aspect ratio        : 1.000
Shrink factor       : 1.000
Scale of res/length : 1.000
Scale of cap/length : 1.000
Net derating factor : 1.000
Thermal factor      : 1.000
Via Resistance      : 0.000 ohm (from default)
Site size           : 2.660 um (from lef [tech+cell])

                                   Capacitance
  Layer                             / Length         Data source:
Name        Direction Utilization  (pF/micron)       default value
------------------------------------------------
<default>       U         n/a         0.000250

** = DEFAULT cap per unit length is used for timing analysis

                                    Resistance
  Layer                              / Length         Data source:
Name        Direction Utilization  (ohm/micron)       lef_library
-------------------------------------------------
metal1          H         0.00         5.846154
metal2          V         1.00         3.571429
metal3          H         1.00         3.571429
metal4          V         1.00         1.785714
metal5          H         1.00         1.785714
metal6          V         1.00         1.785714
metal7          H         1.00         0.625000
metal8          V         1.00         0.625000
metal9          H         1.00         0.262500
metal10         V         1.00         0.262500

                                        Area
  Layer                               / Length        Data source:
Name        Direction Utilization     (micron)        lef_library
-------------------------------------------------
metal1          H         0.00         0.065000
metal2          V         1.00         0.070000
metal3          H         1.00         0.070000
metal4          V         1.00         0.140000
metal5          H         1.00         0.140000
metal6          V         1.00         0.140000
metal7          H         1.00         0.400000
metal8          V         1.00         0.400000
metal9          H         1.00         0.800000
metal10         V         1.00         0.800000

Info    : Synthesizing. [SYNTH-1]
        : Synthesizing 'tt_um_Jsilicon' to generic gates using 'medium' effort.
Running Synthesis Turbo Flow Version 3.
Info    : Partition Based Synthesis execution skipped. [PHYS-752]
        : Design size is less than the partition size '100000' for distributed generic optimization to kick in.
Starting mux data reorder optimization [v1.0] (stage: pre_to_gen_setup, startdef: tt_um_Jsilicon, recur: true)
Completed mux data reorder optimization (accepts: 0, rejects: 0, runtime: 0.002s)

Stage: pre_to_gen_setup
-----------------------------------------------------
| Transform       | Accepts | Rejects | Runtime (s) |
-----------------------------------------------------
| hlo_mux_reorder |       0 |       0 |        0.00 |
-----------------------------------------------------
Starting mux data reorder optimization [v1.0] (stage: post_to_gen_setup, startdef: tt_um_Jsilicon, recur: true)
Completed mux data reorder optimization (accepts: 0, rejects: 0, runtime: 0.001s)

Stage: post_to_gen_setup
-----------------------------------------------------
| Transform       | Accepts | Rejects | Runtime (s) |
-----------------------------------------------------
| hlo_mux_reorder |       0 |       0 |        0.00 |
-----------------------------------------------------
Current PLE settings:

Aspect ratio        : 1.000
Shrink factor       : 1.000
Scale of res/length : 1.000
Scale of cap/length : 1.000
Net derating factor : 1.000
Thermal factor      : 1.000
Via Resistance      : 0.000 ohm (from default)
Site size           : 2.660 um (from lef [tech+cell])

                                   Capacitance
  Layer                             / Length         Data source:
Name        Direction Utilization  (pF/micron)       default value
------------------------------------------------
<default>       U         n/a         0.000250

** = DEFAULT cap per unit length is used for timing analysis

                                    Resistance
  Layer                              / Length         Data source:
Name        Direction Utilization  (ohm/micron)       lef_library
-------------------------------------------------
metal1          H         0.00         5.846154
metal2          V         1.00         3.571429
metal3          H         1.00         3.571429
metal4          V         1.00         1.785714
metal5          H         1.00         1.785714
metal6          V         1.00         1.785714
metal7          H         1.00         0.625000
metal8          V         1.00         0.625000
metal9          H         1.00         0.262500
metal10         V         1.00         0.262500

                                        Area
  Layer                               / Length        Data source:
Name        Direction Utilization     (micron)        lef_library
-------------------------------------------------
metal1          H         0.00         0.065000
metal2          V         1.00         0.070000
metal3          H         1.00         0.070000
metal4          V         1.00         0.140000
metal5          H         1.00         0.140000
metal6          V         1.00         0.140000
metal7          H         1.00         0.400000
metal8          V         1.00         0.400000
metal9          H         1.00         0.800000
metal10         V         1.00         0.800000

Running Unified Mux Engine Tricks...
Completed Unified Mux Engine Tricks

Stage: pre_hlo_rtlopt
-----------------------------------------------
| Trick     | Accepts | Rejects | Runtime (s) |
-----------------------------------------------
| ume_ssm   |       0 |       0 |        0.00 |
| ume_sweep |       2 |       0 |        0.00 |
| ume_share |       0 |       0 |        0.00 |
| ume_ssm   |       0 |       0 |        0.00 |
| ume_sweep |       0 |       0 |        0.00 |
| ume_share |       0 |       0 |        0.00 |
-----------------------------------------------
Begin SDR optimization CTX_region
  Setting attribute of root '/': 'hier_sandbox_support_folded' = 1
#Special hiers formed inside ALU = 0
#Special hiers formed inside DECODER = 0
#Special hiers formed inside FSM = 0
#Special hiers formed inside PC = 0
#Special hiers formed inside REG = 0
#Special hiers formed inside SWITCH = 0
#Special hiers formed inside UART_TX = 0
#Special hiers formed inside tt_um_Jsilicon = 0
No special hier is found
  Setting attribute of root '/': 'hier_sandbox_support_folded' = 0
End SDR optimization CTX_region
Begin SDR optimization UME_region
  Setting attribute of root '/': 'hier_sandbox_support_folded' = 1
#Special hiers formed inside ALU = 0
#Special hiers formed inside DECODER = 0
#Special hiers formed inside FSM = 0
#Special hiers formed inside PC = 0
#Special hiers formed inside REG = 0
#Special hiers formed inside SWITCH = 0
#Special hiers formed inside UART_TX = 0
#Special hiers formed inside tt_um_Jsilicon = 0
No special hier is found
  Setting attribute of root '/': 'hier_sandbox_support_folded' = 0
End SDR optimization UME_region
Starting timing based select reordering [v1.0] (stage: pre_rtlopt, startdef: tt_um_Jsilicon, recur: true)
Completed timing based select reordering (accepts: 0, rejects: 0, runtime: 0.078s)
Starting recase case-box optimization [v1.0] (stage: pre_rtlopt, startdef: tt_um_Jsilicon, recur: true)
Completed recase case-box optimization (accepts: 0, rejects: 0, runtime: 0.006s)
Starting infer macro optimization [v1.0] (stage: pre_rtlopt, startdef: tt_um_Jsilicon, recur: true)
Info    : Deleting instances not driving any primary outputs. [GLO-34]
        : Deleting 2 sequential instances.
Info    : Deleting instances not driving any primary outputs. [GLO-34]
        : Deleting 2 hierarchical instances.
Completed infer macro optimization (accepts: 0, rejects: 10, runtime: 0.003s)
Starting decode mux sandwich optimization [v2.0] (stage: pre_rtlopt, startdef: tt_um_Jsilicon, recur: true)
Completed decode mux sandwich optimization (accepts: 0, rejects: 0, runtime: 0.000s)
Starting decode mux optimization [v1.0] (stage: pre_rtlopt, startdef: tt_um_Jsilicon, recur: true)
Completed decode mux optimization (accepts: 0, rejects: 0, runtime: 0.000s)
Starting chop wide muxes [v1.0] (stage: pre_rtlopt, startdef: tt_um_Jsilicon, recur: true)
Completed chop wide muxes (accepts: 0, rejects: 0, runtime: 0.000s)
Starting common data mux cascade opt [v1.0] (stage: pre_rtlopt, startdef: tt_um_Jsilicon, recur: true)
Completed common data mux cascade opt (accepts: 0, rejects: 0, runtime: 0.000s)
Starting mux input consolidation [v1.0] (stage: pre_rtlopt, startdef: tt_um_Jsilicon, recur: true)
Completed mux input consolidation (accepts: 0, rejects: 0, runtime: 0.000s)
Starting constant-data mux optimization [v1.0] (stage: pre_rtlopt, startdef: tt_um_Jsilicon, recur: true)
Completed constant-data mux optimization (accepts: 0, rejects: 0, runtime: 0.000s)
Starting chain-to-tree inequality transform [v2.0] (stage: pre_rtlopt, startdef: tt_um_Jsilicon, recur: true)
Completed chain-to-tree inequality transform (accepts: 0, rejects: 0, runtime: 0.003s)
Starting reconvergence optimization [v1.0] (stage: pre_rtlopt, startdef: tt_um_Jsilicon, recur: true)
Completed reconvergence optimization (accepts: 0, rejects: 0, runtime: 0.000s)
Starting logic restructure optimization [v1.0] (stage: pre_rtlopt, startdef: tt_um_Jsilicon, recur: true)
Completed logic restructure optimization (accepts: 0, rejects: 0, runtime: 0.000s)
Starting identity transform [v3.0] (stage: pre_rtlopt, startdef: tt_um_Jsilicon, recur: true)
Completed identity transform (accepts: 0, rejects: 1, runtime: 0.001s)
Starting reduce operator chain [v1.0] (stage: pre_rtlopt, startdef: tt_um_Jsilicon, recur: true)
Completed reduce operator chain (accepts: 0, rejects: 0, runtime: 0.000s)
Starting common data mux cascade opt [v1.0] (stage: pre_rtlopt, startdef: tt_um_Jsilicon, recur: true)
Completed common data mux cascade opt (accepts: 0, rejects: 0, runtime: 0.000s)
Starting mux input consolidation [v1.0] (stage: pre_rtlopt, startdef: tt_um_Jsilicon, recur: true)
Completed mux input consolidation (accepts: 0, rejects: 0, runtime: 0.000s)
Starting optimize datapath elements [v1.0] (stage: pre_rtlopt, startdef: tt_um_Jsilicon, recur: true)
Completed optimize datapath elements (accepts: 0, rejects: 0, runtime: 0.000s)
Starting datapath recasting [v1.0] (stage: pre_rtlopt, startdef: tt_um_Jsilicon, recur: true)
Completed datapath recasting (accepts: 0, rejects: 4, runtime: 0.025s)
Starting word-level redundancy removal [v1.0] (stage: pre_rtlopt, startdef: tt_um_Jsilicon, recur: true)
Completed word-level redundancy removal (accepts: 0, rejects: 0, runtime: 0.033s)
Starting clip mux common data inputs [v1.0] (stage: pre_rtlopt, startdef: tt_um_Jsilicon, recur: true)
Completed clip mux common data inputs (accepts: 0, rejects: 0, runtime: 0.000s)
Starting clip the non-user hierarchies [v2.0] (stage: pre_rtlopt, startdef: tt_um_Jsilicon, recur: true)
Completed clip the non-user hierarchies (accepts: 0, rejects: 0, runtime: 0.001s)
Starting basic netlist cleanup [v1.0] (stage: pre_rtlopt, startdef: tt_um_Jsilicon, recur: true)
Completed basic netlist cleanup (accepts: 0, rejects: 0, runtime: 0.000s)

Stage: pre_rtlopt
-----------------------------------------------------------------
| Transform                   | Accepts | Rejects | Runtime (s) |
-----------------------------------------------------------------
| hlo_timing_reorder          |       0 |       0 |        0.08 |
| hlo_recase_casebox          |       0 |       0 |        0.01 |
| hlo_infer_macro             |       0 |      10 |        0.00 |
| hlo_decode_mux_sandwich     |       0 |       0 |        0.00 |
| hlo_mux_decode              |       0 |       0 |        0.00 |
| hlo_chop_mux                |       0 |       0 |        0.00 |
| hlo_mux_cascade_opt         |       0 |       0 |        0.00 |
| hlo_mux_consolidation       |       0 |       0 |        0.00 |
| hlo_constant_mux_opt        |       0 |       0 |        0.00 |
| hlo_inequality_transform    |       0 |       0 |        0.00 |
| hlo_reconv_opt              |       0 |       0 |        0.00 |
| hlo_restructure             |       0 |       0 |        0.00 |
| hlo_identity_transform      |       0 |       1 |        0.00 |
| hlo_reduce_operator_chain   |       0 |       0 |        0.00 |
| hlo_mux_cascade_opt         |       0 |       0 |        0.00 |
| hlo_mux_consolidation       |       0 |       0 |        0.00 |
| hlo_optimize_datapath       |       0 |       0 |        0.00 |
| hlo_datapath_recast         |       0 |       4 |        0.03 |
| hlo_redundancy_removal_word |       0 |       0 |        0.03 |
| hlo_clip_mux_input          |       0 |       0 |        0.00 |
| hlo_clip                    |       0 |       0 |        0.00 |
| hlo_cleanup                 |       0 |       0 |        0.00 |
-----------------------------------------------------------------
Running Unified Mux Engine Tricks...
Completed Unified Mux Engine Tricks

Stage: post_hlo_rtlopt
----------------------------------------------------------
| Trick                | Accepts | Rejects | Runtime (s) |
----------------------------------------------------------
| ume_sweep_aggressive |       0 |       0 |        0.00 |
| ume_runtime          |       0 |       0 |        0.00 |
----------------------------------------------------------
Info    : Deleting instances not driving any primary outputs. [GLO-34]
        : Deleting 1 hierarchical instance.
Number of big hc bmuxes before = 0
Number of non-ctl's : 3
mux_cmbsop_alu_enable_44_19 mux_alu_enable_32_9 mux_write_enable_32_11
SOP DEBUG : Module= DECODER, Cluster= ctl_44_19, ctl= 3, Non-ctl= 3
Selected impl_type 0 (ctl + 1-hot mux form) for sop cluster ctl_44_19.
Number of non-ctl's : 13
g62 g63 g65 g66 g67 g69 g71 g72 g74 mux_start_uart_60_19 mux_state_60_19 mux_start_uart_59_78 mux_state_59_80
SOP DEBUG : Module= FSM, Cluster= ctl_state_60_19, ctl= 3, Non-ctl= 13
Selected impl_type 0 (ctl + 1-hot mux form) for sop cluster ctl_state_60_19.
Number of non-ctl's : 17
g110 g112 g113 g114 g116 g118 g120 g121 g123 g125 g128 mux_bit_idx_37_19 mux_busy_37_19 mux_clock_count_37_19 mux_state_37_19 mux_tx_37_19 mux_busy_43_132
SOP DEBUG : Module= UART_TX, Cluster= ctl_state_37_19, ctl= 2, Non-ctl= 17
Selected impl_type 0 (ctl + 1-hot mux form) for sop cluster ctl_state_37_19.
Info    : Pre-processed datapath logic. [DPOPT-6]
        : Pre-processing optimizations applied to datapath logic in 'tt_um_Jsilicon':
          sop(3)
Info    : Optimizing datapath logic. [DPOPT-1]
        : Optimizing datapath logic in 'tt_um_Jsilicon'.
Info    : Implementing datapath configurations. [DPOPT-3]
        : Implementing datapath configurations for 'CDN_DP_region_2_0'
CSAGen Prep Share:0 Re-Write:2 Speculation: 0
Info    : Accepted resource sharing opportunity. [RTLOPT-30]
        : Merged the following sets of instances in 'CDN_DP_region_2_0_c7 in tt_um_Jsilicon':
          (SUB_TC_OP_2, SUB_TC_OP_1, SUB_TC_OP, ADD_TC_OP)

Info    : Accepted resource sharing opportunity. [RTLOPT-30]
        : Merged the following sets of instances in 'CDN_DP_region_2_0_c1 in tt_um_Jsilicon':
          (core_inst_alu_inst_rem_39_73, core_inst_alu_inst_div_38_73)
          (core_inst_alu_inst_lt_42_37, core_inst_alu_inst_gt_41_37)

Info    : Accepted resource sharing opportunity. [RTLOPT-30]
        : Merged the following sets of instances in 'CDN_DP_region_2_0_c1 in tt_um_Jsilicon':
          (core_inst_alu_inst_sub_36_48, core_inst_alu_inst_add_35_48)

Info    : Accepted resource sharing opportunity. [RTLOPT-30]
        : Merged the following sets of instances in 'CDN_DP_region_2_0_c2 in tt_um_Jsilicon':
          (core_inst_alu_inst_rem_39_73, core_inst_alu_inst_div_38_73)
          (core_inst_alu_inst_lt_42_37, core_inst_alu_inst_gt_41_37)

Info    : Accepted resource sharing opportunity. [RTLOPT-30]
        : Merged the following sets of instances in 'CDN_DP_region_2_0_c2 in tt_um_Jsilicon':
          (core_inst_alu_inst_sub_36_48, core_inst_alu_inst_add_35_48)

Info    : Accepted resource sharing opportunity. [RTLOPT-30]
        : Merged the following sets of instances in 'CDN_DP_region_2_0_c3 in tt_um_Jsilicon':
          (core_inst_alu_inst_lt_42_37, core_inst_alu_inst_gt_41_37)

Info    : Accepted resource sharing opportunity. [RTLOPT-30]
        : Merged the following sets of instances in 'CDN_DP_region_2_0_c3 in tt_um_Jsilicon':
          (core_inst_alu_inst_sub_36_48, core_inst_alu_inst_add_35_48)

Info    : Accepted resource sharing opportunity. [RTLOPT-30]
        : Merged the following sets of instances in 'CDN_DP_region_2_0_c4 in tt_um_Jsilicon':
          (core_inst_alu_inst_lt_42_37, core_inst_alu_inst_gt_41_37)

Info    : Accepted resource sharing opportunity. [RTLOPT-30]
        : Merged the following sets of instances in 'CDN_DP_region_2_0_c4 in tt_um_Jsilicon':
          (core_inst_alu_inst_sub_36_48, core_inst_alu_inst_add_35_48)

Info    : Accepted resource sharing opportunity. [RTLOPT-30]
        : Merged the following sets of instances in 'CDN_DP_region_2_0_c5 in tt_um_Jsilicon':
          (core_inst_alu_inst_lt_42_37, core_inst_alu_inst_gt_41_37)

Info    : Accepted resource sharing opportunity. [RTLOPT-30]
        : Merged the following sets of instances in 'CDN_DP_region_2_0_c5 in tt_um_Jsilicon':
          (core_inst_alu_inst_sub_36_48, core_inst_alu_inst_add_35_48)

Info    : Accepted resource sharing opportunity. [RTLOPT-30]
        : Merged the following sets of instances in 'CDN_DP_region_2_0_c6 in tt_um_Jsilicon':
          (core_inst_alu_inst_rem_39_73, core_inst_alu_inst_div_38_73)
          (core_inst_alu_inst_lt_42_37, core_inst_alu_inst_gt_41_37)

Info    : Accepted resource sharing opportunity. [RTLOPT-30]
        : Merged the following sets of instances in 'CDN_DP_region_2_0_c6 in tt_um_Jsilicon':
          (core_inst_alu_inst_sub_36_48, core_inst_alu_inst_add_35_48)

CDN_DP_region_2_0 level = 0 loads = 0 drivers = 0
CDN_DP_region_2_0_c0 in tt_um_Jsilicon: area: 28880072566 ,dp = 7 mux = 12  ctl_case = 1  decode = 1  other = 34  sg = slow         worst_clk_period: -1.0000
    wns: 18420  norm_wns:  -1.0000
    fail_endp: -1
    tns:  233357  tns_per_endp:  -1.0000   norm_tns_per_endp:  -1.0000
    tns_sense_max:  -1.0000  tns_sense_avg:  -1.0000   tns_sense_num: -1
 skipped
CDN_DP_region_2_0_c1 in tt_um_Jsilicon: area: 20893467192 ,dp = 4 mux = 13  ctl_case = 0  decode = 1  other = 43  sg = fast         worst_clk_period: -1.0000
    wns: 18772  norm_wns:  -1.0000
    fail_endp: -1
    tns:  241805  tns_per_endp:  -1.0000   norm_tns_per_endp:  -1.0000
    tns_sense_max:  -1.0000  tns_sense_avg:  -1.0000   tns_sense_num: -1
 is current best
CDN_DP_region_2_0_c2 in tt_um_Jsilicon: area: 20893467192 ,dp = 4 mux = 13  ctl_case = 0  decode = 1  other = 43  sg = very_slow    worst_clk_period: -1.0000
    wns: 18772  norm_wns:  -1.0000
    fail_endp: -1
    tns:  241805  tns_per_endp:  -1.0000   norm_tns_per_endp:  -1.0000
    tns_sense_max:  -1.0000  tns_sense_avg:  -1.0000   tns_sense_num: -1
 is current best
CDN_DP_region_2_0_c3 in tt_um_Jsilicon: area: 27604189448 ,dp = 5 mux = 13  ctl_case = 0  decode = 1  other = 43  sg = very_fast    worst_clk_period: -1.0000
    wns: 18363  norm_wns:  -1.0000
    fail_endp: -1
    tns:  231989  tns_per_endp:  -1.0000   norm_tns_per_endp:  -1.0000
    tns_sense_max:  -1.0000  tns_sense_avg:  -1.0000   tns_sense_num: -1
 is current best
CDN_DP_region_2_0_c4 in tt_um_Jsilicon: area: 27604189448 ,dp = 5 mux = 13  ctl_case = 0  decode = 1  other = 43  sg = very_fast    worst_clk_period: -1.0000
    wns: 18363  norm_wns:  -1.0000
    fail_endp: -1
    tns:  231989  tns_per_endp:  -1.0000   norm_tns_per_endp:  -1.0000
    tns_sense_max:  -1.0000  tns_sense_avg:  -1.0000   tns_sense_num: -1
 is current best
CDN_DP_region_2_0_c5 in tt_um_Jsilicon: area: 27604189448 ,dp = 5 mux = 13  ctl_case = 0  decode = 1  other = 43  sg = very_fast    worst_clk_period: -1.0000
    wns: 18363  norm_wns:  -1.0000
    fail_endp: -1
    tns:  231989  tns_per_endp:  -1.0000   norm_tns_per_endp:  -1.0000
    tns_sense_max:  -1.0000  tns_sense_avg:  -1.0000   tns_sense_num: -1
 is current best
CDN_DP_region_2_0_c6 in tt_um_Jsilicon: area: 20893467192 ,dp = 4 mux = 13  ctl_case = 0  decode = 1  other = 43  sg = very_fast    worst_clk_period: -1.0000
    wns: 18772  norm_wns:  -1.0000
    fail_endp: -1
    tns:  241805  tns_per_endp:  -1.0000   norm_tns_per_endp:  -1.0000
    tns_sense_max:  -1.0000  tns_sense_avg:  -1.0000   tns_sense_num: -1

CDN_DP_region_2_0_c7 in tt_um_Jsilicon: area: 27829759944 ,dp = 4 mux = 14  ctl_case = 0  decode = 1  other = 44  sg = very_fast    worst_clk_period: -1.0000
    wns: 18341  norm_wns:  -1.0000
    fail_endp: -1
    tns:  231461  tns_per_endp:  -1.0000   norm_tns_per_endp:  -1.0000
    tns_sense_max:  -1.0000  tns_sense_avg:  -1.0000   tns_sense_num: -1
 is current best
Best config: CDN_DP_region_2_0_c7 in tt_um_Jsilicon: area: 27829759944 ,dp = 4 mux = 14  ctl_case = 0  decode = 1  other = 44  sg = very_fast    worst_clk_period: -1.0000
    wns: 18341  norm_wns:  -1.0000
    fail_endp: -1
    tns:  231461  tns_per_endp:  -1.0000   norm_tns_per_endp:  -1.0000
    tns_sense_max:  -1.0000  tns_sense_avg:  -1.0000   tns_sense_num: -1
  Smallest config area : 20893467192.  Fastest config wns;  18341
##>+----------------------------------------------------------------------------------------------------------------------------------------------------------------+
##>Summary table of configs (Best config is CDN_DP_region_2_0_c7)
##>+----------------------------------------------------------------------------------------------------------------------------------------------------------------+
##>                     0                  1                  2                  3                  4                  5                  6                  7
##>+----------------------------------------------------------------------------------------------------------------------------------------------------------------+
##>           Area      28880072566        20893467192        20893467192        27604189448        27604189448        27604189448        20893467192        27829759944
##>            WNS         -1842.00           -1877.20           -1877.20           -1836.30           -1836.30           -1836.30           -1877.20           -1834.10
##>            TNS           233357             241805             241805             231989             231989             231989             241805             231461
##>    Num Rewrite                0                  0                  0                  0                  0                  0                  0                  2
##>     Num Factor                0                  0                  0                  0                  0                  0                  0                  0
##>      Num Share                0                  3                  3                  2                  2                  2                  3                  2
##>   Num CmultCse                0                  0                  0                  0                  0                  0                  0                  0
##>   Num Downsize                0                  0                  0                  0                  0                  0                  0                  0
##>  Num Speculate                0                  0                  0                  0                  0                  0                  0                  0
##>     Runtime(s)                0                  0                  0                  2                  2                  4                  0                  7
+----------------------------------------------------------------------------------------------------------------------------------------------------------------+
##>
##>
##>+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
##>Optimization Step DEBUG Table for config CDN_DP_region_2_0_c7
##>
##>                          Step                        Area   (  % Chg)         WNS (Change)          TNS (Change)                Power   (  % Chg)        Runtime (s)        Comment
##>+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
##>EquationExtraction              START            28880072566 (       )    -1842.00 (        )     233357 (        )                    0 (       )
##> rewrite                        START            28880072566 (  +0.00)    -1842.00 (   +0.00)     233357 (       0)                    0 (  +0.00)              (a,ar) less_than_from_uns --> less_than_to_uns
##>                                  END            29317115402 (  +1.51)    -1842.00 (   +0.00)     233357 (       0)                    0 (  +0.00)           0
##> rewrite                        START            29317115402 (  +0.00)    -1842.00 (   +0.00)     233357 (       0)                    0 (  +0.00)              (a,ar) greater_than_from_uns --> greater_than_to_uns
##>                                  END            29754158238 (  +1.49)    -1842.00 (   +0.00)     233357 (       0)                    0 (  +0.00)           0
##> rewrite                        START            42075946582 ( +41.41)    -2041.60 ( -199.60)     326366 (   93009)                    0 (  +0.00)              (a,ar) Expr0_from --> Expr0_to
##>                                  END            44162473670 (  +4.96)    -2049.30 (   -7.70)     303578 (  -22788)                    0 (  +0.00)           0
##>                                  END            34159831988 ( +18.28)    -1842.00 (   +0.00)     239820 (    6463)                    0 (  +0.00)           0
##>createMaxCarrySave              START            31389544334 (  -8.11)    -1842.00 (   +0.00)     233357 (   -6463)                    0 (  +0.00)
##> datapath_rewrite_one_def       START            31389544334 (  +0.00)    -1842.00 (   +0.00)     233357 (       0)                    0 (  +0.00)
##>                                  END            31389544334 (  +0.00)    -1842.00 (   +0.00)     233357 (       0)                    0 (  +0.00)           0
##> speculate_in_gdef              START            31389544334 (  +0.00)    -1842.00 (   +0.00)     233357 (       0)                    0 (  +0.00)
##>  pre_speculate_mux_merge       START            31389544334 (  +0.00)    -1842.00 (   +0.00)     233357 (       0)                    0 (  +0.00)
##>                                  END            31389544334 (  +0.00)    -1842.00 (   +0.00)     233357 (       0)                    0 (  +0.00)           0
##>                                  END            31389544334 (  +0.00)    -1842.00 (   +0.00)     233357 (       0)                    0 (  +0.00)           0
##> csa_opto                       START            31389544334 (  +0.00)    -1842.00 (   +0.00)     233357 (       0)                    0 (  +0.00)
##>                                  END            31389544334 (  +0.00)    -1842.00 (   +0.00)     233357 (       0)                    0 (  +0.00)           0
##>                                  END            31389544334 (  +0.00)    -1842.00 (   +0.00)     233357 (       0)                    0 (  +0.00)           0
##>canonicalize_by_names           START            31389544334 (  +0.00)    -1842.00 (   +0.00)     233357 (       0)                    0 (  +0.00)
##>                                  END            31389544334 (  +0.00)    -1842.00 (   +0.00)     233357 (       0)                    0 (  +0.00)           0
##>datapath_rewrite_post_csa_one_  START            31389544334 (  +0.00)    -1842.00 (   +0.00)     233357 (       0)                    0 (  +0.00)
##>                                  END            31389544334 (  +0.00)    -1842.00 (   +0.00)     233357 (       0)                    0 (  +0.00)           0
##>datapath_csa_factoring_one_gde  START            31389544334 (  +0.00)    -1842.00 (   +0.00)     233357 (       0)                    0 (  +0.00)
##>                                  END            31389544334 (  +0.00)    -1842.00 (   +0.00)     233357 (       0)                    0 (  +0.00)           0
##>dpopt_share_one_def             START            31389544334 (  +0.00)    -1842.00 (   +0.00)     233357 (       0)                    0 (  +0.00)
##>                                  END            29796452706 (  -5.08)    -1836.90 (   +5.10)     232133 (   -1224)                    0 (  +0.00)           3
##>datapath_rewrite_post_share     START            29796452706 (  +0.00)    -1836.90 (   +0.00)     232133 (       0)                    0 (  +0.00)
##>                                  END            29796452706 (  +0.00)    -1836.90 (   +0.00)     232133 (       0)                    0 (  +0.00)           0
##>dp_combine_const_mult_with_com  START            29796452706 (  +0.00)    -1836.90 (   +0.00)     232133 (       0)                    0 (  +0.00)
##>                                  END            29796452706 (  +0.00)    -1836.90 (   +0.00)     232133 (       0)                    0 (  +0.00)           0
##>speculate_in_gdef               START            29796452706 (  +0.00)    -1836.90 (   +0.00)     232133 (       0)                    0 (  +0.00)
##> pre_speculate_mux_merge        START            29796452706 (  +0.00)    -1836.90 (   +0.00)     232133 (       0)                    0 (  +0.00)
##>                                  END            29796452706 (  +0.00)    -1836.90 (   +0.00)     232133 (       0)                    0 (  +0.00)           0
##>                                  END            29796452706 (  +0.00)    -1836.90 (   +0.00)     232133 (       0)                    0 (  +0.00)           0
##>dp_operator_level_decompositio  START            29796452706 (  +0.00)    -1836.90 (   +0.00)     232133 (       0)                    0 (  +0.00)
##>                                  END            29796452706 (  +0.00)    -1836.90 (   +0.00)     232133 (       0)                    0 (  +0.00)           0
##>selective_flatten_dp_config     START            29796452706 (  +0.00)    -1836.90 (   +0.00)     232133 (       0)                    0 (  +0.00)
##>                                  END            29796452706 (  +0.00)    -1836.90 (   +0.00)     232133 (       0)                    0 (  +0.00)           0
##>createMaxCarrySave              START            29796452706 (  +0.00)    -1836.90 (   +0.00)     232133 (       0)                    0 (  +0.00)
##> datapath_rewrite_one_def       START            29796452706 (  +0.00)    -1836.90 (   +0.00)     232133 (       0)                    0 (  +0.00)
##>  fast_cse_elim                 START            29796452706 (  +0.00)    -1836.90 (   +0.00)     232133 (       0)                    0 (  +0.00)
##>                                  END            29747109160 (  -0.17)    -1836.90 (   +0.00)     232133 (       0)                    0 (  +0.00)           0
##>  fast_cse_elim                 START            29747109160 (  +0.00)    -1836.90 (   +0.00)     232133 (       0)                    0 (  +0.00)
##>                                  END            29747109160 (  +0.00)    -1836.90 (   +0.00)     232133 (       0)                    0 (  +0.00)           0
##>                                  END            29747109160 (  -0.17)    -1836.90 (   +0.00)     232133 (       0)                    0 (  +0.00)           0
##> speculate_in_gdef              START            29747109160 (  +0.00)    -1836.90 (   +0.00)     232133 (       0)                    0 (  +0.00)
##>  pre_speculate_mux_merge       START            29747109160 (  +0.00)    -1836.90 (   +0.00)     232133 (       0)                    0 (  +0.00)
##>                                  END            29747109160 (  +0.00)    -1836.90 (   +0.00)     232133 (       0)                    0 (  +0.00)           0
##>                                  END            29747109160 (  +0.00)    -1836.90 (   +0.00)     232133 (       0)                    0 (  +0.00)           0
##> csa_opto                       START            29747109160 (  +0.00)    -1836.90 (   +0.00)     232133 (       0)                    0 (  +0.00)
##>                                  END            29747109160 (  +0.00)    -1836.90 (   +0.00)     232133 (       0)                    0 (  +0.00)           0
##>                                  END            29747109160 (  -0.17)    -1836.90 (   +0.00)     232133 (       0)                    0 (  +0.00)           0
##>datapath_rewrite_post_csa_one_  START            29747109160 (  +0.00)    -1836.90 (   +0.00)     232133 (       0)                    0 (  +0.00)
##>                                  END            29747109160 (  +0.00)    -1836.90 (   +0.00)     232133 (       0)                    0 (  +0.00)           0
##>datapath_csa_factoring_one_gde  START            29747109160 (  +0.00)    -1836.90 (   +0.00)     232133 (       0)                    0 (  +0.00)
##>                                  END            29747109160 (  +0.00)    -1836.90 (   +0.00)     232133 (       0)                    0 (  +0.00)           0
##>dpopt_share_one_def             START            29747109160 (  +0.00)    -1836.90 (   +0.00)     232133 (       0)                    0 (  +0.00)
##>                                  END            29747109160 (  +0.00)    -1836.90 (   +0.00)     232133 (       0)                    0 (  +0.00)           0
##>datapath_rewrite_post_share     START            29747109160 (  +0.00)    -1836.90 (   +0.00)     232133 (       0)                    0 (  +0.00)
##>                                  END            29747109160 (  +0.00)    -1836.90 (   +0.00)     232133 (       0)                    0 (  +0.00)           0
##>dp_combine_const_mult_with_com  START            29747109160 (  +0.00)    -1836.90 (   +0.00)     232133 (       0)                    0 (  +0.00)
##>                                  END            29747109160 (  +0.00)    -1836.90 (   +0.00)     232133 (       0)                    0 (  +0.00)           0
##>speculate_in_gdef               START            29747109160 (  +0.00)    -1836.90 (   +0.00)     232133 (       0)                    0 (  +0.00)
##> pre_speculate_mux_merge        START            29747109160 (  +0.00)    -1836.90 (   +0.00)     232133 (       0)                    0 (  +0.00)
##>                                  END            29747109160 (  +0.00)    -1836.90 (   +0.00)     232133 (       0)                    0 (  +0.00)           0
##>                                  END            29747109160 (  +0.00)    -1836.90 (   +0.00)     232133 (       0)                    0 (  +0.00)           0
##>dp_operator_level_decompositio  START            29747109160 (  +0.00)    -1836.90 (   +0.00)     232133 (       0)                    0 (  +0.00)
##>                                  END            29747109160 (  +0.00)    -1836.90 (   +0.00)     232133 (       0)                    0 (  +0.00)           0
##>selective_flatten_dp_config     START            29747109160 (  +0.00)    -1836.90 (   +0.00)     232133 (       0)                    0 (  +0.00)
##>                                  END            29747109160 (  +0.00)    -1836.90 (   +0.00)     232133 (       0)                    0 (  +0.00)           0
##>createMaxCarrySave              START            29747109160 (  +0.00)    -1836.90 (   +0.00)     232133 (       0)                    0 (  +0.00)
##> datapath_rewrite_one_def       START            29747109160 (  +0.00)    -1836.90 (   +0.00)     232133 (       0)                    0 (  +0.00)
##>  fast_cse_elim                 START            29747109160 (  +0.00)    -1836.90 (   +0.00)     232133 (       0)                    0 (  +0.00)
##>                                  END            29747109160 (  +0.00)    -1836.90 (   +0.00)     232133 (       0)                    0 (  +0.00)           0
##>  fast_cse_elim                 START            29747109160 (  +0.00)    -1836.90 (   +0.00)     232133 (       0)                    0 (  +0.00)
##>                                  END            29747109160 (  +0.00)    -1836.90 (   +0.00)     232133 (       0)                    0 (  +0.00)           0
##>                                  END            29747109160 (  +0.00)    -1836.90 (   +0.00)     232133 (       0)                    0 (  +0.00)           0
##> speculate_in_gdef              START            29747109160 (  +0.00)    -1836.90 (   +0.00)     232133 (       0)                    0 (  +0.00)
##>  pre_speculate_mux_merge       START            29747109160 (  +0.00)    -1836.90 (   +0.00)     232133 (       0)                    0 (  +0.00)
##>                                  END            29747109160 (  +0.00)    -1836.90 (   +0.00)     232133 (       0)                    0 (  +0.00)           0
##>                                  END            29747109160 (  +0.00)    -1836.90 (   +0.00)     232133 (       0)                    0 (  +0.00)           0
##> csa_opto                       START            29747109160 (  +0.00)    -1836.90 (   +0.00)     232133 (       0)                    0 (  +0.00)
##>                                  END            29747109160 (  +0.00)    -1836.90 (   +0.00)     232133 (       0)                    0 (  +0.00)           0
##>                                  END            29747109160 (  +0.00)    -1836.90 (   +0.00)     232133 (       0)                    0 (  +0.00)           0
##>context_based_simplify          START            28041232284 (  -5.73)    -1836.90 (   +0.00)     232133 (       0)                    0 (  +0.00)
##>                                  END            28041232284 (  +0.00)    -1836.90 (   +0.00)     232133 (       0)                    0 (  +0.00)           0
##>group_csa_final_adder_dp        START            28041232284 (  +0.00)    -1836.90 (   +0.00)     232133 (       0)                    0 (  +0.00)
##>                                  END            28041232284 (  +0.00)    -1836.90 (   +0.00)     232133 (       0)                    0 (  +0.00)           0
##>dpopt_flatten_critical_muxes_i  START            28041232284 (  +0.00)    -1836.90 (   +0.00)     232133 (       0)                    0 (  +0.00)
##>                                  END            27829759944 (  -0.75)    -1834.10 (   +2.80)     231461 (    -672)                    0 (  +0.00)           0
##>speculate_in_gdef               START            27829759944 (  +0.00)    -1834.10 (   +0.00)     231461 (       0)                    0 (  +0.00)
##> pre_speculate_mux_merge        START            27829759944 (  +0.00)    -1834.10 (   +0.00)     231461 (       0)                    0 (  +0.00)
##>                                  END            27829759944 (  +0.00)    -1834.10 (   +0.00)     231461 (       0)                    0 (  +0.00)           0
##>                                  END            27829759944 (  +0.00)    -1834.10 (   +0.00)     231461 (       0)                    0 (  +0.00)           0
##>create_score                    START            27829759944 (  +0.00)    -1834.10 (   +0.00)     231461 (       0)                    0 (  +0.00)
##>                                  END            27829759944 (  +0.00)    -1834.10 (   +0.00)     231461 (       0)                    0 (  +0.00)           0
##>+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
Committed config: CDN_DP_region_2_0_c7
Info    : Done implementing datapath configurations. [DPOPT-4]
        : Selected 'very_fast' configuration 7 for module 'CDN_DP_region_2_0_c7'.
          Optimizations applied to 'very_fast' configuration:
            rewriting(2), factoring(0), sharing(2), cmultcse(0), downsizing(0), speculation(0)
Info    : Implementing datapath configurations. [DPOPT-3]
        : Implementing datapath configurations for 'CDN_DP_region_1_0'
CSAGen Prep Share:0 Re-Write:1 Speculation: 0
CDN_DP_region_1_0 level = 0 loads = 0 drivers = 0
CDN_DP_region_1_0_c0 in UART_TX: area: 1508502692 ,dp = 2 mux = 1  ctl_case = 0  decode = 0  other = 1  sg = slow         worst_clk_period: -1.0000
    wns: 0  norm_wns:  -1.0000
    fail_endp: -1
    tns:  0  tns_per_endp:  -1.0000   norm_tns_per_endp:  -1.0000
    tns_sense_max:  -1.0000  tns_sense_avg:  -1.0000   tns_sense_num: -1
 skipped
CDN_DP_region_1_0_c1 in UART_TX: area: 1212441416 ,dp = 2 mux = 1  ctl_case = 0  decode = 0  other = 1  sg = fast         worst_clk_period: -1.0000
    wns: 0  norm_wns:  -1.0000
    fail_endp: -1
    tns:  0  tns_per_endp:  -1.0000   norm_tns_per_endp:  -1.0000
    tns_sense_max:  -1.0000  tns_sense_avg:  -1.0000   tns_sense_num: -1
 is current best
CDN_DP_region_1_0_c2 in UART_TX: area: 1212441416 ,dp = 2 mux = 1  ctl_case = 0  decode = 0  other = 1  sg = very_slow    worst_clk_period: -1.0000
    wns: 0  norm_wns:  -1.0000
    fail_endp: -1
    tns:  0  tns_per_endp:  -1.0000   norm_tns_per_endp:  -1.0000
    tns_sense_max:  -1.0000  tns_sense_avg:  -1.0000   tns_sense_num: -1
 is current best
CDN_DP_region_1_0_c3 in UART_TX: area: 1212441416 ,dp = 2 mux = 1  ctl_case = 0  decode = 0  other = 1  sg = very_fast    worst_clk_period: -1.0000
    wns: 0  norm_wns:  -1.0000
    fail_endp: -1
    tns:  0  tns_per_endp:  -1.0000   norm_tns_per_endp:  -1.0000
    tns_sense_max:  -1.0000  tns_sense_avg:  -1.0000   tns_sense_num: -1
 is current best
CDN_DP_region_1_0_c4 in UART_TX: area: 1212441416 ,dp = 2 mux = 1  ctl_case = 0  decode = 0  other = 1  sg = very_fast    worst_clk_period: -1.0000
    wns: 0  norm_wns:  -1.0000
    fail_endp: -1
    tns:  0  tns_per_endp:  -1.0000   norm_tns_per_endp:  -1.0000
    tns_sense_max:  -1.0000  tns_sense_avg:  -1.0000   tns_sense_num: -1
 is current best
CDN_DP_region_1_0_c5 in UART_TX: area: 1212441416 ,dp = 2 mux = 1  ctl_case = 0  decode = 0  other = 1  sg = very_fast    worst_clk_period: -1.0000
    wns: 0  norm_wns:  -1.0000
    fail_endp: -1
    tns:  0  tns_per_endp:  -1.0000   norm_tns_per_endp:  -1.0000
    tns_sense_max:  -1.0000  tns_sense_avg:  -1.0000   tns_sense_num: -1
 is current best
CDN_DP_region_1_0_c6 in UART_TX: area: 1212441416 ,dp = 2 mux = 1  ctl_case = 0  decode = 0  other = 1  sg = very_fast    worst_clk_period: -1.0000
    wns: 0  norm_wns:  -1.0000
    fail_endp: -1
    tns:  0  tns_per_endp:  -1.0000   norm_tns_per_endp:  -1.0000
    tns_sense_max:  -1.0000  tns_sense_avg:  -1.0000   tns_sense_num: -1
 is current best
CDN_DP_region_1_0_c7 in UART_TX: area: 1508502692 ,dp = 2 mux = 1  ctl_case = 0  decode = 0  other = 1  sg = very_fast    worst_clk_period: -1.0000
    wns: 0  norm_wns:  -1.0000
    fail_endp: -1
    tns:  0  tns_per_endp:  -1.0000   norm_tns_per_endp:  -1.0000
    tns_sense_max:  -1.0000  tns_sense_avg:  -1.0000   tns_sense_num: -1

Best config: CDN_DP_region_1_0_c6 in UART_TX: area: 1212441416 ,dp = 2 mux = 1  ctl_case = 0  decode = 0  other = 1  sg = very_fast    worst_clk_period: -1.0000
    wns: 0  norm_wns:  -1.0000
    fail_endp: -1
    tns:  0  tns_per_endp:  -1.0000   norm_tns_per_endp:  -1.0000
    tns_sense_max:  -1.0000  tns_sense_avg:  -1.0000   tns_sense_num: -1
  Smallest config area : 1212441416.  Fastest config wns;  0
##>+----------------------------------------------------------------------------------------------------------------------------------------------------------------+
##>Summary table of configs (Best config is CDN_DP_region_1_0_c6)
##>+----------------------------------------------------------------------------------------------------------------------------------------------------------------+
##>                     0                  1                  2                  3                  4                  5                  6                  7
##>+----------------------------------------------------------------------------------------------------------------------------------------------------------------+
##>           Area       1508502692         1212441416         1212441416         1212441416         1212441416         1212441416         1212441416         1508502692
##>            WNS         +3604.10           +3759.30           +3759.30           +3759.30           +3759.30           +3759.30           +3759.30           +3604.10
##>            TNS                0                  0                  0                  0                  0                  0                  0                  0
##>    Num Rewrite                0                  0                  0                  0                  0                  0                  0                  2
##>     Num Factor                0                  0                  0                  0                  0                  0                  0                  0
##>      Num Share                0                  0                  0                  0                  0                  0                  0                  0
##>   Num CmultCse                0                  0                  0                  0                  0                  0                  0                  0
##>   Num Downsize                0                  0                  0                  0                  0                  0                  0                  0
##>  Num Speculate                0                  0                  0                  0                  0                  0                  0                  0
##>     Runtime(s)                0                  0                  0                  0                  0                  0                  0                  0
+----------------------------------------------------------------------------------------------------------------------------------------------------------------+
##>
##>
##>+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
##>Optimization Step DEBUG Table for config CDN_DP_region_1_0_c6
##>
##>                          Step                        Area   (  % Chg)         WNS (Change)          TNS (Change)                Power   (  % Chg)        Runtime (s)        Comment
##>+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
##>createMaxCarrySave              START             1508502692 (       )    107377786.50 (        )          0 (        )                    0 (       )
##> datapath_rewrite_one_def       START             1508502692 (  +0.00)    107377786.50 (   +0.00)          0 (       0)                    0 (  +0.00)
##>  fast_cse_elim                 START             1508502692 (  +0.00)    107377786.50 (   +0.00)          0 (       0)                    0 (  +0.00)
##>                                  END             1508502692 (  +0.00)    107377786.50 (   +0.00)          0 (       0)                    0 (  +0.00)           0
##>  fast_cse_elim                 START             1508502692 (  +0.00)    107377786.50 (   +0.00)          0 (       0)                    0 (  +0.00)
##>                                  END             1508502692 (  +0.00)    107377786.50 (   +0.00)          0 (       0)                    0 (  +0.00)           0
##>                                  END             1508502692 (  +0.00)    107377786.50 (   +0.00)          0 (       0)                    0 (  +0.00)           0
##> dpopt_share_one_def            START             1508502692 (  +0.00)    107377786.50 (   +0.00)          0 (       0)                    0 (  +0.00)
##>                                  END             1508502692 (  +0.00)    107377786.50 (   +0.00)          0 (       0)                    0 (  +0.00)           0
##> csa_opto                       START             1508502692 (  +0.00)    214748364.70 (+107370578.20)          0 (       0)                    0 (  +0.00)
##>                                  END             1452110068 (  -3.74)    214748364.70 (   +0.00)          0 (       0)                    0 (  +0.00)           0
##>                                  END             1452110068 (  -3.74)    214748364.70 (+107370578.20)          0 (       0)                    0 (  +0.00)           0
##>canonicalize_by_names           START             1452110068 (  +0.00)    214748364.70 (   +0.00)          0 (       0)                    0 (  +0.00)
##>                                  END             1452110068 (  +0.00)    214748364.70 (   +0.00)          0 (       0)                    0 (  +0.00)           0
##>datapath_rewrite_post_csa_one_  START             1452110068 (  +0.00)    214748364.70 (   +0.00)          0 (       0)                    0 (  +0.00)
##>                                  END             1452110068 (  +0.00)    214748364.70 (   +0.00)          0 (       0)                    0 (  +0.00)           0
##>datapath_csa_factoring_one_gde  START             1452110068 (  +0.00)    214748364.70 (   +0.00)          0 (       0)                    0 (  +0.00)
##>                                  END             1452110068 (  +0.00)    214748364.70 (   +0.00)          0 (       0)                    0 (  +0.00)           0
##>dpopt_share_one_def             START             1452110068 (  +0.00)    214748364.70 (   +0.00)          0 (       0)                    0 (  +0.00)
##>                                  END             1452110068 (  +0.00)    214748364.70 (   +0.00)          0 (       0)                    0 (  +0.00)           0
##>datapath_rewrite_post_share     START             1452110068 (  +0.00)    214748364.70 (   +0.00)          0 (       0)                    0 (  +0.00)
##>                                  END             1452110068 (  +0.00)    214748364.70 (   +0.00)          0 (       0)                    0 (  +0.00)           0
##>dp_combine_const_mult_with_com  START             1452110068 (  +0.00)    214748364.70 (   +0.00)          0 (       0)                    0 (  +0.00)
##>                                  END             1452110068 (  +0.00)    214748364.70 (   +0.00)          0 (       0)                    0 (  +0.00)           0
##>dp_operator_level_decompositio  START             1452110068 (  +0.00)    214748364.70 (   +0.00)          0 (       0)                    0 (  +0.00)
##>                                  END             1452110068 (  +0.00)    214748364.70 (   +0.00)          0 (       0)                    0 (  +0.00)           0
##>selective_flatten_dp_config     START             1452110068 (  +0.00)    214748364.70 (   +0.00)          0 (       0)                    0 (  +0.00)
##>                                  END             1452110068 (  +0.00)    214748364.70 (   +0.00)          0 (       0)                    0 (  +0.00)           0
##>createMaxCarrySave              START             1452110068 (  +0.00)    214748364.70 (   +0.00)          0 (       0)                    0 (  +0.00)
##> datapath_rewrite_one_def       START             1452110068 (  +0.00)    214748364.70 (   +0.00)          0 (       0)                    0 (  +0.00)
##>  fast_cse_elim                 START             1452110068 (  +0.00)    214748364.70 (   +0.00)          0 (       0)                    0 (  +0.00)
##>                                  END             1452110068 (  +0.00)    214748364.70 (   +0.00)          0 (       0)                    0 (  +0.00)           0
##>  fast_cse_elim                 START             1452110068 (  +0.00)    214748364.70 (   +0.00)          0 (       0)                    0 (  +0.00)
##>                                  END             1452110068 (  +0.00)    214748364.70 (   +0.00)          0 (       0)                    0 (  +0.00)           0
##>                                  END             1452110068 (  +0.00)    214748364.70 (   +0.00)          0 (       0)                    0 (  +0.00)           0
##> dpopt_share_one_def            START             1452110068 (  +0.00)    214748364.70 (   +0.00)          0 (       0)                    0 (  +0.00)
##>                                  END             1452110068 (  +0.00)    214748364.70 (   +0.00)          0 (       0)                    0 (  +0.00)           0
##> csa_opto                       START             1452110068 (  +0.00)    214748364.70 (   +0.00)          0 (       0)                    0 (  +0.00)
##>                                  END             1452110068 (  +0.00)    214748364.70 (   +0.00)          0 (       0)                    0 (  +0.00)           0
##>                                  END             1452110068 (  +0.00)    214748364.70 (   +0.00)          0 (       0)                    0 (  +0.00)           0
##>context_based_simplify          START             1423913756 (  -1.94)    214748364.70 (   +0.00)          0 (       0)                    0 (  +0.00)
##>                                  END             1212441416 ( -14.85)    214748364.70 (   +0.00)          0 (       0)                    0 (  +0.00)           0
##>group_csa_final_adder_dp        START             1212441416 (  +0.00)    214748364.70 (   +0.00)          0 (       0)                    0 (  +0.00)
##>                                  END             1212441416 (  +0.00)    214748364.70 (   +0.00)          0 (       0)                    0 (  +0.00)           0
##>dpopt_flatten_critical_muxes_i  START             1212441416 (  +0.00)    214748364.70 (   +0.00)          0 (       0)                    0 (  +0.00)
##>                                  END             1212441416 (  +0.00)    214748364.70 (   +0.00)          0 (       0)                    0 (  +0.00)           0
##>create_score                    START             1212441416 (  +0.00)     3759.30 (-214744605.40)          0 (       0)                    0 (  +0.00)
##>                                  END             1212441416 (  +0.00)     3759.30 (   +0.00)          0 (       0)                    0 (  +0.00)           0
##>+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
Committed config: CDN_DP_region_1_0_c6
Info    : Done implementing datapath configurations. [DPOPT-4]
        : Selected 'very_fast' configuration 6 for module 'CDN_DP_region_1_0_c6'.
          Optimizations applied to 'very_fast' configuration:
            rewriting(0), factoring(0), sharing(0), cmultcse(0), downsizing(0), speculation(0)
Info    : Implementing datapath configurations. [DPOPT-3]
        : Implementing datapath configurations for 'CDN_DP_region_1_1'
CSAGen Prep Share:0 Re-Write:0 Speculation: 0
CDN_DP_region_1_1 level = 0 loads = 0 drivers = 0
CDN_DP_region_1_1_c0 in UART_TX: area: 183276028 ,dp = 1 mux = 1  ctl_case = 0  decode = 0  other = 2  sg = slow         worst_clk_period: -1.0000
    wns: 0  norm_wns:  -1.0000
    fail_endp: -1
    tns:  0  tns_per_endp:  -1.0000   norm_tns_per_endp:  -1.0000
    tns_sense_max:  -1.0000  tns_sense_avg:  -1.0000   tns_sense_num: -1
 skipped
CDN_DP_region_1_1_c1 in UART_TX: area: 162128794 ,dp = 1 mux = 1  ctl_case = 0  decode = 0  other = 2  sg = fast         worst_clk_period: -1.0000
    wns: 0  norm_wns:  -1.0000
    fail_endp: -1
    tns:  0  tns_per_endp:  -1.0000   norm_tns_per_endp:  -1.0000
    tns_sense_max:  -1.0000  tns_sense_avg:  -1.0000   tns_sense_num: -1
 is current best
CDN_DP_region_1_1_c2 in UART_TX: area: 162128794 ,dp = 1 mux = 1  ctl_case = 0  decode = 0  other = 2  sg = very_slow    worst_clk_period: -1.0000
    wns: 0  norm_wns:  -1.0000
    fail_endp: -1
    tns:  0  tns_per_endp:  -1.0000   norm_tns_per_endp:  -1.0000
    tns_sense_max:  -1.0000  tns_sense_avg:  -1.0000   tns_sense_num: -1
 is current best
CDN_DP_region_1_1_c3 in UART_TX: area: 162128794 ,dp = 1 mux = 1  ctl_case = 0  decode = 0  other = 2  sg = very_fast    worst_clk_period: -1.0000
    wns: 0  norm_wns:  -1.0000
    fail_endp: -1
    tns:  0  tns_per_endp:  -1.0000   norm_tns_per_endp:  -1.0000
    tns_sense_max:  -1.0000  tns_sense_avg:  -1.0000   tns_sense_num: -1
 is current best
CDN_DP_region_1_1_c4 in UART_TX: area: 162128794 ,dp = 1 mux = 1  ctl_case = 0  decode = 0  other = 2  sg = very_fast    worst_clk_period: -1.0000
    wns: 0  norm_wns:  -1.0000
    fail_endp: -1
    tns:  0  tns_per_endp:  -1.0000   norm_tns_per_endp:  -1.0000
    tns_sense_max:  -1.0000  tns_sense_avg:  -1.0000   tns_sense_num: -1
 is current best
CDN_DP_region_1_1_c5 in UART_TX: area: 162128794 ,dp = 1 mux = 1  ctl_case = 0  decode = 0  other = 2  sg = very_fast    worst_clk_period: -1.0000
    wns: 0  norm_wns:  -1.0000
    fail_endp: -1
    tns:  0  tns_per_endp:  -1.0000   norm_tns_per_endp:  -1.0000
    tns_sense_max:  -1.0000  tns_sense_avg:  -1.0000   tns_sense_num: -1
 is current best
CDN_DP_region_1_1_c6 in UART_TX: area: 162128794 ,dp = 1 mux = 1  ctl_case = 0  decode = 0  other = 2  sg = very_fast    worst_clk_period: -1.0000
    wns: 0  norm_wns:  -1.0000
    fail_endp: -1
    tns:  0  tns_per_endp:  -1.0000   norm_tns_per_endp:  -1.0000
    tns_sense_max:  -1.0000  tns_sense_avg:  -1.0000   tns_sense_num: -1
 is current best
CDN_DP_region_1_1_c7 in UART_TX: area: 162128794 ,dp = 1 mux = 1  ctl_case = 0  decode = 0  other = 2  sg = very_fast    worst_clk_period: -1.0000
    wns: 0  norm_wns:  -1.0000
    fail_endp: -1
    tns:  0  tns_per_endp:  -1.0000   norm_tns_per_endp:  -1.0000
    tns_sense_max:  -1.0000  tns_sense_avg:  -1.0000   tns_sense_num: -1
 is current best
Best config: CDN_DP_region_1_1_c7 in UART_TX: area: 162128794 ,dp = 1 mux = 1  ctl_case = 0  decode = 0  other = 2  sg = very_fast    worst_clk_period: -1.0000
    wns: 0  norm_wns:  -1.0000
    fail_endp: -1
    tns:  0  tns_per_endp:  -1.0000   norm_tns_per_endp:  -1.0000
    tns_sense_max:  -1.0000  tns_sense_avg:  -1.0000   tns_sense_num: -1
  Smallest config area : 162128794.  Fastest config wns;  0
##>+----------------------------------------------------------------------------------------------------------------------------------------------------------------+
##>Summary table of configs (Best config is CDN_DP_region_1_1_c7)
##>+----------------------------------------------------------------------------------------------------------------------------------------------------------------+
##>                     0                  1                  2                  3                  4                  5                  6                  7
##>+----------------------------------------------------------------------------------------------------------------------------------------------------------------+
##>           Area        183276028          162128794          162128794          162128794          162128794          162128794          162128794          162128794
##>            WNS         +3865.60           +3865.60           +3865.60           +3865.60           +3865.60           +3865.60           +3865.60           +3865.60
##>            TNS                0                  0                  0                  0                  0                  0                  0                  0
##>    Num Rewrite                0                  0                  0                  0                  0                  0                  0                  0
##>     Num Factor                0                  0                  0                  0                  0                  0                  0                  0
##>      Num Share                0                  0                  0                  0                  0                  0                  0                  0
##>   Num CmultCse                0                  0                  0                  0                  0                  0                  0                  0
##>   Num Downsize                0                  0                  0                  0                  0                  0                  0                  0
##>  Num Speculate                0                  0                  0                  0                  0                  0                  0                  0
##>     Runtime(s)                0                  0                  0                  0                  0                  0                  0                  0
+----------------------------------------------------------------------------------------------------------------------------------------------------------------+
##>
##>
##>+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
##>Optimization Step DEBUG Table for config CDN_DP_region_1_1_c7
##>
##>                          Step                        Area   (  % Chg)         WNS (Change)          TNS (Change)                Power   (  % Chg)        Runtime (s)        Comment
##>+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
##>EquationExtraction              START              183276028 (       )     3865.60 (        )          0 (        )                    0 (       )
##> rewrite                        START              246717730 ( +34.62)     3829.60 (  -36.00)          0 (       0)                    0 (  +0.00)              (a,ar) Expr2_from --> Expr2_to
##>                                  END              387699290 ( +57.14)     3829.60 (   +0.00)          0 (       0)                    0 (  +0.00)           0
##>                                  END              183276028 (  +0.00)     3865.60 (   +0.00)          0 (       0)                    0 (  +0.00)           0
##>createMaxCarrySave              START              183276028 (  +0.00)     3865.60 (   +0.00)          0 (       0)                    0 (  +0.00)
##> datapath_rewrite_one_def       START              183276028 (  +0.00)     3865.60 (   +0.00)          0 (       0)                    0 (  +0.00)
##>                                  END              183276028 (  +0.00)     3865.60 (   +0.00)          0 (       0)                    0 (  +0.00)           0
##> csa_opto                       START              183276028 (  +0.00)     3865.60 (   +0.00)          0 (       0)                    0 (  +0.00)
##>                                  END              197374184 (  +7.69)     3865.60 (   +0.00)          0 (       0)                    0 (  +0.00)           0
##>                                  END              197374184 (  +7.69)     3865.60 (   +0.00)          0 (       0)                    0 (  +0.00)           0
##>canonicalize_by_names           START              197374184 (  +0.00)     3865.60 (   +0.00)          0 (       0)                    0 (  +0.00)
##>                                  END              197374184 (  +0.00)     3865.60 (   +0.00)          0 (       0)                    0 (  +0.00)           0
##>datapath_rewrite_post_csa_one_  START              197374184 (  +0.00)     3865.60 (   +0.00)          0 (       0)                    0 (  +0.00)
##>                                  END              197374184 (  +0.00)     3865.60 (   +0.00)          0 (       0)                    0 (  +0.00)           0
##>datapath_csa_factoring_one_gde  START              197374184 (  +0.00)     3865.60 (   +0.00)          0 (       0)                    0 (  +0.00)
##>                                  END              197374184 (  +0.00)     3865.60 (   +0.00)          0 (       0)                    0 (  +0.00)           0
##>dpopt_share_one_def             START              197374184 (  +0.00)     3865.60 (   +0.00)          0 (       0)                    0 (  +0.00)
##>                                  END              197374184 (  +0.00)     3865.60 (   +0.00)          0 (       0)                    0 (  +0.00)           0
##>datapath_rewrite_post_share     START              197374184 (  +0.00)     3865.60 (   +0.00)          0 (       0)                    0 (  +0.00)
##>                                  END              197374184 (  +0.00)     3865.60 (   +0.00)          0 (       0)                    0 (  +0.00)           0
##>dp_combine_const_mult_with_com  START              197374184 (  +0.00)     3865.60 (   +0.00)          0 (       0)                    0 (  +0.00)
##>                                  END              197374184 (  +0.00)     3865.60 (   +0.00)          0 (       0)                    0 (  +0.00)           0
##>dp_operator_level_decompositio  START              197374184 (  +0.00)     3865.60 (   +0.00)          0 (       0)                    0 (  +0.00)
##>                                  END              197374184 (  +0.00)     3865.60 (   +0.00)          0 (       0)                    0 (  +0.00)           0
##>selective_flatten_dp_config     START              197374184 (  +0.00)     3865.60 (   +0.00)          0 (       0)                    0 (  +0.00)
##>                                  END              197374184 (  +0.00)     3865.60 (   +0.00)          0 (       0)                    0 (  +0.00)           0
##>createMaxCarrySave              START              197374184 (  +0.00)     3865.60 (   +0.00)          0 (       0)                    0 (  +0.00)
##> datapath_rewrite_one_def       START              197374184 (  +0.00)     3865.60 (   +0.00)          0 (       0)                    0 (  +0.00)
##>  fast_cse_elim                 START              197374184 (  +0.00)     3865.60 (   +0.00)          0 (       0)                    0 (  +0.00)
##>                                  END              197374184 (  +0.00)     3865.60 (   +0.00)          0 (       0)                    0 (  +0.00)           0
##>  fast_cse_elim                 START              197374184 (  +0.00)     3865.60 (   +0.00)          0 (       0)                    0 (  +0.00)
##>                                  END              197374184 (  +0.00)     3865.60 (   +0.00)          0 (       0)                    0 (  +0.00)           0
##>                                  END              197374184 (  +0.00)     3865.60 (   +0.00)          0 (       0)                    0 (  +0.00)           0
##> csa_opto                       START              197374184 (  +0.00)     3865.60 (   +0.00)          0 (       0)                    0 (  +0.00)
##>                                  END              197374184 (  +0.00)     3865.60 (   +0.00)          0 (       0)                    0 (  +0.00)           0
##>                                  END              197374184 (  +0.00)     3865.60 (   +0.00)          0 (       0)                    0 (  +0.00)           0
##>context_based_simplify          START              169177872 ( -14.29)     3865.60 (   +0.00)          0 (       0)                    0 (  +0.00)
##>                                  END              162128794 (  -4.17)     3865.60 (   +0.00)          0 (       0)                    0 (  +0.00)           0
##>group_csa_final_adder_dp        START              162128794 (  +0.00)     3865.60 (   +0.00)          0 (       0)                    0 (  +0.00)
##>                                  END              162128794 (  +0.00)     3865.60 (   +0.00)          0 (       0)                    0 (  +0.00)           0
##>dpopt_flatten_critical_muxes_i  START              162128794 (  +0.00)     3865.60 (   +0.00)          0 (       0)                    0 (  +0.00)
##>                                  END              162128794 (  +0.00)     3865.60 (   +0.00)          0 (       0)                    0 (  +0.00)           0
##>create_score                    START              162128794 (  +0.00)     3865.60 (   +0.00)          0 (       0)                    0 (  +0.00)
##>                                  END              162128794 (  +0.00)     3865.60 (   +0.00)          0 (       0)                    0 (  +0.00)           0
##>+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
Committed config: CDN_DP_region_1_1_c7
Info    : Done implementing datapath configurations. [DPOPT-4]
        : Selected 'very_fast' configuration 7 for module 'CDN_DP_region_1_1_c7'.
          Optimizations applied to 'very_fast' configuration:
            rewriting(0), factoring(0), sharing(0), cmultcse(0), downsizing(0), speculation(0)
Info:  Ungrouped 0 dp-cluster instances.  0 cluster instances were left intact, to aid verification.
Info    : Deleting instances not driving any primary outputs. [GLO-34]
        : Deleting 1 sequential instance.
Info    : Done optimizing datapath logic. [DPOPT-2]
        : Done optimizing datapath logic in 'tt_um_Jsilicon'.
Number of big hc bmuxes after = 0
Starting bit-level redundancy removal [v1.0] (stage: post_rtlopt, startdef: tt_um_Jsilicon, recur: true)
Completed bit-level redundancy removal (accepts: 0, rejects: 0, runtime: 0.043s)
Starting logic reduction [v1.0] (stage: post_rtlopt, startdef: tt_um_Jsilicon, recur: true)
Completed logic reduction (accepts: 0, rejects: 0, runtime: 0.000s)
Starting mux data reorder optimization [v1.0] (stage: post_rtlopt, startdef: tt_um_Jsilicon, recur: true)
Completed mux data reorder optimization (accepts: 0, rejects: 0, runtime: 0.000s)
Starting timing based select reordering [v1.0] (stage: post_rtlopt, startdef: tt_um_Jsilicon, recur: true)
Completed timing based select reordering (accepts: 0, rejects: 0, runtime: 0.070s)

Stage: post_rtlopt
----------------------------------------------------------------
| Transform                  | Accepts | Rejects | Runtime (s) |
----------------------------------------------------------------
| hlo_redundancy_removal_bit |       0 |       0 |        0.04 |
| hlo_logic_reduction        |       0 |       0 |        0.00 |
| hlo_mux_reorder            |       0 |       0 |        0.00 |
| hlo_timing_reorder         |       0 |       0 |        0.07 |
----------------------------------------------------------------
Running post blast mux optimization. Please follow up with Cadence support if runtime issues are seen with this optimization.
Running post blast mux optimization. Please follow up with Cadence support if runtime issues are seen with this optimization.
Starting mux speculation [v1.0] (stage: post_muxopt, startdef: tt_um_Jsilicon, recur: true)
Starting speculation optimization
Completed speculation optimization (accepts:0)
Completed mux speculation (accepts: 0, rejects: 0, runtime: 0.069s)
Starting timing based select reordering [v1.0] (stage: post_muxopt, startdef: tt_um_Jsilicon, recur: true)
Completed timing based select reordering (accepts: 0, rejects: 0, runtime: 0.074s)

Stage: post_muxopt
--------------------------------------------------------
| Transform          | Accepts | Rejects | Runtime (s) |
--------------------------------------------------------
| hlo_speculation    |       0 |       0 |        0.07 |
| hlo_timing_reorder |       0 |       0 |        0.07 |
--------------------------------------------------------
==================================
Stage : to_generic
==================================
  =================
   Message Summary
  =================
------------------------------------------------------------------------------------------------------------------------------------
|    Id     |  Sev  |Count|                                              Message Text                                              |
------------------------------------------------------------------------------------------------------------------------------------
|CDFG-250   |Info   |    1|Processing multi-dimensional arrays.                                                                    |
|CDFG-372   |Info   |    4|Bitwidth mismatch in assignment.                                                                        |
|           |       |     |Review and make sure the mismatch is intentional. Genus can possibly issue bitwidth mismatch warning for|
|           |       |     | explicit assignments present in RTL as-well-as for implicit assignments inferred by the tool. For      |
|           |       |     | example, in case of enum declaration without value, the tool will implicitly assign value to the enum  |
|           |       |     | variables. It also issues the warning for any bitwidth mismatch that appears in this implicit          |
|           |       |     | assignment.                                                                                            |
|CDFG-472   |Warning|    1|Unreachable statements for case item.                                                                   |
|CDFG-567   |Info   |    7|Instantiating Subdesign.                                                                                |
|CDFG-738   |Info   |    4|Common subexpression eliminated.                                                                        |
|CDFG-739   |Info   |    4|Common subexpression kept.                                                                              |
|CDFG-769   |Info   |    1|Identified sum-of-products logic to be optimized during syn_generic.                                    |
|CWD-19     |Info   |  185|An implementation was inferred.                                                                         |
|DPOPT-1    |Info   |    1|Optimizing datapath logic.                                                                              |
|DPOPT-2    |Info   |    1|Done optimizing datapath logic.                                                                         |
|DPOPT-3    |Info   |    3|Implementing datapath configurations.                                                                   |
|DPOPT-4    |Info   |    3|Done implementing datapath configurations.                                                              |
|DPOPT-6    |Info   |    1|Pre-processed datapath logic.                                                                           |
|DPOPT-10   |Info   |    1|Optimized a mux chain.                                                                                  |
|ELAB-1     |Info   |    1|Elaborating Design.                                                                                     |
|ELAB-2     |Info   |    7|Elaborating Subdesign.                                                                                  |
|ELAB-3     |Info   |    1|Done Elaborating Design.                                                                                |
|ELABUTL-125|Warning|   16|Undriven signal detected.                                                                               |
|           |       |     |The undriven signal handling can be controlled by setting the attribute 'hdl_unconnected_value' before  |
|           |       |     | syn_generic command.                                                                                   |
|ELABUTL-130|Info   |   16|Undriven signal detected.                                                                               |
|           |       |     |The 'hdl_unconnected_value' attribute controls treatment of undriven signal.                            |
|GB-6       |Info   | 1287|A datapath component has been ungrouped.                                                                |
|GLO-12     |Info   |   11|Replacing a flip-flop with a logic constant 0.                                                          |
|           |       |     |To prevent this optimization, set the 'optimize_constant_0_flops' root attribute to 'false' or          |
|           |       |     | 'optimize_constant_0_seq' instance attribute to 'false'. You can also see the complete list of deleted |
|           |       |     | sequential with command 'report sequential -deleted' (on Reason 'constant0').                          |
|GLO-34     |Info   |    5|Deleting instances not driving any primary outputs.                                                     |
|           |       |     |Optimizations such as constant propagation or redundancy removal could change the connections so a      |
|           |       |     | hierarchical instance does not drive any primary outputs anymore. To see the list of deleted           |
|           |       |     | hierarchical instances, set the 'information_level' attribute to 2 or above. If the message is         |
|           |       |     | truncated set the message attribute 'truncate' to false to see the complete list. To prevent this      |
|           |       |     | optimization, set the 'delete_unloaded_insts' root/subdesign attribute to 'false' or 'preserve'        |
|           |       |     | instance attribute to 'true'.                                                                          |
|GLO-42     |Info   |    1|Equivalent sequential instances have been merged.                                                       |
|           |       |     |To prevent merging of sequential instances, set the 'optimize_merge_flops' and 'optimize_merge_latches' |
|           |       |     | root attributes to 'false' or the 'optimize_merge_seq' instance attribute to 'false'.                  |
|GLO-45     |Info   |    2|Replacing the synchronous part of an always feeding back flip-flop with a logic constant.               |
|           |       |     |To prevent this optimization, set 'optimize_constant_feedback_seqs' root attribute to 'false'. The      |
|           |       |     | instance attribute 'optimize_constant_feedback_seq' controls this optimization.                        |
|GLO-51     |Info   |    4|Hierarchical instance automatically ungrouped.                                                          |
|           |       |     |Hierarchical instances can be automatically ungrouped to allow for better area or timing optimization.  |
|           |       |     | To prevent this ungroup, set the root-level attribute 'auto_ungroup' to 'none'. You can also prevent   |
|           |       |     | individual ungroup with setting the attribute 'ungroup_ok' of instances or modules to 'false'.         |
|LBR-412    |Info   |    1|Created nominal operating condition.                                                                    |
|           |       |     |The nominal operating condition is represented, either by the nominal PVT values specified in the       |
|           |       |     | library source (via nom_process,nom_voltage and nom_temperature respectively)                          |
|           |       |     | , or by the default PVT values (1.0,1.0,1.0).                                                          |
|LBR-516    |Info   |    1|Missing library level attribute.                                                                        |
|PHYS-12    |Warning|    2|The variant range of wire parameters is too large. An example of wire parameters are, a WIDTH for layer,|
|           |       |     | PITCH for layer, MINSPACING for layers, etc.                                                           |
|           |       |     |Check the consistency of the parameters, and see if you can ignore this message or you're using         |
|           |       |     | different LEF file with wrong parameters.                                                              |
|PHYS-15    |Warning|   20|Missing wire parameter.                                                                                 |
|           |       |     |Check the wire parameter in LEF technology files.                                                       |
|PHYS-129   |Info   |   14|Via with no resistance will have a value of '0.0' assigned for resistance value.                        |
|           |       |     |If this is the expected behavior, this message can be ignored.                                          |
|PHYS-279   |Warning|    2|Physical cell not defined in library.                                                                   |
|           |       |     |Ensure that the proper library files are available and have been imported.                              |
|PHYS-752   |Info   |    1|Partition Based Synthesis execution skipped.                                                            |
|RTLOPT-30  |Info   |   13|Accepted resource sharing opportunity.                                                                  |
|RTLOPT-40  |Info   |    1|Transformed datapath macro.                                                                             |
|SDC-201    |Warning|    1|Unsupported SDC command option.                                                                         |
|           |       |     |The current version does not support this SDC command option.  However, future versions may be enhanced |
|           |       |     | to support this option.                                                                                |
|SYNTH-1    |Info   |    1|Synthesizing.                                                                                           |
|TIM-1000   |Info   |    1|Multimode clock gating check is disabled.                                                               |
|VLOGPT-37  |Warning|    1|Ignoring unsynthesizable construct.                                                                     |
|           |       |     |For example, the following constructs will be ignored:
    - initial block
    - final block
    -      |
|           |       |     | program block
    - property block
    - sequence block
    - covergroup
    - checker block
    - gate|
|           |       |     | drive strength
    - system task enable
    - reg declaration with initial value
    - specify block.  |
|VLOGPT-506 |Warning|    5|Unused attribute.                                                                                       |
------------------------------------------------------------------------------------------------------------------------------------
Current PLE settings:

Aspect ratio        : 1.000
Shrink factor       : 1.000
Scale of res/length : 1.000
Scale of cap/length : 1.000
Net derating factor : 1.000
Thermal factor      : 1.000
Via Resistance      : 0.000 ohm (from default)
Site size           : 2.660 um (from lef [tech+cell])

                                   Capacitance
  Layer                             / Length         Data source:
Name        Direction Utilization  (pF/micron)       default value
------------------------------------------------
<default>       U         n/a         0.000250

** = DEFAULT cap per unit length is used for timing analysis

                                    Resistance
  Layer                              / Length         Data source:
Name        Direction Utilization  (ohm/micron)       lef_library
-------------------------------------------------
metal1          H         0.00         5.846154
metal2          V         1.00         3.571429
metal3          H         1.00         3.571429
metal4          V         1.00         1.785714
metal5          H         1.00         1.785714
metal6          V         1.00         1.785714
metal7          H         1.00         0.625000
metal8          V         1.00         0.625000
metal9          H         1.00         0.262500
metal10         V         1.00         0.262500

                                        Area
  Layer                               / Length        Data source:
Name        Direction Utilization     (micron)        lef_library
-------------------------------------------------
metal1          H         0.00         0.065000
metal2          V         1.00         0.070000
metal3          H         1.00         0.070000
metal4          V         1.00         0.140000
metal5          H         1.00         0.140000
metal6          V         1.00         0.140000
metal7          H         1.00         0.400000
metal8          V         1.00         0.400000
metal9          H         1.00         0.800000
metal10         V         1.00         0.800000

Mapper: Libraries have:
        domain _default_: 27 combo usable cells and 4 sequential usable cells
Info    : Replacing the synchronous part of an always feeding back flip-flop with a logic constant. [GLO-45]
        : The instance is 'reg_inst_R1_reg[0]'. The constant is '0'.
Info    : Replacing the synchronous part of an always feeding back flip-flop with a logic constant. [GLO-45]
        : The instance is 'reg_inst_R1_reg[1]'. The constant is '0'.
Info    : Replacing the synchronous part of an always feeding back flip-flop with a logic constant. [GLO-45]
        : The instance is 'reg_inst_R1_reg[2]'. The constant is '0'.
Info    : Replacing the synchronous part of an always feeding back flip-flop with a logic constant. [GLO-45]
        : The instance is 'reg_inst_R1_reg[3]'. The constant is '0'.
Info    : Replacing the synchronous part of an always feeding back flip-flop with a logic constant. [GLO-45]
        : The instance is 'reg_inst_R1_reg[4]'. The constant is '0'.
Info    : Replacing the synchronous part of an always feeding back flip-flop with a logic constant. [GLO-45]
        : The instance is 'reg_inst_R1_reg[5]'. The constant is '0'.
Info    : Replacing the synchronous part of an always feeding back flip-flop with a logic constant. [GLO-45]
        : The instance is 'reg_inst_R1_reg[6]'. The constant is '0'.
Info    : Replacing the synchronous part of an always feeding back flip-flop with a logic constant. [GLO-45]
        : The instance is 'reg_inst_R1_reg[7]'. The constant is '0'.
Info    : Replacing a flip-flop with a logic constant 0. [GLO-12]
        : The instance is 'reg_inst_R1_reg[0]'.
Info    : Replacing a flip-flop with a logic constant 0. [GLO-12]
        : The instance is 'reg_inst_R1_reg[1]'.
Info    : Replacing a flip-flop with a logic constant 0. [GLO-12]
        : The instance is 'reg_inst_R1_reg[2]'.
Info    : Replacing a flip-flop with a logic constant 0. [GLO-12]
        : The instance is 'reg_inst_R1_reg[3]'.
Info    : Replacing a flip-flop with a logic constant 0. [GLO-12]
        : The instance is 'reg_inst_R1_reg[4]'.
Info    : Replacing a flip-flop with a logic constant 0. [GLO-12]
        : The instance is 'reg_inst_R1_reg[5]'.
Info    : Replacing a flip-flop with a logic constant 0. [GLO-12]
        : The instance is 'reg_inst_R1_reg[6]'.
Info    : Replacing a flip-flop with a logic constant 0. [GLO-12]
        : The instance is 'reg_inst_R1_reg[7]'.
Info    : Deleting instances not driving any primary outputs. [GLO-34]
        : Deleting 8 sequential instances.
Info    : Deleting instances not driving any primary outputs. [GLO-34]
        : Deleting 1 sequential instance.
Multi-threaded Virtual Mapping    (8 threads per ST process, 8 of 80 CPUs usable)
==================================
Stage : first_condense
==================================
  =================
   Message Summary
  =================
------------------------------------------------------------------------------------------------------------------------------------
|  Id  |Sev |Count|                                                  Message Text                                                  |
------------------------------------------------------------------------------------------------------------------------------------
|GB-6  |Info|    3|A datapath component has been ungrouped.                                                                        |
|GLO-12|Info|    8|Replacing a flip-flop with a logic constant 0.                                                                  |
|      |    |     |To prevent this optimization, set the 'optimize_constant_0_flops' root attribute to 'false' or                  |
|      |    |     | 'optimize_constant_0_seq' instance attribute to 'false'. You can also see the complete list of deleted         |
|      |    |     | sequential with command 'report sequential -deleted' (on Reason 'constant0').                                  |
|GLO-34|Info|    2|Deleting instances not driving any primary outputs.                                                             |
|      |    |     |Optimizations such as constant propagation or redundancy removal could change the connections so a hierarchical |
|      |    |     | instance does not drive any primary outputs anymore. To see the list of deleted hierarchical instances, set the|
|      |    |     | 'information_level' attribute to 2 or above. If the message is truncated set the message attribute 'truncate'  |
|      |    |     | to false to see the complete list. To prevent this optimization, set the 'delete_unloaded_insts' root/subdesign|
|      |    |     | attribute to 'false' or 'preserve' instance attribute to 'true'.                                               |
|GLO-42|Info|    1|Equivalent sequential instances have been merged.                                                               |
|      |    |     |To prevent merging of sequential instances, set the 'optimize_merge_flops' and 'optimize_merge_latches' root    |
|      |    |     | attributes to 'false' or the 'optimize_merge_seq' instance attribute to 'false'.                               |
|GLO-45|Info|    8|Replacing the synchronous part of an always feeding back flip-flop with a logic constant.                       |
|      |    |     |To prevent this optimization, set 'optimize_constant_feedback_seqs' root attribute to 'false'. The instance     |
|      |    |     | attribute 'optimize_constant_feedback_seq' controls this optimization.                                         |
------------------------------------------------------------------------------------------------------------------------------------

Global mapping target info
==========================
Cost Group 'clk' target slack:    84 ps
Target path end-point (Port: tt_um_Jsilicon/uo_out[1])

/home/student001/JSilicon2/work/synthesis/.st_launch_localhost_93397

State Retention Synthesis Status
================================

Category                        Flops   Percentage
--------------------------------------------------
Total instances                    42        100.0
Excluded from State Retention      42        100.0
    - Will not convert             42        100.0
      - Preserved                   0          0.0
      - Power intent excluded      42        100.0
    - Could not convert             0          0.0
      - Scan type                   0          0.0
      - No suitable cell            0          0.0
State Retention instances           0          0.0
--------------------------------------------------

PBS_Generic_Opt-Post - Elapsed_Time 41, CPU_Time 41.290053
stamp 'PBS_Generic_Opt-Post' being created for table 'pbs_debug'

  Total Time (Wall) |  Stage Time (Wall)  |   % (Wall)   |    Date - Time     |  Memory   | Stage
--------------------+---------------------+--------------+--------------------+-----------+----------------------
 00:00:16(00:00:16) |  00:00:00(00:00:00) |   0.0(  0.0) |   10:53:40 (Nov19) |  424.4 MB | PBS_Generic-Start
--------------------+---------------------+--------------+--------------------+-----------+----------------------
 00:00:58(00:00:58) |  00:00:42(00:00:42) | 100.0(100.0) |   10:54:22 (Nov19) |  869.9 MB | PBS_Generic_Opt-Post
--------------------+---------------------+--------------+--------------------+-----------+----------------------
Number of threads: 8 * 1   (id: pbs_debug, time_info v1.57)
Info: (*N*) indicates data that was populated from previously saved time_info database
Info: CPU time includes time of parent + longest thread
PBS_Generic-Postgen HBO Optimizations - Elapsed_Time 0, CPU_Time 0.0
stamp 'PBS_Generic-Postgen HBO Optimizations' being created for table 'pbs_debug'

  Total Time (Wall) |  Stage Time (Wall)  |   % (Wall)   |    Date - Time     |  Memory   | Stage
--------------------+---------------------+--------------+--------------------+-----------+----------------------
 00:00:16(00:00:16) |  00:00:00(00:00:00) |   0.0(  0.0) |   10:53:40 (Nov19) |  424.4 MB | PBS_Generic-Start
--------------------+---------------------+--------------+--------------------+-----------+----------------------
 00:00:58(00:00:58) |  00:00:42(00:00:42) | 100.0( 97.7) |   10:54:22 (Nov19) |  869.9 MB | PBS_Generic_Opt-Post
--------------------+---------------------+--------------+--------------------+-----------+----------------------
 00:00:58(00:00:59) |  00:00:00(00:00:01) |   0.0(  2.3) |   10:54:23 (Nov19) |  869.9 MB | PBS_Generic-Postgen HBO Optimizations
--------------------+---------------------+--------------+--------------------+-----------+----------------------
Number of threads: 8 * 1   (id: pbs_debug, time_info v1.57)
Info: (*N*) indicates data that was populated from previously saved time_info database
Info: CPU time includes time of parent + longest thread
Starting post syn_generic ultra-effort Boolean optimization
Redundancy removal succeeded.
Done post syn_generic ultra-effort Boolean optimization (1.00 cpu seconds) (0.00 elapsed cpu seconds)
Info    : Done synthesizing. [SYNTH-2]
        : Done synthesizing 'tt_um_Jsilicon' to generic gates.
##>=================== Cadence Confidential (Generic-Logical) ===================
##>=================== Cadence Confidential (Generic-Logical) ===================
      flow.cputime  flow.realtime  timing.setup.tns  timing.setup.wns  snapshot
UM:*                                                                   syn_gen
@file(synthesis.tcl) 45: puts "Phase 2: Technology Mapping"
Phase 2: Technology Mapping
@file(synthesis.tcl) 46: syn_map
#----------------------------------------------------------------------------------------
# Root attributes for category: opt
#----------------------------------------------------------------------------------------
# Feature                           | Attribute                    | Value
#----------------------------------------------------------------------------------------
# Avoid tied inputs                 | avoid_tied_inputs            | false (default)
# Allow floating outputs            | opt_allow_floating_outputs   | false (default)
# Power optimization effort         | design_power_effort          | none (default)
# Do not use qbar sequential pins   | dont_use_qbar_seq_pins       | false (default)
#----------------------------------------------------------------------------------------

##Generic Timing Info: typical gate delay   84.0 ps   std_slew:    2.4 ps   std_load:  4.6 fF  for library domain _default_
Mapping ChipWare ICG instances in tt_um_Jsilicon
Found 0 unmapped ChipWare ICG instances
Mapped 0 of 0 ChipWare ICG instances
Current PLE settings:

Aspect ratio        : 1.000
Shrink factor       : 1.000
Scale of res/length : 1.000
Scale of cap/length : 1.000
Net derating factor : 1.000
Thermal factor      : 1.000
Via Resistance      : 0.000 ohm (from default)
Site size           : 2.660 um (from lef [tech+cell])

                                   Capacitance
  Layer                             / Length         Data source:
Name        Direction Utilization  (pF/micron)       default value
------------------------------------------------
<default>       U         n/a         0.000250

** = DEFAULT cap per unit length is used for timing analysis

                                    Resistance
  Layer                              / Length         Data source:
Name        Direction Utilization  (ohm/micron)       lef_library
-------------------------------------------------
metal1          H         0.00         5.846154
metal2          V         1.00         3.571429
metal3          H         1.00         3.571429
metal4          V         1.00         1.785714
metal5          H         1.00         1.785714
metal6          V         1.00         1.785714
metal7          H         1.00         0.625000
metal8          V         1.00         0.625000
metal9          H         1.00         0.262500
metal10         V         1.00         0.262500

                                        Area
  Layer                               / Length        Data source:
Name        Direction Utilization     (micron)        lef_library
-------------------------------------------------
metal1          H         0.00         0.065000
metal2          V         1.00         0.070000
metal3          H         1.00         0.070000
metal4          V         1.00         0.140000
metal5          H         1.00         0.140000
metal6          V         1.00         0.140000
metal7          H         1.00         0.400000
metal8          V         1.00         0.400000
metal9          H         1.00         0.800000
metal10         V         1.00         0.800000

Info    : Mapping. [SYNTH-4]
        : Mapping 'tt_um_Jsilicon' using 'medium' effort.
Mapper: Libraries have:
        domain _default_: 27 combo usable cells and 4 sequential usable cells
PBS_TechMap-Start - Elapsed_Time 0, CPU_Time 0.0
stamp 'PBS_TechMap-Start' being created for table 'pbs_debug'

  Total Time (Wall) |  Stage Time (Wall)  |   % (Wall)   |    Date - Time     |  Memory   | Stage
--------------------+---------------------+--------------+--------------------+-----------+----------------------
 00:00:16(00:00:16) |  00:00:00(00:00:00) |   0.0(  0.0) |   10:53:40 (Nov19) |  424.4 MB | PBS_Generic-Start
--------------------+---------------------+--------------+--------------------+-----------+----------------------
 00:00:58(00:00:58) |  00:00:42(00:00:42) |  97.7( 97.7) |   10:54:22 (Nov19) |  869.9 MB | PBS_Generic_Opt-Post
--------------------+---------------------+--------------+--------------------+-----------+----------------------
 00:00:58(00:00:59) |  00:00:00(00:00:01) |   0.0(  2.3) |   10:54:23 (Nov19) |  869.9 MB | PBS_Generic-Postgen HBO Optimizations
--------------------+---------------------+--------------+--------------------+-----------+----------------------
 00:00:59(00:00:59) |  00:00:01(00:00:00) |   2.3(  0.0) |   10:54:23 (Nov19) |  869.9 MB | PBS_TechMap-Start
--------------------+---------------------+--------------+--------------------+-----------+----------------------
Number of threads: 8 * 1   (id: pbs_debug, time_info v1.57)
Info: (*N*) indicates data that was populated from previously saved time_info database
Info: CPU time includes time of parent + longest thread
PBS_TechMap-Premap HBO Optimizations - Elapsed_Time 1, CPU_Time 0.0
stamp 'PBS_TechMap-Premap HBO Optimizations' being created for table 'pbs_debug'

  Total Time (Wall) |  Stage Time (Wall)  |   % (Wall)   |    Date - Time     |  Memory   | Stage
--------------------+---------------------+--------------+--------------------+-----------+----------------------
 00:00:16(00:00:16) |  00:00:00(00:00:00) |   0.0(  0.0) |   10:53:40 (Nov19) |  424.4 MB | PBS_Generic-Start
--------------------+---------------------+--------------+--------------------+-----------+----------------------
 00:00:58(00:00:58) |  00:00:42(00:00:42) |  97.7( 95.5) |   10:54:22 (Nov19) |  869.9 MB | PBS_Generic_Opt-Post
--------------------+---------------------+--------------+--------------------+-----------+----------------------
 00:00:58(00:00:59) |  00:00:00(00:00:01) |   0.0(  2.3) |   10:54:23 (Nov19) |  869.9 MB | PBS_Generic-Postgen HBO Optimizations
--------------------+---------------------+--------------+--------------------+-----------+----------------------
 00:00:59(00:00:59) |  00:00:01(00:00:00) |   2.3(  0.0) |   10:54:23 (Nov19) |  869.9 MB | PBS_TechMap-Start
--------------------+---------------------+--------------+--------------------+-----------+----------------------
 00:00:59(00:01:00) |  00:00:00(00:00:01) |   0.0(  2.3) |   10:54:24 (Nov19) |  869.9 MB | PBS_TechMap-Premap HBO Optimizations
--------------------+---------------------+--------------+--------------------+-----------+----------------------
Number of threads: 8 * 1   (id: pbs_debug, time_info v1.57)
Info: (*N*) indicates data that was populated from previously saved time_info database
Info: CPU time includes time of parent + longest thread
Info    : Partition Based Synthesis execution skipped. [PHYS-752]
        : Design size is less than the partition size '100000' for distributed mapping optimization to kick in.
Current PLE settings:

Aspect ratio        : 1.000
Shrink factor       : 1.000
Scale of res/length : 1.000
Scale of cap/length : 1.000
Net derating factor : 1.000
Thermal factor      : 1.000
Via Resistance      : 0.000 ohm (from default)
Site size           : 2.660 um (from lef [tech+cell])

                                   Capacitance
  Layer                             / Length         Data source:
Name        Direction Utilization  (pF/micron)       default value
------------------------------------------------
<default>       U         n/a         0.000250

** = DEFAULT cap per unit length is used for timing analysis

                                    Resistance
  Layer                              / Length         Data source:
Name        Direction Utilization  (ohm/micron)       lef_library
-------------------------------------------------
metal1          H         0.00         5.846154
metal2          V         1.00         3.571429
metal3          H         1.00         3.571429
metal4          V         1.00         1.785714
metal5          H         1.00         1.785714
metal6          V         1.00         1.785714
metal7          H         1.00         0.625000
metal8          V         1.00         0.625000
metal9          H         1.00         0.262500
metal10         V         1.00         0.262500

                                        Area
  Layer                               / Length        Data source:
Name        Direction Utilization     (micron)        lef_library
-------------------------------------------------
metal1          H         0.00         0.065000
metal2          V         1.00         0.070000
metal3          H         1.00         0.070000
metal4          V         1.00         0.140000
metal5          H         1.00         0.140000
metal6          V         1.00         0.140000
metal7          H         1.00         0.400000
metal8          V         1.00         0.400000
metal9          H         1.00         0.800000
metal10         V         1.00         0.800000

Mapper: Libraries have:
        domain _default_: 27 combo usable cells and 4 sequential usable cells
Multi-threaded Virtual Mapping    (8 threads per ST process, 8 of 80 CPUs usable)
==================================
Stage : first_condense
==================================
  =================
   Message Summary
  =================
------------------------------------------------------------------
|   Id   |Sev |Count|                Message Text                |
------------------------------------------------------------------
|PHYS-752|Info|    1|Partition Based Synthesis execution skipped.|
|SYNTH-2 |Info|    1|Done synthesizing.                          |
|SYNTH-4 |Info|    1|Mapping.                                    |
------------------------------------------------------------------

Global mapping target info
==========================
Cost Group 'clk' target slack:    43 ps
Target path end-point (Port: tt_um_Jsilicon/uo_out[1])

Multi-threaded Technology Mapping (8 threads per ST process, 8 of 80 CPUs usable)

Global mapping status
=====================
                                   Group
                                  Tot Wrst
                           Total  Weighted
Operation                   Area   Slacks
 global_map                 5400      -59
            Worst cost_group: clk, WNS: -59.7
            Path: uio_in[4] --> uo_out[1]

    Cost Group            Target    Slack    Diff.  Constr.
-----------------------------------------------------------
           clk                43      -60      -2%     5000


Global incremental target info
==============================
Cost Group 'clk' target slack:   -60 ps
Target path end-point (Port: tt_um_Jsilicon/uo_out[1])

==================================
Stage : global_incr_map
==================================
  =================
   Message Summary
  =================
----------------------------------------------------------------
| Id |Sev |Count|                 Message Text                 |
----------------------------------------------------------------
|GB-6|Info|   17|A datapath component has been ungrouped.      |
|PA-7|Info|   18|Resetting power analysis results.             |
|    |    |     |All computed switching activities are removed.|
----------------------------------------------------------------

Global incremental optimization status
======================================
                                   Group
                                  Tot Wrst
                           Total  Weighted
Operation                   Area   Slacks
 global_incr                5119      -70
            Worst cost_group: clk, WNS: -70.2
            Path: uio_in[4] --> uo_out[1]

    Cost Group            Target    Slack    Diff.  Constr.
-----------------------------------------------------------
           clk               -60      -70      +0%     5000

/home/student001/JSilicon2/work/synthesis/.st_launch_localhost_93397

State Retention Synthesis Status
================================

Category                        Flops   Percentage
--------------------------------------------------
Total instances                    42        100.0
Excluded from State Retention      42        100.0
    - Will not convert             42        100.0
      - Preserved                   0          0.0
      - Power intent excluded      42        100.0
    - Could not convert             0          0.0
      - Scan type                   0          0.0
      - No suitable cell            0          0.0
State Retention instances           0          0.0
--------------------------------------------------

INFO: skipping constant propagation
PBS_Techmap-Global Mapping - Elapsed_Time 57, CPU_Time 57.28596299999999
stamp 'PBS_Techmap-Global Mapping' being created for table 'pbs_debug'

  Total Time (Wall) |  Stage Time (Wall)  |   % (Wall)   |    Date - Time     |  Memory   | Stage
--------------------+---------------------+--------------+--------------------+-----------+----------------------
 00:00:16(00:00:16) |  00:00:00(00:00:00) |   0.0(  0.0) |   10:53:40 (Nov19) |  424.4 MB | PBS_Generic-Start
--------------------+---------------------+--------------+--------------------+-----------+----------------------
 00:00:58(00:00:58) |  00:00:42(00:00:42) |  42.0( 41.6) |   10:54:22 (Nov19) |  869.9 MB | PBS_Generic_Opt-Post
--------------------+---------------------+--------------+--------------------+-----------+----------------------
 00:00:58(00:00:59) |  00:00:00(00:00:01) |   0.0(  1.0) |   10:54:23 (Nov19) |  869.9 MB | PBS_Generic-Postgen HBO Optimizations
--------------------+---------------------+--------------+--------------------+-----------+----------------------
 00:00:59(00:00:59) |  00:00:01(00:00:00) |   1.0(  0.0) |   10:54:23 (Nov19) |  869.9 MB | PBS_TechMap-Start
--------------------+---------------------+--------------+--------------------+-----------+----------------------
 00:00:59(00:01:00) |  00:00:00(00:00:01) |   0.0(  1.0) |   10:54:24 (Nov19) |  869.9 MB | PBS_TechMap-Premap HBO Optimizations
--------------------+---------------------+--------------+--------------------+-----------+----------------------
 00:01:56(00:01:57) |  00:00:57(00:00:57) |  57.0( 56.4) |   10:55:21 (Nov19) |  840.6 MB | PBS_Techmap-Global Mapping
--------------------+---------------------+--------------+--------------------+-----------+----------------------
Number of threads: 8 * 1   (id: pbs_debug, time_info v1.57)
Info: (*N*) indicates data that was populated from previously saved time_info database
Info: CPU time includes time of parent + longest thread
Info    : Wrote formal verification information. [CFM-5]
        : Wrote 'fv/tt_um_Jsilicon/fv_map.fv.json' for netlist 'fv/tt_um_Jsilicon/fv_map.v.gz'.
Info    : Existing dofile found. Copied as fv/tt_um_Jsilicon/rtl_to_fv_map.do~.
Info    : Wrote dofile. [CFM-1]
        : Dofile is 'fv/tt_um_Jsilicon/rtl_to_fv_map.do'.
        : RTL names flow is enabled.
PBS_TechMap-Datapath Postmap Operations - Elapsed_Time 2, CPU_Time 1.9891520000000043
stamp 'PBS_TechMap-Datapath Postmap Operations' being created for table 'pbs_debug'

  Total Time (Wall) |  Stage Time (Wall)  |   % (Wall)   |    Date - Time     |  Memory   | Stage
--------------------+---------------------+--------------+--------------------+-----------+----------------------
 00:00:16(00:00:16) |  00:00:00(00:00:00) |   0.0(  0.0) |   10:53:40 (Nov19) |  424.4 MB | PBS_Generic-Start
--------------------+---------------------+--------------+--------------------+-----------+----------------------
 00:00:58(00:00:58) |  00:00:42(00:00:42) |  41.2( 40.8) |   10:54:22 (Nov19) |  869.9 MB | PBS_Generic_Opt-Post
--------------------+---------------------+--------------+--------------------+-----------+----------------------
 00:00:58(00:00:59) |  00:00:00(00:00:01) |   0.0(  1.0) |   10:54:23 (Nov19) |  869.9 MB | PBS_Generic-Postgen HBO Optimizations
--------------------+---------------------+--------------+--------------------+-----------+----------------------
 00:00:59(00:00:59) |  00:00:01(00:00:00) |   1.0(  0.0) |   10:54:23 (Nov19) |  869.9 MB | PBS_TechMap-Start
--------------------+---------------------+--------------+--------------------+-----------+----------------------
 00:00:59(00:01:00) |  00:00:00(00:00:01) |   0.0(  1.0) |   10:54:24 (Nov19) |  869.9 MB | PBS_TechMap-Premap HBO Optimizations
--------------------+---------------------+--------------+--------------------+-----------+----------------------
 00:01:56(00:01:57) |  00:00:57(00:00:57) |  55.9( 55.3) |   10:55:21 (Nov19) |  840.6 MB | PBS_Techmap-Global Mapping
--------------------+---------------------+--------------+--------------------+-----------+----------------------
 00:01:58(00:01:59) |  00:00:01(00:00:02) |   1.9(  1.9) |   10:55:23 (Nov19) |  840.6 MB | PBS_TechMap-Datapath Postmap Operations
--------------------+---------------------+--------------+--------------------+-----------+----------------------
Number of threads: 8 * 1   (id: pbs_debug, time_info v1.57)
Info: (*N*) indicates data that was populated from previously saved time_info database
Info: CPU time includes time of parent + longest thread
PBS_TechMap-Postmap HBO Optimizations - Elapsed_Time 0, CPU_Time -0.012333999999995626
stamp 'PBS_TechMap-Postmap HBO Optimizations' being created for table 'pbs_debug'

  Total Time (Wall) |  Stage Time (Wall)  |   % (Wall)   |    Date - Time     |  Memory   | Stage
--------------------+---------------------+--------------+--------------------+-----------+----------------------
 00:00:16(00:00:16) |  00:00:00(00:00:00) |   0.0(  0.0) |   10:53:40 (Nov19) |  424.4 MB | PBS_Generic-Start
--------------------+---------------------+--------------+--------------------+-----------+----------------------
 00:00:58(00:00:58) |  00:00:42(00:00:42) |  41.2( 40.8) |   10:54:22 (Nov19) |  869.9 MB | PBS_Generic_Opt-Post
--------------------+---------------------+--------------+--------------------+-----------+----------------------
 00:00:58(00:00:59) |  00:00:00(00:00:01) |   0.0(  1.0) |   10:54:23 (Nov19) |  869.9 MB | PBS_Generic-Postgen HBO Optimizations
--------------------+---------------------+--------------+--------------------+-----------+----------------------
 00:00:59(00:00:59) |  00:00:01(00:00:00) |   1.0(  0.0) |   10:54:23 (Nov19) |  869.9 MB | PBS_TechMap-Start
--------------------+---------------------+--------------+--------------------+-----------+----------------------
 00:00:59(00:01:00) |  00:00:00(00:00:01) |   0.0(  1.0) |   10:54:24 (Nov19) |  869.9 MB | PBS_TechMap-Premap HBO Optimizations
--------------------+---------------------+--------------+--------------------+-----------+----------------------
 00:01:56(00:01:57) |  00:00:57(00:00:57) |  55.9( 55.3) |   10:55:21 (Nov19) |  840.6 MB | PBS_Techmap-Global Mapping
--------------------+---------------------+--------------+--------------------+-----------+----------------------
 00:01:58(00:01:59) |  00:00:01(00:00:02) |   1.9(  1.9) |   10:55:23 (Nov19) |  840.6 MB | PBS_TechMap-Datapath Postmap Operations
--------------------+---------------------+--------------+--------------------+-----------+----------------------
 00:01:58(00:01:59) |  00:00:00(00:00:00) |  -0.0(  0.0) |   10:55:23 (Nov19) |  840.6 MB | PBS_TechMap-Postmap HBO Optimizations
--------------------+---------------------+--------------+--------------------+-----------+----------------------
Number of threads: 8 * 1   (id: pbs_debug, time_info v1.57)
Info: (*N*) indicates data that was populated from previously saved time_info database
Info: CPU time includes time of parent + longest thread
 Doing ConstProp on design:tt_um_Jsilicon ...

Time taken by ConstProp Step: 00:00:00
PBS_TechMap-Postmap Clock Gating - Elapsed_Time 0, CPU_Time 0.0
stamp 'PBS_TechMap-Postmap Clock Gating' being created for table 'pbs_debug'

  Total Time (Wall) |  Stage Time (Wall)  |   % (Wall)   |    Date - Time     |  Memory   | Stage
--------------------+---------------------+--------------+--------------------+-----------+----------------------
 00:00:16(00:00:16) |  00:00:00(00:00:00) |   0.0(  0.0) |   10:53:40 (Nov19) |  424.4 MB | PBS_Generic-Start
--------------------+---------------------+--------------+--------------------+-----------+----------------------
 00:00:58(00:00:58) |  00:00:42(00:00:42) |  41.2( 40.8) |   10:54:22 (Nov19) |  869.9 MB | PBS_Generic_Opt-Post
--------------------+---------------------+--------------+--------------------+-----------+----------------------
 00:00:58(00:00:59) |  00:00:00(00:00:01) |   0.0(  1.0) |   10:54:23 (Nov19) |  869.9 MB | PBS_Generic-Postgen HBO Optimizations
--------------------+---------------------+--------------+--------------------+-----------+----------------------
 00:00:59(00:00:59) |  00:00:01(00:00:00) |   1.0(  0.0) |   10:54:23 (Nov19) |  869.9 MB | PBS_TechMap-Start
--------------------+---------------------+--------------+--------------------+-----------+----------------------
 00:00:59(00:01:00) |  00:00:00(00:00:01) |   0.0(  1.0) |   10:54:24 (Nov19) |  869.9 MB | PBS_TechMap-Premap HBO Optimizations
--------------------+---------------------+--------------+--------------------+-----------+----------------------
 00:01:56(00:01:57) |  00:00:57(00:00:57) |  55.9( 55.3) |   10:55:21 (Nov19) |  840.6 MB | PBS_Techmap-Global Mapping
--------------------+---------------------+--------------+--------------------+-----------+----------------------
 00:01:58(00:01:59) |  00:00:01(00:00:02) |   1.9(  1.9) |   10:55:23 (Nov19) |  840.6 MB | PBS_TechMap-Datapath Postmap Operations
--------------------+---------------------+--------------+--------------------+-----------+----------------------
 00:01:58(00:01:59) |  00:00:00(00:00:00) |  -0.0(  0.0) |   10:55:23 (Nov19) |  840.6 MB | PBS_TechMap-Postmap HBO Optimizations
--------------------+---------------------+--------------+--------------------+-----------+----------------------
 00:01:58(00:01:59) |  00:00:00(00:00:00) |   0.0(  0.0) |   10:55:23 (Nov19) |  840.6 MB | PBS_TechMap-Postmap Clock Gating
--------------------+---------------------+--------------+--------------------+-----------+----------------------
Number of threads: 8 * 1   (id: pbs_debug, time_info v1.57)
Info: (*N*) indicates data that was populated from previously saved time_info database
Info: CPU time includes time of parent + longest thread
-------------------------------------------------------------------------------
 hi_fo_buf                  3698        0         0       434

           Trick     Calls     Accepts   Attempts    Time(secs)
-----------------------------------------------------------
       hi_fo_buf         0  (        0 /        0 )  0.00


Incremental optimization status
===============================
                                   Group
                                  Tot Wrst     Total DRC Total
                           Total  Weighted      Neg       Max
Operation                   Area   Slacks      Slack      Cap
 init_delay                 3698        0         0       434

           Trick     Calls     Accepts   Attempts    Time(secs)
-----------------------------------------------------------
       crit_upsz         0  (        0 /        0 )  0.00
    plc_bal_star         0  (        0 /        0 )  0.00
     drc_buftimb         0  (        0 /        0 )  0.00
          plc_st         0  (        0 /        0 )  0.00
    plc_st_fence         0  (        0 /        0 )  0.00
        plc_star         0  (        0 /        0 )  0.00
      plc_laf_st         0  (        0 /        0 )  0.00
 plc_laf_st_fence         0  (        0 /        0 )  0.00
     drc_buftims         0  (        0 /        0 )  0.00
            fopt         0  (        0 /        0 )  0.00
   plc_laf_lo_st         0  (        0 /        0 )  0.00
       plc_lo_st         0  (        0 /        0 )  0.00
        mb_split         0  (        0 /        0 )  0.00


Local TNS optimization status
=============================
                                   Group
                                  Tot Wrst     Total DRC Total
                           Total  Weighted      Neg       Max
Operation                   Area   Slacks      Slack      Cap
 init_tns                   3698        0         0       434

           Trick     Calls     Accepts   Attempts    Time(secs)
-----------------------------------------------------------
    plc_bal_star         0  (        0 /        0 )  0.00
     drc_buftimb         0  (        0 /        0 )  0.00
     drc_buftims         0  (        0 /        0 )  0.00
       crit_upsz         0  (        0 /        0 )  0.00
   plc_laf_lo_st         0  (        0 /        0 )  0.00
       plc_lo_st         0  (        0 /        0 )  0.00
            fopt         0  (        0 /        0 )  0.00
       crit_dnsz         0  (        0 /        0 )  0.00
             dup         0  (        0 /        0 )  0.00
        setup_dn         0  (        0 /        0 )  0.00
        mb_split         0  (        0 /        0 )  0.00

PBS_TechMap-Postmap Cleanup - Elapsed_Time 0, CPU_Time -0.010362999999998124
stamp 'PBS_TechMap-Postmap Cleanup' being created for table 'pbs_debug'

  Total Time (Wall) |  Stage Time (Wall)  |   % (Wall)   |    Date - Time     |  Memory   | Stage
--------------------+---------------------+--------------+--------------------+-----------+----------------------
 00:00:16(00:00:16) |  00:00:00(00:00:00) |   0.0(  0.0) |   10:53:40 (Nov19) |  424.4 MB | PBS_Generic-Start
--------------------+---------------------+--------------+--------------------+-----------+----------------------
 00:00:58(00:00:58) |  00:00:42(00:00:42) |  41.2( 40.8) |   10:54:22 (Nov19) |  869.9 MB | PBS_Generic_Opt-Post
--------------------+---------------------+--------------+--------------------+-----------+----------------------
 00:00:58(00:00:59) |  00:00:00(00:00:01) |   0.0(  1.0) |   10:54:23 (Nov19) |  869.9 MB | PBS_Generic-Postgen HBO Optimizations
--------------------+---------------------+--------------+--------------------+-----------+----------------------
 00:00:59(00:00:59) |  00:00:01(00:00:00) |   1.0(  0.0) |   10:54:23 (Nov19) |  869.9 MB | PBS_TechMap-Start
--------------------+---------------------+--------------+--------------------+-----------+----------------------
 00:00:59(00:01:00) |  00:00:00(00:00:01) |   0.0(  1.0) |   10:54:24 (Nov19) |  869.9 MB | PBS_TechMap-Premap HBO Optimizations
--------------------+---------------------+--------------+--------------------+-----------+----------------------
 00:01:56(00:01:57) |  00:00:57(00:00:57) |  55.9( 55.3) |   10:55:21 (Nov19) |  840.6 MB | PBS_Techmap-Global Mapping
--------------------+---------------------+--------------+--------------------+-----------+----------------------
 00:01:58(00:01:59) |  00:00:01(00:00:02) |   1.9(  1.9) |   10:55:23 (Nov19) |  840.6 MB | PBS_TechMap-Datapath Postmap Operations
--------------------+---------------------+--------------+--------------------+-----------+----------------------
 00:01:58(00:01:59) |  00:00:00(00:00:00) |  -0.0(  0.0) |   10:55:23 (Nov19) |  840.6 MB | PBS_TechMap-Postmap HBO Optimizations
--------------------+---------------------+--------------+--------------------+-----------+----------------------
 00:01:58(00:01:59) |  00:00:00(00:00:00) |   0.0(  0.0) |   10:55:23 (Nov19) |  840.6 MB | PBS_TechMap-Postmap Clock Gating
--------------------+---------------------+--------------+--------------------+-----------+----------------------
 00:01:58(00:01:59) |  00:00:00(00:00:00) |  -0.0(  0.0) |   10:55:23 (Nov19) |  840.6 MB | PBS_TechMap-Postmap Cleanup
--------------------+---------------------+--------------+--------------------+-----------+----------------------
Number of threads: 8 * 1   (id: pbs_debug, time_info v1.57)
Info: (*N*) indicates data that was populated from previously saved time_info database
Info: CPU time includes time of parent + longest thread
PBS_Techmap-Post_MBCI - Elapsed_Time 0, CPU_Time 0.0
stamp 'PBS_Techmap-Post_MBCI' being created for table 'pbs_debug'

  Total Time (Wall) |  Stage Time (Wall)  |   % (Wall)   |    Date - Time     |  Memory   | Stage
--------------------+---------------------+--------------+--------------------+-----------+----------------------
 00:00:16(00:00:16) |  00:00:00(00:00:00) |   0.0(  0.0) |   10:53:40 (Nov19) |  424.4 MB | PBS_Generic-Start
--------------------+---------------------+--------------+--------------------+-----------+----------------------
 00:00:58(00:00:58) |  00:00:42(00:00:42) |  41.2( 40.8) |   10:54:22 (Nov19) |  869.9 MB | PBS_Generic_Opt-Post
--------------------+---------------------+--------------+--------------------+-----------+----------------------
 00:00:58(00:00:59) |  00:00:00(00:00:01) |   0.0(  1.0) |   10:54:23 (Nov19) |  869.9 MB | PBS_Generic-Postgen HBO Optimizations
--------------------+---------------------+--------------+--------------------+-----------+----------------------
 00:00:59(00:00:59) |  00:00:01(00:00:00) |   1.0(  0.0) |   10:54:23 (Nov19) |  869.9 MB | PBS_TechMap-Start
--------------------+---------------------+--------------+--------------------+-----------+----------------------
 00:00:59(00:01:00) |  00:00:00(00:00:01) |   0.0(  1.0) |   10:54:24 (Nov19) |  869.9 MB | PBS_TechMap-Premap HBO Optimizations
--------------------+---------------------+--------------+--------------------+-----------+----------------------
 00:01:56(00:01:57) |  00:00:57(00:00:57) |  55.9( 55.3) |   10:55:21 (Nov19) |  840.6 MB | PBS_Techmap-Global Mapping
--------------------+---------------------+--------------+--------------------+-----------+----------------------
 00:01:58(00:01:59) |  00:00:01(00:00:02) |   1.9(  1.9) |   10:55:23 (Nov19) |  840.6 MB | PBS_TechMap-Datapath Postmap Operations
--------------------+---------------------+--------------+--------------------+-----------+----------------------
 00:01:58(00:01:59) |  00:00:00(00:00:00) |  -0.0(  0.0) |   10:55:23 (Nov19) |  840.6 MB | PBS_TechMap-Postmap HBO Optimizations
--------------------+---------------------+--------------+--------------------+-----------+----------------------
 00:01:58(00:01:59) |  00:00:00(00:00:00) |   0.0(  0.0) |   10:55:23 (Nov19) |  840.6 MB | PBS_TechMap-Postmap Clock Gating
--------------------+---------------------+--------------+--------------------+-----------+----------------------
 00:01:58(00:01:59) |  00:00:00(00:00:00) |  -0.0(  0.0) |   10:55:23 (Nov19) |  840.6 MB | PBS_TechMap-Postmap Cleanup
--------------------+---------------------+--------------+--------------------+-----------+----------------------
 00:01:58(00:01:59) |  00:00:00(00:00:00) |   0.0(  0.0) |   10:55:23 (Nov19) |  840.6 MB | PBS_Techmap-Post_MBCI
--------------------+---------------------+--------------+--------------------+-----------+----------------------
Number of threads: 8 * 1   (id: pbs_debug, time_info v1.57)
Info: (*N*) indicates data that was populated from previously saved time_info database
Info: CPU time includes time of parent + longest thread
##>=================== Cadence Confidential (Mapping-Logical) ===================
##>Main Thread Summary:
##>----------------------------------------------------------------------------------------
##>STEP                           Elapsed       WNS       TNS     Insts      Area    Memory
##>----------------------------------------------------------------------------------------
##>M:Initial                            0         -         -      1355      5131       869
##>M:Early Clock Gating                 0         -         -         -         -         -
##>M:Pre Cleanup                        1         -         -      1355      5131       869
##>M:Setup                              0         -         -         -         -         -
##>M:Launch ST                          0         -         -         -         -         -
##>M:Design Partition                   0         -         -         -         -         -
##>M:Create Partition Netlists          0         -         -         -         -         -
##>M:Init Power                         0         -         -         -         -         -
##>M:Budgeting                          0         -         -         -         -         -
##>M:Derenv-DB                          0         -         -         -         -         -
##>M:Debug Outputs                      0         -         -         -         -         -
##>M:ST loading                         0         -         -         -         -         -
##>M:Distributed                        0         -         -         -         -         -
##>M:Timer                              0         -         -         -         -         -
##>M:Assembly                           0         -         -         -         -         -
##>M:DFT                                0         -         -         -         -         -
##>M:DP Operations                      2         -         -      1086      2974       840
##>M:Const Prop                         0       -70       503      1086      2974       840
##>M:Cleanup                            0        98         0       791      2211       840
##>M:MBCI                               0         -         -       791      2211       840
##>M:PostGen Opt                        0         -         -         -         -         -
##>M:Const Gate Removal                 0         -         -         -         -         -
##>M:Early Clock Gating Cleanup         0         -         -         -         -         -
##>M:Misc                              57
##>----------------------------------------------------------------------------------------
##>Total Elapsed                       60
##>========================================================================================
Info    : Done mapping. [SYNTH-5]
        : Done mapping 'tt_um_Jsilicon'.
      flow.cputime  flow.realtime  timing.setup.tns  timing.setup.wns  snapshot
UM:*                                                                   syn_map
@file(synthesis.tcl) 48: puts "Phase 3: Optimization"
Phase 3: Optimization
@file(synthesis.tcl) 49: syn_opt
Warning : The selected flow setting will be removed in a future release. [SYNTH-33]
        : The use of 'syn_opt' for logical only optimization will be obsolete in a future release.
        Transition to 'syn_opt -logical' or 'syn_opt -spatial'.

        : Contact Cadence support to understand current flows.
Current PLE settings:

Aspect ratio        : 1.000
Shrink factor       : 1.000
Scale of res/length : 1.000
Scale of cap/length : 1.000
Net derating factor : 1.000
Thermal factor      : 1.000
Via Resistance      : 0.000 ohm (from default)
Site size           : 2.660 um (from lef [tech+cell])

                                   Capacitance
  Layer                             / Length         Data source:
Name        Direction Utilization  (pF/micron)       default value
------------------------------------------------
<default>       U         n/a         0.000250

** = DEFAULT cap per unit length is used for timing analysis

                                    Resistance
  Layer                              / Length         Data source:
Name        Direction Utilization  (ohm/micron)       lef_library
-------------------------------------------------
metal1          H         0.00         5.846154
metal2          V         1.00         3.571429
metal3          H         1.00         3.571429
metal4          V         1.00         1.785714
metal5          H         1.00         1.785714
metal6          V         1.00         1.785714
metal7          H         1.00         0.625000
metal8          V         1.00         0.625000
metal9          H         1.00         0.262500
metal10         V         1.00         0.262500

                                        Area
  Layer                               / Length        Data source:
Name        Direction Utilization     (micron)        lef_library
-------------------------------------------------
metal1          H         0.00         0.065000
metal2          V         1.00         0.070000
metal3          H         1.00         0.070000
metal4          V         1.00         0.140000
metal5          H         1.00         0.140000
metal6          V         1.00         0.140000
metal7          H         1.00         0.400000
metal8          V         1.00         0.400000
metal9          H         1.00         0.800000
metal10         V         1.00         0.800000

Info    : Incrementally optimizing. [SYNTH-7]
        : Incrementally optimizing 'tt_um_Jsilicon' using 'medium' effort.

Incremental optimization status
===============================
                                   Group
                                  Tot Wrst     Total DRC Total
                           Total  Weighted      Neg       Max
Operation                   Area   Slacks      Slack      Cap
 init_iopt                  3698        0         0       434
-------------------------------------------------------------------------------
 const_prop                 3698        0         0       434
 simp_cc_inputs             3670        0         0       421

Incremental optimization status
===============================
                                   Group
                                  Tot Wrst     Total DRC Total
                           Total  Weighted      Neg       Max
Operation                   Area   Slacks      Slack      Cap
 init_delay                 3670        0         0       421

           Trick     Calls     Accepts   Attempts    Time(secs)
-----------------------------------------------------------
       crit_upsz         0  (        0 /        0 )  0.00
    plc_bal_star         0  (        0 /        0 )  0.00
     drc_buftimb         0  (        0 /        0 )  0.00
          plc_st         0  (        0 /        0 )  0.00
    plc_st_fence         0  (        0 /        0 )  0.00
        plc_star         0  (        0 /        0 )  0.00
      plc_laf_st         0  (        0 /        0 )  0.00
 plc_laf_st_fence         0  (        0 /        0 )  0.00
     drc_buftims         0  (        0 /        0 )  0.00
   plc_laf_lo_st         0  (        0 /        0 )  0.00
       plc_lo_st         0  (        0 /        0 )  0.00
            fopt         0  (        0 /        0 )  0.00
       crit_dnsz         0  (        0 /        0 )  0.00
             dup         0  (        0 /        0 )  0.00
            fopt         0  (        0 /        0 )  0.00
        setup_dn         0  (        0 /        0 )  0.00
         buf2inv         0  (        0 /        0 )  0.00
        mb_split         0  (        0 /        0 )  0.00
             exp         0  (        0 /        0 )  0.00
       gate_deco         0  (        0 /        0 )  0.00
       gcomp_tim         0  (        0 /        0 )  0.00
  inv_pair_2_buf         0  (        0 /        0 )  0.00

 init_drc                   3670        0         0       421

           Trick     Calls     Accepts   Attempts    Time(secs)
-----------------------------------------------------------
          plc_st         0  (        0 /        0 )  0.00
        plc_star         0  (        0 /        0 )  0.00
        drc_bufs         0  (        0 /        0 )  0.00
        drc_fopt         0  (        0 /        0 )  0.00
        drc_bufb         0  (        0 /        0 )  0.00
      simple_buf         0  (        0 /        0 )  0.00
             dup         0  (        0 /        0 )  0.00
       crit_dnsz         0  (        0 /        0 )  0.00
       crit_upsz         0  (        0 /        0 )  0.00

 incr_max_cap               3754        0         0       368
 incr_max_cap               3757        0         0       364

           Trick     Calls     Accepts   Attempts    Time(secs)
-----------------------------------------------------------
          plc_st       102  (        0 /        0 )  0.00
        plc_star       102  (        0 /        0 )  0.00
      drc_buf_sp       204  (        5 /      102 )  0.05
        drc_bufs       194  (       17 /       97 )  0.07
        drc_fopt        80  (        0 /        0 )  0.01
        drc_bufb        80  (        0 /        0 )  0.00
      simple_buf        80  (        0 /        0 )  0.10
             dup        80  (        0 /        0 )  0.00
       crit_dnsz         4  (        3 /        3 )  0.01
       crit_upsz        77  (        0 /        0 )  0.01


           Trick     Calls     Accepts   Attempts    Time(secs)
-----------------------------------------------------------
          plc_st         0  (        0 /        0 )  0.00
        plc_star         0  (        0 /        0 )  0.00
      drc_buf_sp         0  (        0 /        0 )  0.00
        drc_bufs         0  (        0 /        0 )  0.00
        drc_fopt         0  (        0 /        0 )  0.00
        drc_bufb         0  (        0 /        0 )  0.00
             dup         0  (        0 /        0 )  0.00
       crit_dnsz         0  (        0 /        0 )  0.00
       crit_upsz         0  (        0 /        0 )  0.00

 init_tns                   3757        0         0       364

           Trick     Calls     Accepts   Attempts    Time(secs)
-----------------------------------------------------------
    plc_bal_star         0  (        0 /        0 )  0.00
     drc_buftimb         0  (        0 /        0 )  0.00
     drc_buftims         0  (        0 /        0 )  0.00
       crit_upsz         0  (        0 /        0 )  0.00
   plc_laf_lo_st         0  (        0 /        0 )  0.00
       plc_lo_st         0  (        0 /        0 )  0.00
            fopt         0  (        0 /        0 )  0.00
       crit_dnsz         0  (        0 /        0 )  0.00
             dup         0  (        0 /        0 )  0.00
        setup_dn         0  (        0 /        0 )  0.00
         buf2inv         0  (        0 /        0 )  0.00
        mb_split         0  (        0 /        0 )  0.00

 init_area                  3757        0         0       364
 rem_buf                    3569        0         0       364
 rem_inv                    3458        0         0       364
 merge_bi                   3396        0         0       364
 io_phase                   3376        0         0       359
 gate_comp                  3347        0         0       359
 glob_area                  3331        0         0       359
 area_down                  3329        0         0       359
 rem_buf                    3328        0         0       359
 rem_inv                    3322        0         0       359

           Trick     Calls     Accepts   Attempts    Time(secs)
-----------------------------------------------------------
           undup         0  (        0 /        0 )  0.00
         rem_buf       130  (       57 /       57 )  0.21
         rem_inv        45  (       33 /       33 )  0.11
        merge_bi        23  (       23 /       23 )  0.06
      rem_inv_qb         0  (        0 /        0 )  0.00
        io_phase        41  (        4 /        4 )  0.07
       gate_comp        35  (       10 /       10 )  0.12
       gcomp_mog         1  (        0 /        0 )  0.03
       glob_area        49  (       22 /       49 )  0.02
       area_down         6  (        3 /        3 )  0.02
      size_n_buf         0  (        0 /        0 )  0.00
  gate_deco_area         0  (        0 /        0 )  0.00
         rem_buf        73  (        1 /        1 )  0.10
         rem_inv         9  (        2 /        2 )  0.02
        merge_bi         0  (        0 /        0 )  0.00
      rem_inv_qb         0  (        0 /        0 )  0.00


Incremental optimization status
===============================
                                   Group
                                  Tot Wrst     Total DRC Total
                           Total  Weighted      Neg       Max
Operation                   Area   Slacks      Slack      Cap
 init_delay                 3322        0         0       359

           Trick     Calls     Accepts   Attempts    Time(secs)
-----------------------------------------------------------
       crit_upsz         0  (        0 /        0 )  0.00
    plc_bal_star         0  (        0 /        0 )  0.00
     drc_buftimb         0  (        0 /        0 )  0.00
          plc_st         0  (        0 /        0 )  0.00
    plc_st_fence         0  (        0 /        0 )  0.00
        plc_star         0  (        0 /        0 )  0.00
      plc_laf_st         0  (        0 /        0 )  0.00
 plc_laf_st_fence         0  (        0 /        0 )  0.00
     drc_buftims         0  (        0 /        0 )  0.00
   plc_laf_lo_st         0  (        0 /        0 )  0.00
       plc_lo_st         0  (        0 /        0 )  0.00
            fopt         0  (        0 /        0 )  0.00
       crit_dnsz         0  (        0 /        0 )  0.00
             dup         0  (        0 /        0 )  0.00
            fopt         0  (        0 /        0 )  0.00
        setup_dn         0  (        0 /        0 )  0.00
         buf2inv         0  (        0 /        0 )  0.00
        mb_split         0  (        0 /        0 )  0.00
             exp         0  (        0 /        0 )  0.00
       gate_deco         0  (        0 /        0 )  0.00
       gcomp_tim         0  (        0 /        0 )  0.00
  inv_pair_2_buf         0  (        0 /        0 )  0.00

 init_drc                   3322        0         0       359

           Trick     Calls     Accepts   Attempts    Time(secs)
-----------------------------------------------------------
          plc_st         0  (        0 /        0 )  0.00
        plc_star         0  (        0 /        0 )  0.00
        drc_bufs         0  (        0 /        0 )  0.00
        drc_fopt         0  (        0 /        0 )  0.00
        drc_bufb         0  (        0 /        0 )  0.00
      simple_buf         0  (        0 /        0 )  0.00
             dup         0  (        0 /        0 )  0.00
       crit_dnsz         0  (        0 /        0 )  0.00
       crit_upsz         0  (        0 /        0 )  0.00

 incr_max_cap               3328        0         0       359

           Trick     Calls     Accepts   Attempts    Time(secs)
-----------------------------------------------------------
          plc_st        78  (        0 /        0 )  0.00
        plc_star        78  (        0 /        0 )  0.00
        drc_bufs       156  (        2 /       78 )  0.07
        drc_fopt        76  (        0 /        0 )  0.01
        drc_bufb        76  (        0 /        0 )  0.00
      simple_buf        76  (        0 /        0 )  0.10
             dup        76  (        0 /        0 )  0.00
       crit_dnsz         1  (        0 /        0 )  0.00
       crit_upsz        76  (        0 /        0 )  0.07


           Trick     Calls     Accepts   Attempts    Time(secs)
-----------------------------------------------------------
          plc_st         0  (        0 /        0 )  0.00
        plc_star         0  (        0 /        0 )  0.00
        drc_bufs         0  (        0 /        0 )  0.00
        drc_fopt         0  (        0 /        0 )  0.00
        drc_bufb         0  (        0 /        0 )  0.00
             dup         0  (        0 /        0 )  0.00
       crit_dnsz         0  (        0 /        0 )  0.00
       crit_upsz         0  (        0 /        0 )  0.00

 init_area                  3328        0         0       359
 undup                      3317        0         0       359
 rem_buf                    3314        0         0       359
 rem_inv                    3309        0         0       359
 merge_bi                   3304        0         0       359
 glob_area                  3303        0         0       359

           Trick     Calls     Accepts   Attempts    Time(secs)
-----------------------------------------------------------
           undup         2  (        2 /        2 )  0.01
         rem_buf        74  (        1 /        1 )  0.10
         rem_inv         6  (        1 /        1 )  0.01
        merge_bi         2  (        2 /        2 )  0.01
      rem_inv_qb         0  (        0 /        0 )  0.00
        io_phase        35  (        0 /        0 )  0.05
       gate_comp        23  (        0 /        0 )  0.08
       gcomp_mog         1  (        0 /        0 )  0.03
       glob_area        40  (        4 /       40 )  0.01
       area_down         3  (        0 /        0 )  0.01
      size_n_buf         0  (        0 /        0 )  0.00
  gate_deco_area         0  (        0 /        0 )  0.00

==================================
Stage : incr_opt
==================================
  =================
   Message Summary
  =================
---------------------------------------------------------------------------------------
|   Id   |  Sev  |Count|                         Message Text                         |
---------------------------------------------------------------------------------------
|CFM-1   |Info   |    1|Wrote dofile.                                                 |
|CFM-5   |Info   |    1|Wrote formal verification information.                        |
|PA-7    |Info   |    4|Resetting power analysis results.                             |
|        |       |     |All computed switching activities are removed.                |
|SYNTH-5 |Info   |    1|Done mapping.                                                 |
|SYNTH-7 |Info   |    1|Incrementally optimizing.                                     |
|SYNTH-33|Warning|    1|The selected flow setting will be removed in a future release.|
|        |       |     |Contact Cadence support to understand current flows.          |
---------------------------------------------------------------------------------------
Info    : Done incrementally optimizing. [SYNTH-8]
        : Done incrementally optimizing 'tt_um_Jsilicon'.
      flow.cputime  flow.realtime  timing.setup.tns  timing.setup.wns  snapshot
UM:*                                                                   syn_opt
@file(synthesis.tcl) 51: puts "Generating Reports..."
Generating Reports...
@file(synthesis.tcl) 52: set report_dir $project_root/reports/synthesis
@file(synthesis.tcl) 53: file mkdir $report_dir
@file(synthesis.tcl) 55: redirect $report_dir/area.rpt {report_area}
@file(synthesis.tcl) 56: redirect $report_dir/gates.rpt {report_gates}
@file(synthesis.tcl) 57: redirect $report_dir/power.rpt {report_power}
@file(synthesis.tcl) 58: redirect $report_dir/timing.rpt {report_timing -nworst 10}
@file(synthesis.tcl) 59: redirect $report_dir/qor.rpt {report_qor}
@file(synthesis.tcl) 61: puts "Writing Output Files..."
Writing Output Files...
@file(synthesis.tcl) 62: set netlist_dir $project_root/results/netlist
@file(synthesis.tcl) 63: set work_dir $project_root/work/synthesis
@file(synthesis.tcl) 65: file mkdir $netlist_dir
@file(synthesis.tcl) 66: file mkdir $work_dir
@file(synthesis.tcl) 68: write_hdl > $netlist_dir/tt_um_Jsilicon_synth.v
@file(synthesis.tcl) 69: write_sdc > $work_dir/tt_um_Jsilicon_synth.sdc
Finished SDC export (command execution time mm:ss (real) = 00:00).
@file(synthesis.tcl) 70: write_sdf -timescale ns > $project_root/results/timing/tt_um_Jsilicon_synth.sdf
Warning : Default value for an option has changed in this release. [WSDF-104]
        : Default value for -setuphold has changed from split to merge_always. Specify '-setuphold split' to preserve the behavior of the previous release.
        : Specify the option explicitly.
Warning : Default value for an option has changed in this release. [WSDF-104]
        : Default value for -recrem has changed from split to merge_always. Specify '-recrem split' to preserve the behavior of the previous release.
@file(synthesis.tcl) 71: write_db $work_dir/tt_um_Jsilicon_synth.db
Finished exporting design database to file '/home/student001/JSilicon2/work/synthesis/tt_um_Jsilicon_synth.db' for 'tt_um_Jsilicon' (command execution time mm:ss cpu = 00:00, real = 00:01).
@file(synthesis.tcl) 73: puts ""

@file(synthesis.tcl) 74: puts "SYNTHESIS COMPLETE!"
SYNTHESIS COMPLETE!
@file(synthesis.tcl) 75: puts ""

@file(synthesis.tcl) 77: exit

Lic Summary:
[10:55:27.179843] Cdslmd servers: iot46
[10:55:27.179857] Feature usage summary:
[10:55:27.179858] Genus_Synthesis

Normal exit.

[OK] Synthesis complete

QoR Summary:
----------------------------------------------------------------------
Timing
--------

Clock Period
-------------
clk   5000.0
----------------------------------------------------------------------

==============================================================================
Stage 2: Place & Route
==============================================================================

Running Innovus... (this may take 10-15 minutes)

Cadence Innovus(TM) Implementation System.
Copyright 2024 Cadence Design Systems, Inc. All rights reserved worldwide.

Version:        v23.13-s082_1, built Wed Nov 13 13:42:48 PST 2024
Options:        -init ../../scripts/innovus/pnr_flow.tcl
Date:           Wed Nov 19 10:55:29 2025
Host:           gjchamber (x86_64 w/Linux 3.10.0-1160.el7.x86_64) (20cores*80cpus*Intel(R) Xeon(R) Gold 6230 CPU @ 2.10GHz 28160KB)
OS:             CentOS Linux 7 (Core)

License:
                [10:55:29.133041] Configured Lic search path (23.02-s006): 5280@10.10.20.247

                invs    Innovus Implementation System   23.1    checkout succeeded
                8 CPU jobs allowed with the current license(s). Use setMultiCpuUsage to set your required CPU count.
**ERROR: (IMPOAX-124):  OpenAccess (OA) shared library installation is older than the one that was used to build this Innovus version. For using the OA installation built and tested with this Innovus version, unset the shell variable OA_HOME. For using 'p018' or higher version of OA, reset OA_HOME to point to that installation.
Type 'man IMPOAX-124' for more detail.
**ERROR: (IMPOAX-332):  Failed to initialize OpenAccess (OA) database. OA related commands cannot be run in this session. Confirm that the OA shared library is installed and OA_HOME is set correctly. Typically the OA_HOME environment variable should not be set.
Type 'man IMPOAX-332' for more detail.
INFO: OA features are disabled in this session.
Create and set the environment variable TMPDIR to /home/student001/JSilicon2/work/pnr/innovus_temp_95123_b150d23f-4499-44eb-9146-ed97469e7d45_gjchamber_student001_0rY64f.

Change the soft stacksize limit to 0.2%RAM (770 mbytes). Set global soft_stack_size_limit to change the value.
Info: Process UID = 95123 / b150d23f-4499-44eb-9146-ed97469e7d45 / QMwHrQSo4S

**INFO:  MMMC transition support version v31-84

[INFO] Loading PVS 22.21 fill procedures
Sourcing file "../../scripts/innovus/pnr_flow.tcl" ...
innovus 1> source ../../scripts/innovus/pnr_flow.tcl
JSilicon P&R Flow
Initializing design...
**ERROR: (IMPOAX-124):  OpenAccess (OA) shared library installation is older than the one that was used to build this Innovus version. For using the OA installation built and tested with this Innovus version, unset the shell variable OA_HOME. For using 'p018' or higher version of OA, reset OA_HOME to point to that installation.
Type 'man IMPOAX-124' for more detail.
**ERROR: (IMPOAX-332):  Failed to initialize OpenAccess (OA) database. OA related commands cannot be run in this session. Confirm that the OA shared library is installed and OA_HOME is set correctly. Typically the OA_HOME environment variable should not be set.
Type 'man IMPOAX-332' for more detail.
#% Begin Load MMMC data ... (date=11/19 10:55:52, mem=1649.0M)
MMMC Configuration...
#% End Load MMMC data ... (date=11/19 10:55:53, total cpu=0:00:00.0, real=0:00:01.0, peak res=1650.2M, current mem=1650.2M)

Loading LEF file /home/student001/JSilicon2/tech/lef/gscl45nm.lef ...
Set DBUPerIGU to M2 pitch 380.

##  Check design process and node:
##  Both design process and tech node are not set.

Loading view definition file from /home/student001/JSilicon2/scripts/innovus/mmmc.tcl
Reading LIB_TYPICAL timing library '/home/student001/JSilicon2/tech/lib/gscl45nm.lib' ...
Read 31 cells in library 'gscl45nm'
*** End library_loading (cpu=0.00min, real=0.00min, mem=13.0M, fe_cpu=0.38min, fe_real=0.40min, fe_mem=1871.3M) ***
#% Begin Load netlist data ... (date=11/19 10:55:53, mem=1664.9M)
*** Begin netlist parsing (mem=1871.3M) ***
**WARN: (IMPVL-159):    Pin 'gnd' of cell 'XOR2X1' is defined in LEF but not in the timing library.
Type 'man IMPVL-159' for more detail.
**WARN: (IMPVL-159):    Pin 'vdd' of cell 'XOR2X1' is defined in LEF but not in the timing library.
Type 'man IMPVL-159' for more detail.
**WARN: (IMPVL-159):    Pin 'gnd' of cell 'XNOR2X1' is defined in LEF but not in the timing library.
Type 'man IMPVL-159' for more detail.
**WARN: (IMPVL-159):    Pin 'vdd' of cell 'XNOR2X1' is defined in LEF but not in the timing library.
Type 'man IMPVL-159' for more detail.
**WARN: (IMPVL-159):    Pin 'gnd' of cell 'TBUFX2' is defined in LEF but not in the timing library.
Type 'man IMPVL-159' for more detail.
**WARN: (IMPVL-159):    Pin 'vdd' of cell 'TBUFX2' is defined in LEF but not in the timing library.
Type 'man IMPVL-159' for more detail.
**WARN: (IMPVL-159):    Pin 'gnd' of cell 'TBUFX1' is defined in LEF but not in the timing library.
Type 'man IMPVL-159' for more detail.
**WARN: (IMPVL-159):    Pin 'vdd' of cell 'TBUFX1' is defined in LEF but not in the timing library.
Type 'man IMPVL-159' for more detail.
**WARN: (IMPVL-159):    Pin 'gnd' of cell 'OR2X2' is defined in LEF but not in the timing library.
Type 'man IMPVL-159' for more detail.
**WARN: (IMPVL-159):    Pin 'vdd' of cell 'OR2X2' is defined in LEF but not in the timing library.
Type 'man IMPVL-159' for more detail.
**WARN: (IMPVL-159):    Pin 'gnd' of cell 'OR2X1' is defined in LEF but not in the timing library.
Type 'man IMPVL-159' for more detail.
**WARN: (IMPVL-159):    Pin 'vdd' of cell 'OR2X1' is defined in LEF but not in the timing library.
Type 'man IMPVL-159' for more detail.
**WARN: (IMPVL-159):    Pin 'gnd' of cell 'OAI21X1' is defined in LEF but not in the timing library.
Type 'man IMPVL-159' for more detail.
**WARN: (IMPVL-159):    Pin 'vdd' of cell 'OAI21X1' is defined in LEF but not in the timing library.
Type 'man IMPVL-159' for more detail.
**WARN: (IMPVL-159):    Pin 'gnd' of cell 'NOR3X1' is defined in LEF but not in the timing library.
Type 'man IMPVL-159' for more detail.
**WARN: (IMPVL-159):    Pin 'vdd' of cell 'NOR3X1' is defined in LEF but not in the timing library.
Type 'man IMPVL-159' for more detail.
**WARN: (IMPVL-159):    Pin 'gnd' of cell 'NOR2X1' is defined in LEF but not in the timing library.
Type 'man IMPVL-159' for more detail.
**WARN: (IMPVL-159):    Pin 'vdd' of cell 'NOR2X1' is defined in LEF but not in the timing library.
Type 'man IMPVL-159' for more detail.
**WARN: (IMPVL-159):    Pin 'gnd' of cell 'NAND3X1' is defined in LEF but not in the timing library.
Type 'man IMPVL-159' for more detail.
**WARN: (IMPVL-159):    Pin 'vdd' of cell 'NAND3X1' is defined in LEF but not in the timing library.
Type 'man IMPVL-159' for more detail.
**WARN: (EMS-27):       Message (IMPVL-159) has exceeded the current message display limit of 20.
To increase the message display limit, refer to the product command reference manual.
Created 31 new cells from 1 timing libraries.
Reading netlist ...
Backslashed names will retain backslash and a trailing blank character.
Reading verilog netlist '/home/student001/JSilicon2/results/netlist/tt_um_Jsilicon_synth.v'

*** Memory Usage v#2 (Current mem = 1874.285M, initial mem = 831.172M) ***
*** End netlist parsing (cpu=0:00:00.0, real=0:00:00.0, mem=1874.3M) ***
#% End Load netlist data ... (date=11/19 10:55:53, total cpu=0:00:00.0, real=0:00:00.0, peak res=1669.3M, current mem=1669.3M)
Set top cell to tt_um_Jsilicon.
Hooked 31 DB cells to tlib cells.
Starting recursive module instantiation check.
No recursion found.
Building hierarchical netlist for Cell tt_um_Jsilicon ...
***** UseNewTieNetMode *****.
*** Netlist is unique.
Set DBUPerIGU to techSite CoreSite width 760.
** info: there are 36 modules.
** info: there are 669 stdCell insts.
** info: there are 669 stdCell insts with at least one signal pin.

*** Memory Usage v#2 (Current mem = 1932.711M, initial mem = 831.172M) ***
Horizontal Layer M1 offset = 190 (guessed)
Vertical Layer M2 offset = 190 (guessed)
Suggestion: specify LAYER OFFSET in LEF file
Reason: hard to extract LAYER OFFSET from standard cells
Start create_tracks
Generated pitch 1.68 in metal10 is different from 1.71 defined in technology file in preferred direction.
Generated pitch 0.84 in metal8 is different from 0.855 defined in technology file in preferred direction.
Generated pitch 0.95 in metal7 is different from 0.855 defined in technology file in preferred direction.
Generated pitch 0.28 in metal6 is different from 0.285 defined in technology file in preferred direction.
Generated pitch 0.28 in metal4 is different from 0.285 defined in technology file in preferred direction.
Extraction setup Started for TopCell tt_um_Jsilicon
Initializing multi-corner RC extraction with 1 active RC Corners ...
**WARN: (IMPEXT-2773):  The via resistance between layers M0 and M1 could not be determined from the LEF technology file because the via resistance specification is missing. A default of 4 Ohms will be used as via resistance between these layers.
Type 'man IMPEXT-2773' for more detail.
**WARN: (IMPEXT-2773):  The via resistance between layers M1 and M2 could not be determined from the LEF technology file because the via resistance specification is missing. A default of 4 Ohms will be used as via resistance between these layers.
Type 'man IMPEXT-2773' for more detail.
**WARN: (IMPEXT-2773):  The via resistance between layers M2 and M3 could not be determined from the LEF technology file because the via resistance specification is missing. A default of 4 Ohms will be used as via resistance between these layers.
Type 'man IMPEXT-2773' for more detail.
**WARN: (IMPEXT-2773):  The via resistance between layers M3 and M4 could not be determined from the LEF technology file because the via resistance specification is missing. A default of 4 Ohms will be used as via resistance between these layers.
Type 'man IMPEXT-2773' for more detail.
**WARN: (IMPEXT-2773):  The via resistance between layers M4 and M5 could not be determined from the LEF technology file because the via resistance specification is missing. A default of 4 Ohms will be used as via resistance between these layers.
Type 'man IMPEXT-2773' for more detail.
**WARN: (IMPEXT-2773):  The via resistance between layers M5 and M6 could not be determined from the LEF technology file because the via resistance specification is missing. A default of 4 Ohms will be used as via resistance between these layers.
Type 'man IMPEXT-2773' for more detail.
**WARN: (IMPEXT-2773):  The via resistance between layers M6 and M7 could not be determined from the LEF technology file because the via resistance specification is missing. A default of 4 Ohms will be used as via resistance between these layers.
Type 'man IMPEXT-2773' for more detail.
**WARN: (IMPEXT-2773):  The via resistance between layers M7 and M8 could not be determined from the LEF technology file because the via resistance specification is missing. A default of 4 Ohms will be used as via resistance between these layers.
Type 'man IMPEXT-2773' for more detail.
**WARN: (IMPEXT-2773):  The via resistance between layers M8 and M9 could not be determined from the LEF technology file because the via resistance specification is missing. A default of 4 Ohms will be used as via resistance between these layers.
Type 'man IMPEXT-2773' for more detail.
**WARN: (IMPEXT-2773):  The via resistance between layers M9 and M10 could not be determined from the LEF technology file because the via resistance specification is missing. A default of 4 Ohms will be used as via resistance between these layers.
Type 'man IMPEXT-2773' for more detail.
**WARN: (IMPEXT-2766):  The sheet resistance for layer M1 is not defined in the cap table. Therefore, the LEF value 0.38 will be used instead. To avoid this message, update the relevant cap table to include the sheet resistance for the specified layer and read it back in.
**WARN: (IMPEXT-2766):  The sheet resistance for layer M2 is not defined in the cap table. Therefore, the LEF value 0.25 will be used instead. To avoid this message, update the relevant cap table to include the sheet resistance for the specified layer and read it back in.
**WARN: (IMPEXT-2766):  The sheet resistance for layer M3 is not defined in the cap table. Therefore, the LEF value 0.25 will be used instead. To avoid this message, update the relevant cap table to include the sheet resistance for the specified layer and read it back in.
**WARN: (IMPEXT-2766):  The sheet resistance for layer M4 is not defined in the cap table. Therefore, the LEF value 0.25 will be used instead. To avoid this message, update the relevant cap table to include the sheet resistance for the specified layer and read it back in.
**WARN: (IMPEXT-2766):  The sheet resistance for layer M5 is not defined in the cap table. Therefore, the LEF value 0.25 will be used instead. To avoid this message, update the relevant cap table to include the sheet resistance for the specified layer and read it back in.
**WARN: (IMPEXT-2766):  The sheet resistance for layer M6 is not defined in the cap table. Therefore, the LEF value 0.25 will be used instead. To avoid this message, update the relevant cap table to include the sheet resistance for the specified layer and read it back in.
**WARN: (IMPEXT-2766):  The sheet resistance for layer M7 is not defined in the cap table. Therefore, the LEF value 0.25 will be used instead. To avoid this message, update the relevant cap table to include the sheet resistance for the specified layer and read it back in.
**WARN: (IMPEXT-2766):  The sheet resistance for layer M8 is not defined in the cap table. Therefore, the LEF value 0.25 will be used instead. To avoid this message, update the relevant cap table to include the sheet resistance for the specified layer and read it back in.
**WARN: (IMPEXT-2766):  The sheet resistance for layer M9 is not defined in the cap table. Therefore, the LEF value 0.21 will be used instead. To avoid this message, update the relevant cap table to include the sheet resistance for the specified layer and read it back in.
**WARN: (IMPEXT-2766):  The sheet resistance for layer M10 is not defined in the cap table. Therefore, the LEF value 0.21 will be used instead. To avoid this message, update the relevant cap table to include the sheet resistance for the specified layer and read it back in.
Summary of Active RC-Corners :

 Analysis View: VIEW_TYPICAL
    RC-Corner Name        : RC_TYPICAL
    RC-Corner Index       : 0
    RC-Corner Temperature : 25 Celsius
    RC-Corner Cap Table   : ''
    RC-Corner PreRoute Res Factor         : 1
    RC-Corner PreRoute Cap Factor         : 1
    RC-Corner PostRoute Res Factor        : 1 {1 1 1}
    RC-Corner PostRoute Cap Factor        : 1 {1 1 1}
    RC-Corner PostRoute XCap Factor       : 1 {1 1 1}
    RC-Corner PreRoute Clock Res Factor   : 1   [Derived from Cap Table]
    RC-Corner PreRoute Clock Cap Factor   : 1   [Derived from Cap Table]
    RC-Corner PostRoute Clock Cap Factor  : 1 {1 1 1}   [Derived from postRoute_cap (effortLevel low)]
    RC-Corner PostRoute Clock Res Factor  : 1 {1 1 1}   [Derived from postRoute_res (effortLevel low)]
    RC-Corner PostRoute Clock coupling capacitance Factor : 1 {1 1 1}
Updating RC Grid density data for preRoute extraction ...
Initializing multi-corner resistance tables ...
*Info: initialize multi-corner CTS.
Reading timing constraints file '/home/student001/JSilicon2/work/synthesis/tt_um_Jsilicon_synth.sdc' ...
Current (total cpu=0:00:23.6, real=0:00:25.0, peak res=2068.1M, current mem=2068.1M)
**WARN: (TCLCMD-1461):  Skipped unsupported command: set_units (File /home/student001/JSilicon2/work/synthesis/tt_um_Jsilicon_synth.sdc, Line 9).

**WARN: (TCLCMD-1461):  Skipped unsupported command: set_units (File /home/student001/JSilicon2/work/synthesis/tt_um_Jsilicon_synth.sdc, Line 10).

tt_um_Jsilicon
INFO (CTE): Reading of timing constraints file /home/student001/JSilicon2/work/synthesis/tt_um_Jsilicon_synth.sdc completed, with 2 WARNING
Ending "Constraint file reading stats" (total cpu=0:00:00.1, real=0:00:00.0, peak res=2082.2M, current mem=2082.2M)
Current (total cpu=0:00:23.7, real=0:00:25.0, peak res=2082.2M, current mem=2082.2M)
Total number of combinational cells: 25
Total number of sequential cells: 4
Total number of tristate cells: 2
Total number of level shifter cells: 0
Total number of power gating cells: 0
Total number of isolation cells: 0
Total number of power switch cells: 0
Total number of pulse generator cells: 0
Total number of always on buffers: 0
Total number of retention cells: 0
Total number of physical cells: 0
List of usable buffers: BUFX2 BUFX4
Total number of usable buffers: 2
List of unusable buffers:
Total number of unusable buffers: 0
List of usable inverters: INVX2 INVX1 INVX4 INVX8
Total number of usable inverters: 4
List of unusable inverters:
Total number of unusable inverters: 0
List of identified usable delay cells: CLKBUF1 CLKBUF2 CLKBUF3
Total number of identified usable delay cells: 3
List of identified unusable delay cells:
Total number of identified unusable delay cells: 0
#% Begin Load MMMC data post ... (date=11/19 10:55:54, mem=2101.4M)
MMMC complete
#% End Load MMMC data post ... (date=11/19 10:55:54, total cpu=0:00:00.0, real=0:00:00.0, peak res=2101.4M, current mem=2101.4M)

*** Summary of all messages that are not suppressed in this session:
Severity  ID               Count  Summary
WARNING   IMPEXT-2766         10  The sheet resistance for layer %s is not...
WARNING   IMPEXT-2773         10  The via resistance between layers %s and...
WARNING   IMPVL-159           62  Pin '%s' of cell '%s' is defined in LEF ...
ERROR     IMPOAX-124           1  OpenAccess (OA) shared library installat...
ERROR     IMPOAX-332           1  Failed to initialize OpenAccess (OA) dat...
WARNING   TCLCMD-1461          2  Skipped unsupported command: %s
*** Message Summary: 84 warning(s), 2 error(s)

Floorplan...
Adjusting coreMargin left    to finFet grid (PlacementGrid) : after adjusting :10.07
Adjusting coreMargin bottom  to finFet grid (PlacementGrid) : after adjusting :10.07
Adjusting coreMargin right   to finFet grid (PlacementGrid) : after adjusting :10.07
Adjusting coreMargin top     to finFet grid (PlacementGrid) : after adjusting :10.07
Adjusting core size to PlacementGrid : width :54.72 height : 51.87
Horizontal Layer M1 offset = 190 (guessed)
Vertical Layer M2 offset = 190 (guessed)
Suggestion: specify LAYER OFFSET in LEF file
Reason: hard to extract LAYER OFFSET from standard cells
Start create_tracks
Generated pitch 1.68 in metal10 is different from 1.71 defined in technology file in preferred direction.
Generated pitch 0.84 in metal8 is different from 0.855 defined in technology file in preferred direction.
Generated pitch 0.95 in metal7 is different from 0.855 defined in technology file in preferred direction.
Generated pitch 0.28 in metal6 is different from 0.285 defined in technology file in preferred direction.
Generated pitch 0.28 in metal4 is different from 0.285 defined in technology file in preferred direction.
**ERROR: (IMPTCM-113):  Option "-spacing" is required when option "[ -unit ]" is specified. Type 'man editPin' for more details.
**ERROR: (IMPPTN-1599): Invalid syntax of editPin command, errorCode [-2]
Power Planning...
#% Begin addRing (date=11/19 10:55:54, mem=2102.9M)
**ERROR: (IMPPP-4029):  Unexpected value for the option '-layer'. "-layer {value | {top value bottom value left value right value}}"
#% End addRing (date=11/19 10:55:54, total cpu=0:00:00.0, real=0:00:00.0, peak res=2103.0M, current mem=2103.0M)
#% Begin addStripe (date=11/19 10:55:54, mem=2103.0M)

viaInitial starts at Wed Nov 19 10:55:54 2025
viaInitial ends at Wed Nov 19 10:55:54 2025

Initialize fgc environment(mem: 2367.8M) ...  fail and won't use fgc to check drc(cpu: 0:00:00.0, real: 0:00:00.0, peak mem: 2367.8M)
Loading cell geometries (cpu: 0:00:00.0, real: 0:00:00.0, peak mem: 2367.8M)
Loading wires (cpu: 0:00:00.0, real: 0:00:00.0, peak mem: 2367.8M)
Loading via instances (cpu: 0:00:00.0, real: 0:00:00.0, peak mem: 2367.8M)
Starting stripe generation ...
Non-Default Mode Option Settings :
  NONE
The core ring for vdd is incomplete. The core ring will not be used as a boundary for stripes. In this situation, the power planner will generate stripes only within the core area.
The core ring for gnd is incomplete. The core ring will not be used as a boundary for stripes. In this situation, the power planner will generate stripes only within the core area.
Stripe generation is complete.
vias are now being generated.
addStripe created 6 wires.
ViaGen created 0 via, deleted 0 via to avoid violation.
+--------+----------------+----------------+
|  Layer |     Created    |     Deleted    |
+--------+----------------+----------------+
| metal8 |        6       |       NA       |
+--------+----------------+----------------+
innovus 2> #% End addStripe (date=11/19 10:55:54, total cpu=0:00:00.0, real=0:00:00.0, peak res=2105.3M, current mem=2105.3M)
#% Begin sroute (date=11/19 10:55:54, mem=2105.3M)
*** Begin SPECIAL ROUTE on Wed Nov 19 10:55:54 2025 ***
SPECIAL ROUTE ran on directory: /home/student001/JSilicon2/work/pnr
SPECIAL ROUTE ran on machine: gjchamber (Linux 3.10.0-1160.el7.x86_64 Xeon 2.10Ghz)

Begin option processing ...
srouteConnectPowerBump set to false
routeSelectNet set to "vdd gnd"
routeSpecial set to true
srouteConnectBlockPin set to false
srouteConnectConverterPin set to false
srouteConnectPadPin set to false
srouteConnectStripe set to false
srouteFollowCorePinEnd set to 3
srouteFollowPadPin set to false
srouteJogControl set to "preferWithChanges differentLayer"
sroutePadPinAllPorts set to true
sroutePreserveExistingRoutes set to true
srouteRoutePowerBarPortOnBothDir set to true
End option processing: cpu: 0:00:00, real: 0:00:00, peak: 54.00 megs.

Reading DB technology information...
Finished reading DB technology information.
Reading floorplan and netlist information...
Finished reading floorplan and netlist information.
Read in 21 layers, 10 routing layers, 1 overlap layer
Read in 33 macros, 21 used
Read in 21 components
  21 core components: 21 unplaced, 0 placed, 0 fixed
Read in 43 logical pins
Read in 43 nets
Read in 2 special nets, 2 routed
Read in 42 terminals
2 nets selected.

Begin power routing ...
CPU time for vdd FollowPin 0 seconds
CPU time for gnd FollowPin 0 seconds
  Number of Core ports routed: 0  open: 44
  Number of Followpin connections: 22
End power routing: cpu: 0:00:00, real: 0:00:00, peak: 77.00 megs.



 Begin updating DB with routing results ...
 Updating DB with 0 via definition ...Extracting standard cell pins and blockage ......
Pin and blockage extraction finished

sroute created 22 wires.
ViaGen created 462 vias, deleted 0 via to avoid violation.
+--------+----------------+----------------+
|  Layer |     Created    |     Deleted    |
+--------+----------------+----------------+
| metal1 |       22       |       NA       |
|  via1  |       66       |        0       |
|  via2  |       66       |        0       |
|  via3  |       66       |        0       |
|  via4  |       66       |        0       |
|  via5  |       66       |        0       |
|  via6  |       66       |        0       |
|  via7  |       66       |        0       |
+--------+----------------+----------------+
innovus 2> #% End sroute (date=11/19 10:55:54, total cpu=0:00:00.1, real=0:00:00.0, peak res=2124.0M, current mem=2117.4M)
Placement...
*** placeDesign #1 [begin] () : totSession cpu/real = 0:00:24.1/0:00:23.7 (1.0), mem = 2388.1M
*** Starting placeDesign default flow ***
*** Start deleteBufferTree ***
Info: Detect buffers to remove automatically.
Analyzing netlist ...
Updating netlist

*summary: 83 instances (buffers/inverters) removed
*** Finish deleteBufferTree (0:00:00.2) ***
**INFO: Enable pre-place timing setting for timing analysis
Set Using Default Delay Limit as 101.
**WARN: (IMPDC-1629):   The default delay limit was set to 101. This is less than the default of 1000 and may result in inaccurate delay calculation for nets with a fanout higher than the setting.  If needed, the default delay limit may be adjusted by running the command 'set delaycal_use_default_delay_limit'.
Set Default Net Delay as 0 ps.
Set Default Net Load as 0 pF.
Set Default Input Pin Transition as 1 ps.
**INFO: Analyzing IO path groups for slack adjustment
Effort level <high> specified for reg2reg_tmp.95123 path_group
AAE_INFO: opIsDesignInPostRouteState() is 0
AAE DB initialization (MEM=2123.746094 CPU=0:00:00.0 REAL=0:00:00.0)
#################################################################################
# Design Stage: PreRoute
# Design Name: tt_um_Jsilicon
# Design Mode: 90nm
# Analysis Mode: MMMC Non-OCV
# Parasitics Mode: No SPEF/RCDB
# Signoff Settings: SI Off
#################################################################################
Calculate delays in Single mode...
Start delay calculation (fullDC) (1 T). (MEM=2140.21)
siFlow : Timing analysis mode is single, using late cdB files
Total number of fetched objects 636
AAE_INFO: Total number of nets for which stage creation was skipped for all views 0
End delay calculation. (MEM=2149.75 CPU=0:00:00.1 REAL=0:00:01.0)
End delay calculation (fullDC). (MEM=2148.98 CPU=0:00:00.3 REAL=0:00:01.0)
**INFO: Disable pre-place timing setting for timing analysis
Set Using Default Delay Limit as 1000.
Set Default Net Delay as 1000 ps.
Set Default Input Pin Transition as 0.1 ps.
Set Default Net Load as 0.5 pF.
**INFO: Pre-place timing setting for timing analysis already disabled
Deleted 0 physical inst  (cell - / prefix -).
INFO: #ExclusiveGroups=0
INFO: There are no Exclusive Groups.
*** Starting "NanoPlace(TM) placement v#23 (mem=2566.3M)" ...
Estimated loop count for BSM: 142
*** Build Buffered Sizing Timing Model
(cpu=0:00:00.0 mem=2574.3M) ***
*** Build Virtual Sizing Timing Model
(cpu=0:00:00.0 mem=2574.3M) ***
No user-set net weight.
Net fanout histogram:
2               : 415 (65.7%) nets
3               : 107 (16.9%) nets
4     - 14      : 104 (16.5%) nets
15    - 39      : 5 (0.8%) nets
40    - 79      : 1 (0.2%) nets
80    - 159     : 0 (0.0%) nets
160   - 319     : 0 (0.0%) nets
320   - 639     : 0 (0.0%) nets
640   - 1279    : 0 (0.0%) nets
1280  - 2559    : 0 (0.0%) nets
2560  - 5119    : 0 (0.0%) nets
5120+           : 0 (0.0%) nets
Scan chains were not defined.
#std cell=587 (0 fixed + 587 movable) #buf cell=0 #inv cell=137 #block=0 (0 floating + 0 preplaced)
#ioInst=0 #net=632 #term=1877 #term/net=2.97, #fixedIo=0, #floatIo=0, #fixedPin=0, #floatPin=24
stdCell: 587 single + 0 double + 0 multi
Total standard cell length = 0.7418 (mm), area = 0.0018 (mm^2)
**Info: (IMPSP-307): Design contains fractional 20 cells.
Average module density = 0.646.
Density for the design = 0.646.
       = stdcell_area 1952 sites (1832 um^2) / alloc_area 3024 sites (2838 um^2).
Pin Density = 0.6207.
            = total # of pins 1877 / total area 3024.
[spp] 0
Clock gating cells determined by native netlist tracing.
=== lastAutoLevel = 6
Iteration  1: Total net bbox = 1.027e-11 (8.79e-12 1.48e-12)
              Est.  stn bbox = 1.072e-11 (9.12e-12 1.60e-12)
              cpu = 0:00:00.0 real = 0:00:00.0 mem = 2672.5M
Iteration  2: Total net bbox = 1.027e-11 (8.79e-12 1.48e-12)
              Est.  stn bbox = 1.072e-11 (9.12e-12 1.60e-12)
              cpu = 0:00:00.0 real = 0:00:00.0 mem = 2672.5M
Iteration  3: Total net bbox = 2.006e+02 (9.80e+01 1.03e+02)
              Est.  stn bbox = 2.284e+02 (1.12e+02 1.17e+02)
              cpu = 0:00:00.1 real = 0:00:00.0 mem = 2690.5M
Active setup views:
    VIEW_TYPICAL
Iteration  4: Total net bbox = 2.522e+03 (1.17e+03 1.35e+03)
              Est.  stn bbox = 2.971e+03 (1.35e+03 1.62e+03)
              cpu = 0:00:00.3 real = 0:00:01.0 mem = 2690.5M
Iteration  5: Total net bbox = 3.485e+03 (1.52e+03 1.97e+03)
              Est.  stn bbox = 4.092e+03 (1.73e+03 2.37e+03)
              cpu = 0:00:00.4 real = 0:00:00.0 mem = 2690.5M
Iteration  6: Total net bbox = 3.850e+03 (1.75e+03 2.10e+03)
              Est.  stn bbox = 4.492e+03 (1.98e+03 2.51e+03)
              cpu = 0:00:00.2 real = 0:00:00.0 mem = 2707.5M
Iteration  7: Total net bbox = 4.174e+03 (1.87e+03 2.31e+03)
              Est.  stn bbox = 4.816e+03 (2.09e+03 2.72e+03)
              cpu = 0:00:00.4 real = 0:00:01.0 mem = 2707.5M
Iteration  8: Total net bbox = 3.704e+03 (1.76e+03 1.94e+03)
              Est.  stn bbox = 4.282e+03 (1.96e+03 2.32e+03)
              cpu = 0:00:00.4 real = 0:00:00.0 mem = 2724.5M

Max route layer is changed from 127 to 10 because there is no routing track above this layer
Max route layer is changed from 127 to 10 because there is no routing track above this layer
[NR-eGR] Started Early Global Route kernel ( Curr Mem: 2.62 MB )
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Iteration  9: Total net bbox = 5.710e+03 (2.64e+03 3.08e+03)
              Est.  stn bbox = 6.421e+03 (2.90e+03 3.52e+03)
              cpu = 0:00:01.2 real = 0:00:01.0 mem = 2714.9M
Iteration 10: Total net bbox = 5.710e+03 (2.64e+03 3.08e+03)
              Est.  stn bbox = 6.421e+03 (2.90e+03 3.52e+03)
              cpu = 0:00:00.0 real = 0:00:00.0 mem = 2714.9M
Iteration 11: Total net bbox = 5.710e+03 (2.64e+03 3.08e+03)
              Est.  stn bbox = 6.421e+03 (2.90e+03 3.52e+03)
              cpu = 0:00:00.0 real = 0:00:00.0 mem = 2714.9M
*** cost = 5.710e+03 (2.64e+03 3.08e+03) (cpu for global=0:00:03.1) real=0:00:04.0***
Info: 0 clock gating cells identified, 0 (on average) moved 0/3
Solver runtime cpu: 0:00:02.8 real: 0:00:02.8
Core Placement runtime cpu: 0:00:03.0 real: 0:00:04.0
Begin: Reorder Scan Chains
**WARN: (IMPSP-9025):   No scan chain specified/traced.
Type 'man IMPSP-9025' for more detail.
End: Reorder Scan Chains
**Info: (IMPSP-307): Design contains fractional 20 cells.
*** Starting refinePlace (0:00:29.3 mem=2714.9M) ***
Total net bbox length = 5.710e+03 (2.635e+03 3.075e+03) (ext = 1.782e+03)
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Move report: Detail placement moves 587 insts, mean move: 0.45 um, max move: 5.92 um
        Max move on inst (core_inst_uart_inst/g2192): (16.57, 54.52) --> (13.11, 52.06)
        Runtime: CPU: 0:00:00.1 REAL: 0:00:01.0 MEM: 2686.0MB
Summary Report:
Instances move: 587 (out of 587 movable)
Instances flipped: 0
Mean displacement: 0.45 um
Max displacement: 5.92 um (Instance: core_inst_uart_inst/g2192) (16.566, 54.5245) -> (13.11, 52.06)
        Length: 2 sites, height: 1 rows, site name: CoreSite, cell type: INVX1
Physical-only instances move: 0 (out of 0 movable physical-only)
Total net bbox length = 5.909e+03 (2.755e+03 3.154e+03) (ext = 1.793e+03)
Runtime: CPU: 0:00:00.1 REAL: 0:00:01.0 MEM: 2686.0MB
*** Finished refinePlace (0:00:29.4 mem=2686.0M) ***
*** End of Placement (cpu=0:00:03.6, real=0:00:05.0, mem=2686.0M) ***
**Info: (IMPSP-307): Design contains fractional 20 cells.
default core: bins with density > 0.750 = 22.22 % ( 2 / 9 )
Density distribution unevenness ratio = 14.579%
*** Free Virtual Timing Model ...(mem=2686.0M)
**INFO: Enable pre-place timing setting for timing analysis
Set Using Default Delay Limit as 101.
**WARN: (IMPDC-1629):   The default delay limit was set to 101. This is less than the default of 1000 and may result in inaccurate delay calculation for nets with a fanout higher than the setting.  If needed, the default delay limit may be adjusted by running the command 'set delaycal_use_default_delay_limit'.
Set Default Net Delay as 0 ps.
Set Default Net Load as 0 pF.
**INFO: Analyzing IO path groups for slack adjustment
Effort level <high> specified for reg2reg_tmp.95123 path_group
AAE_INFO: opIsDesignInPostRouteState() is 0
#################################################################################
# Design Stage: PreRoute
# Design Name: tt_um_Jsilicon
# Design Mode: 90nm
# Analysis Mode: MMMC Non-OCV
# Parasitics Mode: No SPEF/RCDB
# Signoff Settings: SI Off
#################################################################################
Calculate delays in Single mode...
Start delay calculation (fullDC) (1 T). (MEM=2200.82)
Total number of fetched objects 636
AAE_INFO: Total number of nets for which stage creation was skipped for all views 0
End delay calculation. (MEM=2207.91 CPU=0:00:00.1 REAL=0:00:00.0)
End delay calculation (fullDC). (MEM=2207.91 CPU=0:00:00.1 REAL=0:00:00.0)
**INFO: Disable pre-place timing setting for timing analysis
Set Using Default Delay Limit as 1000.
Set Default Net Delay as 1000 ps.
Set Default Net Load as 0.5 pF.
Info: Disable timing driven in postCTS congRepair.

Starting congRepair ...
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Max route layer is changed from 127 to 10 because there is no routing track above this layer
[NR-eGR] Read 620 nets ( ignored 0 )
[NR-eGR] There are 1 clock nets ( 0 with NDR ).
[NR-eGR] Layer group 1: route 620 net(s) in layer range [2, 10]
[NR-eGR] Early Global Route overflow of layer group 1: 0.00% H + 0.00% V. EstWL: 4.525040e+03um
[NR-eGR] Overflow after Early Global Route 0.00% H + 0.00% V
[NR-eGR] Finished Early Global Route kernel ( CPU: 0.03 sec, Real: 0.03 sec, Curr Mem: 2.58 MB )
Early Global Route congestion estimation runtime: 0.04 seconds, mem = 2666.1M
Local HotSpot Analysis: normalized max congestion hotspot area = 0.00, normalized total congestion hotspot area = 0.00 (area is in unit of 4 std-cell row bins)
Skipped repairing congestion.
[NR-eGR] Total eGR-routed clock nets wire length: 205um, number of vias: 124
[NR-eGR] --------------------------------------------------------------------------
[NR-eGR]                  Length (um)  Vias
[NR-eGR] -----------------------------------
[NR-eGR]  metal1   (1H)             0  1826
[NR-eGR]  metal2   (2V)          2025  2341
[NR-eGR]  metal3   (3H)          1980   346
[NR-eGR]  metal4   (4V)           636   304
[NR-eGR]  metal5   (5H)           416     0
[NR-eGR]  metal6   (6V)             0     0
[NR-eGR]  metal7   (7H)             0     0
[NR-eGR]  metal8   (8V)             0     0
[NR-eGR]  metal9   (9H)             0     0
[NR-eGR]  metal10  (10V)            0     0
[NR-eGR] -----------------------------------
[NR-eGR]           Total         5058  4817
[NR-eGR] --------------------------------------------------------------------------
[NR-eGR] Total half perimeter of net bounding box: 5909um
[NR-eGR] Total length: 5058um, number of vias: 4817
[NR-eGR] --------------------------------------------------------------------------
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Early Global Route wiring runtime: 0.03 seconds, mem = 2682.1M
Tdgp not enabled or already been cleared! skip clearing
End of congRepair (cpu=0:00:00.1, real=0:00:00.0)
*** Finishing placeDesign default flow ***
***** Total cpu  0:0:6
***** Total real time  0:0:7
**placeDesign ... cpu = 0: 0: 6, real = 0: 0: 7, mem = 2682.1M **
Tdgp not enabled or already been cleared! skip clearing
innovus 2>
*** Summary of all messages that are not suppressed in this session:
Severity  ID               Count  Summary
WARNING   IMPDC-1629           2  The default delay limit was set to %d. T...
WARNING   IMPSP-9025           1  No scan chain specified/traced.
*** Message Summary: 3 warning(s), 0 error(s)

*** placeDesign #1 [finish] () : cpu/real = 0:00:06.0/0:00:07.3 (0.8), totSession cpu/real = 0:00:30.1/0:00:30.9 (1.0), mem = 2682.1M
#% Begin save design ... (date=11/19 10:56:01, mem=2177.8M)
INFO: Current data have to be saved into a temporary db: 'jsilicon_placed.enc.dat.tmp' first. It will be renamed to the correct name 'jsilicon_placed.enc.dat' after the old db was deleted.
% Begin Save ccopt configuration ... (date=11/19 10:56:01, mem=2177.8M)
% End Save ccopt configuration ... (date=11/19 10:56:01, total cpu=0:00:00.0, real=0:00:00.0, peak res=2178.7M, current mem=2178.7M)
% Begin Save netlist data ... (date=11/19 10:56:01, mem=2178.7M)
Writing Binary DB to /home/student001/JSilicon2/work/pnr/jsilicon_placed.enc.dat.tmp/tt_um_Jsilicon.v.bin in single-threaded mode...
% End Save netlist data ... (date=11/19 10:56:02, total cpu=0:00:00.0, real=0:00:00.0, peak res=2178.8M, current mem=2178.8M)
Saving symbol-table file ...
Saving congestion map file /home/student001/JSilicon2/work/pnr/jsilicon_placed.enc.dat.tmp/tt_um_Jsilicon.route.congmap.gz ...
% Begin Save AAE data ... (date=11/19 10:56:02, mem=2178.9M)
Saving AAE Data ...
% End Save AAE data ... (date=11/19 10:56:02, total cpu=0:00:00.6, real=0:00:00.0, peak res=2364.2M, current mem=2180.2M)
Saving preference file /home/student001/JSilicon2/work/pnr/jsilicon_placed.enc.dat.tmp/gui.pref.tcl ...
Saving mode setting ...
**WARN: (IMPMF-5054):   fill_setting_save command is obsolete and should not be used any more. It still works in this release but will be removed in future release. Recommend to use Pegasus metal fill flow which is the replacement.
Saving global file ...
% Begin Save floorplan data ... (date=11/19 10:56:02, mem=2183.0M)
Saving floorplan file ...
% End Save floorplan data ... (date=11/19 10:56:02, total cpu=0:00:00.0, real=0:00:00.0, peak res=2183.0M, current mem=2183.0M)
Saving PG file /home/student001/JSilicon2/work/pnr/jsilicon_placed.enc.dat.tmp/tt_um_Jsilicon.pg.gz, version#2, (Created by Innovus v23.13-s082_1 on Wed Nov 19 10:56:02 2025)
*** Completed savePGFile (cpu=0:00:00.0 real=0:00:00.0 mem=2684.7M) ***
*info - save blackBox cells to lef file /home/student001/JSilicon2/work/pnr/jsilicon_placed.enc.dat.tmp/tt_um_Jsilicon.bbox.lef
Saving Drc markers ...
... 44 markers are saved ...
... 0 geometry drc markers are saved ...
... 0 antenna drc markers are saved ...
% Begin Save placement data ... (date=11/19 10:56:02, mem=2183.1M)
** Saving stdCellPlacement_binary (version# 2) ...
Save Adaptive View Pruning View Names to Binary file
% End Save placement data ... (date=11/19 10:56:02, total cpu=0:00:00.0, real=0:00:00.0, peak res=2183.1M, current mem=2183.1M)
% Begin Save routing data ... (date=11/19 10:56:02, mem=2183.1M)
Saving route file ...
*** Completed saveRoute (cpu=0:00:00.0 real=0:00:01.0 mem=2684.7M) ***
% End Save routing data ... (date=11/19 10:56:03, total cpu=0:00:00.1, real=0:00:01.0, peak res=2183.2M, current mem=2183.2M)
Saving property file /home/student001/JSilicon2/work/pnr/jsilicon_placed.enc.dat.tmp/tt_um_Jsilicon.prop
*** Completed saveProperty (cpu=0:00:00.0 real=0:00:00.0 mem=2687.7M) ***
% Begin Save power constraints data ... (date=11/19 10:56:03, mem=2183.8M)
% End Save power constraints data ... (date=11/19 10:56:03, total cpu=0:00:00.0, real=0:00:00.0, peak res=2183.9M, current mem=2183.9M)
Generated self-contained design jsilicon_placed.enc.dat.tmp
#% End save design ... (date=11/19 10:56:03, total cpu=0:00:01.6, real=0:00:02.0, peak res=2364.2M, current mem=2186.5M)

*** Summary of all messages that are not suppressed in this session:
Severity  ID               Count  Summary
WARNING   IMPMF-5054           1  fill_setting_save command is obsolete an...
*** Message Summary: 1 warning(s), 0 error(s)

Pre-CTS Optimization...
Executing: place_opt_design -opt
#% Begin place_opt_design (date=11/19 10:56:03, mem=2186.6M)
**INFO: User settings:
setExtractRCMode -engine                preRoute
setDelayCalMode -engine                 aae
setDelayCalMode -ignoreNetLoad          false
setPlaceMode -place_global_cong_effort  high
setPlaceMode -timingDriven              true
setAnalysisMode -analysisType           single
setAnalysisMode -clkSrcPath             true
setAnalysisMode -clockPropagation       sdcControl
setAnalysisMode -virtualIPO             false

*** place_opt_design #1 [begin] () : totSession cpu/real = 0:00:31.8/0:00:32.7 (1.0), mem = 2722.0M
No user sequential activity specified, applying default sequential activity of "0.2" for Dynamic Power reporting.
'set_default_switching_activity' finished successfully.
*** Starting GigaPlace ***
-earlyGlobalBlockTracks {}                # string, default="", private
-earlyGlobalCapacityScreen {}             # string, default="", private
There is no track adjustment
Starting place_opt_design V2 flow
#optDebug: fT-E <X 2 3 1 0>
**Info: (IMPSP-307): Design contains fractional 20 cells.
*** GlobalPlace #1 [begin] (place_opt_design #1) : totSession cpu/real = 0:00:31.9/0:00:32.7 (1.0), mem = 2722.0M
*** GlobalPlace #1 [finish] (place_opt_design #1) : cpu/real = 0:00:00.0/0:00:00.0 (0.0), totSession cpu/real = 0:00:31.9/0:00:32.7 (1.0), mem = 2722.0M
Enable CTE adjustment.
Enable Layer aware incrSKP.
**optDesign ... cpu = 0:00:00, real = 0:00:00, mem = 2187.8M, totSessionCpu=0:00:32 **
**WARN: (IMPOPT-576):   24 nets have unplaced terms.
GigaOpt running with 1 threads.
*** InitOpt #1 [begin] (place_opt_design #1) : totSession cpu/real = 0:00:31.9/0:00:32.7 (1.0), mem = 2722.0M
**INFO: setDesignMode -flowEffort standard -> setting 'setOptMode -allEndPoints true' for the duration of this command.
**Info: (IMPSP-307): Design contains fractional 20 cells.
Updating RC Grid density data for preRoute extraction ...
Initializing multi-corner resistance tables ...
**WARN: (IMPOPT-665):   clk : Net has unplaced terms or is connected to uplaced instances in design.
Type 'man IMPOPT-665' for more detail.
**WARN: (IMPOPT-665):   rst_n : Net has unplaced terms or is connected to uplaced instances in design.
Type 'man IMPOPT-665' for more detail.
**WARN: (IMPOPT-665):   ui_in[7] : Net has unplaced terms or is connected to uplaced instances in design.
Type 'man IMPOPT-665' for more detail.
**WARN: (IMPOPT-665):   ui_in[6] : Net has unplaced terms or is connected to uplaced instances in design.
Type 'man IMPOPT-665' for more detail.
**WARN: (IMPOPT-665):   ui_in[5] : Net has unplaced terms or is connected to uplaced instances in design.
Type 'man IMPOPT-665' for more detail.
**WARN: (IMPOPT-665):   ui_in[4] : Net has unplaced terms or is connected to uplaced instances in design.
Type 'man IMPOPT-665' for more detail.
**WARN: (IMPOPT-665):   ui_in[3] : Net has unplaced terms or is connected to uplaced instances in design.
Type 'man IMPOPT-665' for more detail.
**WARN: (IMPOPT-665):   ui_in[2] : Net has unplaced terms or is connected to uplaced instances in design.
Type 'man IMPOPT-665' for more detail.
**WARN: (IMPOPT-665):   ui_in[1] : Net has unplaced terms or is connected to uplaced instances in design.
Type 'man IMPOPT-665' for more detail.
**WARN: (IMPOPT-665):   ui_in[0] : Net has unplaced terms or is connected to uplaced instances in design.
Type 'man IMPOPT-665' for more detail.
**WARN: (IMPOPT-665):   uio_in[7] : Net has unplaced terms or is connected to uplaced instances in design.
Type 'man IMPOPT-665' for more detail.
**WARN: (IMPOPT-665):   uio_in[6] : Net has unplaced terms or is connected to uplaced instances in design.
Type 'man IMPOPT-665' for more detail.
**WARN: (IMPOPT-665):   uio_in[5] : Net has unplaced terms or is connected to uplaced instances in design.
Type 'man IMPOPT-665' for more detail.
**WARN: (IMPOPT-665):   uio_in[4] : Net has unplaced terms or is connected to uplaced instances in design.
Type 'man IMPOPT-665' for more detail.
**WARN: (IMPOPT-665):   ena : Net has unplaced terms or is connected to uplaced instances in design.
Type 'man IMPOPT-665' for more detail.
**WARN: (IMPOPT-665):   uo_out[7] : Net has unplaced terms or is connected to uplaced instances in design.
Type 'man IMPOPT-665' for more detail.
**WARN: (IMPOPT-665):   uo_out[6] : Net has unplaced terms or is connected to uplaced instances in design.
Type 'man IMPOPT-665' for more detail.
**WARN: (IMPOPT-665):   uo_out[5] : Net has unplaced terms or is connected to uplaced instances in design.
Type 'man IMPOPT-665' for more detail.
**WARN: (IMPOPT-665):   uo_out[4] : Net has unplaced terms or is connected to uplaced instances in design.
Type 'man IMPOPT-665' for more detail.
**WARN: (IMPOPT-665):   uo_out[3] : Net has unplaced terms or is connected to uplaced instances in design.
Type 'man IMPOPT-665' for more detail.
**WARN: (EMS-27):       Message (IMPOPT-665) has exceeded the current message display limit of 20.
To increase the message display limit, refer to the product command reference manual.
AAE DB initialization (MEM=2193.816406 CPU=0:00:00.0 REAL=0:00:00.0)
Info: Using SynthesisEngine executable '/tools/cadence/DDI231/INNOVUS231/bin/innovus_'.
      SynthesisEngine workers will not check out additional licenses.
**INFO: Using Advanced Metric Collection system.
**optDesign ... cpu = 0:00:01, real = 0:00:19, mem = 2194.8M, totSessionCpu=0:00:33 **
#optDebug: { P: 90 W: 3201 FE: standard PE: none LDR: 1}
*** optDesign -preCTS ***
DRC Margin: user margin 0.0; extra margin 0.2
Setup Target Slack: user slack 0; extra slack 0.0
Hold Target Slack: user slack 0
**WARN: (IMPOPT-3195):  Analysis mode has changed.
Type 'man IMPOPT-3195' for more detail.
Multi-VT timing optimization disabled based on library information.
        CornerforLayerOpt timing analysis view VIEW_TYPICAL has been selected for calibration
        CornerforLayerOpt timing analysis view VIEW_TYPICAL has been selected for calibration
        CornerforLayerOpt timing analysis view VIEW_TYPICAL has been selected for calibration
        CornerforLayerOpt timing analysis view VIEW_TYPICAL has been selected for calibration
        CornerforLayerOpt timing analysis view VIEW_TYPICAL has been selected for calibration
        CornerforLayerOpt timing analysis view VIEW_TYPICAL has been selected for calibration
[NR-eGR] Started Early Global Route ( Curr Mem: 2.72 MB )
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Max route layer is changed from 127 to 10 because there is no routing track above this layer
[NR-eGR] Started Early Global Route kernel ( Curr Mem: 2.72 MB )
[NR-eGR] Read 620 nets ( ignored 0 )
[NR-eGR] There are 1 clock nets ( 0 with NDR ).
[NR-eGR] Layer group 1: route 620 net(s) in layer range [2, 10]
[NR-eGR] Early Global Route overflow of layer group 1: 0.00% H + 0.00% V. EstWL: 4.552210e+03um
[NR-eGR] Overflow after Early Global Route 0.00% H + 0.00% V
[NR-eGR] Total eGR-routed clock nets wire length: 210um, number of vias: 130
[NR-eGR] --------------------------------------------------------------------------
[NR-eGR]                  Length (um)  Vias
[NR-eGR] -----------------------------------
[NR-eGR]  metal1   (1H)             0  1826
[NR-eGR]  metal2   (2V)          2076  2356
[NR-eGR]  metal3   (3H)          1983   349
[NR-eGR]  metal4   (4V)           629   313
[NR-eGR]  metal5   (5H)           421     0
[NR-eGR]  metal6   (6V)             0     0
[NR-eGR]  metal7   (7H)             0     0
[NR-eGR]  metal8   (8V)             0     0
[NR-eGR]  metal9   (9H)             0     0
[NR-eGR]  metal10  (10V)            0     0
[NR-eGR] -----------------------------------
[NR-eGR]           Total         5108  4844
[NR-eGR] --------------------------------------------------------------------------
[NR-eGR] Total half perimeter of net bounding box: 5909um
[NR-eGR] Total length: 5108um, number of vias: 4844
[NR-eGR] --------------------------------------------------------------------------
[NR-eGR] Finished Early Global Route kernel ( CPU: 0.06 sec, Real: 0.06 sec, Curr Mem: 2.72 MB )
[NR-eGR] Finished Early Global Route ( CPU: 0.07 sec, Real: 0.07 sec, Curr Mem: 2.72 MB )
Extraction called for design 'tt_um_Jsilicon' of instances=587 and nets=704 using extraction engine 'preRoute' .
**WARN: (IMPEXT-3530):  The process node is not set. Use the command setDesignMode -process <process node> prior to extraction for maximum accuracy and optimal automatic threshold setting.
Type 'man IMPEXT-3530' for more detail.
PreRoute RC Extraction called for design tt_um_Jsilicon.
RC Extraction called in multi-corner(1) mode.
**WARN: (IMPEXT-6197):  The Cap table file is not specified. This will result in lower parasitic accuracy when using preRoute extraction or postRoute extraction with effort level 'low'. It is recommended to generate the Cap table file using the 'generateCapTbl' command and specify it before extraction using 'create_rc_corner/update_rc_corner -cap_table'.
Type 'man IMPEXT-6197' for more detail.
RCMode: PreRoute
      RC Corner Indexes            0
Capacitance Scaling Factor   : 1.00000
Resistance Scaling Factor    : 1.00000
Clock Cap. Scaling Factor    : 1.00000
Clock Res. Scaling Factor    : 1.00000
Shrink Factor                : 1.00000
PreRoute extraction is honoring NDR/Shielding/ExtraSpace for clock nets.
Updating RC Grid density data for preRoute extraction ...
Initializing multi-corner resistance tables ...
PreRoute RC Extraction DONE (CPU Time: 0:00:00.0  Real Time: 0:00:00.0  MEM: 2802.664M)
Starting delay calculation for Setup views
AAE_INFO: opIsDesignInPostRouteState() is 0
#################################################################################
# Design Stage: PreRoute
# Design Name: tt_um_Jsilicon
# Design Mode: 90nm
# Analysis Mode: MMMC Non-OCV
# Parasitics Mode: No SPEF/RCDB
# Signoff Settings: SI Off
#################################################################################
Calculate delays in Single mode...
Start delay calculation (fullDC) (1 T). (MEM=2325.2)
siFlow : Timing analysis mode is single, using late cdB files
**WARN: (IMPEXT-2882):  Unable to find the resistance for via 'M2_M1_via' in Cap table or LEF or OA files. The default value of 4.0 ohms is being assigned. To avoid this, check the Cap table and LEF and OA files, provide the resistance and read the files again.
**WARN: (IMPEXT-2882):  Unable to find the resistance for via 'M3_M2_via' in Cap table or LEF or OA files. The default value of 4.0 ohms is being assigned. To avoid this, check the Cap table and LEF and OA files, provide the resistance and read the files again.
**WARN: (IMPEXT-2882):  Unable to find the resistance for via 'M4_M3_via' in Cap table or LEF or OA files. The default value of 4.0 ohms is being assigned. To avoid this, check the Cap table and LEF and OA files, provide the resistance and read the files again.
**WARN: (IMPEXT-2882):  Unable to find the resistance for via 'M5_M4_via' in Cap table or LEF or OA files. The default value of 4.0 ohms is being assigned. To avoid this, check the Cap table and LEF and OA files, provide the resistance and read the files again.
Total number of fetched objects 636
AAE_INFO: Total number of nets for which stage creation was skipped for all views 0
End delay calculation. (MEM=2329.35 CPU=0:00:00.1 REAL=0:00:01.0)
End delay calculation (fullDC). (MEM=2328.46 CPU=0:00:00.3 REAL=0:00:01.0)
*** Done Building Timing Graph (cpu=0:00:00.6 real=0:00:01.0 totSessionCpu=0:00:34.4 mem=2891.3M)

------------------------------------------------------------------
             Initial Summary
------------------------------------------------------------------

Setup views included:
 VIEW_TYPICAL

+--------------------+---------+
|     Setup mode     |   all   |
+--------------------+---------+
|           WNS (ns):|  0.003  |
|           TNS (ns):|  0.000  |
|    Violating Paths:|    0    |
|          All Paths:|   85    |
+--------------------+---------+

+----------------+-------------------------------+------------------+
|                |              Real             |       Total      |
|    DRVs        +------------------+------------+------------------|
|                |  Nr nets(terms)  | Worst Vio  |  Nr nets(terms)  |
+----------------+------------------+------------+------------------+
|   max_cap      |     76 (76)      |   -0.058   |     76 (76)      |
|   max_tran     |      0 (0)       |   0.000    |      0 (0)       |
|   max_fanout   |      0 (0)       |     0      |      0 (0)       |
|   max_length   |      0 (0)       |     0      |      0 (0)       |
+----------------+------------------+------------+------------------+

Density: 64.550%
------------------------------------------------------------------
**optDesign ... cpu = 0:00:03, real = 0:00:20, mem = 2328.4M, totSessionCpu=0:00:34 **
*** InitOpt #1 [finish] (place_opt_design #1) : cpu/real = 0:00:02.7/0:00:19.8 (0.1), totSession cpu/real = 0:00:34.6/0:00:52.5 (0.7), mem = 2845.4M
** INFO : this run is activating medium effort placeOptDesign flow
**Info: (IMPSP-307): Design contains fractional 20 cells.
**Info: (IMPSP-307): Design contains fractional 20 cells.
*** ExcludedClockNetOpt #1 [begin] (place_opt_design #1) : totSession cpu/real = 0:00:34.6/0:00:52.6 (0.7), mem = 2845.4M
*** Starting optimizing excluded clock nets MEM= 2845.4M) ***
*info: No excluded clock nets to be optimized.
*** Finished optimizing excluded clock nets (CPU Time= 0:00:00.0  MEM= 2845.4M) ***
*** ExcludedClockNetOpt #1 [finish] (place_opt_design #1) : cpu/real = 0:00:00.0/0:00:00.0 (0.0), totSession cpu/real = 0:00:34.6/0:00:52.6 (0.7), mem = 2845.4M
The useful skew maximum allowed delay is: 0.3
*** SimplifyNetlist #1 [begin] (place_opt_design #1) : totSession cpu/real = 0:00:34.7/0:00:52.7 (0.7), mem = 2847.4M
Info: 1 clock net  excluded from IPO operation.
**Info: (IMPSP-307): Design contains fractional 20 cells.

Footprint cell information for calculating maxBufDist
*info: There are 2 candidate Buffer cells
*info: There are 4 candidate Inverter cells

        CornerforLayerOpt timing analysis view VIEW_TYPICAL has been selected for calibration
        CornerforLayerOpt timing analysis view VIEW_TYPICAL has been selected for calibration

Netlist preparation processing...
Removed 0 instance
*info: Marking 0 isolation instances dont touch
*info: Marking 0 level shifter instances dont touch
*** SimplifyNetlist #1 [finish] (place_opt_design #1) : cpu/real = 0:00:00.5/0:00:00.5 (1.0), totSession cpu/real = 0:00:35.2/0:00:53.2 (0.7), mem = 2987.5M
Running new flow changes for HFN
Begin: GigaOpt high fanout net optimization
GigaOpt HFN: use maxLocalDensity 1.2
GigaOpt Checkpoint: Internal optDRV -useLevelizedBufferTreeOnly -auxMaxFanoutCountLimit 500 -largeScaleFixing -maxIter 1 -maxLocalDensity 1.2 -numThreads 1 -preCTS -preRouteDontEndWithRefinePlaceIncrSteinerRouteDC
*** DrvOpt #1 [begin] (place_opt_design #1) : totSession cpu/real = 0:00:35.3/0:00:53.3 (0.7), mem = 2866.5M
Info: 1 clock net  excluded from IPO operation.
**Info: (IMPSP-307): Design contains fractional 20 cells.
        CornerforLayerOpt timing analysis view VIEW_TYPICAL has been selected for calibration
        CornerforLayerOpt timing analysis view VIEW_TYPICAL has been selected for calibration
        CornerforLayerOpt timing analysis view VIEW_TYPICAL has been selected for calibration
        CornerforLayerOpt timing analysis view VIEW_TYPICAL has been selected for calibration
*** DrvOpt #1 [finish] (place_opt_design #1) : cpu/real = 0:00:00.1/0:00:00.1 (1.0), totSession cpu/real = 0:00:35.4/0:00:53.4 (0.7), mem = 2924.6M
GigaOpt HFN: restore maxLocalDensity to 0.98
End: GigaOpt high fanout net optimization
Begin: GigaOpt DRV Optimization
[GPS-DRV] number of DCLS groups: 0; maxIter: 2
GigaOpt Checkpoint: Internal optDRV -max_tran -max_cap -maxLocalDensity 1.2 -numThreads 1 -largeScaleFixing -maxIter 2 -preCTS -preRouteDontEndWithRefinePlaceIncrSteinerRouteDC
*** DrvOpt #2 [begin] (place_opt_design #1) : totSession cpu/real = 0:00:35.5/0:00:53.5 (0.7), mem = 2866.6M
Info: 1 clock net  excluded from IPO operation.
**Info: (IMPSP-307): Design contains fractional 20 cells.
        CornerforLayerOpt timing analysis view VIEW_TYPICAL has been selected for calibration
        CornerforLayerOpt timing analysis view VIEW_TYPICAL has been selected for calibration
        CornerforLayerOpt timing analysis view VIEW_TYPICAL has been selected for calibration
        CornerforLayerOpt timing analysis view VIEW_TYPICAL has been selected for calibration
+-------------------------------------------------------------------------------------------------------------------------------------------------------+
|        max-tran       |        max-cap        |  max-fanout |  max-length |       setup       |        |        |        |       |          |         |
+-------------------------------------------------------------------------------------------------------------------------------------------------------+
| nets | terms|  wViol  | nets | terms|  wViol  | nets | terms| nets | terms|   WNS   |   TNS   |  #Buf  |  #Inv  | #Resize|Density|   Real   |   Mem   |
+-------------------------------------------------------------------------------------------------------------------------------------------------------+
|     0|     0|     0.00|     0|     0|     0.00|     0|     0|     0|     0|     0.00|     0.00|       0|       0|       0| 64.55%|          |         |
|     0|     0|     0.00|     0|     0|     0.00|     0|     0|     0|     0|     0.00|     0.00|       0|       0|       0| 64.55%| 0:00:00.0|  2924.8M|
+-------------------------------------------------------------------------------------------------------------------------------------------------------+
Bottom Preferred Layer:
    None
Via Pillar Rule:
    None

*** Finish DRV Fixing (cpu=0:00:00.0 real=0:00:00.0 mem=2924.8M) ***

*** DrvOpt #2 [finish] (place_opt_design #1) : cpu/real = 0:00:00.3/0:00:00.2 (1.0), totSession cpu/real = 0:00:35.7/0:00:53.8 (0.7), mem = 2924.8M
End: GigaOpt DRV Optimization
GigaOpt DRV: restore maxLocalDensity to 0.98
**optDesign ... cpu = 0:00:04, real = 0:00:21, mem = 2337.1M, totSessionCpu=0:00:36 **

Active setup views:
 VIEW_TYPICAL
  Dominating endpoints: 0
  Dominating TNS: -0.000

Begin: GigaOpt Global Optimization
*info: use new DP (enabled)
GigaOpt Checkpoint: Internal globalOpt -maxLocalDensity 1.2 -numThreads 1 -preCTS -rebufferAll -preRouteDontEndWithRefinePlaceIncrSteinerRouteDC -enableHighLayerOpt -maxIter 50 -maxIterForLEPG 50
Info: 1 clock net  excluded from IPO operation.
*** GlobalOpt #1 [begin] (place_opt_design #1) : totSession cpu/real = 0:00:35.9/0:00:53.9 (0.7), mem = 2924.9M
**Info: (IMPSP-307): Design contains fractional 20 cells.
*info: 1 clock net excluded
*info: 47 no-driver nets excluded.
** GigaOpt Global Opt WNS Slack 0.000  TNS Slack 0.000
+--------+--------+---------+------------+--------+------------+---------+-------------------------------------------+
|  WNS   |  TNS   | Density |    Real    |  Mem   | Worst View |Pathgroup|                 End Point                 |
+--------+--------+---------+------------+--------+------------+---------+-------------------------------------------+
|   0.000|   0.000|   64.55%|   0:00:00.0| 2954.0M|VIEW_TYPICAL|       NA| NA                                        |
+--------+--------+---------+------------+--------+------------+---------+-------------------------------------------+

*** Finish pre-CTS Global Setup Fixing (cpu=0:00:00.0 real=0:00:00.0 mem=2954.0M) ***

*** Finish pre-CTS Setup Fixing (cpu=0:00:00.0 real=0:00:00.0 mem=2954.0M) ***
Bottom Preferred Layer:
    None
Via Pillar Rule:
    None
** GigaOpt Global Opt End WNS Slack 0.000  TNS Slack 0.000
*** GlobalOpt #1 [finish] (place_opt_design #1) : cpu/real = 0:00:00.2/0:00:00.2 (1.0), totSession cpu/real = 0:00:36.1/0:00:54.1 (0.7), mem = 2954.0M
End: GigaOpt Global Optimization
*** Timing Is met
*** Check timing (0:00:00.0)
GigaOpt Checkpoint: Internal reclaim -numThreads 1 -preCTS -force -doRemoveUselessTerm -tgtSlackMult 3 -routeType -noRouteTypeResizePolish -noViewPrune -weedwhack -nonLegal -nativePathGroupFlow -SimpCCIn -GCompAndPhase
Info: 1 clock net  excluded from IPO operation.
**Info: (IMPSP-307): Design contains fractional 20 cells.
Begin: Area Reclaim Optimization
*** AreaOpt #1 [begin] (place_opt_design #1) : totSession cpu/real = 0:00:36.2/0:00:54.2 (0.7), mem = 2935.2M
Reclaim Optimization WNS Slack 0.000  TNS Slack 0.000 Density 64.55
+---------+---------+--------+--------+------------+--------+
| Density | Commits |  WNS   |  TNS   |    Real    |  Mem   |
+---------+---------+--------+--------+------------+--------+
|   64.55%|        -|   0.000|   0.000|   0:00:00.0| 2937.2M|
|   64.47%|        5|   0.000|   0.000|   0:00:00.0| 2977.3M|
|   64.47%|        0|   0.000|   0.000|   0:00:00.0| 2977.3M|
|   64.47%|        0|   0.000|   0.000|   0:00:00.0| 2977.3M|
|   64.45%|        1|   0.000|   0.000|   0:00:00.0| 2977.3M|
|   64.45%|        0|   0.000|   0.000|   0:00:00.0| 2977.3M|
|   64.45%|        0|   0.000|   0.000|   0:00:00.0| 2977.3M|
+---------+---------+--------+--------+------------+--------+
Reclaim Optimization End WNS Slack 0.000  TNS Slack 0.000 Density 64.45
Bottom Preferred Layer:
    None
Via Pillar Rule:
    None

Number of times islegalLocAvaiable called = 0 skipped = 0, called in commitmove = 0, skipped in commitmove = 0
End: Core Area Reclaim Optimization (cpu = 0:00:00.8) (real = 0:00:00.0) **
*** AreaOpt #1 [finish] (place_opt_design #1) : cpu/real = 0:00:00.8/0:00:00.8 (1.0), totSession cpu/real = 0:00:37.0/0:00:55.0 (0.7), mem = 2977.3M
Executing incremental physical updates
Executing incremental physical updates
End: Area Reclaim Optimization (cpu=0:00:01, real=0:00:00, mem=2894.28M, totSessionCpu=0:00:37).
*** IncrReplace #1 [begin] (place_opt_design #1) : totSession cpu/real = 0:00:37.1/0:00:55.1 (0.7), mem = 2894.3M

*** Start incrementalPlace ***
No Views given, use default active views for adaptive view pruning
Active views:
  VIEW_TYPICAL
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Max route layer is changed from 127 to 10 because there is no routing track above this layer
[NR-eGR] Started Early Global Route kernel ( Curr Mem: 2.81 MB )
[NR-eGR] Read 620 nets ( ignored 0 )
[NR-eGR] There are 1 clock nets ( 0 with NDR ).
[NR-eGR] Layer group 1: route 620 net(s) in layer range [2, 10]
[NR-eGR] Early Global Route overflow of layer group 1: 0.00% H + 0.00% V. EstWL: 4.522570e+03um
[NR-eGR] Overflow after Early Global Route 0.00% H + 0.00% V
[NR-eGR] Finished Early Global Route kernel ( CPU: 0.02 sec, Real: 0.03 sec, Curr Mem: 2.81 MB )
Early Global Route congestion estimation runtime: 0.03 seconds, mem = 2896.3M
Local HotSpot Analysis: normalized max congestion hotspot area = 0.00, normalized total congestion hotspot area = 0.00 (area is in unit of 4 std-cell row bins)

=== incrementalPlace Internal Loop 1 ===
      flow.cputime  flow.realtime  timing.setup.tns  timing.setup.wns  snapshot
UM:*                                                                   incrNP_iter_start
**Info: (IMPSP-307): Design contains fractional 20 cells.
[spp] 0
*** Finished SKP initialization (cpu=0:00:00.1, real=0:00:00.0)***
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Max route layer is changed from 127 to 10 because there is no routing track above this layer
[NR-eGR] Started Early Global Route kernel ( Curr Mem: 2.82 MB )
SKP will use view:
  VIEW_TYPICAL
Iteration  4: Total net bbox = 2.550e+03 (1.10e+03 1.45e+03)
              Est.  stn bbox = 2.985e+03 (1.24e+03 1.74e+03)
              cpu = 0:00:00.3 real = 0:00:00.0 mem = 2931.7M
Iteration  5: Total net bbox = 3.231e+03 (1.47e+03 1.76e+03)
              Est.  stn bbox = 3.797e+03 (1.68e+03 2.12e+03)
              cpu = 0:00:00.8 real = 0:00:01.0 mem = 2915.7M
Iteration  6: Total net bbox = 3.427e+03 (1.57e+03 1.85e+03)
              Est.  stn bbox = 4.023e+03 (1.81e+03 2.22e+03)
              cpu = 0:00:01.1 real = 0:00:01.0 mem = 2915.7M
Iteration  7: Total net bbox = 3.915e+03 (1.77e+03 2.14e+03)
              Est.  stn bbox = 4.521e+03 (2.00e+03 2.52e+03)
              cpu = 0:00:01.8 real = 0:00:02.0 mem = 2915.7M
Iteration  8: Total net bbox = 3.589e+03 (1.75e+03 1.84e+03)
              Est.  stn bbox = 4.145e+03 (1.96e+03 2.18e+03)
              cpu = 0:00:00.5 real = 0:00:00.0 mem = 2931.7M
Move report: Timing Driven Placement moves 587 insts, mean move: 3.34 um, max move: 15.16 um
        Max move on inst (core_inst_uart_inst/tx_reg): (16.91, 57.00) --> (22.19, 47.12)

Finished Incremental Placement (cpu=0:00:04.7, real=0:00:04.0, mem=2915.7M)
Begin: Reorder Scan Chains
**WARN: (IMPSP-9025):   No scan chain specified/traced.
Type 'man IMPSP-9025' for more detail.
End: Reorder Scan Chains
**Info: (IMPSP-307): Design contains fractional 20 cells.
*** Starting refinePlace (0:00:41.9 mem=2915.7M) ***
Total net bbox length = 5.560e+03 (2.635e+03 2.925e+03) (ext = 1.754e+03)
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Move report: Detail placement moves 587 insts, mean move: 0.66 um, max move: 5.05 um
        Max move on inst (core_inst_uart_inst/g2199__1705): (27.27, 42.16) --> (22.23, 42.18)
        Runtime: CPU: 0:00:00.1 REAL: 0:00:00.0 MEM: 2886.8MB
Summary Report:
Instances move: 587 (out of 587 movable)
Instances flipped: 0
Mean displacement: 0.66 um
Max displacement: 5.05 um (Instance: core_inst_uart_inst/g2199__1705) (27.269, 42.165) -> (22.23, 42.18)
        Length: 4 sites, height: 1 rows, site name: CoreSite, cell type: MUX2X1
Physical-only instances move: 0 (out of 0 movable physical-only)
Total net bbox length = 5.851e+03 (2.832e+03 3.019e+03) (ext = 1.751e+03)
Runtime: CPU: 0:00:00.1 REAL: 0:00:00.0 MEM: 2886.8MB
*** Finished refinePlace (0:00:42.0 mem=2886.8M) ***
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Max route layer is changed from 127 to 10 because there is no routing track above this layer
[NR-eGR] Read 620 nets ( ignored 0 )
[NR-eGR] There are 1 clock nets ( 0 with NDR ).
[NR-eGR] Layer group 1: route 620 net(s) in layer range [2, 10]
[NR-eGR] Early Global Route overflow of layer group 1: 0.00% H + 0.00% V. EstWL: 4.431180e+03um
[NR-eGR] Overflow after Early Global Route 0.00% H + 0.00% V
[NR-eGR] Finished Early Global Route kernel ( CPU: 0.03 sec, Real: 0.03 sec, Curr Mem: 2.80 MB )
Early Global Route congestion estimation runtime: 0.03 seconds, mem = 2883.8M
Local HotSpot Analysis: normalized max congestion hotspot area = 0.00, normalized total congestion hotspot area = 0.00 (area is in unit of 4 std-cell row bins)
[NR-eGR] Total eGR-routed clock nets wire length: 174um, number of vias: 138
[NR-eGR] --------------------------------------------------------------------------
[NR-eGR]                  Length (um)  Vias
[NR-eGR] -----------------------------------
[NR-eGR]  metal1   (1H)             0  1826
[NR-eGR]  metal2   (2V)          1930  2384
[NR-eGR]  metal3   (3H)          1928   395
[NR-eGR]  metal4   (4V)           683   328
[NR-eGR]  metal5   (5H)           512     0
[NR-eGR]  metal6   (6V)             0     0
[NR-eGR]  metal7   (7H)             0     0
[NR-eGR]  metal8   (8V)             0     0
[NR-eGR]  metal9   (9H)             0     0
[NR-eGR]  metal10  (10V)            0     0
[NR-eGR] -----------------------------------
[NR-eGR]           Total         5054  4933
[NR-eGR] --------------------------------------------------------------------------
[NR-eGR] Total half perimeter of net bounding box: 5851um
[NR-eGR] Total length: 5054um, number of vias: 4933
[NR-eGR] --------------------------------------------------------------------------
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Early Global Route wiring runtime: 0.10 seconds, mem = 2870.2M
[hotspot] +------------+---------------+---------------+
[hotspot] |            |   max hotspot | total hotspot |
[hotspot] +------------+---------------+---------------+
[hotspot] | normalized |          0.00 |          0.00 |
[hotspot] +------------+---------------+---------------+
Local HotSpot Analysis: normalized max congestion hotspot area = 0.00, normalized total congestion hotspot area = 0.00 (area is in unit of 4 std-cell row bins)
[hotspot] Hotspot report including placement blocked areas
[hotspot] +------------+---------------+---------------+
[hotspot] |            |   max hotspot | total hotspot |
[hotspot] +------------+---------------+---------------+
[hotspot] | normalized |          0.00 |          0.00 |
[hotspot] +------------+---------------+---------------+
Local HotSpot Analysis (blockage included): normalized max congestion hotspot area = 0.00, normalized total congestion hotspot area = 0.00 (area is in unit of 4 std-cell row bins)
0 delay mode for cte disabled.

*** Finished incrementalPlace (cpu=0:00:05.0, real=0:00:05.0)***
Start to check current routing status for nets...
All nets are already routed correctly.
End to check current routing status for nets (mem=2870.2M)
Extraction called for design 'tt_um_Jsilicon' of instances=587 and nets=704 using extraction engine 'preRoute' .
**WARN: (IMPEXT-3530):  The process node is not set. Use the command setDesignMode -process <process node> prior to extraction for maximum accuracy and optimal automatic threshold setting.
Type 'man IMPEXT-3530' for more detail.
PreRoute RC Extraction called for design tt_um_Jsilicon.
RC Extraction called in multi-corner(1) mode.
**WARN: (IMPEXT-6197):  The Cap table file is not specified. This will result in lower parasitic accuracy when using preRoute extraction or postRoute extraction with effort level 'low'. It is recommended to generate the Cap table file using the 'generateCapTbl' command and specify it before extraction using 'create_rc_corner/update_rc_corner -cap_table'.
Type 'man IMPEXT-6197' for more detail.
RCMode: PreRoute
      RC Corner Indexes            0
Capacitance Scaling Factor   : 1.00000
Resistance Scaling Factor    : 1.00000
Clock Cap. Scaling Factor    : 1.00000
Clock Res. Scaling Factor    : 1.00000
Shrink Factor                : 1.00000
PreRoute extraction is honoring NDR/Shielding/ExtraSpace for clock nets.
Updating RC Grid density data for preRoute extraction ...
Initializing multi-corner resistance tables ...
PreRoute RC Extraction DONE (CPU Time: 0:00:00.0  Real Time: 0:00:00.0  MEM: 2870.246M)
**optDesign ... cpu = 0:00:10, real = 0:00:28, mem = 2337.7M, totSessionCpu=0:00:42 **
Starting delay calculation for Setup views
AAE_INFO: opIsDesignInPostRouteState() is 0
#################################################################################
# Design Stage: PreRoute
# Design Name: tt_um_Jsilicon
# Design Mode: 90nm
# Analysis Mode: MMMC Non-OCV
# Parasitics Mode: No SPEF/RCDB
# Signoff Settings: SI Off
#################################################################################
Calculate delays in Single mode...
Start delay calculation (fullDC) (1 T). (MEM=2368.51)
Total number of fetched objects 636
AAE_INFO: Total number of nets for which stage creation was skipped for all views 0
End delay calculation. (MEM=2367.16 CPU=0:00:00.1 REAL=0:00:00.0)
End delay calculation (fullDC). (MEM=2367.16 CPU=0:00:00.2 REAL=0:00:00.0)
*** Done Building Timing Graph (cpu=0:00:00.5 real=0:00:00.0 totSessionCpu=0:00:42.7 mem=2924.8M)
*** IncrReplace #1 [finish] (place_opt_design #1) : cpu/real = 0:00:05.8/0:00:06.1 (1.0), totSession cpu/real = 0:00:42.9/0:01:01.2 (0.7), mem = 2871.8M
Begin: GigaOpt DRV Optimization
[GPS-DRV] number of DCLS groups: 0; maxIter: 2
GigaOpt Checkpoint: Internal optDRV -max_tran -max_cap -maxLocalDensity 1.2 -numThreads 1 -smallScaleFixing -maxIter 3 -setupTNSCostFactor 3.0 -preCTS -preRouteDontEndWithRefinePlaceIncrSteinerRouteDC
*** DrvOpt #3 [begin] (place_opt_design #1) : totSession cpu/real = 0:00:43.0/0:01:01.2 (0.7), mem = 2887.8M
Info: 1 clock net  excluded from IPO operation.
**Info: (IMPSP-307): Design contains fractional 20 cells.
        CornerforLayerOpt timing analysis view VIEW_TYPICAL has been selected for calibration
        CornerforLayerOpt timing analysis view VIEW_TYPICAL has been selected for calibration
        CornerforLayerOpt timing analysis view VIEW_TYPICAL has been selected for calibration
        CornerforLayerOpt timing analysis view VIEW_TYPICAL has been selected for calibration
+-------------------------------------------------------------------------------------------------------------------------------------------------------+
|        max-tran       |        max-cap        |  max-fanout |  max-length |       setup       |        |        |        |       |          |         |
+-------------------------------------------------------------------------------------------------------------------------------------------------------+
| nets | terms|  wViol  | nets | terms|  wViol  | nets | terms| nets | terms|   WNS   |   TNS   |  #Buf  |  #Inv  | #Resize|Density|   Real   |   Mem   |
+-------------------------------------------------------------------------------------------------------------------------------------------------------+
|     0|     0|     0.00|     0|     0|     0.00|     0|     0|     0|     0|     0.01|     0.00|       0|       0|       0| 64.45%|          |         |
|     0|     0|     0.00|     0|     0|     0.00|     0|     0|     0|     0|     0.01|     0.00|       0|       0|       0| 64.45%| 0:00:00.0|  2945.9M|
+-------------------------------------------------------------------------------------------------------------------------------------------------------+
Bottom Preferred Layer:
    None
Via Pillar Rule:
    None

*** Finish DRV Fixing (cpu=0:00:00.0 real=0:00:00.0 mem=2945.9M) ***

*** DrvOpt #3 [finish] (place_opt_design #1) : cpu/real = 0:00:00.2/0:00:00.2 (1.0), totSession cpu/real = 0:00:43.2/0:01:01.4 (0.7), mem = 2945.9M
End: GigaOpt DRV Optimization
GigaOpt DRV: restore maxLocalDensity to 0.98

------------------------------------------------------------------
     Summary (cpu=0.00min real=0.00min mem=2887.9M)
------------------------------------------------------------------

Setup views included:
 VIEW_TYPICAL

+--------------------+---------+---------+---------+
|     Setup mode     |   all   | reg2reg | default |
+--------------------+---------+---------+---------+
|           WNS (ns):|  0.013  |  1.573  |  0.013  |
|           TNS (ns):|  0.000  |  0.000  |  0.000  |
|    Violating Paths:|    0    |    0    |    0    |
|          All Paths:|   85    |   41    |   62    |
+--------------------+---------+---------+---------+

+----------------+-------------------------------+------------------+
|                |              Real             |       Total      |
|    DRVs        +------------------+------------+------------------|
|                |  Nr nets(terms)  | Worst Vio  |  Nr nets(terms)  |
+----------------+------------------+------------+------------------+
|   max_cap      |     81 (81)      |   -0.058   |     81 (81)      |
|   max_tran     |      0 (0)       |   0.000    |      0 (0)       |
|   max_fanout   |      0 (0)       |     0      |      0 (0)       |
|   max_length   |      0 (0)       |     0      |      0 (0)       |
+----------------+------------------+------------+------------------+

Density: 64.451%
Routing Overflow: 0.00% H and 0.00% V
------------------------------------------------------------------
**optDesign ... cpu = 0:00:11, real = 0:00:29, mem = 2364.7M, totSessionCpu=0:00:43 **
*** Timing Is met
*** Check timing (0:00:00.0)
*** Timing Is met
*** Check timing (0:00:00.0)
*** Timing Is met
*** Check timing (0:00:00.0)
GigaOpt Checkpoint: Internal reclaim -noViewPrune -rebufferOnly -costCleanup -preRouteDontEndWithRefinePlaceIncrSteinerRouteDC -force -numThreads 1 -preCTS
Info: 1 clock net  excluded from IPO operation.
**Info: (IMPSP-307): Design contains fractional 20 cells.
Begin: Area Reclaim Optimization
*** AreaOpt #2 [begin] (place_opt_design #1) : totSession cpu/real = 0:00:43.5/0:01:01.7 (0.7), mem = 2947.3M
Reclaim Optimization WNS Slack 0.000  TNS Slack 0.000 Density 64.45
+---------+---------+--------+--------+------------+--------+
| Density | Commits |  WNS   |  TNS   |    Real    |  Mem   |
+---------+---------+--------+--------+------------+--------+
|   64.45%|        -|   0.000|   0.000|   0:00:00.0| 2947.3M|
|   64.45%|        0|   0.000|   0.000|   0:00:00.0| 2972.4M|
+---------+---------+--------+--------+------------+--------+
Reclaim Optimization End WNS Slack 0.000  TNS Slack 0.000 Density 64.45
Bottom Preferred Layer:
    None
Via Pillar Rule:
    None

Number of times islegalLocAvaiable called = 0 skipped = 0, called in commitmove = 0, skipped in commitmove = 0
End: Core Area Reclaim Optimization (cpu = 0:00:00.2) (real = 0:00:00.0) **
*** AreaOpt #2 [finish] (place_opt_design #1) : cpu/real = 0:00:00.2/0:00:00.2 (1.0), totSession cpu/real = 0:00:43.7/0:01:01.9 (0.7), mem = 2972.4M
End: Area Reclaim Optimization (cpu=0:00:00, real=0:00:00, mem=2888.36M, totSessionCpu=0:00:44).
GigaOpt Checkpoint: Internal reclaim -numThreads 1 -customPhyUpdate -noGCompAndPhase -ensureOneAreaReclaim -force -svrReclaim -rtrShortNets -allowDegradingShortNetRemoval -preCTS -tgtSlackMult 2 -wtns -noRouteTypeResizePolish -noViewPrune -nativePathGroupFlow
Info: 1 clock net  excluded from IPO operation.
**Info: (IMPSP-307): Design contains fractional 20 cells.
Begin: Area Reclaim Optimization
*** AreaOpt #3 [begin] (place_opt_design #1) : totSession cpu/real = 0:00:43.8/0:01:02.1 (0.7), mem = 2946.5M
Reclaim Optimization WNS Slack 0.000  TNS Slack 0.000 Density 64.45
+---------+---------+--------+--------+------------+--------+
| Density | Commits |  WNS   |  TNS   |    Real    |  Mem   |
+---------+---------+--------+--------+------------+--------+
|   64.45%|        -|   0.000|   0.000|   0:00:00.0| 2946.5M|
|   64.45%|        0|   0.000|   0.000|   0:00:00.0| 2946.5M|
|   64.45%|        0|   0.000|   0.000|   0:00:00.0| 2946.5M|
|   64.45%|        0|   0.000|   0.000|   0:00:00.0| 2946.5M|
|   64.45%|        0|   0.000|   0.000|   0:00:00.0| 2946.5M|
+---------+---------+--------+--------+------------+--------+
Reclaim Optimization End WNS Slack 0.000  TNS Slack 0.000 Density 64.45
Bottom Preferred Layer:
    None
Via Pillar Rule:
    None

Number of times islegalLocAvaiable called = 0 skipped = 0, called in commitmove = 0, skipped in commitmove = 0
End: Core Area Reclaim Optimization (cpu = 0:00:00.1) (real = 0:00:00.0) **
*** Finished re-routing un-routed nets (2962.5M) ***

*** Finish Physical Update (cpu=0:00:00.0 real=0:00:00.0 mem=2981.6M) ***
*** AreaOpt #3 [finish] (place_opt_design #1) : cpu/real = 0:00:00.1/0:00:00.1 (0.9), totSession cpu/real = 0:00:43.9/0:01:02.2 (0.7), mem = 2981.6M
End: Area Reclaim Optimization (cpu=0:00:00, real=0:00:00, mem=2896.60M, totSessionCpu=0:00:44).
-opt_exp_set_preroute_early_power_reclaim_recovery_split_flow false
                                           # bool, default=false, private
Begin: GigaOpt postEco DRV Optimization
GigaOpt Checkpoint: Internal optDRV -inPostEcoStage -smallScaleFixing -maxIter 3 -max_tran -max_cap -maxLocalDensity 0.98 -numThreads 1 -preRouteDontEndWithRefinePlaceIncrSteinerRouteDC -setupTNSCostFactor 1.0 -preCTS
*** DrvOpt #4 [begin] (place_opt_design #1) : totSession cpu/real = 0:00:44.1/0:01:02.4 (0.7), mem = 2896.6M
Info: 1 clock net  excluded from IPO operation.
**Info: (IMPSP-307): Design contains fractional 20 cells.
+-------------------------------------------------------------------------------------------------------------------------------------------------------+
|        max-tran       |        max-cap        |  max-fanout |  max-length |       setup       |        |        |        |       |          |         |
+-------------------------------------------------------------------------------------------------------------------------------------------------------+
| nets | terms|  wViol  | nets | terms|  wViol  | nets | terms| nets | terms|   WNS   |   TNS   |  #Buf  |  #Inv  | #Resize|Density|   Real   |   Mem   |
+-------------------------------------------------------------------------------------------------------------------------------------------------------+
|     0|     0|     0.00|     0|     0|     0.00|     0|     0|     0|     0|     0.01|     0.00|       0|       0|       0| 64.45%|          |         |
|     0|     0|     0.00|     0|     0|     0.00|     0|     0|     0|     0|     0.01|     0.00|       0|       0|       0| 64.45%| 0:00:00.0|  2954.8M|
+-------------------------------------------------------------------------------------------------------------------------------------------------------+
Bottom Preferred Layer:
    None
Via Pillar Rule:
    None

*** Finish DRV Fixing (cpu=0:00:00.0 real=0:00:00.0 mem=2954.8M) ***

*** DrvOpt #4 [finish] (place_opt_design #1) : cpu/real = 0:00:00.1/0:00:00.1 (1.0), totSession cpu/real = 0:00:44.2/0:01:02.4 (0.7), mem = 2954.8M
End: GigaOpt postEco DRV Optimization
**WARN: (IMPOPT-7329):  Skipping refinePlace due to user configuration.
Register exp ratio and priority group on 0 nets on 636 nets :

Active setup views:
 VIEW_TYPICAL
  Dominating endpoints: 0
  Dominating TNS: -0.000

Extraction called for design 'tt_um_Jsilicon' of instances=587 and nets=704 using extraction engine 'preRoute' .
**WARN: (IMPEXT-3530):  The process node is not set. Use the command setDesignMode -process <process node> prior to extraction for maximum accuracy and optimal automatic threshold setting.
Type 'man IMPEXT-3530' for more detail.
PreRoute RC Extraction called for design tt_um_Jsilicon.
RC Extraction called in multi-corner(1) mode.
**WARN: (IMPEXT-6197):  The Cap table file is not specified. This will result in lower parasitic accuracy when using preRoute extraction or postRoute extraction with effort level 'low'. It is recommended to generate the Cap table file using the 'generateCapTbl' command and specify it before extraction using 'create_rc_corner/update_rc_corner -cap_table'.
Type 'man IMPEXT-6197' for more detail.
RCMode: PreRoute
      RC Corner Indexes            0
Capacitance Scaling Factor   : 1.00000
Resistance Scaling Factor    : 1.00000
Clock Cap. Scaling Factor    : 1.00000
Clock Res. Scaling Factor    : 1.00000
Shrink Factor                : 1.00000
PreRoute extraction is honoring NDR/Shielding/ExtraSpace for clock nets.
Grid density data update skipped
Initializing multi-corner resistance tables ...
PreRoute RC Extraction DONE (CPU Time: 0:00:00.0  Real Time: 0:00:00.0  MEM: 2945.395M)
Skewing Data Summary (End_of_FINAL)

Skew summary for view VIEW_TYPICAL:
* Accumulated skew : count = 0

Starting delay calculation for Setup views
AAE_INFO: opIsDesignInPostRouteState() is 0
#################################################################################
# Design Stage: PreRoute
# Design Name: tt_um_Jsilicon
# Design Mode: 90nm
# Analysis Mode: MMMC Non-OCV
# Parasitics Mode: No SPEF/RCDB
# Signoff Settings: SI Off
#################################################################################
Calculate delays in Single mode...
Start delay calculation (fullDC) (1 T). (MEM=2375.12)
Total number of fetched objects 636
AAE_INFO: Total number of nets for which stage creation was skipped for all views 0
End delay calculation. (MEM=2381.56 CPU=0:00:00.1 REAL=0:00:01.0)
End delay calculation (fullDC). (MEM=2381.56 CPU=0:00:00.1 REAL=0:00:01.0)
*** Done Building Timing Graph (cpu=0:00:00.5 real=0:00:01.0 totSessionCpu=0:00:44.9 mem=2922.9M)
OPTC: user 20.0
Reported timing to dir ./timingReports
**optDesign ... cpu = 0:00:13, real = 0:00:31, mem = 2370.4M, totSessionCpu=0:00:45 **

------------------------------------------------------------------
     optDesign Final Summary
------------------------------------------------------------------

Setup views included:
 VIEW_TYPICAL

+--------------------+---------+---------+---------+
|     Setup mode     |   all   | reg2reg | default |
+--------------------+---------+---------+---------+
|           WNS (ns):|  0.013  |  1.573  |  0.013  |
|           TNS (ns):|  0.000  |  0.000  |  0.000  |
|    Violating Paths:|    0    |    0    |    0    |
|          All Paths:|   85    |   41    |   62    |
+--------------------+---------+---------+---------+

+----------------+-------------------------------+------------------+
|                |              Real             |       Total      |
|    DRVs        +------------------+------------+------------------|
|                |  Nr nets(terms)  | Worst Vio  |  Nr nets(terms)  |
+----------------+------------------+------------+------------------+
|   max_cap      |     81 (81)      |   -0.058   |     81 (81)      |
|   max_tran     |      0 (0)       |   0.000    |      0 (0)       |
|   max_fanout   |      0 (0)       |     0      |      0 (0)       |
|   max_length   |      0 (0)       |     0      |      0 (0)       |
+----------------+------------------+------------+------------------+

Density: 64.451%
Routing Overflow: 0.00% H and 0.00% V
------------------------------------------------------------------
Begin: Collecting metrics
 -------------------------------------------------------------------------------------------------------------------------------------------------------
| Snapshot                | WNS                  | TNS                  | Density (%) | Hotspot                   | Resource               | DRVs       |
|                         | HEPG (ns) | ALL (ns) | HEPG (ns) | ALL (ns) |             | Max (bins) | Total (bins) | Real (s) | Memory (MB) | Tran | Cap |
|-------------------------+-----------+----------+-----------+----------+-------------+------------+--------------+----------+-------------+------+-----|
| initial_summary         |           |    0.003 |           |        0 |       64.55 |            |              | 0:00:01  |        2849 |    0 |  76 |
| simplify_netlist        |           |          |           |          |             |            |              | 0:00:01  |        2866 |      |     |
| drv_fixing              |           |          |           |          |             |            |              | 0:00:00  |        2867 |      |     |
| drv_fixing_2            |     0.000 |    0.003 |         0 |        0 |       64.55 |            |              | 0:00:00  |        2867 |    0 |   0 |
| global_opt              |           |    0.003 |           |        0 |       64.55 |            |              | 0:00:01  |        2877 |      |     |
| area_reclaiming         |     0.000 |    0.003 |         0 |        0 |       64.45 |            |              | 0:00:00  |        2894 |      |     |
| incremental_replacement |           |          |           |          |             |       0.00 |         0.00 | 0:00:06  |        2896 |      |     |
| drv_fixing_3            |     0.013 |    0.013 |         0 |        0 |       64.45 |            |              | 0:00:00  |        2888 |    0 |  81 |
| area_reclaiming_2       |     1.573 |    0.013 |         0 |        0 |       64.45 |            |              | 0:00:00  |        2888 |      |     |
| area_reclaiming_3       |     1.573 |    0.013 |         0 |        0 |       64.45 |            |              | 0:00:00  |        2897 |      |     |
| drv_eco_fixing          |     1.573 |    0.013 |         0 |        0 |       64.45 |            |              | 0:00:00  |        2897 |    0 |   0 |
| final_summary           |     1.573 |    0.013 |           |        0 |       64.45 |            |              | 0:00:01  |        2881 |    0 |  81 |
 -------------------------------------------------------------------------------------------------------------------------------------------------------
End: Collecting metrics
**optDesign ... cpu = 0:00:14, real = 0:00:32, mem = 2373.9M, totSessionCpu=0:00:45 **
**WARN: (IMPOPT-3195):  Analysis mode has changed.
Type 'man IMPOPT-3195' for more detail.
*** Finished optDesign ***
      flow.cputime  flow.realtime  timing.setup.tns  timing.setup.wns  snapshot
UM:*                                                                   final
      flow.cputime  flow.realtime  timing.setup.tns  timing.setup.wns  snapshot
UM:*                                                                   opt_design_prects
Info: final physical memory for 2 CRR processes is 733.79MB.
Info: Summary of CRR changes:
      - Timing transform commits:       0
Disable CTE adjustment.
Disable Layer aware incrSKP.
#optDebug: fT-D <X 1 0 0 0>
**place_opt_design ... cpu = 0:00:14, real = 0:00:40, mem = 2786.1M **
*** Finished GigaPlace ***

*** Summary of all messages that are not suppressed in this session:
Severity  ID               Count  Summary
WARNING   IMPEXT-6197          3  The Cap table file is not specified. Thi...
WARNING   IMPEXT-2882          4  Unable to find the resistance for via '%...
WARNING   IMPEXT-3530          3  The process node is not set. Use the com...
WARNING   IMPSP-9025           1  No scan chain specified/traced.
WARNING   IMPOPT-576           1  %d nets have unplaced terms.
WARNING   IMPOPT-3195          2  Analysis mode has changed.
WARNING   IMPOPT-665          24  %s : Net has unplaced terms or is connec...
WARNING   IMPOPT-7329          1  Skipping refinePlace due to user configu...
*** Message Summary: 39 warning(s), 0 error(s)

*** place_opt_design #1 [finish] () : cpu/real = 0:00:13.9/0:00:40.2 (0.3), totSession cpu/real = 0:00:45.7/0:01:12.9 (0.6), mem = 2786.1M
#% End place_opt_design (date=11/19 10:56:43, total cpu=0:00:13.9, real=0:00:40.0, peak res=2385.6M, current mem=2273.3M)
Clock Tree Synthesis...
**ERROR: (IMPTCM-163):  Option "-immediate" for command create_ccopt_clock_tree_spec is obsolete and will be ignored. It no longer has any effect and should be removed from your script.
Creating clock tree spec for modes (timing configs): CONSTRAINTS
extract_clock_generator_skew_groups=true: create_ccopt_clock_tree_spec will generate skew groups with a name prefix of "_clock_gen" to balance clock generator connected flops with the clock generator they drive.
Reset timing graph...
Ignoring AAE DB Resetting ...
Reset timing graph done.
Ignoring AAE DB Resetting ...
Analyzing clock structure...
Analyzing clock structure done.
Reset timing graph...
Ignoring AAE DB Resetting ...
Reset timing graph done.
Extracting original clock gating for clk...
  clock_tree clk contains 42 sinks and 0 clock gates.
Extracting original clock gating for clk done.
The skew group clk/CONSTRAINTS was created. It contains 42 sinks and 1 sources.
Checking clock tree convergence...
Checking clock tree convergence done.
#% Begin ccopt_design (date=11/19 10:56:44, mem=2250.4M)
Turning off fast DC mode.
**ERROR: (IMPCCOPT-2440):       The input db is PODv2. Please try clock_opt_design.
#% End ccopt_design (date=11/19 10:56:44, total cpu=0:00:00.0, real=0:00:00.0, peak res=2252.6M, current mem=2252.6M)
#% Begin save design ... (date=11/19 10:56:44, mem=2252.6M)
INFO: Current data have to be saved into a temporary db: 'jsilicon_cts.enc.dat.tmp' first. It will be renamed to the correct name 'jsilicon_cts.enc.dat' after the old db was deleted.
% Begin Save ccopt configuration ... (date=11/19 10:56:44, mem=2252.6M)
% End Save ccopt configuration ... (date=11/19 10:56:44, total cpu=0:00:00.0, real=0:00:00.0, peak res=2253.5M, current mem=2253.5M)
% Begin Save netlist data ... (date=11/19 10:56:44, mem=2253.5M)
Writing Binary DB to /home/student001/JSilicon2/work/pnr/jsilicon_cts.enc.dat.tmp/tt_um_Jsilicon.v.bin in single-threaded mode...
% End Save netlist data ... (date=11/19 10:56:44, total cpu=0:00:00.0, real=0:00:00.0, peak res=2253.5M, current mem=2253.5M)
Saving symbol-table file ...
Saving congestion map file /home/student001/JSilicon2/work/pnr/jsilicon_cts.enc.dat.tmp/tt_um_Jsilicon.route.congmap.gz ...
% Begin Save AAE data ... (date=11/19 10:56:44, mem=2253.5M)
Saving AAE Data ...
% End Save AAE data ... (date=11/19 10:56:44, total cpu=0:00:00.9, real=0:00:00.0, peak res=2435.2M, current mem=2253.8M)
Saving preference file /home/student001/JSilicon2/work/pnr/jsilicon_cts.enc.dat.tmp/gui.pref.tcl ...
Saving mode setting ...
**WARN: (IMPMF-5054):   fill_setting_save command is obsolete and should not be used any more. It still works in this release but will be removed in future release. Recommend to use Pegasus metal fill flow which is the replacement.
Saving global file ...
% Begin Save floorplan data ... (date=11/19 10:56:44, mem=2255.2M)
Saving floorplan file ...
% End Save floorplan data ... (date=11/19 10:56:45, total cpu=0:00:00.0, real=0:00:01.0, peak res=2255.2M, current mem=2255.2M)
Saving PG file /home/student001/JSilicon2/work/pnr/jsilicon_cts.enc.dat.tmp/tt_um_Jsilicon.pg.gz, version#2, (Created by Innovus v23.13-s082_1 on Wed Nov 19 10:56:45 2025)
*** Completed savePGFile (cpu=0:00:00.0 real=0:00:00.0 mem=2766.1M) ***
*info - save blackBox cells to lef file /home/student001/JSilicon2/work/pnr/jsilicon_cts.enc.dat.tmp/tt_um_Jsilicon.bbox.lef
Saving Drc markers ...
... 44 markers are saved ...
... 0 geometry drc markers are saved ...
... 0 antenna drc markers are saved ...
% Begin Save placement data ... (date=11/19 10:56:45, mem=2255.2M)
** Saving stdCellPlacement_binary (version# 2) ...
Save Adaptive View Pruning View Names to Binary file
% End Save placement data ... (date=11/19 10:56:45, total cpu=0:00:00.0, real=0:00:00.0, peak res=2255.2M, current mem=2255.2M)
% Begin Save routing data ... (date=11/19 10:56:45, mem=2255.2M)
Saving route file ...
*** Completed saveRoute (cpu=0:00:00.0 real=0:00:00.0 mem=2766.1M) ***
% End Save routing data ... (date=11/19 10:56:45, total cpu=0:00:00.0, real=0:00:00.0, peak res=2255.2M, current mem=2255.2M)
Saving property file /home/student001/JSilicon2/work/pnr/jsilicon_cts.enc.dat.tmp/tt_um_Jsilicon.prop
*** Completed saveProperty (cpu=0:00:00.0 real=0:00:00.0 mem=2769.1M) ***
Saving rc congestion map /home/student001/JSilicon2/work/pnr/jsilicon_cts.enc.dat.tmp/tt_um_Jsilicon.congmap.gz ...
% Begin Save power constraints data ... (date=11/19 10:56:45, mem=2255.2M)
% End Save power constraints data ... (date=11/19 10:56:45, total cpu=0:00:00.0, real=0:00:00.0, peak res=2255.2M, current mem=2255.2M)
Generated self-contained design jsilicon_cts.enc.dat.tmp
#% End save design ... (date=11/19 10:56:45, total cpu=0:00:01.9, real=0:00:01.0, peak res=2435.2M, current mem=2258.1M)

*** Summary of all messages that are not suppressed in this session:
Severity  ID               Count  Summary
WARNING   IMPMF-5054           1  fill_setting_save command is obsolete an...
*** Message Summary: 1 warning(s), 0 error(s)

Post-CTS Optimization...
**optDesign ... cpu = 0:00:00, real = 0:00:00, mem = 2258.1M, totSessionCpu=0:00:48 **
**WARN: (IMPOPT-576):   24 nets have unplaced terms.
*** optDesign #1 [begin] () : totSession cpu/real = 0:00:48.0/0:01:15.0 (0.6), mem = 2781.2M
GigaOpt running with 1 threads.
*** InitOpt #1 [begin] (optDesign #1) : totSession cpu/real = 0:00:48.0/0:01:15.0 (0.6), mem = 2781.2M
**INFO: User settings:
setExtractRCMode -engine                                       preRoute
setDelayCalMode -enable_high_fanout                            true
setDelayCalMode -enable_ideal_seq_async_pins                   false
setDelayCalMode -eng_enablePrePlacedFlow                       false
setDelayCalMode -engine                                        aae
setDelayCalMode -ignoreNetLoad                                 false
setDelayCalMode -socv_accuracy_mode                            low
setOptMode -opt_view_pruning_hold_views_active_list            { VIEW_TYPICAL }
setOptMode -opt_view_pruning_setup_views_active_list           { VIEW_TYPICAL }
setOptMode -opt_view_pruning_setup_views_persistent_list       { VIEW_TYPICAL}
setOptMode -opt_view_pruning_tdgr_setup_views_persistent_list  { VIEW_TYPICAL}
setOptMode -opt_drv_margin                                     0
setOptMode -opt_drv                                            true
setOptMode -opt_resize_flip_flops                              true
setOptMode -opt_setup_target_slack                             0
setPlaceMode -place_global_cong_effort                         high
setPlaceMode -timingDriven                                     true
setAnalysisMode -analysisType                                  single
setAnalysisMode -checkType                                     setup
setAnalysisMode -clkSrcPath                                    true
setAnalysisMode -clockPropagation                              forcedIdeal
setAnalysisMode -usefulSkew                                    true
setAnalysisMode -virtualIPO                                    false

**INFO: setDesignMode -flowEffort standard -> setting 'setOptMode -allEndPoints true' for the duration of this command.
Need call spDPlaceInit before registerPrioInstLoc.
**Info: (IMPSP-307): Design contains fractional 20 cells.
**WARN: (IMPOPT-665):   clk : Net has unplaced terms or is connected to uplaced instances in design.
Type 'man IMPOPT-665' for more detail.
**WARN: (IMPOPT-665):   rst_n : Net has unplaced terms or is connected to uplaced instances in design.
Type 'man IMPOPT-665' for more detail.
**WARN: (IMPOPT-665):   ui_in[7] : Net has unplaced terms or is connected to uplaced instances in design.
Type 'man IMPOPT-665' for more detail.
**WARN: (IMPOPT-665):   ui_in[6] : Net has unplaced terms or is connected to uplaced instances in design.
Type 'man IMPOPT-665' for more detail.
**WARN: (IMPOPT-665):   ui_in[5] : Net has unplaced terms or is connected to uplaced instances in design.
Type 'man IMPOPT-665' for more detail.
**WARN: (IMPOPT-665):   ui_in[4] : Net has unplaced terms or is connected to uplaced instances in design.
Type 'man IMPOPT-665' for more detail.
**WARN: (IMPOPT-665):   ui_in[3] : Net has unplaced terms or is connected to uplaced instances in design.
Type 'man IMPOPT-665' for more detail.
**WARN: (IMPOPT-665):   ui_in[2] : Net has unplaced terms or is connected to uplaced instances in design.
Type 'man IMPOPT-665' for more detail.
**WARN: (IMPOPT-665):   ui_in[1] : Net has unplaced terms or is connected to uplaced instances in design.
Type 'man IMPOPT-665' for more detail.
**WARN: (IMPOPT-665):   ui_in[0] : Net has unplaced terms or is connected to uplaced instances in design.
Type 'man IMPOPT-665' for more detail.
**WARN: (IMPOPT-665):   uio_in[7] : Net has unplaced terms or is connected to uplaced instances in design.
Type 'man IMPOPT-665' for more detail.
**WARN: (IMPOPT-665):   uio_in[6] : Net has unplaced terms or is connected to uplaced instances in design.
Type 'man IMPOPT-665' for more detail.
**WARN: (IMPOPT-665):   uio_in[5] : Net has unplaced terms or is connected to uplaced instances in design.
Type 'man IMPOPT-665' for more detail.
**WARN: (IMPOPT-665):   uio_in[4] : Net has unplaced terms or is connected to uplaced instances in design.
Type 'man IMPOPT-665' for more detail.
**WARN: (IMPOPT-665):   ena : Net has unplaced terms or is connected to uplaced instances in design.
Type 'man IMPOPT-665' for more detail.
**WARN: (IMPOPT-665):   uo_out[7] : Net has unplaced terms or is connected to uplaced instances in design.
Type 'man IMPOPT-665' for more detail.
**WARN: (IMPOPT-665):   uo_out[6] : Net has unplaced terms or is connected to uplaced instances in design.
Type 'man IMPOPT-665' for more detail.
**WARN: (IMPOPT-665):   uo_out[5] : Net has unplaced terms or is connected to uplaced instances in design.
Type 'man IMPOPT-665' for more detail.
**WARN: (IMPOPT-665):   uo_out[4] : Net has unplaced terms or is connected to uplaced instances in design.
Type 'man IMPOPT-665' for more detail.
**WARN: (IMPOPT-665):   uo_out[3] : Net has unplaced terms or is connected to uplaced instances in design.
Type 'man IMPOPT-665' for more detail.
**WARN: (EMS-27):       Message (IMPOPT-665) has exceeded the current message display limit of 20.
To increase the message display limit, refer to the product command reference manual.
Info: Using SynthesisEngine executable '/tools/cadence/DDI231/INNOVUS231/bin/innovus_'.
      SynthesisEngine workers will not check out additional licenses.
**INFO: Using Advanced Metric Collection system.
**optDesign ... cpu = 0:00:00, real = 0:00:16, mem = 2274.8M, totSessionCpu=0:00:48 **
#optDebug: { P: 90 W: 8201 FE: standard PE: none LDR: 1}
*** optDesign -postCTS ***
DRC Margin: user margin 0.0; extra margin 0.2
Hold Target Slack: user slack 0
Setup Target Slack: user slack 0; extra slack 0.0
setUsefulSkewMode -opt_skew_eco_route false
**WARN: (IMPOPT-3195):  Analysis mode has changed.
Type 'man IMPOPT-3195' for more detail.
Multi-VT timing optimization disabled based on library information.
Start to check current routing status for nets...
All nets are already routed correctly.
End to check current routing status for nets (mem=2800.6M)
        CornerforLayerOpt timing analysis view VIEW_TYPICAL has been selected for calibration
        CornerforLayerOpt timing analysis view VIEW_TYPICAL has been selected for calibration
Compute RC Scale Done ...
Starting delay calculation for Setup views
AAE_INFO: opIsDesignInPostRouteState() is 0
#################################################################################
# Design Stage: PreRoute
# Design Name: tt_um_Jsilicon
# Design Mode: 90nm
# Analysis Mode: MMMC Non-OCV
# Parasitics Mode: No SPEF/RCDB
# Signoff Settings: SI Off
#################################################################################
Calculate delays in Single mode...
Start delay calculation (fullDC) (1 T). (MEM=2387.36)
Total number of fetched objects 636
AAE_INFO: Total number of nets for which stage creation was skipped for all views 0
End delay calculation. (MEM=2400.48 CPU=0:00:00.1 REAL=0:00:00.0)
End delay calculation (fullDC). (MEM=2400.48 CPU=0:00:00.2 REAL=0:00:00.0)
*** Done Building Timing Graph (cpu=0:00:00.5 real=0:00:01.0 totSessionCpu=0:00:49.3 mem=2992.8M)

------------------------------------------------------------------
             Initial Summary
------------------------------------------------------------------

Setup views included:
 VIEW_TYPICAL

+--------------------+---------+---------+---------+
|     Setup mode     |   all   | reg2reg | default |
+--------------------+---------+---------+---------+
|           WNS (ns):|  0.008  |  1.573  |  0.008  |
|           TNS (ns):|  0.000  |  0.000  |  0.000  |
|    Violating Paths:|    0    |    0    |    0    |
|          All Paths:|   85    |   41    |   62    |
+--------------------+---------+---------+---------+

+----------------+-------------------------------+------------------+
|                |              Real             |       Total      |
|    DRVs        +------------------+------------+------------------|
|                |  Nr nets(terms)  | Worst Vio  |  Nr nets(terms)  |
+----------------+------------------+------------+------------------+
|   max_cap      |     81 (81)      |   -0.058   |     81 (81)      |
|   max_tran     |      0 (0)       |   0.000    |      0 (0)       |
|   max_fanout   |      0 (0)       |     0      |      0 (0)       |
|   max_length   |      0 (0)       |     0      |      0 (0)       |
+----------------+------------------+------------+------------------+

Density: 64.451%
Routing Overflow: 0.00% H and 0.00% V
------------------------------------------------------------------
**optDesign ... cpu = 0:00:01, real = 0:00:17, mem = 2382.8M, totSessionCpu=0:00:49 **
*** InitOpt #1 [finish] (optDesign #1) : cpu/real = 0:00:01.5/0:00:16.6 (0.1), totSession cpu/real = 0:00:49.5/0:01:31.7 (0.5), mem = 2904.9M
** INFO : this run is activating low effort ccoptDesign flow
**Info: (IMPSP-307): Design contains fractional 20 cells.
OPTC: m4 20.0 50.0 [ 250.0 20.0 50.0 ]
OPTC: view 50.0:250.0 [ 0.0500 ]
#optDebug: fT-E <X 2 0 0 1>
-opt_post_cts_congestion_repair false      # bool, default=false, private
GigaOpt Checkpoint: Internal congRefineRouteType -postCTS -congThreshold 0.001 -rescheduleForCongestion -resetVeryShortNets -resetShortNets -useSpineBased -rescheduleForAdherence -minSlack -237.5 -useBottleneckAnalyzer -drvRatio 0.4
Begin: GigaOpt Route Type Constraints Refinement
*** CongRefineRouteType #1 [begin] (optDesign #1) : totSession cpu/real = 0:00:49.6/0:01:31.8 (0.5), mem = 2906.9M
Updated routing constraints on 0 nets.
Bottom Preferred Layer:
    None
Via Pillar Rule:
    None
*** CongRefineRouteType #1 [finish] (optDesign #1) : cpu/real = 0:00:00.0/0:00:00.0 (0.0), totSession cpu/real = 0:00:49.6/0:01:31.8 (0.5), mem = 2906.9M
End: GigaOpt Route Type Constraints Refinement
*** SimplifyNetlist #1 [begin] (optDesign #1) : totSession cpu/real = 0:00:49.7/0:01:32.0 (0.5), mem = 2904.9M
Info: 1 clock net  excluded from IPO operation.
**Info: (IMPSP-307): Design contains fractional 20 cells.

Netlist preparation processing...
Removed 0 instance
*info: Marking 0 isolation instances dont touch
*info: Marking 0 level shifter instances dont touch
*** SimplifyNetlist #1 [finish] (optDesign #1) : cpu/real = 0:00:00.2/0:00:00.2 (1.0), totSession cpu/real = 0:00:49.9/0:01:32.1 (0.5), mem = 3027.2M
*** ExcludedClockNetOpt #1 [begin] (optDesign #1) : totSession cpu/real = 0:00:50.0/0:01:32.3 (0.5), mem = 2921.2M
*** Starting optimizing excluded clock nets MEM= 2921.2M) ***
*info: There are no clock nets marked defIn, clock nets will not be optimized.
*info: No excluded clock nets to be optimized.
*** Finished optimizing excluded clock nets (CPU Time= 0:00:00.0  MEM= 2921.2M) ***
*** ExcludedClockNetOpt #1 [finish] (optDesign #1) : cpu/real = 0:00:00.0/0:00:00.0 (0.0), totSession cpu/real = 0:00:50.0/0:01:32.3 (0.5), mem = 2921.2M
*** ExcludedClockNetOpt #2 [begin] (optDesign #1) : totSession cpu/real = 0:00:50.0/0:01:32.3 (0.5), mem = 2921.2M
*** Starting optimizing excluded clock nets MEM= 2921.2M) ***
*info: There are no clock nets marked defIn, clock nets will not be optimized.
*info: No excluded clock nets to be optimized.
*** Finished optimizing excluded clock nets (CPU Time= 0:00:00.0  MEM= 2921.2M) ***
*** ExcludedClockNetOpt #2 [finish] (optDesign #1) : cpu/real = 0:00:00.0/0:00:00.0 (0.0), totSession cpu/real = 0:00:50.0/0:01:32.3 (0.5), mem = 2921.2M
Info: Done creating the CCOpt slew target map.
Begin: GigaOpt high fanout net optimization
GigaOpt HFN: use maxLocalDensity 1.2
GigaOpt Checkpoint: Internal optDRV -useLevelizedBufferTreeOnly -auxMaxFanoutCountLimit 500 -largeScaleFixing -maxIter 1 -maxLocalDensity 1.2 -numThreads 1 -postCTS -preRouteDontEndWithRefinePlaceIncrSteinerRouteDC
*** DrvOpt #1 [begin] (optDesign #1) : totSession cpu/real = 0:00:50.1/0:01:32.3 (0.5), mem = 2921.2M
Info: 1 clock net  excluded from IPO operation.
**Info: (IMPSP-307): Design contains fractional 20 cells.
        CornerforLayerOpt timing analysis view VIEW_TYPICAL has been selected for calibration
        CornerforLayerOpt timing analysis view VIEW_TYPICAL has been selected for calibration
        CornerforLayerOpt timing analysis view VIEW_TYPICAL has been selected for calibration
        CornerforLayerOpt timing analysis view VIEW_TYPICAL has been selected for calibration
*** DrvOpt #1 [finish] (optDesign #1) : cpu/real = 0:00:00.1/0:00:00.1 (1.0), totSession cpu/real = 0:00:50.2/0:01:32.4 (0.5), mem = 2979.3M
GigaOpt HFN: restore maxLocalDensity to 0.98
End: GigaOpt high fanout net optimization
Begin: GigaOpt DRV Optimization
[GPS-DRV] number of DCLS groups: 0; maxIter: 2
GigaOpt Checkpoint: Internal optDRV -max_tran -max_cap -maxLocalDensity 0.98 -numThreads 1 -smallScaleFixing -maxIter 3 -setupTNSCostFactor 3.0 -postCTS
*** DrvOpt #2 [begin] (optDesign #1) : totSession cpu/real = 0:00:50.2/0:01:32.5 (0.5), mem = 2979.3M
Info: 1 clock net  excluded from IPO operation.
**Info: (IMPSP-307): Design contains fractional 20 cells.
        CornerforLayerOpt timing analysis view VIEW_TYPICAL has been selected for calibration
        CornerforLayerOpt timing analysis view VIEW_TYPICAL has been selected for calibration
        CornerforLayerOpt timing analysis view VIEW_TYPICAL has been selected for calibration
        CornerforLayerOpt timing analysis view VIEW_TYPICAL has been selected for calibration
+-------------------------------------------------------------------------------------------------------------------------------------------------------+
|        max-tran       |        max-cap        |  max-fanout |  max-length |       setup       |        |        |        |       |          |         |
+-------------------------------------------------------------------------------------------------------------------------------------------------------+
| nets | terms|  wViol  | nets | terms|  wViol  | nets | terms| nets | terms|   WNS   |   TNS   |  #Buf  |  #Inv  | #Resize|Density|   Real   |   Mem   |
+-------------------------------------------------------------------------------------------------------------------------------------------------------+
|     0|     0|     0.00|     0|     0|     0.00|     0|     0|     0|     0|     0.01|     0.00|       0|       0|       0| 64.45%|          |         |
|     0|     0|     0.00|     0|     0|     0.00|     0|     0|     0|     0|     0.01|     0.00|       0|       0|       0| 64.45%| 0:00:00.0|  2979.3M|
+-------------------------------------------------------------------------------------------------------------------------------------------------------+
Bottom Preferred Layer:
    None
Via Pillar Rule:
    None

*** Finish DRV Fixing (cpu=0:00:00.0 real=0:00:00.0 mem=2979.3M) ***

*** DrvOpt #2 [finish] (optDesign #1) : cpu/real = 0:00:00.2/0:00:00.2 (1.0), totSession cpu/real = 0:00:50.5/0:01:32.7 (0.5), mem = 2979.3M
End: GigaOpt DRV Optimization
GigaOpt DRV: restore maxLocalDensity to 0.98
**optDesign ... cpu = 0:00:02, real = 0:00:18, mem = 2384.7M, totSessionCpu=0:00:50 **
Number of setup views: 1
Begin: GigaOpt Global Optimization
*info: use new DP (enabled)
GigaOpt Checkpoint: Internal globalOpt -maxLocalDensity 1.2 -numThreads 1 -postCTS -preRouteDontEndWithRefinePlaceIncrSteinerRouteDC -enableHighLayerOpt -maxIter 50 -maxIterForLEPG 50
Info: 1 clock net  excluded from IPO operation.
*** GlobalOpt #1 [begin] (optDesign #1) : totSession cpu/real = 0:00:50.6/0:01:32.8 (0.5), mem = 2921.3M
**Info: (IMPSP-307): Design contains fractional 20 cells.
*info: 1 clock net excluded
*info: 47 no-driver nets excluded.
** GigaOpt Global Opt WNS Slack 0.000  TNS Slack 0.000
+--------+--------+---------+------------+--------+------------+---------+-------------------------------------------+
|  WNS   |  TNS   | Density |    Real    |  Mem   | Worst View |Pathgroup|                 End Point                 |
+--------+--------+---------+------------+--------+------------+---------+-------------------------------------------+
|   0.000|   0.000|   64.45%|   0:00:00.0| 2987.5M|VIEW_TYPICAL|       NA| NA                                        |
+--------+--------+---------+------------+--------+------------+---------+-------------------------------------------+

*** Finish post-CTS Global Setup Fixing (cpu=0:00:00.0 real=0:00:00.0 mem=2987.5M) ***

*** Finish post-CTS Setup Fixing (cpu=0:00:00.0 real=0:00:00.0 mem=2987.5M) ***
Bottom Preferred Layer:
    None
Via Pillar Rule:
    None
** GigaOpt Global Opt End WNS Slack 0.000  TNS Slack 0.000
*** GlobalOpt #1 [finish] (optDesign #1) : cpu/real = 0:00:00.2/0:00:00.2 (1.0), totSession cpu/real = 0:00:50.8/0:01:33.0 (0.5), mem = 2987.5M
End: GigaOpt Global Optimization
*** Timing Is met
*** Check timing (0:00:00.0)
GigaOpt Checkpoint: Internal reclaim -numThreads 1 -postCTS -doRemoveUselessTerm -tgtSlackMult 3 -routeType -noRouteTypeResizePolish -noViewPrune -weedwhack -nonLegal -nativePathGroupFlow -SimpCCIn
Info: 1 clock net  excluded from IPO operation.
**Info: (IMPSP-307): Design contains fractional 20 cells.
Begin: Area Reclaim Optimization
*** AreaOpt #1 [begin] (optDesign #1) : totSession cpu/real = 0:00:50.9/0:01:33.1 (0.5), mem = 2985.7M
Reclaim Optimization WNS Slack 0.008  TNS Slack 0.000 Density 64.45
+---------+---------+--------+--------+------------+--------+
| Density | Commits |  WNS   |  TNS   |    Real    |  Mem   |
+---------+---------+--------+--------+------------+--------+
|   64.45%|        -|   0.008|   0.000|   0:00:00.0| 2987.7M|
|   64.43%|        1|   0.008|   0.000|   0:00:00.0| 3026.8M|
|   64.43%|        0|   0.008|   0.000|   0:00:00.0| 3026.8M|
|   64.43%|        0|   0.008|   0.000|   0:00:00.0| 3026.8M|
|   64.43%|        0|   0.008|   0.000|   0:00:00.0| 3026.8M|
|   64.43%|        0|   0.008|   0.000|   0:00:00.0| 3026.8M|
+---------+---------+--------+--------+------------+--------+
Reclaim Optimization End WNS Slack 0.008  TNS Slack 0.000 Density 64.43
Bottom Preferred Layer:
    None
Via Pillar Rule:
    None

Number of times islegalLocAvaiable called = 0 skipped = 0, called in commitmove = 0, skipped in commitmove = 0
End: Core Area Reclaim Optimization (cpu = 0:00:00.5) (real = 0:00:00.0) **
*** AreaOpt #1 [finish] (optDesign #1) : cpu/real = 0:00:00.5/0:00:00.5 (1.0), totSession cpu/real = 0:00:51.4/0:01:33.6 (0.5), mem = 3026.8M
Executing incremental physical updates
Executing incremental physical updates
End: Area Reclaim Optimization (cpu=0:00:01, real=0:00:00, mem=2943.77M, totSessionCpu=0:00:51).
Begin: GigaOpt DRV Optimization
[GPS-DRV] number of DCLS groups: 0; maxIter: 2
GigaOpt Checkpoint: Internal optDRV -max_tran -max_cap -maxLocalDensity 0.98 -numThreads 1 -smallScaleFixing -maxIter 3 -setupTNSCostFactor 3.0 -postCTS
*** DrvOpt #3 [begin] (optDesign #1) : totSession cpu/real = 0:00:51.6/0:01:33.8 (0.5), mem = 2943.8M
Info: 1 clock net  excluded from IPO operation.
**Info: (IMPSP-307): Design contains fractional 20 cells.
        CornerforLayerOpt timing analysis view VIEW_TYPICAL has been selected for calibration
        CornerforLayerOpt timing analysis view VIEW_TYPICAL has been selected for calibration
        CornerforLayerOpt timing analysis view VIEW_TYPICAL has been selected for calibration
        CornerforLayerOpt timing analysis view VIEW_TYPICAL has been selected for calibration
+-------------------------------------------------------------------------------------------------------------------------------------------------------+
|        max-tran       |        max-cap        |  max-fanout |  max-length |       setup       |        |        |        |       |          |         |
+-------------------------------------------------------------------------------------------------------------------------------------------------------+
| nets | terms|  wViol  | nets | terms|  wViol  | nets | terms| nets | terms|   WNS   |   TNS   |  #Buf  |  #Inv  | #Resize|Density|   Real   |   Mem   |
+-------------------------------------------------------------------------------------------------------------------------------------------------------+
|     0|     0|     0.00|     0|     0|     0.00|     0|     0|     0|     0|     0.01|     0.00|       0|       0|       0| 64.43%|          |         |
|     0|     0|     0.00|     0|     0|     0.00|     0|     0|     0|     0|     0.01|     0.00|       0|       0|       0| 64.43%| 0:00:00.0|  3001.9M|
+-------------------------------------------------------------------------------------------------------------------------------------------------------+
Bottom Preferred Layer:
    None
Via Pillar Rule:
    None

*** Finish DRV Fixing (cpu=0:00:00.0 real=0:00:00.0 mem=3001.9M) ***

*** DrvOpt #3 [finish] (optDesign #1) : cpu/real = 0:00:00.2/0:00:00.2 (1.0), totSession cpu/real = 0:00:51.8/0:01:34.0 (0.6), mem = 3001.9M
End: GigaOpt DRV Optimization
GigaOpt DRV: restore maxLocalDensity to 0.98

------------------------------------------------------------------
     Summary (cpu=0.00min real=0.00min mem=2943.9M)
------------------------------------------------------------------

Setup views included:
 VIEW_TYPICAL

+--------------------+---------+---------+---------+
|     Setup mode     |   all   | reg2reg | default |
+--------------------+---------+---------+---------+
|           WNS (ns):|  0.008  |  1.573  |  0.008  |
|           TNS (ns):|  0.000  |  0.000  |  0.000  |
|    Violating Paths:|    0    |    0    |    0    |
|          All Paths:|   85    |   41    |   62    |
+--------------------+---------+---------+---------+

+----------------+-------------------------------+------------------+
|                |              Real             |       Total      |
|    DRVs        +------------------+------------+------------------|
|                |  Nr nets(terms)  | Worst Vio  |  Nr nets(terms)  |
+----------------+------------------+------------+------------------+
|   max_cap      |     82 (82)      |   -0.058   |     82 (82)      |
|   max_tran     |      0 (0)       |   0.000    |      0 (0)       |
|   max_fanout   |      0 (0)       |     0      |      0 (0)       |
|   max_length   |      0 (0)       |     0      |      0 (0)       |
+----------------+------------------+------------+------------------+

Density: 64.435%
Routing Overflow: 0.00% H and 0.00% V
------------------------------------------------------------------
**optDesign ... cpu = 0:00:04, real = 0:00:20, mem = 2401.1M, totSessionCpu=0:00:52 **
GigaOpt Checkpoint: Internal reclaim -noViewPrune -rebufferOnly -costCleanup -preRouteDontEndWithRefinePlaceIncrSteinerRouteDC -force -numThreads 1 -postCTS
Info: 1 clock net  excluded from IPO operation.
**Info: (IMPSP-307): Design contains fractional 20 cells.
Begin: Area Reclaim Optimization
*** AreaOpt #2 [begin] (optDesign #1) : totSession cpu/real = 0:00:52.1/0:01:34.3 (0.6), mem = 2997.2M
Reclaim Optimization WNS Slack 0.000  TNS Slack 0.000 Density 64.43
+---------+---------+--------+--------+------------+--------+
| Density | Commits |  WNS   |  TNS   |    Real    |  Mem   |
+---------+---------+--------+--------+------------+--------+
|   64.43%|        -|   0.000|   0.000|   0:00:00.0| 3001.3M|
|   64.43%|        0|   0.000|   0.000|   0:00:00.0| 3028.4M|
+---------+---------+--------+--------+------------+--------+
Reclaim Optimization End WNS Slack 0.000  TNS Slack 0.000 Density 64.43
Bottom Preferred Layer:
    None
Via Pillar Rule:
    None

Number of times islegalLocAvaiable called = 0 skipped = 0, called in commitmove = 0, skipped in commitmove = 0
End: Core Area Reclaim Optimization (cpu = 0:00:00.4) (real = 0:00:00.0) **
*** AreaOpt #2 [finish] (optDesign #1) : cpu/real = 0:00:00.4/0:00:00.4 (1.0), totSession cpu/real = 0:00:52.5/0:01:34.7 (0.6), mem = 3028.4M
End: Area Reclaim Optimization (cpu=0:00:00, real=0:00:00, mem=2943.36M, totSessionCpu=0:00:52).
GigaOpt Checkpoint: Internal reclaim -numThreads 1 -customPhyUpdate -noGCompAndPhase -force -svrReclaim -rtrShortNets -allowDegradingShortNetRemoval -postCTS -tgtSlackMult 2 -wtns -noRouteTypeResizePolish -noViewPrune -nativePathGroupFlow -SimpCCIn
Info: 1 clock net  excluded from IPO operation.
**Info: (IMPSP-307): Design contains fractional 20 cells.
Begin: Area Reclaim Optimization
*** AreaOpt #3 [begin] (optDesign #1) : totSession cpu/real = 0:00:52.6/0:01:34.8 (0.6), mem = 3001.5M
Reclaim Optimization WNS Slack 0.008  TNS Slack 0.000 Density 64.43
+---------+---------+--------+--------+------------+--------+
| Density | Commits |  WNS   |  TNS   |    Real    |  Mem   |
+---------+---------+--------+--------+------------+--------+
|   64.43%|        -|   0.008|   0.000|   0:00:00.0| 3001.5M|
|   64.43%|        0|   0.008|   0.000|   0:00:00.0| 3002.5M|
|   64.43%|        0|   0.008|   0.000|   0:00:00.0| 3002.5M|
|   64.43%|        0|   0.008|   0.000|   0:00:00.0| 3002.5M|
|   64.43%|        0|   0.008|   0.000|   0:00:01.0| 3002.5M|
|   64.43%|        0|   0.008|   0.000|   0:00:00.0| 3002.5M|
+---------+---------+--------+--------+------------+--------+
Reclaim Optimization End WNS Slack 0.008  TNS Slack 0.000 Density 64.43
Bottom Preferred Layer:
    None
Via Pillar Rule:
    None

Number of times islegalLocAvaiable called = 0 skipped = 0, called in commitmove = 0, skipped in commitmove = 0
End: Core Area Reclaim Optimization (cpu = 0:00:00.3) (real = 0:00:01.0) **
*** Starting refinePlace (0:00:52.9 mem=3002.5M) ***
Total net bbox length = 5.851e+03 (2.833e+03 3.019e+03) (ext = 1.751e+03)
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Move report: Detail placement moves 0 insts, mean move: 0.00 um, max move: 0.00 um
        Runtime: CPU: 0:00:00.1 REAL: 0:00:00.0 MEM: 2986.5MB
Summary Report:
Instances move: 0 (out of 587 movable)
Instances flipped: 0
Mean displacement: 0.00 um
Max displacement: 0.00 um
Physical-only instances move: 0 (out of 0 movable physical-only)
Total net bbox length = 5.851e+03 (2.833e+03 3.019e+03) (ext = 1.751e+03)
Runtime: CPU: 0:00:00.1 REAL: 0:00:00.0 MEM: 2986.5MB
*** Finished refinePlace (0:00:53.0 mem=2986.5M) ***
*** maximum move = 0.00 um ***
*** Finished re-routing un-routed nets (2986.5M) ***

*** Finish Physical Update (cpu=0:00:00.1 real=0:00:00.0 mem=3005.6M) ***
*** AreaOpt #3 [finish] (optDesign #1) : cpu/real = 0:00:00.4/0:00:00.4 (1.0), totSession cpu/real = 0:00:53.0/0:01:35.3 (0.6), mem = 3005.6M
End: Area Reclaim Optimization (cpu=0:00:00, real=0:00:01, mem=2928.59M, totSessionCpu=0:00:53).
*** LocalWireReclaim #1 [begin] (optDesign #1) : totSession cpu/real = 0:00:53.2/0:01:35.4 (0.6), mem = 2928.6M
Starting local wire reclaim
**Info: (IMPSP-307): Design contains fractional 20 cells.
*** Starting refinePlace (0:00:53.2 mem=2928.6M) ***
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Max route layer is changed from 127 to 10 because there is no routing track above this layer
**WARN: [IO pin not placed] clk
**WARN: [IO pin not placed] rst_n
**WARN: [IO pin not placed] ui_in[7]
**WARN: [IO pin not placed] ui_in[6]
**WARN: [IO pin not placed] ui_in[5]
**WARN: [IO pin not placed] ui_in[4]
**WARN: [IO pin not placed] ui_in[3]
**WARN: [IO pin not placed] ui_in[2]
**WARN: [IO pin not placed] ui_in[1]
**WARN: [IO pin not placed] ui_in[0]
**WARN: [IO pin not placed] ...
**WARN: [IO pin not placed] The ratio of IO pins are not placed: 43 / 43 = 100.00%
*** Finished SKP initialization (cpu=0:00:00.0, real=0:00:00.0)***
Timing cost in AAE based: 26.2186609019381649
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Call icdpEval cleanup ...
Move report: Detail placement moves 122 insts, mean move: 2.20 um, max move: 9.69 um
        Max move on inst (g1993__9945): (46.55, 49.59) --> (44.27, 42.18)
        Runtime: CPU: 0:00:00.7 REAL: 0:00:01.0 MEM: 2915.6MB
Summary Report:
Instances move: 122 (out of 587 movable)
Instances flipped: 0
Mean displacement: 2.20 um
Max displacement: 9.69 um (Instance: g1993__9945) (46.55, 49.59) -> (44.27, 42.18)
        Length: 3 sites, height: 1 rows, site name: CoreSite, cell type: AND2X2
Physical-only instances move: 0 (out of 0 movable physical-only)
Runtime: CPU: 0:00:00.7 REAL: 0:00:01.0 MEM: 2915.6MB
*** Finished refinePlace (0:00:54.0 mem=2915.6M) ***
*** LocalWireReclaim #1 [finish] (optDesign #1) : cpu/real = 0:00:00.8/0:00:00.7 (1.0), totSession cpu/real = 0:00:54.0/0:01:36.2 (0.6), mem = 2915.6M
AAE_INFO: opIsDesignInPostRouteState() is 0
#################################################################################
# Design Stage: PreRoute
# Design Name: tt_um_Jsilicon
# Design Mode: 90nm
# Analysis Mode: MMMC Non-OCV
# Parasitics Mode: No SPEF/RCDB
# Signoff Settings: SI Off
#################################################################################
Calculate delays in Single mode...
Start delay calculation (fullDC) (1 T). (MEM=2403.35)
Total number of fetched objects 636
AAE_INFO: Total number of nets for which stage creation was skipped for all views 0
End delay calculation. (MEM=2408.35 CPU=0:00:00.1 REAL=0:00:00.0)
End delay calculation (fullDC). (MEM=2408.35 CPU=0:00:00.2 REAL=0:00:00.0)
eGR doReRoute: optGuide
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Max route layer is changed from 127 to 10 because there is no routing track above this layer
[NR-eGR] Read 620 nets ( ignored 0 )
[NR-eGR] There are 1 clock nets ( 0 with NDR ).
[NR-eGR] Layer group 1: route 620 net(s) in layer range [2, 10]
[NR-eGR] Early Global Route overflow of layer group 1: 0.00% H + 0.00% V. EstWL: 4.396600e+03um
[NR-eGR] Overflow after Early Global Route 0.00% H + 0.00% V
[NR-eGR] Total eGR-routed clock nets wire length: 177um, number of vias: 136
[NR-eGR] --------------------------------------------------------------------------
[NR-eGR]                  Length (um)  Vias
[NR-eGR] -----------------------------------
[NR-eGR]  metal1   (1H)             0  1826
[NR-eGR]  metal2   (2V)          1933  2372
[NR-eGR]  metal3   (3H)          1878   366
[NR-eGR]  metal4   (4V)           641   307
[NR-eGR]  metal5   (5H)           521     2
[NR-eGR]  metal6   (6V)             2     0
[NR-eGR]  metal7   (7H)             0     0
[NR-eGR]  metal8   (8V)             0     0
[NR-eGR]  metal9   (9H)             0     0
[NR-eGR]  metal10  (10V)            0     0
[NR-eGR] -----------------------------------
[NR-eGR]           Total         4974  4873
[NR-eGR] --------------------------------------------------------------------------
[NR-eGR] Total half perimeter of net bounding box: 5793um
[NR-eGR] Total length: 4974um, number of vias: 4873
[NR-eGR] --------------------------------------------------------------------------
[NR-eGR] Finished Early Global Route kernel ( CPU: 0.11 sec, Real: 0.12 sec, Curr Mem: 2.81 MB )
[NR-eGR] Finished Early Global Route ( CPU: 0.11 sec, Real: 0.12 sec, Curr Mem: 2.81 MB )
Extraction called for design 'tt_um_Jsilicon' of instances=587 and nets=704 using extraction engine 'preRoute' .
**WARN: (IMPEXT-3530):  The process node is not set. Use the command setDesignMode -process <process node> prior to extraction for maximum accuracy and optimal automatic threshold setting.
Type 'man IMPEXT-3530' for more detail.
PreRoute RC Extraction called for design tt_um_Jsilicon.
RC Extraction called in multi-corner(1) mode.
**WARN: (IMPEXT-6197):  The Cap table file is not specified. This will result in lower parasitic accuracy when using preRoute extraction or postRoute extraction with effort level 'low'. It is recommended to generate the Cap table file using the 'generateCapTbl' command and specify it before extraction using 'create_rc_corner/update_rc_corner -cap_table'.
Type 'man IMPEXT-6197' for more detail.
RCMode: PreRoute
      RC Corner Indexes            0
Capacitance Scaling Factor   : 1.00000
Resistance Scaling Factor    : 1.00000
Clock Cap. Scaling Factor    : 1.00000
Clock Res. Scaling Factor    : 1.00000
Shrink Factor                : 1.00000
PreRoute extraction is honoring NDR/Shielding/ExtraSpace for clock nets.
Updating RC Grid density data for preRoute extraction ...
Initializing multi-corner resistance tables ...
PreRoute RC Extraction DONE (CPU Time: 0:00:00.0  Real Time: 0:00:00.0  MEM: 2900.664M)
Compute RC Scale Done ...
[hotspot] +------------+---------------+---------------+
[hotspot] |            |   max hotspot | total hotspot |
[hotspot] +------------+---------------+---------------+
[hotspot] | normalized |          0.00 |          0.00 |
[hotspot] +------------+---------------+---------------+
Local HotSpot Analysis: normalized max congestion hotspot area = 0.00, normalized total congestion hotspot area = 0.00 (area is in unit of 4 std-cell row bins)
GigaOpt Checkpoint: Internal congRefineRouteType -postCTS -resetVeryShortNets -rescheduleForAdherence
Begin: GigaOpt Route Type Constraints Refinement
*** CongRefineRouteType #2 [begin] (optDesign #1) : totSession cpu/real = 0:00:55.0/0:01:37.2 (0.6), mem = 2900.7M
Updated routing constraints on 0 nets.
Bottom Preferred Layer:
    None
Via Pillar Rule:
    None
*** CongRefineRouteType #2 [finish] (optDesign #1) : cpu/real = 0:00:00.0/0:00:00.0 (0.0), totSession cpu/real = 0:00:55.0/0:01:37.2 (0.6), mem = 2900.7M
End: GigaOpt Route Type Constraints Refinement
skip EGR on cluster skew clock nets.
-opt_exp_set_preroute_early_power_reclaim_recovery_split_flow false
                                           # bool, default=false, private
Starting delay calculation for Setup views
AAE_INFO: opIsDesignInPostRouteState() is 0
#################################################################################
# Design Stage: PreRoute
# Design Name: tt_um_Jsilicon
# Design Mode: 90nm
# Analysis Mode: MMMC Non-OCV
# Parasitics Mode: No SPEF/RCDB
# Signoff Settings: SI Off
#################################################################################
Calculate delays in Single mode...
Start delay calculation (fullDC) (1 T). (MEM=2402.48)
**WARN: (IMPEXT-2882):  Unable to find the resistance for via 'M6_M5_via' in Cap table or LEF or OA files. The default value of 4.0 ohms is being assigned. To avoid this, check the Cap table and LEF and OA files, provide the resistance and read the files again.
Total number of fetched objects 636
AAE_INFO: Total number of nets for which stage creation was skipped for all views 0
End delay calculation. (MEM=2408.59 CPU=0:00:00.1 REAL=0:00:00.0)
End delay calculation (fullDC). (MEM=2408.59 CPU=0:00:00.1 REAL=0:00:00.0)
*** Done Building Timing Graph (cpu=0:00:00.4 real=0:00:00.0 totSessionCpu=0:00:55.5 mem=2967.3M)
Begin: GigaOpt postEco DRV Optimization
GigaOpt Checkpoint: Internal optDRV -inPostEcoStage -smallScaleFixing -maxIter 3 -max_tran -max_cap -maxLocalDensity 0.98 -numThreads 1 -preRouteDontEndWithRefinePlaceIncrSteinerRouteDC -setupTNSCostFactor 1.0 -postCTS
*** DrvOpt #4 [begin] (optDesign #1) : totSession cpu/real = 0:00:55.5/0:01:37.8 (0.6), mem = 2967.3M
Info: 1 clock net  excluded from IPO operation.
**Info: (IMPSP-307): Design contains fractional 20 cells.
        CornerforLayerOpt timing analysis view VIEW_TYPICAL has been selected for calibration
        CornerforLayerOpt timing analysis view VIEW_TYPICAL has been selected for calibration
        CornerforLayerOpt timing analysis view VIEW_TYPICAL has been selected for calibration
        CornerforLayerOpt timing analysis view VIEW_TYPICAL has been selected for calibration
+-------------------------------------------------------------------------------------------------------------------------------------------------------+
|        max-tran       |        max-cap        |  max-fanout |  max-length |       setup       |        |        |        |       |          |         |
+-------------------------------------------------------------------------------------------------------------------------------------------------------+
| nets | terms|  wViol  | nets | terms|  wViol  | nets | terms| nets | terms|   WNS   |   TNS   |  #Buf  |  #Inv  | #Resize|Density|   Real   |   Mem   |
+-------------------------------------------------------------------------------------------------------------------------------------------------------+
|     0|     0|     0.00|     0|     0|     0.00|     0|     0|     0|     0|     0.02|     0.00|       0|       0|       0| 64.43%|          |         |
|     0|     0|     0.00|     0|     0|     0.00|     0|     0|     0|     0|     0.02|     0.00|       0|       0|       0| 64.43%| 0:00:00.0|  3002.4M|
+-------------------------------------------------------------------------------------------------------------------------------------------------------+
Bottom Preferred Layer:
    None
Via Pillar Rule:
    None

*** Finish DRV Fixing (cpu=0:00:00.0 real=0:00:00.0 mem=3002.4M) ***

*** DrvOpt #4 [finish] (optDesign #1) : cpu/real = 0:00:00.1/0:00:00.1 (1.0), totSession cpu/real = 0:00:55.6/0:01:37.9 (0.6), mem = 3002.4M
End: GigaOpt postEco DRV Optimization
Running refinePlace -preserveRouting true -hardFence false
**Info: (IMPSP-307): Design contains fractional 20 cells.
*** Starting refinePlace (0:00:55.8 mem=2923.4M) ***
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Max route layer is changed from 127 to 10 because there is no routing track above this layer

Starting Small incrNP...
Density distribution unevenness ratio = 15.920%
Skipped incrNP (cpu=0:00:00.0, real=0:00:00.0, mem=2923.4M)
End of Small incrNP (cpu=0:00:00.0, real=0:00:00.0)
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Move report: Detail placement moves 0 insts, mean move: 0.00 um, max move: 0.00 um
        Runtime: CPU: 0:00:00.1 REAL: 0:00:01.0 MEM: 2907.3MB
Summary Report:
Instances move: 0 (out of 587 movable)
Instances flipped: 0
Mean displacement: 0.00 um
Max displacement: 0.00 um
Physical-only instances move: 0 (out of 0 movable physical-only)
Runtime: CPU: 0:00:00.1 REAL: 0:00:01.0 MEM: 2907.3MB
*** Finished refinePlace (0:00:55.8 mem=2907.3M) ***
#optDebug: fT-D <X 1 0 0 0>
Register exp ratio and priority group on 0 nets on 636 nets :

Active setup views:
 VIEW_TYPICAL
  Dominating endpoints: 0
  Dominating TNS: -0.000

Extraction called for design 'tt_um_Jsilicon' of instances=587 and nets=704 using extraction engine 'preRoute' .
**WARN: (IMPEXT-3530):  The process node is not set. Use the command setDesignMode -process <process node> prior to extraction for maximum accuracy and optimal automatic threshold setting.
Type 'man IMPEXT-3530' for more detail.
PreRoute RC Extraction called for design tt_um_Jsilicon.
RC Extraction called in multi-corner(1) mode.
**WARN: (IMPEXT-6197):  The Cap table file is not specified. This will result in lower parasitic accuracy when using preRoute extraction or postRoute extraction with effort level 'low'. It is recommended to generate the Cap table file using the 'generateCapTbl' command and specify it before extraction using 'create_rc_corner/update_rc_corner -cap_table'.
Type 'man IMPEXT-6197' for more detail.
RCMode: PreRoute
      RC Corner Indexes            0
Capacitance Scaling Factor   : 1.00000
Resistance Scaling Factor    : 1.00000
Clock Cap. Scaling Factor    : 1.00000
Clock Res. Scaling Factor    : 1.00000
Shrink Factor                : 1.00000
PreRoute extraction is honoring NDR/Shielding/ExtraSpace for clock nets.
Updating RC Grid density data for preRoute extraction ...
Initializing multi-corner resistance tables ...
PreRoute RC Extraction DONE (CPU Time: 0:00:00.0  Real Time: 0:00:00.0  MEM: 2971.992M)
Starting delay calculation for Setup views
AAE_INFO: opIsDesignInPostRouteState() is 0
#################################################################################
# Design Stage: PreRoute
# Design Name: tt_um_Jsilicon
# Design Mode: 90nm
# Analysis Mode: MMMC Non-OCV
# Parasitics Mode: No SPEF/RCDB
# Signoff Settings: SI Off
#################################################################################
Calculate delays in Single mode...
Start delay calculation (fullDC) (1 T). (MEM=2406.72)
Total number of fetched objects 636
AAE_INFO: Total number of nets for which stage creation was skipped for all views 0
End delay calculation. (MEM=2414.4 CPU=0:00:00.1 REAL=0:00:00.0)
End delay calculation (fullDC). (MEM=2414.4 CPU=0:00:00.2 REAL=0:00:00.0)
*** Done Building Timing Graph (cpu=0:00:00.5 real=0:00:00.0 totSessionCpu=0:00:56.5 mem=2965.5M)
OPTC: user 20.0
Reported timing to dir ./timingReports
**optDesign ... cpu = 0:00:09, real = 0:00:24, mem = 2397.1M, totSessionCpu=0:00:57 **

------------------------------------------------------------------
     optDesign Final Summary
------------------------------------------------------------------

Setup views included:
 VIEW_TYPICAL

+--------------------+---------+---------+---------+
|     Setup mode     |   all   | reg2reg | default |
+--------------------+---------+---------+---------+
|           WNS (ns):|  0.022  |  1.580  |  0.022  |
|           TNS (ns):|  0.000  |  0.000  |  0.000  |
|    Violating Paths:|    0    |    0    |    0    |
|          All Paths:|   85    |   41    |   62    |
+--------------------+---------+---------+---------+

+----------------+-------------------------------+------------------+
|                |              Real             |       Total      |
|    DRVs        +------------------+------------+------------------|
|                |  Nr nets(terms)  | Worst Vio  |  Nr nets(terms)  |
+----------------+------------------+------------+------------------+
|   max_cap      |     82 (82)      |   -0.058   |     82 (82)      |
|   max_tran     |      0 (0)       |   0.000    |      0 (0)       |
|   max_fanout   |      0 (0)       |     0      |      0 (0)       |
|   max_length   |      0 (0)       |     0      |      0 (0)       |
+----------------+------------------+------------+------------------+

Density: 64.435%
Routing Overflow: 0.00% H and 0.00% V
------------------------------------------------------------------
Begin: Collecting metrics
 -------------------------------------------------------------------------------------------------------------------------------------------------------
| Snapshot                | WNS                  | TNS                  | Density (%) | Hotspot                   | Resource               | DRVs       |
|                         | HEPG (ns) | ALL (ns) | HEPG (ns) | ALL (ns) |             | Max (bins) | Total (bins) | Real (s) | Memory (MB) | Tran | Cap |
|-------------------------+-----------+----------+-----------+----------+-------------+------------+--------------+----------+-------------+------+-----|
| initial_summary         |     1.573 |    0.008 |           |        0 |       64.45 |            |              | 0:00:01  |        2905 |    0 |  81 |
| route_type_refinement   |           |          |           |          |             |            |              | 0:00:00  |        2905 |      |     |
| simplify_netlist        |           |          |           |          |             |            |              | 0:00:01  |        2921 |      |     |
| excluded_clk_net_fixing |           |          |           |          |             |            |              | 0:00:00  |        2921 |      |     |
| drv_fixing              |     1.573 |    0.008 |         0 |        0 |       64.45 |            |              | 0:00:00  |        2921 |    0 |   0 |
| global_opt              |           |    0.008 |           |        0 |       64.45 |            |              | 0:00:01  |        2928 |      |     |
| area_reclaiming         |     1.573 |    0.008 |         0 |        0 |       64.43 |            |              | 0:00:00  |        2944 |      |     |
| drv_fixing_2            |     1.573 |    0.008 |         0 |        0 |       64.43 |            |              | 0:00:01  |        2944 |    0 |  82 |
| area_reclaiming_2       |     1.573 |    0.008 |         0 |        0 |       64.43 |            |              | 0:00:00  |        2943 |      |     |
| area_reclaiming_3       |     1.573 |    0.008 |         0 |        0 |       64.43 |            |              | 0:00:01  |        2929 |      |     |
| local_wire_reclaim      |           |          |           |          |             |            |              | 0:00:01  |        2913 |      |     |
| global_route            |           |          |           |          |             |       0.00 |         0.00 | 0:00:01  |        2901 |      |     |
| route_type_refinement_2 |           |          |           |          |             |            |              | 0:00:00  |        2901 |      |     |
| drv_eco_fixing          |     1.580 |    0.022 |         0 |        0 |       64.43 |            |              | 0:00:00  |        2923 |    0 |   0 |
| final_summary           |     1.580 |    0.022 |           |        0 |       64.43 |            |              | 0:00:01  |        2923 |    0 |  82 |
 -------------------------------------------------------------------------------------------------------------------------------------------------------
End: Collecting metrics
**optDesign ... cpu = 0:00:09, real = 0:00:25, mem = 2398.5M, totSessionCpu=0:00:57 **
**WARN: (IMPOPT-3195):  Analysis mode has changed.
Type 'man IMPOPT-3195' for more detail.
*** Finished optDesign ***
      flow.cputime  flow.realtime  timing.setup.tns  timing.setup.wns  snapshot
UM:*                                                                   final
      flow.cputime  flow.realtime  timing.setup.tns  timing.setup.wns  snapshot
UM:*                                                                   opt_design_postcts
Info: final physical memory for 2 CRR processes is 742.60MB.
Info: Summary of CRR changes:
      - Timing transform commits:       0
Info: Destroy the CCOpt slew target map.

*** Summary of all messages that are not suppressed in this session:
Severity  ID               Count  Summary
WARNING   IMPEXT-6197          2  The Cap table file is not specified. Thi...
WARNING   IMPEXT-2882          1  Unable to find the resistance for via '%...
WARNING   IMPEXT-3530          2  The process node is not set. Use the com...
WARNING   IMPOPT-3195          2  Analysis mode has changed.
WARNING   IMPOPT-665          24  %s : Net has unplaced terms or is connec...
*** Message Summary: 31 warning(s), 0 error(s)

*** optDesign #1 [finish] () : cpu/real = 0:00:09.3/0:00:29.2 (0.3), totSession cpu/real = 0:00:57.2/0:01:44.3 (0.5), mem = 2922.7M
Routing...
#WARNING (NRIF-81) When route_detail_post_route_swap_via is set to 'true', the post route via swapping step will be performed on all nets. If route_via_weight is also specified, it will swap vias to DFM vias based on via weight; otherwise it will swap vias to double cut vias.
#% Begin routeDesign (date=11/19 10:57:15, mem=2298.9M)
#routeDesign: cpu time = 00:00:00, elapsed time = 00:00:00, memory = 2298.98 (MB), peak = 2435.21 (MB)
AAE_INFO: Pre Route call back at the beginning of routeDesign
#**INFO: setDesignMode -flowEffort standard
#**INFO: setDesignMode -powerEffort none
**INFO: User settings:
setNanoRouteMode -route_detail_fix_antenna                  true
setNanoRouteMode -route_detail_post_route_swap_via          true
setNanoRouteMode -route_route_side                          front
setNanoRouteMode -route_extract_third_party_compatible      false
setNanoRouteMode -route_global_exp_timing_driven_std_delay  47.5
setExtractRCMode -engine                                    preRoute
setDelayCalMode -enable_high_fanout                         true
setDelayCalMode -enable_ideal_seq_async_pins                false
setDelayCalMode -eng_enablePrePlacedFlow                    false
setDelayCalMode -engine                                     aae
setDelayCalMode -ignoreNetLoad                              false
setDelayCalMode -socv_accuracy_mode                         low
setSIMode -separate_delta_delay_on_data                     true

#RC_TYPICAL has no qx tech file defined
#No active RC corner or QRC tech file is missing.
#**INFO: multi-cut via swapping will be performed after routing.
#**INFO: All auto set options tuned by routeDesign will be restored to their original settings on command completion.
Begin checking placement ... (start mem=2831.7M, init mem=2831.7M)
*info: Placed = 587
*info: Unplaced = 0
Placement Density:64.43%(1828/2838)
Placement Density (including fixed std cells):64.43%(1828/2838)
Finished checkPlace (total: cpu=0:00:00.0, real=0:00:00.0; vio checks: cpu=0:00:00.0, real=0:00:00.0; mem=2831.7M)

changeUseClockNetStatus Option :  -ignoreSkipRoutingNets -noFixedNetWires
*** Changed status on (0) nets in Clock.
*** End changeUseClockNetStatus (cpu=0:00:00.0, real=0:00:00.0, mem=2831.7M) ***
% Begin globalDetailRoute (date=11/19 10:57:15, mem=2299.4M)

globalDetailRoute

#Start globalDetailRoute on Wed Nov 19 10:57:15 2025
#
#Generating timing data, please wait...
#636 total nets, 620 already routed, 620 will ignore in trialRoute
**WARN: (IMPEXT-3530):  The process node is not set. Use the command setDesignMode -process <process node> prior to extraction for maximum accuracy and optimal automatic threshold setting.
**WARN: (IMPEXT-6197):  The Cap table file is not specified. This will result in lower parasitic accuracy when using preRoute extraction or postRoute extraction with effort level 'low'. It is recommended to generate the Cap table file using the 'generateCapTbl' command and specify it before extraction using 'create_rc_corner/update_rc_corner -cap_table'.
#Dump tif for version 2.1
**WARN: (IMPESI-3014):  The RC network is incomplete for net uo_out[7]. As a result, a lumped model will be used during delay calculation which may compromise timing accuracy. To resolve this, check parasitics for completeness, re-extraction may be required.
**WARN: (IMPESI-3014):  The RC network is incomplete for net uo_out[6]. As a result, a lumped model will be used during delay calculation which may compromise timing accuracy. To resolve this, check parasitics for completeness, re-extraction may be required.
**WARN: (IMPESI-3014):  The RC network is incomplete for net uo_out[5]. As a result, a lumped model will be used during delay calculation which may compromise timing accuracy. To resolve this, check parasitics for completeness, re-extraction may be required.
**WARN: (IMPESI-3014):  The RC network is incomplete for net uo_out[3]. As a result, a lumped model will be used during delay calculation which may compromise timing accuracy. To resolve this, check parasitics for completeness, re-extraction may be required.
**WARN: (IMPESI-3014):  The RC network is incomplete for net uo_out[4]. As a result, a lumped model will be used during delay calculation which may compromise timing accuracy. To resolve this, check parasitics for completeness, re-extraction may be required.
**WARN: (IMPESI-3014):  The RC network is incomplete for net uo_out[2]. As a result, a lumped model will be used during delay calculation which may compromise timing accuracy. To resolve this, check parasitics for completeness, re-extraction may be required.
**WARN: (IMPESI-3014):  The RC network is incomplete for net uo_out[1]. As a result, a lumped model will be used during delay calculation which may compromise timing accuracy. To resolve this, check parasitics for completeness, re-extraction may be required.
**WARN: (IMPESI-3014):  The RC network is incomplete for net uo_out[0]. As a result, a lumped model will be used during delay calculation which may compromise timing accuracy. To resolve this, check parasitics for completeness, re-extraction may be required.
Total number of fetched objects 636
AAE_INFO: Total number of nets for which stage creation was skipped for all views 0
End delay calculation. (MEM=2308.97 CPU=0:00:00.1 REAL=0:00:00.0)

#Generating timing data took: cpu time = 00:00:01, elapsed time = 00:00:01, memory = 2273.21 (MB), peak = 2435.21 (MB)
#Done generating timing data.
#WARNING (NRIG-1303) The congestion map does not match the GCELL grid. Clearing the congestion map.
#WARNING (NRIF-95) Option setNanoRouteMode -routeTopRoutingLayer has invalid value "0". Reset to max routing layer "10".
#Start reading timing information from file .timing_file_95123.tif.gz ...
#Read in timing information for 43 ports, 587 instances from timing file .timing_file_95123.tif.gz.
#NanoRoute Version 23.13-s082_1 NR241029-2256/23_13-UB
#WARNING (NRIF-95) Option setNanoRouteMode -routeTopRoutingLayer has invalid value "0". Reset to max routing layer "10".
#WARNING (NRIF-95) Option setNanoRouteMode -routeTopRoutingLayer has invalid value "0". Reset to max routing layer "10".
#WARNING (NRIF-95) Option setNanoRouteMode -routeTopRoutingLayer has invalid value "0". Reset to max routing layer "10".
#WARNING (NRIF-95) Option setNanoRouteMode -routeTopRoutingLayer has invalid value "0". Reset to max routing layer "10".
#Total number of trivial nets (e.g. < 2 pins) = 83 (skipped).
#Total number of routable nets = 621.
#Total number of nets in the design = 704.
#621 routable nets do not have any wires.
#621 nets will be global routed.
#WARNING (NRIF-95) Option setNanoRouteMode -routeTopRoutingLayer has invalid value "0". Reset to max routing layer "10".
#Start routing data preparation on Wed Nov 19 10:57:16 2025
#
#WARNING (NRIF-95) Option setNanoRouteMode -routeTopRoutingLayer has invalid value "0". Reset to max routing layer "10".
#WARNING (NRIF-95) Option setNanoRouteMode -routeTopRoutingLayer has invalid value "0". Reset to max routing layer "10".
#Rebuild pin access data for design.
#Initial pin access analysis.
#Detail pin access analysis.
# metal1       H   Track-Pitch = 0.19000    Line-2-Via Pitch = 0.13000
# metal2       V   Track-Pitch = 0.19000    Line-2-Via Pitch = 0.14500
# metal3       H   Track-Pitch = 0.19000    Line-2-Via Pitch = 0.14000
# metal4       V   Track-Pitch = 0.28000    Line-2-Via Pitch = 0.28000
# metal5       H   Track-Pitch = 0.28500    Line-2-Via Pitch = 0.28000
# metal6       V   Track-Pitch = 0.28000    Line-2-Via Pitch = 0.28000
# metal7       H   Track-Pitch = 0.95000    Line-2-Via Pitch = 0.80000
# metal8       V   Track-Pitch = 0.84000    Line-2-Via Pitch = 0.80000
# metal9       H   Track-Pitch = 1.71000    Line-2-Via Pitch = 1.60000
# metal10      V   Track-Pitch = 1.68000    Line-2-Via Pitch = 1.60000
#Bottom routing layer index=1(metal1), bottom routing layer for shielding=1(metal1), bottom shield layer=1(metal1)
#shield_bottom_stripe_layer=1(metal1), shield_top_stripe_layer=10(metal10)
#pin_access_rlayer=2(metal2)
#shield_top_dpt_rlayer=-1 top_rlayer=10 top_trim_metal_rlayer=-1 rlayer_lowest=1 bottom_rlayer=1
#enable_trim_layer_shield=F enable_dpt_layer_shield=F has_line_end_grid=F
#enable_dpt_layer_shield=F
#has_line_end_grid=F
#cpu time = 00:00:00, elapsed time = 00:00:00, memory = 2281.20 (MB), peak = 2435.21 (MB)
#Regenerating Ggrids automatically.
#Auto generating G-grids with size=15 tracks, using layer metal3's pitch = 0.19000.
#Using automatically generated G-grids.
#Done routing data preparation.
#cpu time = 00:00:00, elapsed time = 00:00:00, memory = 2293.54 (MB), peak = 2435.21 (MB)
#WARNING (NRIF-95) Option setNanoRouteMode -routeTopRoutingLayer has invalid value "0". Reset to max routing layer "10".
#
#Connectivity extraction summary:
#621 (88.21%) nets are without wires.
#83 nets are fixed|skipped|trivial (not extracted).
#Total number of nets = 704.
#
#
#Finished routing data preparation on Wed Nov 19 10:57:16 2025
#
#Cpu time = 00:00:00
#Elapsed time = 00:00:00
#Increased memory = 18.58 (MB)
#Total memory = 2293.71 (MB)
#Peak memory = 2435.21 (MB)
#
#
#Start global routing on Wed Nov 19 10:57:16 2025
#
#
#Start global routing initialization on Wed Nov 19 10:57:16 2025
#
#Number of eco nets is 0
#
#Start global routing data preparation on Wed Nov 19 10:57:16 2025
#
#Start routing resource analysis on Wed Nov 19 10:57:16 2025
#
#Routing resource analysis is done on Wed Nov 19 10:57:16 2025
#
#  Resource Analysis:
#
#               Routing  #Avail      #Track     #Total     %Gcell
#  Layer      Direction   Track     Blocked      Gcell    Blocked
#  --------------------------------------------------------------
#  metal1         H         203         176         650    40.00%
#  metal2         V         364          30         650     0.00%
#  metal3         H         373           6         650     0.00%
#  metal4         V         247          15         650     0.00%
#  metal5         H         247           5         650     0.00%
#  metal6         V         246          16         650     0.00%
#  metal7         H          70           5         650     0.00%
#  metal8         V          78          11         650     0.00%
#  metal9         H          41           0         650     0.00%
#  metal10        V          44           0         650     0.00%
#  --------------------------------------------------------------
#  Total                   1914       8.82%        6500     4.00%
#
#
#
#
#Global routing data preparation is done on Wed Nov 19 10:57:16 2025
#
#cpu time = 00:00:00, elapsed time = 00:00:00, memory = 2293.97 (MB), peak = 2435.21 (MB)
#
#
#Global routing initialization is done on Wed Nov 19 10:57:16 2025
#
#cpu time = 00:00:00, elapsed time = 00:00:00, memory = 2294.04 (MB), peak = 2435.21 (MB)
#
#start global routing iteration 1...
#cpu time = 00:00:00, elapsed time = 00:00:00, memory = 2295.65 (MB), peak = 2435.21 (MB)
#
#start global routing iteration 2...
#cpu time = 00:00:00, elapsed time = 00:00:00, memory = 2295.77 (MB), peak = 2435.21 (MB)
#
#
#Total number of trivial nets (e.g. < 2 pins) = 83 (skipped).
#Total number of routable nets = 621.
#Total number of nets in the design = 704.
#
#621 routable nets have routed wires.
#
#Routed nets constraints summary:
#-----------------------------
#        Rules   Unconstrained
#-----------------------------
#      Default             621
#-----------------------------
#        Total             621
#-----------------------------
#
#Routing constraints summary of the whole design:
#-----------------------------
#        Rules   Unconstrained
#-----------------------------
#      Default             621
#-----------------------------
#        Total             621
#-----------------------------
#
#WARNING (NRIF-95) Option setNanoRouteMode -routeTopRoutingLayer has invalid value "0". Reset to max routing layer "10".
#
#  Congestion Analysis: (blocked Gcells are excluded)
#
#                 OverCon
#                  #Gcell    %Gcell
#     Layer           (1)   OverCon
#  --------------------------------
#  metal1        0(0.00%)   (0.00%)
#  metal2        1(0.15%)   (0.15%)
#  metal3        0(0.00%)   (0.00%)
#  metal4        0(0.00%)   (0.00%)
#  metal5        0(0.00%)   (0.00%)
#  metal6        0(0.00%)   (0.00%)
#  metal7        0(0.00%)   (0.00%)
#  metal8        0(0.00%)   (0.00%)
#  metal9        0(0.00%)   (0.00%)
#  metal10       0(0.00%)   (0.00%)
#  --------------------------------
#     Total      1(0.02%)   (0.02%)
#
#  The worst congested Gcell overcon (routing demand over resource in number of tracks) = 1
#  Overflow after GR: 0.00% H + 0.02% V
#
#Hotspot report including placement blocked areas
[hotspot] +----------------+-------------------+-------------------+-------------------------------------+
[hotspot] |      layer     |    max hotspot    |   total hotspot   |            hotspot bbox             |
[hotspot] +----------------+-------------------+-------------------+-------------------------------------+
[hotspot] |   metal1(H)    |              0.00 |              0.00 |   (none)                            |
[hotspot] |   metal2(V)    |              0.00 |              0.00 |   (none)                            |
[hotspot] |   metal3(H)    |              0.00 |              0.00 |   (none)                            |
[hotspot] |   metal4(V)    |              0.00 |              0.00 |   (none)                            |
[hotspot] |   metal5(H)    |              0.00 |              0.00 |   (none)                            |
[hotspot] |   metal6(V)    |              0.00 |              0.00 |   (none)                            |
[hotspot] |   metal7(H)    |              0.00 |              0.00 |   (none)                            |
[hotspot] |   metal8(V)    |              0.00 |              0.00 |   (none)                            |
[hotspot] |   metal9(H)    |              0.00 |              0.00 |   (none)                            |
[hotspot] |  metal10(V)    |              0.00 |              0.00 |   (none)                            |
[hotspot] +----------------+-------------------+-------------------+-------------------------------------+
[hotspot] |      worst     |              0.00 |              0.00 |                                     |
[hotspot] +----------------+-------------------+-------------------+-------------------------------------+
[hotspot] |   all layers   |              0.00 |              0.00 |                                     |
[hotspot] +----------------+-------------------+-------------------+-------------------------------------+
Local HotSpot Analysis (blockage included) (3d): normalized congestion max/total hotspot area = 0.00/0.00 (area is in unit of 4 std-cell row bins)
#Complete Global Routing.
#
#  Routing Statistics
#
#----------------+-----------+-----+
#  Layer         | Length(um)| Vias|
#----------------+-----------+-----+
#  poly ( 0H)    |          0|    0|
#  metal1 ( 1H)  |          0| 1725|
#  metal2 ( 2V)  |       1884|  992|
#  metal3 ( 3H)  |       2046|   21|
#  metal4 ( 4V)  |        137|    0|
#  metal5 ( 5H)  |          0|    0|
#  metal6 ( 6V)  |          0|    0|
#  metal7 ( 7H)  |          0|    0|
#  metal8 ( 8V)  |          0|    0|
#  metal9 ( 9H)  |          0|    0|
#  metal10 (10V) |          0|    0|
#----------------+-----------+-----+
#  Total         |       4067| 2738|
#----------------+-----------+-----+
#
# Total half perimeter of net bounding box: 4951 um.
#WARNING (NRIF-95) Option setNanoRouteMode -routeTopRoutingLayer has invalid value "0". Reset to max routing layer "10".
#Max overcon = 1 tracks.
#Total overcon = 0.02%.
#Worst layer Gcell overcon rate = 0.00%.
#
#Global routing statistics:
#Cpu time = 00:00:00
#Elapsed time = 00:00:00
#Increased memory = 2.99 (MB)
#Total memory = 2296.70 (MB)
#Peak memory = 2435.21 (MB)
#
#Finished global routing on Wed Nov 19 10:57:16 2025
#
#
#WARNING (NRIF-95) Option setNanoRouteMode -routeTopRoutingLayer has invalid value "0". Reset to max routing layer "10".
#WARNING (NRIF-95) Option setNanoRouteMode -routeTopRoutingLayer has invalid value "0". Reset to max routing layer "10".
#cpu time = 00:00:00, elapsed time = 00:00:00, memory = 2296.70 (MB), peak = 2435.21 (MB)
#WARNING (NRIF-95) Option setNanoRouteMode -routeTopRoutingLayer has invalid value "0". Reset to max routing layer "10".
#Start Track Assignment.
#Done with 645 horizontal wires in 1 hboxes and 558 vertical wires in 1 hboxes.
#Done with 157 horizontal wires in 1 hboxes and 99 vertical wires in 1 hboxes.
#Done with 1 horizontal wires in 1 hboxes and 1 vertical wires in 1 hboxes.
#
#Track assignment summary:
# layer   (wire length)   (overlap)     (long ovlp)     (with obs/pg/clk)
#------------------------------------------------------------------------
# metal1         0.00     0.00%           0.00%           0.00%
# metal2      1877.39     0.11%           0.00%           0.05%
# metal3      1992.38     0.21%           0.00%           0.00%
# metal4       144.75     0.00%           0.00%           0.00%
# metal5         0.00     0.00%           0.00%           0.00%
# metal6         0.00     0.00%           0.00%           0.00%
# metal7         0.00     0.00%           0.00%           0.00%
# metal8         0.00     0.00%           0.00%           0.00%
# metal9         0.00     0.00%           0.00%           0.00%
# metal10        0.00     0.00%           0.00%           0.00%
#------------------------------------------------------------------------
# All        4014.52      0.15%           0.00%           0.00%
#Complete Track Assignment.
#
#  Routing Statistics
#
#----------------+-----------+-----+
#  Layer         | Length(um)| Vias|
#----------------+-----------+-----+
#  poly ( 0H)    |          0|    0|
#  metal1 ( 1H)  |          0| 1725|
#  metal2 ( 2V)  |       1865|  992|
#  metal3 ( 3H)  |       1972|   21|
#  metal4 ( 4V)  |        145|    0|
#  metal5 ( 5H)  |          0|    0|
#  metal6 ( 6V)  |          0|    0|
#  metal7 ( 7H)  |          0|    0|
#  metal8 ( 8V)  |          0|    0|
#  metal9 ( 9H)  |          0|    0|
#  metal10 (10V) |          0|    0|
#----------------+-----------+-----+
#  Total         |       3981| 2738|
#----------------+-----------+-----+
#
# Total half perimeter of net bounding box: 4951 um.
#cpu time = 00:00:00, elapsed time = 00:00:00, memory = 2297.02 (MB), peak = 2435.21 (MB)
#
#Routing data preparation, pin analysis, global routing and track assignment statistics:
#Cpu time = 00:00:00
#Elapsed time = 00:00:00
#Increased memory = 21.98 (MB)
#Total memory = 2297.02 (MB)
#Peak memory = 2435.21 (MB)
#WARNING (NRIF-95) Option setNanoRouteMode -routeTopRoutingLayer has invalid value "0". Reset to max routing layer "10".
#WARNING (NRIF-95) Option setNanoRouteMode -routeTopRoutingLayer has invalid value "0". Reset to max routing layer "10".
#WARNING (NRIF-95) Option setNanoRouteMode -routeTopRoutingLayer has invalid value "0". Reset to max routing layer "10".
#WARNING (NRIF-95) Option setNanoRouteMode -routeTopRoutingLayer has invalid value "0". Reset to max routing layer "10".
#
#Start Detail Routing..
#start initial detail routing ...
#   number of violations = 12
#
#  By Layer and Type:
#
#---------+-------+------+-------+
#  -      | MetSpc| Short| Totals|
#---------+-------+------+-------+
#  metal1 |      1|    11|     12|
#  Totals |      1|    11|     12|
#---------+-------+------+-------+
#
#cpu time = 00:00:03, elapsed time = 00:00:03, memory = 2307.47 (MB), peak = 2435.21 (MB)
#start 1st optimization iteration ...
#   number of violations = 0
#cpu time = 00:00:00, elapsed time = 00:00:00, memory = 2306.76 (MB), peak = 2435.21 (MB)
#Complete Detail Routing.
#
#  Routing Statistics
#
#----------------+-----------+-----+
#  Layer         | Length(um)| Vias|
#----------------+-----------+-----+
#  poly ( 0H)    |          0|    0|
#  metal1 ( 1H)  |        148| 1884|
#  metal2 ( 2V)  |       2246| 1237|
#  metal3 ( 3H)  |       1916|  108|
#  metal4 ( 4V)  |        380|    0|
#  metal5 ( 5H)  |          0|    0|
#  metal6 ( 6V)  |          0|    0|
#  metal7 ( 7H)  |          0|    0|
#  metal8 ( 8V)  |          0|    0|
#  metal9 ( 9H)  |          0|    0|
#  metal10 (10V) |          0|    0|
#----------------+-----------+-----+
#  Total         |       4690| 3229|
#----------------+-----------+-----+
#
# Total half perimeter of net bounding box: 4951 um.
#Total number of DRC violations = 0
#Cpu time = 00:00:03
#Elapsed time = 00:00:03
#Increased memory = 8.18 (MB)
#Total memory = 2305.20 (MB)
#Peak memory = 2435.21 (MB)
#WARNING (NRIF-95) Option setNanoRouteMode -routeTopRoutingLayer has invalid value "0". Reset to max routing layer "10".
#WARNING (NRIF-95) Option setNanoRouteMode -routeTopRoutingLayer has invalid value "0". Reset to max routing layer "10".
#
#Start Post Route via swapping...
#99.85% of area are rerouted by ECO routing.
#   number of violations = 0
#cpu time = 00:00:00, elapsed time = 00:00:00, memory = 2306.03 (MB), peak = 2435.21 (MB)
#CELL_VIEW tt_um_Jsilicon,init has no DRC violation.
#Total number of DRC violations = 0
#No via is swapped.
#Post Route via swapping is done.
#
#  Routing Statistics
#
#----------------+-----------+-----+
#  Layer         | Length(um)| Vias|
#----------------+-----------+-----+
#  poly ( 0H)    |          0|    0|
#  metal1 ( 1H)  |        148| 1884|
#  metal2 ( 2V)  |       2246| 1237|
#  metal3 ( 3H)  |       1916|  108|
#  metal4 ( 4V)  |        380|    0|
#  metal5 ( 5H)  |          0|    0|
#  metal6 ( 6V)  |          0|    0|
#  metal7 ( 7H)  |          0|    0|
#  metal8 ( 8V)  |          0|    0|
#  metal9 ( 9H)  |          0|    0|
#  metal10 (10V) |          0|    0|
#----------------+-----------+-----+
#  Total         |       4690| 3229|
#----------------+-----------+-----+
#
# Total half perimeter of net bounding box: 4951 um.
#WARNING (EMS-27) Message (NRIF-95) has exceeded the current message display limit of 20.
#To increase the message display limit, refer to the product command reference manual.
#
#Start Post Route wire spreading..
#
#Start DRC checking..
#   number of violations = 0
#cpu time = 00:00:00, elapsed time = 00:00:00, memory = 2305.60 (MB), peak = 2435.21 (MB)
#CELL_VIEW tt_um_Jsilicon,init has no DRC violation.
#Total number of DRC violations = 0
#
#Start data preparation for wire spreading...
#
#Data preparation is done on Wed Nov 19 10:57:19 2025
#
#
#Start Post Route Wire Spread.
#Done with 143 horizontal wires in 2 hboxes and 100 vertical wires in 2 hboxes.
#Complete Post Route Wire Spread.
#
#
#  Routing Statistics
#
#----------------+-----------+-----+
#  Layer         | Length(um)| Vias|
#----------------+-----------+-----+
#  poly ( 0H)    |          0|    0|
#  metal1 ( 1H)  |        148| 1884|
#  metal2 ( 2V)  |       2263| 1237|
#  metal3 ( 3H)  |       1966|  108|
#  metal4 ( 4V)  |        385|    0|
#  metal5 ( 5H)  |          0|    0|
#  metal6 ( 6V)  |          0|    0|
#  metal7 ( 7H)  |          0|    0|
#  metal8 ( 8V)  |          0|    0|
#  metal9 ( 9H)  |          0|    0|
#  metal10 (10V) |          0|    0|
#----------------+-----------+-----+
#  Total         |       4763| 3229|
#----------------+-----------+-----+
#
# Total half perimeter of net bounding box: 4951 um.
#
#Start DRC checking..
#   number of violations = 0
#cpu time = 00:00:00, elapsed time = 00:00:00, memory = 2305.65 (MB), peak = 2435.21 (MB)
#CELL_VIEW tt_um_Jsilicon,init has no DRC violation.
#Total number of DRC violations = 0
#   number of violations = 0
#cpu time = 00:00:00, elapsed time = 00:00:00, memory = 2304.40 (MB), peak = 2435.21 (MB)
#CELL_VIEW tt_um_Jsilicon,init has no DRC violation.
#Total number of DRC violations = 0
#Post Route wire spread is done.
#
#  Routing Statistics
#
#----------------+-----------+-----+
#  Layer         | Length(um)| Vias|
#----------------+-----------+-----+
#  poly ( 0H)    |          0|    0|
#  metal1 ( 1H)  |        148| 1884|
#  metal2 ( 2V)  |       2263| 1237|
#  metal3 ( 3H)  |       1966|  108|
#  metal4 ( 4V)  |        385|    0|
#  metal5 ( 5H)  |          0|    0|
#  metal6 ( 6V)  |          0|    0|
#  metal7 ( 7H)  |          0|    0|
#  metal8 ( 8V)  |          0|    0|
#  metal9 ( 9H)  |          0|    0|
#  metal10 (10V) |          0|    0|
#----------------+-----------+-----+
#  Total         |       4763| 3229|
#----------------+-----------+-----+
#
# Total half perimeter of net bounding box: 4951 um.
#detailRoute Statistics:
#Cpu time = 00:00:04
#Elapsed time = 00:00:04
#Increased memory = 7.38 (MB)
#Total memory = 2304.40 (MB)
#Peak memory = 2435.21 (MB)
#
#globalDetailRoute statistics:
#Cpu time = 00:00:05
#Elapsed time = 00:00:05
#Increased memory = 4.47 (MB)
#Total memory = 2303.98 (MB)
#Peak memory = 2435.21 (MB)
#Number of warnings = 22
#Total number of warnings = 23
#Number of fails = 0
#Total number of fails = 0
#Complete globalDetailRoute on Wed Nov 19 10:57:20 2025
#
% End globalDetailRoute (date=11/19 10:57:20, total cpu=0:00:04.9, real=0:00:05.0, peak res=2303.2M, current mem=2303.2M)
#Default setup view is reset to VIEW_TYPICAL.
#Default setup view is reset to VIEW_TYPICAL.
AAE_INFO: Post Route call back at the end of routeDesign
#routeDesign: cpu time = 00:00:05, elapsed time = 00:00:05, memory = 2297.87 (MB), peak = 2435.21 (MB)
#
#  Scalability Statistics
#
#----------------------------+---------+-------------+------------+
#  routeDesign               | cpu time| elapsed time| scalability|
#----------------------------+---------+-------------+------------+
#  Pre Callback              | 00:00:00|     00:00:00|         1.0|
#  Post Callback             | 00:00:00|     00:00:00|         1.0|
#  Timing Data Generation    | 00:00:01|     00:00:01|         1.0|
#  DB Import                 | 00:00:00|     00:00:00|         1.0|
#  DB Export                 | 00:00:00|     00:00:00|         1.0|
#  Cell Pin Access           | 00:00:00|     00:00:00|         1.0|
#  Data Preparation          | 00:00:00|     00:00:00|         1.0|
#  Global Routing            | 00:00:00|     00:00:00|         1.0|
#  Track Assignment          | 00:00:00|     00:00:00|         1.0|
#  Detail Routing            | 00:00:03|     00:00:03|         1.0|
#  Post Route Via Swapping   | 00:00:00|     00:00:00|         1.0|
#  Post Route Wire Spreading | 00:00:01|     00:00:01|         1.0|
#  Entire Command            | 00:00:05|     00:00:05|         1.0|
#----------------------------+---------+-------------+------------+
#

*** Summary of all messages that are not suppressed in this session:
Severity  ID               Count  Summary
WARNING   IMPEXT-6197          1  The Cap table file is not specified. Thi...
WARNING   IMPEXT-3530          1  The process node is not set. Use the com...
WARNING   IMPESI-3014          8  The RC network is incomplete for net %s....
WARNING   NRIG-1303            1  The congestion map does not match the GC...
WARNING   NRIF-95             30  Option setNanoRouteMode -routeTopRouting...
*** Message Summary: 41 warning(s), 0 error(s)

#% End routeDesign (date=11/19 10:57:20, total cpu=0:00:05.2, real=0:00:05.0, peak res=2303.2M, current mem=2297.9M)
Post-Route Optimization...
**optDesign ... cpu = 0:00:00, real = 0:00:00, mem = 2297.9M, totSessionCpu=0:01:02 **
**WARN: (IMPOPT-576):   24 nets have unplaced terms.
*** optDesign #2 [begin] () : totSession cpu/real = 0:01:02.5/0:01:49.6 (0.6), mem = 2801.9M
GigaOpt running with 1 threads.
*** InitOpt #1 [begin] (optDesign #2) : totSession cpu/real = 0:01:02.5/0:01:49.6 (0.6), mem = 2801.9M
**INFO: User settings:
setNanoRouteMode -route_detail_fix_antenna                                                true
setNanoRouteMode -route_detail_post_route_swap_via                                        true
setNanoRouteMode -route_extract_third_party_compatible                                    false
setNanoRouteMode -route_global_exp_timing_driven_std_delay                                47.5
setNanoRouteMode -route_global_exp_timing_driven_use_tif_timing_engine_for_import_design  false
setExtractRCMode -engine                                                                  preRoute
setUsefulSkewMode -opt_skew_eco_route                                                     false
setDelayCalMode -enable_high_fanout                                                       true
setDelayCalMode -enable_ideal_seq_async_pins                                              false
setDelayCalMode -eng_enablePrePlacedFlow                                                  false
setDelayCalMode -engine                                                                   aae
setDelayCalMode -ignoreNetLoad                                                            false
setDelayCalMode -socv_accuracy_mode                                                       low
setOptMode -opt_view_pruning_setup_views_active_list                                      { VIEW_TYPICAL }
setOptMode -opt_new_inst_prefix                                                           POSTROUTE
setOptMode -opt_view_pruning_setup_views_persistent_list                                  { VIEW_TYPICAL}
setOptMode -opt_view_pruning_tdgr_setup_views_persistent_list                             { VIEW_TYPICAL}
setOptMode -opt_drv_margin                                                                0
setOptMode -opt_drv                                                                       true
setOptMode -opt_resize_flip_flops                                                         true
setOptMode -opt_setup_target_slack                                                        0
setSIMode -separate_delta_delay_on_data                                                   true
setPlaceMode -place_global_cong_effort                                                    high
setPlaceMode -timingDriven                                                                true
setAnalysisMode -analysisType                                                             single
setAnalysisMode -checkType                                                                setup
setAnalysisMode -clkSrcPath                                                               true
setAnalysisMode -clockPropagation                                                         sdcControl
setAnalysisMode -usefulSkew                                                               true
setAnalysisMode -virtualIPO                                                               false

**INFO: setDesignMode -flowEffort standard -> setting 'setOptMode -allEndPoints true' for the duration of this command.
Disable merging buffers from different footprints for postRoute code for non-MSV designs
Need call spDPlaceInit before registerPrioInstLoc.
Switching SI Aware to true by default in postroute mode
AAE_INFO: switching setDelayCal -siAware from false to true ...
AAE_INFO: The setting is changed from false to true in setDelayCalMode -SIAware
**Info: (IMPSP-307): Design contains fractional 20 cells.
**WARN: (IMPOPT-665):   clk : Net has unplaced terms or is connected to uplaced instances in design.
Type 'man IMPOPT-665' for more detail.
**WARN: (IMPOPT-665):   rst_n : Net has unplaced terms or is connected to uplaced instances in design.
Type 'man IMPOPT-665' for more detail.
**WARN: (IMPOPT-665):   ui_in[7] : Net has unplaced terms or is connected to uplaced instances in design.
Type 'man IMPOPT-665' for more detail.
**WARN: (IMPOPT-665):   ui_in[6] : Net has unplaced terms or is connected to uplaced instances in design.
Type 'man IMPOPT-665' for more detail.
**WARN: (IMPOPT-665):   ui_in[5] : Net has unplaced terms or is connected to uplaced instances in design.
Type 'man IMPOPT-665' for more detail.
**WARN: (IMPOPT-665):   ui_in[4] : Net has unplaced terms or is connected to uplaced instances in design.
Type 'man IMPOPT-665' for more detail.
**WARN: (IMPOPT-665):   ui_in[3] : Net has unplaced terms or is connected to uplaced instances in design.
Type 'man IMPOPT-665' for more detail.
**WARN: (IMPOPT-665):   ui_in[2] : Net has unplaced terms or is connected to uplaced instances in design.
Type 'man IMPOPT-665' for more detail.
**WARN: (IMPOPT-665):   ui_in[1] : Net has unplaced terms or is connected to uplaced instances in design.
Type 'man IMPOPT-665' for more detail.
**WARN: (IMPOPT-665):   ui_in[0] : Net has unplaced terms or is connected to uplaced instances in design.
Type 'man IMPOPT-665' for more detail.
**WARN: (IMPOPT-665):   uio_in[7] : Net has unplaced terms or is connected to uplaced instances in design.
Type 'man IMPOPT-665' for more detail.
**WARN: (IMPOPT-665):   uio_in[6] : Net has unplaced terms or is connected to uplaced instances in design.
Type 'man IMPOPT-665' for more detail.
**WARN: (IMPOPT-665):   uio_in[5] : Net has unplaced terms or is connected to uplaced instances in design.
Type 'man IMPOPT-665' for more detail.
**WARN: (IMPOPT-665):   uio_in[4] : Net has unplaced terms or is connected to uplaced instances in design.
Type 'man IMPOPT-665' for more detail.
**WARN: (IMPOPT-665):   ena : Net has unplaced terms or is connected to uplaced instances in design.
Type 'man IMPOPT-665' for more detail.
**WARN: (IMPOPT-665):   uo_out[7] : Net has unplaced terms or is connected to uplaced instances in design.
Type 'man IMPOPT-665' for more detail.
**WARN: (IMPOPT-665):   uo_out[6] : Net has unplaced terms or is connected to uplaced instances in design.
Type 'man IMPOPT-665' for more detail.
**WARN: (IMPOPT-665):   uo_out[5] : Net has unplaced terms or is connected to uplaced instances in design.
Type 'man IMPOPT-665' for more detail.
**WARN: (IMPOPT-665):   uo_out[4] : Net has unplaced terms or is connected to uplaced instances in design.
Type 'man IMPOPT-665' for more detail.
**WARN: (IMPOPT-665):   uo_out[3] : Net has unplaced terms or is connected to uplaced instances in design.
Type 'man IMPOPT-665' for more detail.
**WARN: (EMS-27):       Message (IMPOPT-665) has exceeded the current message display limit of 20.
To increase the message display limit, refer to the product command reference manual.
**WARN: (IMPOPT-7320):  Glitch fixing has been disabled since glitch reporting is disabled. Glitch reporting can be enabled using command setSIMode -enable_glitch_report true
Info: Using SynthesisEngine executable '/tools/cadence/DDI231/INNOVUS231/bin/innovus_'.
      SynthesisEngine workers will not check out additional licenses.
**INFO: Using Advanced Metric Collection system.
**optDesign ... cpu = 0:00:00, real = 0:00:16, mem = 2314.9M, totSessionCpu=0:01:03 **
Existing Dirty Nets : 0
New Signature Flow (optDesignCheckOptions) ....
#Taking db snapshot
#Taking db snapshot ... done
**Info: (IMPSP-307): Design contains fractional 20 cells.
Begin checking placement ... (start mem=2813.9M, init mem=2813.9M)
*info: Placed = 587
*info: Unplaced = 0
Placement Density:64.43%(1828/2838)
Placement Density (including fixed std cells):64.43%(1828/2838)
Finished checkPlace (total: cpu=0:00:00.0, real=0:00:00.0; vio checks: cpu=0:00:00.0, real=0:00:00.0; mem=2813.9M)
#optDebug: { P: 90 W: 3201 FE: standard PE: none LDR: 1}

**ERROR: (IMPOPT-6080): AAE-SI Optimization can only be turned on when the timing analysis mode is set to OCV.

      flow.cputime  flow.realtime  timing.setup.tns  timing.setup.wns  snapshot
UM:*                                                                   final
      flow.cputime  flow.realtime  timing.setup.tns  timing.setup.wns  snapshot
UM:*                                                                   opt_design_postroute
Info: final physical memory for 2 CRR processes is 737.90MB.
Info: Summary of CRR changes:
      - Timing transform commits:       0
Info: Destroy the CCOpt slew target map.

*** Summary of all messages that are not suppressed in this session:
Severity  ID               Count  Summary
WARNING   IMPOPT-665          24  %s : Net has unplaced terms or is connec...
WARNING   IMPOPT-7320          1  Glitch fixing has been disabled since gl...
ERROR     IMPOPT-6080          1  AAE-SI Optimization can only be turned o...
*** Message Summary: 25 warning(s), 1 error(s)

*** InitOpt #1 [finish] (optDesign #2) : cpu/real = 0:00:00.6/0:00:24.1 (0.0), totSession cpu/real = 0:01:03.1/0:02:13.7 (0.5), mem = 2813.9M
*** optDesign #2 [finish] () : cpu/real = 0:00:00.6/0:00:24.1 (0.0), totSession cpu/real = 0:01:03.1/0:02:13.7 (0.5), mem = 2813.9M
Adding Filler Cells...
**WARN: (IMPSP-5123):   Cell FILL* is not found.
Type 'man IMPSP-5123' for more detail.
**WARN: (IMPSP-5217):   addFiller command is running on a postRoute database. It is recommended to be followed by ecoRoute -target command to make the DRC clean.
Type 'man IMPSP-5217' for more detail.
**Info: (IMPSP-2055): Transparent Filler Flow is OFF !

**ERROR: (IMPSP-5125):  No filler cell provided.
Type 'man IMPSP-5125' for more detail.
Generating Reports...
 *** Starting Verify Geometry (MEM: 2813.9) ***

**WARN: (IMPVFG-257):   setVerifyGeometryMode/verifyGeometry command is obsolete and should not be used any more. It still works in this release but will be removed in future release. You should change to use set_verify_drc_mode/verify_drc which is the replacement tool for verifyGeometry.
  VERIFY GEOMETRY ...... Starting Verification
  VERIFY GEOMETRY ...... Initializing
  VERIFY GEOMETRY ...... Deleting Existing Violations
  VERIFY GEOMETRY ...... Creating Sub-Areas
                  ...... bin size: 2080
  VERIFY GEOMETRY ...... SubArea : 1 of 1
  VERIFY GEOMETRY ...... Cells          :  0 Viols.
  VERIFY GEOMETRY ...... SameNet        :  0 Viols.
  VERIFY GEOMETRY ...... Wiring         :  0 Viols.
  VERIFY GEOMETRY ...... Antenna        :  0 Viols.
VG: elapsed time: 0.00
Begin Summary ...
  Cells       : 0
  SameNet     : 0
  Wiring      : 0
  Antenna     : 0
  Short       : 0
  Overlap     : 0
End Summary

  Verification Complete : 0 Viols.  0 Wrngs.

**********End: VERIFY GEOMETRY**********
 *** verify geometry (CPU: 0:00:00.1  MEM: 359.6M)

VERIFY_CONNECTIVITY use new engine.

******** Start: VERIFY CONNECTIVITY ********
Start Time: Wed Nov 19 10:57:44 2025

Design Name: tt_um_Jsilicon
Database Units: 2000
Design Boundary: (0.0000, 0.0000) (74.8600, 72.0100)
Error Limit = 1000; Warning Limit = 50
Check all nets
**WARN: (IMPVFC-97):    IO pin clk of net clk has not been assigned. Please make sure it is assigned and rerun verifyConnectivity.
**WARN: (IMPVFC-97):    IO pin rst_n of net rst_n has not been assigned. Please make sure it is assigned and rerun verifyConnectivity.
**WARN: (IMPVFC-97):    IO pin ui_in[7] of net ui_in[7] has not been assigned. Please make sure it is assigned and rerun verifyConnectivity.
**WARN: (IMPVFC-97):    IO pin ui_in[6] of net ui_in[6] has not been assigned. Please make sure it is assigned and rerun verifyConnectivity.
**WARN: (IMPVFC-97):    IO pin ui_in[5] of net ui_in[5] has not been assigned. Please make sure it is assigned and rerun verifyConnectivity.
**WARN: (IMPVFC-97):    IO pin ui_in[4] of net ui_in[4] has not been assigned. Please make sure it is assigned and rerun verifyConnectivity.
**WARN: (IMPVFC-97):    IO pin ui_in[3] of net ui_in[3] has not been assigned. Please make sure it is assigned and rerun verifyConnectivity.
**WARN: (IMPVFC-97):    IO pin ui_in[2] of net ui_in[2] has not been assigned. Please make sure it is assigned and rerun verifyConnectivity.
**WARN: (IMPVFC-97):    IO pin ui_in[1] of net ui_in[1] has not been assigned. Please make sure it is assigned and rerun verifyConnectivity.
**WARN: (IMPVFC-97):    IO pin ui_in[0] of net ui_in[0] has not been assigned. Please make sure it is assigned and rerun verifyConnectivity.
**WARN: (IMPVFC-97):    IO pin uio_in[7] of net uio_in[7] has not been assigned. Please make sure it is assigned and rerun verifyConnectivity.
**WARN: (IMPVFC-97):    IO pin uio_in[6] of net uio_in[6] has not been assigned. Please make sure it is assigned and rerun verifyConnectivity.
**WARN: (IMPVFC-97):    IO pin uio_in[5] of net uio_in[5] has not been assigned. Please make sure it is assigned and rerun verifyConnectivity.
**WARN: (IMPVFC-97):    IO pin uio_in[4] of net uio_in[4] has not been assigned. Please make sure it is assigned and rerun verifyConnectivity.
**WARN: (IMPVFC-97):    IO pin uio_in[3] of net uio_in[3] has not been assigned. Please make sure it is assigned and rerun verifyConnectivity.
**WARN: (IMPVFC-97):    IO pin uio_in[2] of net uio_in[2] has not been assigned. Please make sure it is assigned and rerun verifyConnectivity.
**WARN: (IMPVFC-97):    IO pin uio_in[1] of net uio_in[1] has not been assigned. Please make sure it is assigned and rerun verifyConnectivity.
**WARN: (IMPVFC-97):    IO pin uio_in[0] of net uio_in[0] has not been assigned. Please make sure it is assigned and rerun verifyConnectivity.
**WARN: (IMPVFC-97):    IO pin ena of net ena has not been assigned. Please make sure it is assigned and rerun verifyConnectivity.
**WARN: (IMPVFC-97):    IO pin uio_oe[7] of net uio_oe[7] has not been assigned. Please make sure it is assigned and rerun verifyConnectivity.
**WARN: (EMS-27):       Message (IMPVFC-97) has exceeded the current message display limit of 20.
To increase the message display limit, refer to the product command reference manual.
Net vdd: dangling Wire.
Net gnd: dangling Wire.

Begin Summary
    27 Problem(s) (IMPVFC-94): The net has dangling wire(s).
    27 total info(s) created.
End Summary

End Time: Wed Nov 19 10:57:44 2025
Time Elapsed: 0:00:00.0

******** End: VERIFY CONNECTIVITY ********
  Verification Complete : 27 Viols.  0 Wrngs.
  (CPU Time: 0:00:00.0  MEM: 0.000M)

AAE_INFO: opIsDesignInPostRouteState() is 1
AAE_INFO: deleting AAE DB due to opIsDesignInPostRouteState() is changed ...
AAE DB initialization (MEM=2422.742188 CPU=0:00:00.0 REAL=0:00:00.0)
AAE_INFO: resetNetProps viewIdx 0
Starting SI iteration 1 using Infinite Timing Windows
#################################################################################
# Design Stage: PostRoute
# Design Name: tt_um_Jsilicon
# Design Mode: 90nm
# Analysis Mode: MMMC Non-OCV
# Parasitics Mode: No SPEF/RCDB
# Signoff Settings: SI On
#################################################################################
Extraction called for design 'tt_um_Jsilicon' of instances=587 and nets=704 using extraction engine 'postRoute' at effort level 'low' .
**WARN: (IMPEXT-3530):  The process node is not set. Use the command setDesignMode -process <process node> prior to extraction for maximum accuracy and optimal automatic threshold setting.
Type 'man IMPEXT-3530' for more detail.
PostRoute (effortLevel low) RC Extraction called for design tt_um_Jsilicon.
RC Extraction called in multi-corner(1) mode.
**WARN: (IMPEXT-6197):  The Cap table file is not specified. This will result in lower parasitic accuracy when using preRoute extraction or postRoute extraction with effort level 'low'. It is recommended to generate the Cap table file using the 'generateCapTbl' command and specify it before extraction using 'create_rc_corner/update_rc_corner -cap_table'.
Type 'man IMPEXT-6197' for more detail.
**WARN: (IMPEXT-3032):  Because the cap table file was not provided, it will be created internally with the following process info:
* Layer Id             : 1 - M1
      Thickness        : 0.6
      Min Width        : 0.065
      Layer Dielectric : 4.1
* Layer Id             : 2 - M2
      Thickness        : 0.6
      Min Width        : 0.07
      Layer Dielectric : 4.1
* Layer Id             : 3 - M3
      Thickness        : 0.6
      Min Width        : 0.07
      Layer Dielectric : 4.1
* Layer Id             : 4 - M4
      Thickness        : 0.6
      Min Width        : 0.14
      Layer Dielectric : 4.1
* Layer Id             : 5 - M5
      Thickness        : 0.6
      Min Width        : 0.14
      Layer Dielectric : 4.1
* Layer Id             : 6 - M6
      Thickness        : 0.6
      Min Width        : 0.14
      Layer Dielectric : 4.1
* Layer Id             : 7 - M7
      Thickness        : 0.6
      Min Width        : 0.4
      Layer Dielectric : 4.1
* Layer Id             : 8 - M8
      Thickness        : 0.6
      Min Width        : 0.4
      Layer Dielectric : 4.1
* Layer Id             : 9 - M9
      Thickness        : 0.6
      Min Width        : 0.8
      Layer Dielectric : 4.1
* Layer Id             : 10 - M10
      Thickness        : 1
      Min Width        : 0.8
      Layer Dielectric : 4.1
extractDetailRC Option : -outfile /home/student001/JSilicon2/work/pnr/innovus_temp_95123_b150d23f-4499-44eb-9146-ed97469e7d45_gjchamber_student001_0rY64f/tt_um_Jsilicon_95123_b150d23f-4499-44eb-9146-ed97469e7d45_QnLloS.rcdb.d  -basic
RC Mode: PostRoute -effortLevel low [Basic CapTable, LEF Resistances]
      RC Corner Indexes            0
Capacitance Scaling Factor   : 1.00000
Coupling Cap. Scaling Factor : 1.00000
Resistance Scaling Factor    : 1.00000
Clock Cap. Scaling Factor    : 1.00000
Clock Res. Scaling Factor    : 1.00000
Shrink Factor                : 1.00000
Initializing multi-corner resistance tables ...
Checking LVS Completed (CPU Time= 0:00:00.0  MEM= 3237.5M)
Extracted 10.0289% (CPU Time= 0:00:00.1  MEM= 3285.5M)
Extracted 20.0217% (CPU Time= 0:00:00.1  MEM= 3285.5M)
Extracted 30.0325% (CPU Time= 0:00:00.1  MEM= 3285.5M)
Extracted 40.0253% (CPU Time= 0:00:00.1  MEM= 3285.5M)
Extracted 50.0361% (CPU Time= 0:00:00.1  MEM= 3285.5M)
Extracted 60.0289% (CPU Time= 0:00:00.1  MEM= 3285.5M)
Extracted 70.0217% (CPU Time= 0:00:00.1  MEM= 3285.5M)
Extracted 80.0325% (CPU Time= 0:00:00.1  MEM= 3285.5M)
Extracted 90.0253% (CPU Time= 0:00:00.1  MEM= 3285.5M)
Extracted 100% (CPU Time= 0:00:00.1  MEM= 3285.5M)
Number of Extracted Resistors     : 8754
Number of Extracted Ground Cap.   : 9306
Number of Extracted Coupling Cap. : 14588
Filtering XCap in 'relativeOnly' mode using values relative_c_threshold=0.03 and total_c_threshold=5fF.
Checking LVS Completed (CPU Time= 0:00:00.0  MEM= 3253.5M)
PostRoute (effortLevel low) RC Extraction DONE (CPU Time: 0:00:00.3  Real Time: 0:00:00.0  MEM: 3253.531M)
AAE_INFO: 1 threads acquired from CTE.
Calculate delays in Single mode...
Start delay calculation (fullDC) (1 T). (MEM=2444.35)
Initializing multi-corner resistance tables ...
siFlow : Timing analysis mode is single, using late cdB files
siFlow : Timing analysis mode is single, using late cdB files
Total number of fetched objects 636
AAE_INFO: Total number of nets for which stage creation was skipped for all views 0
AAE_INFO-618: Total number of nets in the design is 704,  90.3 percent of the nets selected for SI analysis
End delay calculation. (MEM=2447.47 CPU=0:00:00.1 REAL=0:00:00.0)
End delay calculation (fullDC). (MEM=2446.68 CPU=0:00:00.3 REAL=0:00:00.0)
Save waveform /home/student001/JSilicon2/work/pnr/innovus_temp_95123_b150d23f-4499-44eb-9146-ed97469e7d45_gjchamber_student001_0rY64f/.AAE_zB5qg5/.AAE_95123_b150d23f-4499-44eb-9146-ed97469e7d45/waveform.data...
Loading CTE timing window with TwFlowType 0...(CPU = 0:00:00.0, REAL = 0:00:00.0, MEM = 2444.9M)
Add other clocks and setupCteToAAEClockMapping during iter 1
Loading CTE timing window is completed (CPU = 0:00:00.0, REAL = 0:00:00.0, MEM = 2445.1M)
Starting SI iteration 2
Calculate delays in Single mode...
Start delay calculation (fullDC) (1 T). (MEM=2358.97)
Total number of fetched objects 636
AAE_INFO: Total number of nets for which stage creation was skipped for all views 0
AAE_INFO-618: Total number of nets in the design is 704,  1.8 percent of the nets selected for SI analysis
End delay calculation. (MEM=2364.16 CPU=0:00:00.0 REAL=0:00:00.0)
End delay calculation (fullDC). (MEM=2364.16 CPU=0:00:00.0 REAL=0:00:00.0)
AAE_INFO: opIsDesignInPostRouteState() is 1
AAE_INFO: resetNetProps viewIdx 0
Starting SI iteration 1 using Infinite Timing Windows
#################################################################################
# Design Stage: PostRoute
# Design Name: tt_um_Jsilicon
# Design Mode: 90nm
# Analysis Mode: MMMC Non-OCV
# Parasitics Mode: SPEF/RCDB
# Signoff Settings: SI On
#################################################################################
AAE_INFO: 1 threads acquired from CTE.
Calculate delays in Single mode...
Start delay calculation (fullDC) (1 T). (MEM=2370.54)
Total number of fetched objects 636
AAE_INFO: Total number of nets for which stage creation was skipped for all views 0
AAE_INFO-618: Total number of nets in the design is 704,  90.3 percent of the nets selected for SI analysis
End delay calculation. (MEM=2377.25 CPU=0:00:00.1 REAL=0:00:00.0)
End delay calculation (fullDC). (MEM=2377.25 CPU=0:00:00.2 REAL=0:00:00.0)
Save waveform /home/student001/JSilicon2/work/pnr/innovus_temp_95123_b150d23f-4499-44eb-9146-ed97469e7d45_gjchamber_student001_0rY64f/.AAE_zB5qg5/.AAE_95123_b150d23f-4499-44eb-9146-ed97469e7d45/waveform.data...
Loading CTE timing window with TwFlowType 0...(CPU = 0:00:00.0, REAL = 0:00:00.0, MEM = 2377.2M)
Add other clocks and setupCteToAAEClockMapping during iter 1
Loading CTE timing window is completed (CPU = 0:00:00.0, REAL = 0:00:00.0, MEM = 2377.2M)
Starting SI iteration 2
Calculate delays in Single mode...
Start delay calculation (fullDC) (1 T). (MEM=2360.07)
Glitch Analysis: View VIEW_TYPICAL -- Total Number of Nets Skipped = 0.
Glitch Analysis: View VIEW_TYPICAL -- Total Number of Nets Analyzed = 636.
Total number of fetched objects 636
AAE_INFO: Total number of nets for which stage creation was skipped for all views 0
AAE_INFO-618: Total number of nets in the design is 704,  10.4 percent of the nets selected for SI analysis
End delay calculation. (MEM=2366.27 CPU=0:00:00.0 REAL=0:00:00.0)
End delay calculation (fullDC). (MEM=2366.27 CPU=0:00:00.0 REAL=0:00:00.0)
AAE_INFO: opIsDesignInPostRouteState() is 1
AAE_INFO: resetNetProps viewIdx 0
Starting SI iteration 1 using Infinite Timing Windows
#################################################################################
# Design Stage: PostRoute
# Design Name: tt_um_Jsilicon
# Design Mode: 90nm
# Analysis Mode: MMMC Non-OCV
# Parasitics Mode: SPEF/RCDB
# Signoff Settings: SI On
#################################################################################
AAE_INFO: 1 threads acquired from CTE.
Calculate delays in Single mode...
Start delay calculation (fullDC) (1 T). (MEM=2371.53)
Total number of fetched objects 636
AAE_INFO: Total number of nets for which stage creation was skipped for all views 0
AAE_INFO-618: Total number of nets in the design is 704,  90.3 percent of the nets selected for SI analysis
End delay calculation. (MEM=2380.96 CPU=0:00:00.1 REAL=0:00:01.0)
End delay calculation (fullDC). (MEM=2380.96 CPU=0:00:00.2 REAL=0:00:01.0)
Save waveform /home/student001/JSilicon2/work/pnr/innovus_temp_95123_b150d23f-4499-44eb-9146-ed97469e7d45_gjchamber_student001_0rY64f/.AAE_zB5qg5/.AAE_95123_b150d23f-4499-44eb-9146-ed97469e7d45/waveform.data...
Loading CTE timing window with TwFlowType 0...(CPU = 0:00:00.0, REAL = 0:00:00.0, MEM = 2380.9M)
Add other clocks and setupCteToAAEClockMapping during iter 1
Loading CTE timing window is completed (CPU = 0:00:00.0, REAL = 0:00:00.0, MEM = 2380.9M)
Starting SI iteration 2
Calculate delays in Single mode...
Start delay calculation (fullDC) (1 T). (MEM=2365.12)
Total number of fetched objects 636
AAE_INFO: Total number of nets for which stage creation was skipped for all views 0
AAE_INFO-618: Total number of nets in the design is 704,  1.8 percent of the nets selected for SI analysis
End delay calculation. (MEM=2367.4 CPU=0:00:00.0 REAL=0:00:00.0)
End delay calculation (fullDC). (MEM=2367.4 CPU=0:00:00.0 REAL=0:00:00.0)
Start to collect the design information.
Build netlist information for Cell tt_um_Jsilicon.
Finished collecting the design information.
Generating standard cells used in the design report.
Analyze library ...
Analyze netlist ...
Generate no-driven nets information report.
Analyze timing ...
Analyze floorplan/placement ...
Analysis Routing ...
Report saved in file /home/student001/JSilicon2/reports/pnr/summary.rpt
Writing Outputs...
Writing DEF file '/home/student001/JSilicon2/results/def/tt_um_Jsilicon.def', current time is Wed Nov 19 10:57:47 2025 ...
unitPerMicron=2000, dbgMicronPerDBU=0.000500, unitPerDBU=1.000000
DEF file '/home/student001/JSilicon2/results/def/tt_um_Jsilicon.def' is written, current time is Wed Nov 19 10:57:47 2025 ...
Writing Netlist "/home/student001/JSilicon2/results/netlist/tt_um_Jsilicon_final.v" ...
The in-memory database contained RC information but was not saved. To save
the RC information, use saveDesign's -rc option. Note: Saving RC information can be quite large,
so it should only be saved when it is really desired.
#% Begin save design ... (date=11/19 10:57:47, mem=2369.9M)
INFO: Current data have to be saved into a temporary db: 'jsilicon_final.enc.dat.tmp' first. It will be renamed to the correct name 'jsilicon_final.enc.dat' after the old db was deleted.
% Begin Save ccopt configuration ... (date=11/19 10:57:47, mem=2369.9M)
% End Save ccopt configuration ... (date=11/19 10:57:47, total cpu=0:00:00.0, real=0:00:00.0, peak res=2370.3M, current mem=2370.3M)
% Begin Save netlist data ... (date=11/19 10:57:47, mem=2370.3M)
Writing Binary DB to /home/student001/JSilicon2/work/pnr/jsilicon_final.enc.dat.tmp/tt_um_Jsilicon.v.bin in single-threaded mode...
% End Save netlist data ... (date=11/19 10:57:47, total cpu=0:00:00.0, real=0:00:00.0, peak res=2370.3M, current mem=2370.3M)
Saving symbol-table file ...
Saving congestion map file /home/student001/JSilicon2/work/pnr/jsilicon_final.enc.dat.tmp/tt_um_Jsilicon.route.congmap.gz ...
% Begin Save AAE data ... (date=11/19 10:57:47, mem=2370.4M)
Saving AAE Data ...
% End Save AAE data ... (date=11/19 10:57:47, total cpu=0:00:00.5, real=0:00:00.0, peak res=2370.4M, current mem=2370.2M)
Saving preference file /home/student001/JSilicon2/work/pnr/jsilicon_final.enc.dat.tmp/gui.pref.tcl ...
Saving mode setting ...
**WARN: (IMPMF-5054):   fill_setting_save command is obsolete and should not be used any more. It still works in this release but will be removed in future release. Recommend to use Pegasus metal fill flow which is the replacement.
Saving global file ...
% Begin Save floorplan data ... (date=11/19 10:57:48, mem=2372.0M)
Saving floorplan file ...
% End Save floorplan data ... (date=11/19 10:57:48, total cpu=0:00:00.0, real=0:00:00.0, peak res=2372.0M, current mem=2372.0M)
Saving PG file /home/student001/JSilicon2/work/pnr/jsilicon_final.enc.dat.tmp/tt_um_Jsilicon.pg.gz, version#2, (Created by Innovus v23.13-s082_1 on Wed Nov 19 10:57:48 2025)
*** Completed savePGFile (cpu=0:00:00.0 real=0:00:00.0 mem=2847.0M) ***
*info - save blackBox cells to lef file /home/student001/JSilicon2/work/pnr/jsilicon_final.enc.dat.tmp/tt_um_Jsilicon.bbox.lef
Saving Drc markers ...
... 27 markers are saved ...
... 0 geometry drc markers are saved ...
... 0 antenna drc markers are saved ...
% Begin Save placement data ... (date=11/19 10:57:48, mem=2372.0M)
** Saving stdCellPlacement_binary (version# 2) ...
Save Adaptive View Pruning View Names to Binary file
% End Save placement data ... (date=11/19 10:57:48, total cpu=0:00:00.0, real=0:00:00.0, peak res=2372.0M, current mem=2372.0M)
% Begin Save routing data ... (date=11/19 10:57:48, mem=2372.0M)
Saving route file ...
*** Completed saveRoute (cpu=0:00:00.0 real=0:00:00.0 mem=2847.0M) ***
% End Save routing data ... (date=11/19 10:57:48, total cpu=0:00:00.0, real=0:00:00.0, peak res=2372.1M, current mem=2372.1M)
Saving property file /home/student001/JSilicon2/work/pnr/jsilicon_final.enc.dat.tmp/tt_um_Jsilicon.prop
*** Completed saveProperty (cpu=0:00:00.0 real=0:00:00.0 mem=2850.0M) ***
#Saving pin access data to file /home/student001/JSilicon2/work/pnr/jsilicon_final.enc.dat.tmp/tt_um_Jsilicon.apa ...
#
% Begin Save power constraints data ... (date=11/19 10:57:48, mem=2372.2M)
% End Save power constraints data ... (date=11/19 10:57:48, total cpu=0:00:00.0, real=0:00:00.0, peak res=2372.2M, current mem=2372.2M)
Generated self-contained design jsilicon_final.enc.dat.tmp
#% End save design ... (date=11/19 10:57:49, total cpu=0:00:01.6, real=0:00:02.0, peak res=2373.0M, current mem=2373.0M)

*** Summary of all messages that are not suppressed in this session:
Severity  ID               Count  Summary
WARNING   IMPMF-5054           1  fill_setting_save command is obsolete an...
*** Message Summary: 1 warning(s), 0 error(s)

P&R COMPLETE!

*** Memory Usage v#2 (Current mem = 2847.023M, initial mem = 831.172M) ***
*** Message Summary: 278 warning(s), 11 error(s)

--- Ending "Innovus" (totcpu=0:01:07, real=0:02:20, mem=2847.0M) ---


[OK] P&R complete

==============================================================================
Stage 3: GDS Generation
==============================================================================

Running GDS generation...

Cadence Innovus(TM) Implementation System.
Copyright 2024 Cadence Design Systems, Inc. All rights reserved worldwide.

Version:        v23.13-s082_1, built Wed Nov 13 13:42:48 PST 2024
Options:        -init ../../scripts/innovus/generate_gds.tcl
Date:           Wed Nov 19 10:57:51 2025
Host:           gjchamber (x86_64 w/Linux 3.10.0-1160.el7.x86_64) (20cores*80cpus*Intel(R) Xeon(R) Gold 6230 CPU @ 2.10GHz 28160KB)
OS:             CentOS Linux 7 (Core)

License:
                [10:57:51.133017] Configured Lic search path (23.02-s006): 5280@10.10.20.247

                invs    Innovus Implementation System   23.1    checkout succeeded
                8 CPU jobs allowed with the current license(s). Use setMultiCpuUsage to set your required CPU count.
**ERROR: (IMPOAX-124):  OpenAccess (OA) shared library installation is older than the one that was used to build this Innovus version. For using the OA installation built and tested with this Innovus version, unset the shell variable OA_HOME. For using 'p018' or higher version of OA, reset OA_HOME to point to that installation.
Type 'man IMPOAX-124' for more detail.
**ERROR: (IMPOAX-332):  Failed to initialize OpenAccess (OA) database. OA related commands cannot be run in this session. Confirm that the OA shared library is installed and OA_HOME is set correctly. Typically the OA_HOME environment variable should not be set.
Type 'man IMPOAX-332' for more detail.
INFO: OA features are disabled in this session.
Create and set the environment variable TMPDIR to /home/student001/JSilicon2/work/pnr/innovus_temp_98246_c1a97ae3-8b0a-4970-8497-808eea003547_gjchamber_student001_MT0TKn.

Change the soft stacksize limit to 0.2%RAM (770 mbytes). Set global soft_stack_size_limit to change the value.
Info: Process UID = 98246 / c1a97ae3-8b0a-4970-8497-808eea003547 / S07wZlVhpm

**INFO:  MMMC transition support version v31-84

[INFO] Loading PVS 22.21 fill procedures
Sourcing file "../../scripts/innovus/generate_gds.tcl" ...
innovus 1> source ../../scripts/innovus/generate_gds.tcl
GDS Generation...
#% Begin load design ... (date=11/19 10:58:15, mem=1672.9M)
Set Default Input Pin Transition as 0.1 ps.
Loading design 'tt_um_Jsilicon' saved by 'Innovus' '23.13-s082_1' on 'Wed Nov 19 10:57:49 2025'.
**ERROR: (IMPOAX-124):  OpenAccess (OA) shared library installation is older than the one that was used to build this Innovus version. For using the OA installation built and tested with this Innovus version, unset the shell variable OA_HOME. For using 'p018' or higher version of OA, reset OA_HOME to point to that installation.
Type 'man IMPOAX-124' for more detail.
**ERROR: (IMPOAX-332):  Failed to initialize OpenAccess (OA) database. OA related commands cannot be run in this session. Confirm that the OA shared library is installed and OA_HOME is set correctly. Typically the OA_HOME environment variable should not be set.
Type 'man IMPOAX-332' for more detail.
% Begin Load MMMC data ... (date=11/19 10:58:16, mem=1675.2M)
% End Load MMMC data ... (date=11/19 10:58:17, total cpu=0:00:00.0, real=0:00:01.0, peak res=1676.5M, current mem=1676.5M)

Loading LEF file /home/student001/JSilicon2/work/pnr/jsilicon_final.enc.dat/libs/lef/gscl45nm.lef ...
Set DBUPerIGU to M2 pitch 380.

##  Check design process and node:
##  Both design process and tech node are not set.

Loading view definition file from /home/student001/JSilicon2/work/pnr/jsilicon_final.enc.dat/viewDefinition.tcl
Reading LIB_TYPICAL timing library '/home/student001/JSilicon2/tech/lib/gscl45nm.lib' ...
Read 31 cells in library 'gscl45nm'
*** End library_loading (cpu=0.00min, real=0.00min, mem=12.0M, fe_cpu=0.41min, fe_real=0.43min, fe_mem=1872.7M) ***
% Begin Load netlist data ... (date=11/19 10:58:17, mem=1689.2M)
*** Begin netlist parsing (mem=1872.7M) ***
**WARN: (IMPVL-159):    Pin 'gnd' of cell 'XOR2X1' is defined in LEF but not in the timing library.
Type 'man IMPVL-159' for more detail.
**WARN: (IMPVL-159):    Pin 'vdd' of cell 'XOR2X1' is defined in LEF but not in the timing library.
Type 'man IMPVL-159' for more detail.
**WARN: (IMPVL-159):    Pin 'gnd' of cell 'XNOR2X1' is defined in LEF but not in the timing library.
Type 'man IMPVL-159' for more detail.
**WARN: (IMPVL-159):    Pin 'vdd' of cell 'XNOR2X1' is defined in LEF but not in the timing library.
Type 'man IMPVL-159' for more detail.
**WARN: (IMPVL-159):    Pin 'gnd' of cell 'TBUFX2' is defined in LEF but not in the timing library.
Type 'man IMPVL-159' for more detail.
**WARN: (IMPVL-159):    Pin 'vdd' of cell 'TBUFX2' is defined in LEF but not in the timing library.
Type 'man IMPVL-159' for more detail.
**WARN: (IMPVL-159):    Pin 'gnd' of cell 'TBUFX1' is defined in LEF but not in the timing library.
Type 'man IMPVL-159' for more detail.
**WARN: (IMPVL-159):    Pin 'vdd' of cell 'TBUFX1' is defined in LEF but not in the timing library.
Type 'man IMPVL-159' for more detail.
**WARN: (IMPVL-159):    Pin 'gnd' of cell 'OR2X2' is defined in LEF but not in the timing library.
Type 'man IMPVL-159' for more detail.
**WARN: (IMPVL-159):    Pin 'vdd' of cell 'OR2X2' is defined in LEF but not in the timing library.
Type 'man IMPVL-159' for more detail.
**WARN: (IMPVL-159):    Pin 'gnd' of cell 'OR2X1' is defined in LEF but not in the timing library.
Type 'man IMPVL-159' for more detail.
**WARN: (IMPVL-159):    Pin 'vdd' of cell 'OR2X1' is defined in LEF but not in the timing library.
Type 'man IMPVL-159' for more detail.
**WARN: (IMPVL-159):    Pin 'gnd' of cell 'OAI21X1' is defined in LEF but not in the timing library.
Type 'man IMPVL-159' for more detail.
**WARN: (IMPVL-159):    Pin 'vdd' of cell 'OAI21X1' is defined in LEF but not in the timing library.
Type 'man IMPVL-159' for more detail.
**WARN: (IMPVL-159):    Pin 'gnd' of cell 'NOR3X1' is defined in LEF but not in the timing library.
Type 'man IMPVL-159' for more detail.
**WARN: (IMPVL-159):    Pin 'vdd' of cell 'NOR3X1' is defined in LEF but not in the timing library.
Type 'man IMPVL-159' for more detail.
**WARN: (IMPVL-159):    Pin 'gnd' of cell 'NOR2X1' is defined in LEF but not in the timing library.
Type 'man IMPVL-159' for more detail.
**WARN: (IMPVL-159):    Pin 'vdd' of cell 'NOR2X1' is defined in LEF but not in the timing library.
Type 'man IMPVL-159' for more detail.
**WARN: (IMPVL-159):    Pin 'gnd' of cell 'NAND3X1' is defined in LEF but not in the timing library.
Type 'man IMPVL-159' for more detail.
**WARN: (IMPVL-159):    Pin 'vdd' of cell 'NAND3X1' is defined in LEF but not in the timing library.
Type 'man IMPVL-159' for more detail.
**WARN: (EMS-27):       Message (IMPVL-159) has exceeded the current message display limit of 20.
To increase the message display limit, refer to the product command reference manual.
Created 31 new cells from 1 timing libraries.
Reading netlist ...
Backslashed names will retain backslash and a trailing blank character.
Reading verilogBinary netlist '/home/student001/JSilicon2/work/pnr/jsilicon_final.enc.dat/tt_um_Jsilicon.v.bin'

*** Memory Usage v#2 (Current mem = 1881.707M, initial mem = 831.172M) ***
*** End netlist parsing (cpu=0:00:00.0, real=0:00:00.0, mem=1881.7M) ***
% End Load netlist data ... (date=11/19 10:58:17, total cpu=0:00:00.0, real=0:00:00.0, peak res=1693.3M, current mem=1693.3M)
Set top cell to tt_um_Jsilicon.
Hooked 31 DB cells to tlib cells.
Starting recursive module instantiation check.
No recursion found.
Building hierarchical netlist for Cell tt_um_Jsilicon ...
***** UseNewTieNetMode *****.
*** Netlist is unique.
Set DBUPerIGU to techSite CoreSite width 760.
** info: there are 36 modules.
** info: there are 587 stdCell insts.
** info: there are 587 stdCell insts with at least one signal pin.

*** Memory Usage v#2 (Current mem = 1931.133M, initial mem = 831.172M) ***
*info: set bottom ioPad orient R0
Horizontal Layer M1 offset = 190 (guessed)
Vertical Layer M2 offset = 190 (guessed)
Suggestion: specify LAYER OFFSET in LEF file
Reason: hard to extract LAYER OFFSET from standard cells
Start create_tracks
Generated pitch 1.68 in metal10 is different from 1.71 defined in technology file in preferred direction.
Generated pitch 0.84 in metal8 is different from 0.855 defined in technology file in preferred direction.
Generated pitch 0.95 in metal7 is different from 0.855 defined in technology file in preferred direction.
Generated pitch 0.28 in metal6 is different from 0.285 defined in technology file in preferred direction.
Generated pitch 0.28 in metal4 is different from 0.285 defined in technology file in preferred direction.
Loading preference file /home/student001/JSilicon2/work/pnr/jsilicon_final.enc.dat/gui.pref.tcl ...
#WARNING (NRIF-81) When route_detail_post_route_swap_via is set to 'true', the post route via swapping step will be performed on all nets. If route_via_weight is also specified, it will swap vias to DFM vias based on via weight; otherwise it will swap vias to double cut vias.
AAE_INFO: switching setDelayCal -siAware from false to true ...
AAE_INFO: The setting is changed from false to true in setDelayCalMode -SIAware
Change floorplan default-technical-site to 'CoreSite'.
*Info: initialize multi-corner CTS.
Total number of combinational cells: 25
Total number of sequential cells: 4
Total number of tristate cells: 2
Total number of level shifter cells: 0
Total number of power gating cells: 0
Total number of isolation cells: 0
Total number of power switch cells: 0
Total number of pulse generator cells: 0
Total number of always on buffers: 0
Total number of retention cells: 0
Total number of physical cells: 0
List of usable buffers: BUFX2 BUFX4
Total number of usable buffers: 2
List of unusable buffers:
Total number of unusable buffers: 0
List of usable inverters: INVX2 INVX1 INVX4 INVX8
Total number of usable inverters: 4
List of unusable inverters:
Total number of unusable inverters: 0
List of identified usable delay cells: CLKBUF1 CLKBUF2 CLKBUF3
Total number of identified usable delay cells: 3
List of identified unusable delay cells:
Total number of identified unusable delay cells: 0
Reading floorplan file - /home/student001/JSilicon2/work/pnr/jsilicon_final.enc.dat/tt_um_Jsilicon.fp.gz (mem = 2189.3M).
% Begin Load floorplan data ... (date=11/19 10:58:17, mem=1994.0M)
*info: reset 704 existing net BottomPreferredLayer and AvoidDetour
Deleting old partition specification.
Set FPlanBox to (0 0 149720 144020)
 ... processed partition successfully.
Reading binary special route file /home/student001/JSilicon2/work/pnr/jsilicon_final.enc.dat/tt_um_Jsilicon.fp.spr.gz (Created by Innovus v23.13-s082_1 on Wed Nov 19 10:57:48 2025, version: 1)
Convert 0 swires and 0 svias from compressed groups
8 swires and 14 svias were compressed
8 swires and 14 svias were decompressed from small or sparse groups
Ending "Read special route file" (total cpu=0:00:00.0, real=0:00:00.0, peak res=1994.9M, current mem=1994.9M)
Extracting standard cell pins and blockage ......
Pin and blockage extraction finished
Delete all existing relative floorplan constraints.
% End Load floorplan data ... (date=11/19 10:58:18, total cpu=0:00:00.1, real=0:00:00.0, peak res=1995.1M, current mem=1995.1M)
Reading congestion map file /home/student001/JSilicon2/work/pnr/jsilicon_final.enc.dat/tt_um_Jsilicon.route.congmap.gz ...
% Begin Load SymbolTable ... (date=11/19 10:58:18, mem=1995.5M)
Suppress "**WARN ..." messages.
Un-suppress "**WARN ..." messages.
% End Load SymbolTable ... (date=11/19 10:58:18, total cpu=0:00:00.0, real=0:00:00.0, peak res=1995.9M, current mem=1995.9M)
Loading place ...
% Begin Load placement data ... (date=11/19 10:58:18, mem=1995.9M)
Reading placement file - /home/student001/JSilicon2/work/pnr/jsilicon_final.enc.dat/tt_um_Jsilicon.place.gz.
** Reading stdCellPlacement_binary (Created by Innovus v23.13-s082_1 on Wed Nov 19 10:57:48 2025, version# 2) ...
Read Views for adaptive view pruning ...
Read 0 views from Binary DB for adaptive view pruning
*** Completed restorePlace (cpu=0:00:00.0 real=0:00:00.0 mem=2192.3M) ***
Total net length = 4.049e+03 (1.979e+03 2.070e+03) (ext = 2.528e+02)
% End Load placement data ... (date=11/19 10:58:18, total cpu=0:00:00.0, real=0:00:00.0, peak res=1996.4M, current mem=1996.4M)
Reading PG file /home/student001/JSilicon2/work/pnr/jsilicon_final.enc.dat/tt_um_Jsilicon.pg.gz, version#2, (Created by Innovus v23.13-s082_1 on       Wed Nov 19 10:57:48 2025)
*** Completed restorePGFile (cpu=0:00:00.0 real=0:00:00.0 mem=2189.3M) ***
% Begin Load routing data ... (date=11/19 10:58:18, mem=1996.5M)
Reading routing file - /home/student001/JSilicon2/work/pnr/jsilicon_final.enc.dat/tt_um_Jsilicon.route.gz.
Reading Innovus routing data (Created by Innovus v23.13-s082_1 on Wed Nov 19 10:57:48 2025 Format: 23.1) ...
*** Total 657 nets are successfully restored.
*** Completed restoreRoute (cpu=0:00:00.0 real=0:00:00.0 mem=2189.3M) ***
% End Load routing data ... (date=11/19 10:58:18, total cpu=0:00:00.0, real=0:00:00.0, peak res=1998.7M, current mem=1997.7M)
Loading Drc markers ...
... 27 markers are loaded ...
... 0 geometry drc markers are loaded ...
... 0 antenna drc markers are loaded ...
TAT_INFO: ::restoreCongMap REAL = 0 : CPU = 0 : MEM = 0.
Reading property file /home/student001/JSilicon2/work/pnr/jsilicon_final.enc.dat/tt_um_Jsilicon.prop
*** Completed restoreProperty (cpu=0:00:00.0 real=0:00:00.0 mem=2192.3M) ***
Reading dirtyarea snapshot file /home/student001/JSilicon2/work/pnr/jsilicon_final.enc.dat/tt_um_Jsilicon.db.da.gz (Create by Innovus v23.13-s082_1 on Wed Nov 19 10:57:48 2025, version: 7).
Set Default Input Pin Transition as 0.1 ps.
Extraction setup Started for TopCell tt_um_Jsilicon
Initializing multi-corner RC extraction with 1 active RC Corners ...
**WARN: (IMPEXT-2773):  The via resistance between layers M0 and M1 could not be determined from the LEF technology file because the via resistance specification is missing. A default of 4 Ohms will be used as via resistance between these layers.
Type 'man IMPEXT-2773' for more detail.
**WARN: (IMPEXT-2773):  The via resistance between layers M1 and M2 could not be determined from the LEF technology file because the via resistance specification is missing. A default of 4 Ohms will be used as via resistance between these layers.
Type 'man IMPEXT-2773' for more detail.
**WARN: (IMPEXT-2773):  The via resistance between layers M2 and M3 could not be determined from the LEF technology file because the via resistance specification is missing. A default of 4 Ohms will be used as via resistance between these layers.
Type 'man IMPEXT-2773' for more detail.
**WARN: (IMPEXT-2773):  The via resistance between layers M3 and M4 could not be determined from the LEF technology file because the via resistance specification is missing. A default of 4 Ohms will be used as via resistance between these layers.
Type 'man IMPEXT-2773' for more detail.
**WARN: (IMPEXT-2773):  The via resistance between layers M4 and M5 could not be determined from the LEF technology file because the via resistance specification is missing. A default of 4 Ohms will be used as via resistance between these layers.
Type 'man IMPEXT-2773' for more detail.
**WARN: (IMPEXT-2773):  The via resistance between layers M5 and M6 could not be determined from the LEF technology file because the via resistance specification is missing. A default of 4 Ohms will be used as via resistance between these layers.
Type 'man IMPEXT-2773' for more detail.
**WARN: (IMPEXT-2773):  The via resistance between layers M6 and M7 could not be determined from the LEF technology file because the via resistance specification is missing. A default of 4 Ohms will be used as via resistance between these layers.
Type 'man IMPEXT-2773' for more detail.
**WARN: (IMPEXT-2773):  The via resistance between layers M7 and M8 could not be determined from the LEF technology file because the via resistance specification is missing. A default of 4 Ohms will be used as via resistance between these layers.
Type 'man IMPEXT-2773' for more detail.
**WARN: (IMPEXT-2773):  The via resistance between layers M8 and M9 could not be determined from the LEF technology file because the via resistance specification is missing. A default of 4 Ohms will be used as via resistance between these layers.
Type 'man IMPEXT-2773' for more detail.
**WARN: (IMPEXT-2773):  The via resistance between layers M9 and M10 could not be determined from the LEF technology file because the via resistance specification is missing. A default of 4 Ohms will be used as via resistance between these layers.
Type 'man IMPEXT-2773' for more detail.
**WARN: (IMPEXT-2766):  The sheet resistance for layer M1 is not defined in the cap table. Therefore, the LEF value 0.38 will be used instead. To avoid this message, update the relevant cap table to include the sheet resistance for the specified layer and read it back in.
**WARN: (IMPEXT-2766):  The sheet resistance for layer M2 is not defined in the cap table. Therefore, the LEF value 0.25 will be used instead. To avoid this message, update the relevant cap table to include the sheet resistance for the specified layer and read it back in.
**WARN: (IMPEXT-2766):  The sheet resistance for layer M3 is not defined in the cap table. Therefore, the LEF value 0.25 will be used instead. To avoid this message, update the relevant cap table to include the sheet resistance for the specified layer and read it back in.
**WARN: (IMPEXT-2766):  The sheet resistance for layer M4 is not defined in the cap table. Therefore, the LEF value 0.25 will be used instead. To avoid this message, update the relevant cap table to include the sheet resistance for the specified layer and read it back in.
**WARN: (IMPEXT-2766):  The sheet resistance for layer M5 is not defined in the cap table. Therefore, the LEF value 0.25 will be used instead. To avoid this message, update the relevant cap table to include the sheet resistance for the specified layer and read it back in.
**WARN: (IMPEXT-2766):  The sheet resistance for layer M6 is not defined in the cap table. Therefore, the LEF value 0.25 will be used instead. To avoid this message, update the relevant cap table to include the sheet resistance for the specified layer and read it back in.
**WARN: (IMPEXT-2766):  The sheet resistance for layer M7 is not defined in the cap table. Therefore, the LEF value 0.25 will be used instead. To avoid this message, update the relevant cap table to include the sheet resistance for the specified layer and read it back in.
**WARN: (IMPEXT-2766):  The sheet resistance for layer M8 is not defined in the cap table. Therefore, the LEF value 0.25 will be used instead. To avoid this message, update the relevant cap table to include the sheet resistance for the specified layer and read it back in.
**WARN: (IMPEXT-2766):  The sheet resistance for layer M9 is not defined in the cap table. Therefore, the LEF value 0.21 will be used instead. To avoid this message, update the relevant cap table to include the sheet resistance for the specified layer and read it back in.
**WARN: (IMPEXT-2766):  The sheet resistance for layer M10 is not defined in the cap table. Therefore, the LEF value 0.21 will be used instead. To avoid this message, update the relevant cap table to include the sheet resistance for the specified layer and read it back in.
Summary of Active RC-Corners :

 Analysis View: VIEW_TYPICAL
    RC-Corner Name        : RC_TYPICAL
    RC-Corner Index       : 0
    RC-Corner Temperature : 25 Celsius
    RC-Corner Cap Table   : ''
    RC-Corner PreRoute Res Factor         : 1
    RC-Corner PreRoute Cap Factor         : 1
    RC-Corner PostRoute Res Factor        : 1 {1 1 1}
    RC-Corner PostRoute Cap Factor        : 1 {1 1 1}
    RC-Corner PostRoute XCap Factor       : 1 {1 1 1}
    RC-Corner PreRoute Clock Res Factor   : 1   [Derived from Cap Table]
    RC-Corner PreRoute Clock Cap Factor   : 1   [Derived from Cap Table]
    RC-Corner PostRoute Clock Cap Factor  : 1 {1 1 1}   [Derived from postRoute_cap (effortLevel low)]
    RC-Corner PostRoute Clock Res Factor  : 1 {1 1 1}   [Derived from postRoute_res (effortLevel low)]
    RC-Corner PostRoute Clock coupling capacitance Factor : 1 {1 1 1}
Initializing multi-corner resistance tables ...
Start generating vias ..
#Skip building auto via since it is not turned on.
Extracting standard cell pins and blockage ......
Pin and blockage extraction finished
Via generation completed.
% Begin Load power constraints ... (date=11/19 10:58:20, mem=2003.3M)
source /home/student001/JSilicon2/work/pnr/jsilicon_final.enc.dat/tt_um_Jsilicon_power_constraints.tcl
'set_default_switching_activity' finished successfully.
% End Load power constraints ... (date=11/19 10:58:20, total cpu=0:00:00.0, real=0:00:00.0, peak res=2009.1M, current mem=2009.1M)
% Begin load AAE data ... (date=11/19 10:58:20, mem=2025.2M)
**WARN: (IMPESI-3505):  setDelayCalMode -eng_enablePrePlacedFlow false (default=false) will be obsoleted along with its sgs2set equivalent.  This parameter will continue to be supported in the current release, but will be removed in the next major release of the software.
AAE DB initialization (MEM=2030.261719 CPU=0:00:00.0 REAL=0:00:00.0)
% End load AAE data ... (date=11/19 10:58:20, total cpu=0:00:00.5, real=0:00:00.0, peak res=2030.6M, current mem=2030.6M)
Restoring CCOpt config...
  Extracting original clock gating for clk...
    clock_tree clk contains 42 sinks and 0 clock gates.
  Extracting original clock gating for clk done.
  The skew group clk/CONSTRAINTS was created. It contains 42 sinks and 1 sources.
Restoring CCOpt config done.
Total number of combinational cells: 25
Total number of sequential cells: 4
Total number of tristate cells: 2
Total number of level shifter cells: 0
Total number of power gating cells: 0
Total number of isolation cells: 0
Total number of power switch cells: 0
Total number of pulse generator cells: 0
Total number of always on buffers: 0
Total number of retention cells: 0
Total number of physical cells: 0
List of usable buffers: BUFX2 BUFX4
Total number of usable buffers: 2
List of unusable buffers:
Total number of unusable buffers: 0
List of usable inverters: INVX2 INVX1 INVX4 INVX8
Total number of usable inverters: 4
List of unusable inverters:
Total number of unusable inverters: 0
List of identified usable delay cells: CLKBUF1 CLKBUF2 CLKBUF3
Total number of identified usable delay cells: 3
List of identified unusable delay cells:
Total number of identified unusable delay cells: 0
**WARN: (IMPCTE-107):   The following globals have been obsoleted since version (null). They will be removed in the next release.
timing_aocv_enable_gba_combine_launch_capture
timing_enable_backward_compatible_latch_thru_mt_mode
timing_enable_separate_device_slew_effect_sensitivities
#% End load design ... (date=11/19 10:58:20, total cpu=0:00:04.9, real=0:00:05.0, peak res=2055.7M, current mem=2034.4M)

*** Summary of all messages that are not suppressed in this session:
Severity  ID               Count  Summary
WARNING   IMPEXT-2766         10  The sheet resistance for layer %s is not...
WARNING   IMPEXT-2773         10  The via resistance between layers %s and...
WARNING   IMPVL-159           62  Pin '%s' of cell '%s' is defined in LEF ...
WARNING   IMPESI-3505          1  setDelayCalMode -eng_%s (default=%s) wil...
ERROR     IMPOAX-124           1  OpenAccess (OA) shared library installat...
ERROR     IMPOAX-332           1  Failed to initialize OpenAccess (OA) dat...
WARNING   NRIF-81              1  When route_detail_post_route_swap_via is...
WARNING   IMPCTE-107           1  The following globals have been obsolete...
*** Message Summary: 85 warning(s), 2 error(s)

RC Extraction...
Extraction called for design 'tt_um_Jsilicon' of instances=587 and nets=704 using extraction engine 'postRoute' at effort level 'low' .
**WARN: (IMPEXT-3530):  The process node is not set. Use the command setDesignMode -process <process node> prior to extraction for maximum accuracy and optimal automatic threshold setting.
Type 'man IMPEXT-3530' for more detail.
PostRoute (effortLevel low) RC Extraction called for design tt_um_Jsilicon.
RC Extraction called in multi-corner(1) mode.
**WARN: (IMPEXT-6197):  The Cap table file is not specified. This will result in lower parasitic accuracy when using preRoute extraction or postRoute extraction with effort level 'low'. It is recommended to generate the Cap table file using the 'generateCapTbl' command and specify it before extraction using 'create_rc_corner/update_rc_corner -cap_table'.
Type 'man IMPEXT-6197' for more detail.
**WARN: (IMPEXT-3032):  Because the cap table file was not provided, it will be created internally with the following process info:
* Layer Id             : 1 - M1
      Thickness        : 0.6
      Min Width        : 0.065
      Layer Dielectric : 4.1
* Layer Id             : 2 - M2
      Thickness        : 0.6
      Min Width        : 0.07
      Layer Dielectric : 4.1
* Layer Id             : 3 - M3
      Thickness        : 0.6
      Min Width        : 0.07
      Layer Dielectric : 4.1
* Layer Id             : 4 - M4
      Thickness        : 0.6
      Min Width        : 0.14
      Layer Dielectric : 4.1
* Layer Id             : 5 - M5
      Thickness        : 0.6
      Min Width        : 0.14
      Layer Dielectric : 4.1
* Layer Id             : 6 - M6
      Thickness        : 0.6
      Min Width        : 0.14
      Layer Dielectric : 4.1
* Layer Id             : 7 - M7
      Thickness        : 0.6
      Min Width        : 0.4
      Layer Dielectric : 4.1
* Layer Id             : 8 - M8
      Thickness        : 0.6
      Min Width        : 0.4
      Layer Dielectric : 4.1
* Layer Id             : 9 - M9
      Thickness        : 0.6
      Min Width        : 0.8
      Layer Dielectric : 4.1
* Layer Id             : 10 - M10
      Thickness        : 1
      Min Width        : 0.8
      Layer Dielectric : 4.1
extractDetailRC Option : -outfile /home/student001/JSilicon2/work/pnr/innovus_temp_98246_c1a97ae3-8b0a-4970-8497-808eea003547_gjchamber_student001_MT0TKn/tt_um_Jsilicon_98246_c1a97ae3-8b0a-4970-8497-808eea003547_UXjFnL.rcdb.d  -basic
RC Mode: PostRoute -effortLevel low [Basic CapTable, LEF Resistances]
      RC Corner Indexes            0
Capacitance Scaling Factor   : 1.00000
Coupling Cap. Scaling Factor : 1.00000
Resistance Scaling Factor    : 1.00000
Clock Cap. Scaling Factor    : 1.00000
Clock Res. Scaling Factor    : 1.00000
Shrink Factor                : 1.00000
Initializing multi-corner resistance tables ...
Checking LVS Completed (CPU Time= 0:00:00.0  MEM= 2265.4M)
Extracted 10.0289% (CPU Time= 0:00:00.0  MEM= 2308.4M)
**WARN: (IMPEXT-2882):  Unable to find the resistance for via 'M2_M1_via' in Cap table or LEF or OA files. The default value of 4.0 ohms is being assigned. To avoid this, check the Cap table and LEF and OA files, provide the resistance and read the files again.
Extracted 20.0217% (CPU Time= 0:00:00.0  MEM= 2308.4M)
Extracted 30.0325% (CPU Time= 0:00:00.0  MEM= 2308.4M)
Extracted 40.0253% (CPU Time= 0:00:00.0  MEM= 2308.4M)
Extracted 50.0361% (CPU Time= 0:00:00.0  MEM= 2308.4M)
Extracted 60.0289% (CPU Time= 0:00:00.0  MEM= 2308.4M)
Extracted 70.0217% (CPU Time= 0:00:00.0  MEM= 2308.4M)
**WARN: (IMPEXT-2882):  Unable to find the resistance for via 'M3_M2_via' in Cap table or LEF or OA files. The default value of 4.0 ohms is being assigned. To avoid this, check the Cap table and LEF and OA files, provide the resistance and read the files again.
Extracted 80.0325% (CPU Time= 0:00:00.1  MEM= 2308.4M)
Extracted 90.0253% (CPU Time= 0:00:00.1  MEM= 2308.4M)
**WARN: (IMPEXT-2882):  Unable to find the resistance for via 'M4_M3_via' in Cap table or LEF or OA files. The default value of 4.0 ohms is being assigned. To avoid this, check the Cap table and LEF and OA files, provide the resistance and read the files again.
Extracted 100% (CPU Time= 0:00:00.1  MEM= 2308.4M)
Number of Extracted Resistors     : 8754
Number of Extracted Ground Cap.   : 9306
Number of Extracted Coupling Cap. : 14588
Filtering XCap in 'relativeOnly' mode using values relative_c_threshold=0.03 and total_c_threshold=5fF.
Checking LVS Completed (CPU Time= 0:00:00.0  MEM= 2292.4M)
PostRoute (effortLevel low) RC Extraction DONE (CPU Time: 0:00:00.2  Real Time: 0:00:01.0  MEM: 2296.352M)
RC Out has the following PVT Info:
   RC-typical
Dumping Spef file.....
Printing D_NET...
rcOut completed:: 9 % rcOut completed:: 19 % rcOut completed:: 29 % rcOut completed:: 39 % rcOut completed:: 49 % rcOut completed:: 59 % rcOut completed:: 69 % rcOut completed:: 79 % rcOut completed:: 89 % rcOut completed:: 100 %
RC Out from RCDB Completed (CPU Time= 0:00:00.1  MEM= 2296.4M)
**WARN: (SDF-808):      The software is currently operating in a high performance mode which optimizes the handling of multiple timing arcs between input and output pin pairs. With the current settings, the SDF file generated will contain the same delay information for all of these arcs. To have the SDF recalculated with explicit pin pair data, you should use the option '-recompute_delay_calc'. This setting is recommended for generating SDF for functional  simulation applications.
AAE_INFO: opIsDesignInPostRouteState() is 1
AAE_INFO: resetNetProps viewIdx 0
Starting SI iteration 1 using Infinite Timing Windows
#################################################################################
# Design Stage: PostRoute
# Design Name: tt_um_Jsilicon
# Design Mode: 90nm
# Analysis Mode: MMMC Non-OCV
# Parasitics Mode: SPEF/RCDB
# Signoff Settings: SI On
#################################################################################
AAE_INFO: 1 threads acquired from CTE.
Start delay calculation (fullDC) (1 T). (MEM=2139.6)
Initializing multi-corner resistance tables ...
siFlow : Timing analysis mode is single, using late cdB files
siFlow : Timing analysis mode is single, using late cdB files
Total number of fetched objects 636
AAE_INFO: Total number of nets for which stage creation was skipped for all views 0
AAE_INFO-618: Total number of nets in the design is 704,  93.8 percent of the nets selected for SI analysis
End delay calculation. (MEM=2158.52 CPU=0:00:00.2 REAL=0:00:00.0)
End delay calculation (fullDC). (MEM=2157.76 CPU=0:00:00.4 REAL=0:00:01.0)
Save waveform /home/student001/JSilicon2/work/pnr/innovus_temp_98246_c1a97ae3-8b0a-4970-8497-808eea003547_gjchamber_student001_MT0TKn/.AAE_g4txky/.AAE_98246_c1a97ae3-8b0a-4970-8497-808eea003547/waveform.data...
Loading CTE timing window with TwFlowType 0...(CPU = 0:00:00.0, REAL = 0:00:00.0, MEM = 2159.2M)
Add other clocks and setupCteToAAEClockMapping during iter 1
Loading CTE timing window is completed (CPU = 0:00:00.0, REAL = 0:00:00.0, MEM = 2159.4M)
Starting SI iteration 2
Start delay calculation (fullDC) (1 T). (MEM=2146.7)
**DIAG: Timing query is performed without necessary timing update!
Glitch Analysis: View VIEW_TYPICAL -- Total Number of Nets Skipped = 0.
Glitch Analysis: View VIEW_TYPICAL -- Total Number of Nets Analyzed = 636.
Total number of fetched objects 636
AAE_INFO: Total number of nets for which stage creation was skipped for all views 0
AAE_INFO-618: Total number of nets in the design is 704,  12.1 percent of the nets selected for SI analysis
End delay calculation. (MEM=2165.83 CPU=0:00:00.1 REAL=0:00:00.0)
End delay calculation (fullDC). (MEM=2165.83 CPU=0:00:00.1 REAL=0:00:00.0)
The in-memory database contained RC information but was not saved. To save
the RC information, use saveDesign's -rc option. Note: Saving RC information can be quite large,
so it should only be saved when it is really desired.
#% Begin save design ... (date=11/19 10:58:22, mem=2136.2M)
INFO: Current data have to be saved into a temporary db: 'jsilicon_extracted.enc.dat.tmp' first. It will be renamed to the correct name 'jsilicon_extracted.enc.dat' after the old db was deleted.
% Begin Save ccopt configuration ... (date=11/19 10:58:22, mem=2136.2M)
% End Save ccopt configuration ... (date=11/19 10:58:22, total cpu=0:00:00.0, real=0:00:00.0, peak res=2137.7M, current mem=2137.7M)
% Begin Save netlist data ... (date=11/19 10:58:22, mem=2155.0M)
Writing Binary DB to jsilicon_extracted.enc.dat.tmp/tt_um_Jsilicon.v.bin in single-threaded mode...
% End Save netlist data ... (date=11/19 10:58:22, total cpu=0:00:00.0, real=0:00:00.0, peak res=2155.1M, current mem=2155.1M)
Saving symbol-table file ...
Saving congestion map file jsilicon_extracted.enc.dat.tmp/tt_um_Jsilicon.route.congmap.gz ...
% Begin Save AAE data ... (date=11/19 10:58:22, mem=2155.6M)
Saving AAE Data ...
% End Save AAE data ... (date=11/19 10:58:22, total cpu=0:00:00.8, real=0:00:01.0, peak res=2333.1M, current mem=2156.6M)
Saving preference file jsilicon_extracted.enc.dat.tmp/gui.pref.tcl ...
Saving mode setting ...
**WARN: (IMPMF-5054):   fill_setting_save command is obsolete and should not be used any more. It still works in this release but will be removed in future release. Recommend to use Pegasus metal fill flow which is the replacement.
Saving global file ...
% Begin Save floorplan data ... (date=11/19 10:58:23, mem=2159.3M)
Saving floorplan file ...
Convert 0 swires and 0 svias from compressed groups
% End Save floorplan data ... (date=11/19 10:58:23, total cpu=0:00:00.0, real=0:00:00.0, peak res=2159.7M, current mem=2159.7M)
Saving PG file jsilicon_extracted.enc.dat.tmp/tt_um_Jsilicon.pg.gz, version#2, (Created by Innovus v23.13-s082_1 on Wed Nov 19 10:58:23 2025)
*** Completed savePGFile (cpu=0:00:00.0 real=0:00:00.0 mem=2472.0M) ***
*info - save blackBox cells to lef file jsilicon_extracted.enc.dat.tmp/tt_um_Jsilicon.bbox.lef
Saving Drc markers ...
... 27 markers are saved ...
... 0 geometry drc markers are saved ...
... 0 antenna drc markers are saved ...
% Begin Save placement data ... (date=11/19 10:58:23, mem=2159.8M)
** Saving stdCellPlacement_binary (version# 2) ...
Save Adaptive View Pruning View Names to Binary file
% End Save placement data ... (date=11/19 10:58:23, total cpu=0:00:00.0, real=0:00:00.0, peak res=2159.8M, current mem=2159.8M)
% Begin Save routing data ... (date=11/19 10:58:23, mem=2159.8M)
Saving route file ...
*** Completed saveRoute (cpu=0:00:00.0 real=0:00:00.0 mem=2472.0M) ***
% End Save routing data ... (date=11/19 10:58:23, total cpu=0:00:00.0, real=0:00:00.0, peak res=2160.0M, current mem=2160.0M)
Saving property file jsilicon_extracted.enc.dat.tmp/tt_um_Jsilicon.prop
*** Completed saveProperty (cpu=0:00:00.0 real=0:00:00.0 mem=2475.0M) ***
#Saving pin access data to file jsilicon_extracted.enc.dat.tmp/tt_um_Jsilicon.apa ...
% Begin Save power constraints data ... (date=11/19 10:58:24, mem=2160.6M)
% End Save power constraints data ... (date=11/19 10:58:24, total cpu=0:00:00.0, real=0:00:00.0, peak res=2160.7M, current mem=2160.7M)
Generated self-contained design jsilicon_extracted.enc.dat.tmp
#% End save design ... (date=11/19 10:58:24, total cpu=0:00:01.8, real=0:00:02.0, peak res=2333.1M, current mem=2163.3M)

*** Summary of all messages that are not suppressed in this session:
Severity  ID               Count  Summary
WARNING   IMPMF-5054           1  fill_setting_save command is obsolete an...
*** Message Summary: 1 warning(s), 0 error(s)

Final Reports...
AAE_INFO: opIsDesignInPostRouteState() is 1
AAE_INFO: resetNetProps viewIdx 0
Starting SI iteration 1 using Infinite Timing Windows
#################################################################################
# Design Stage: PostRoute
# Design Name: tt_um_Jsilicon
# Design Mode: 90nm
# Analysis Mode: MMMC Non-OCV
# Parasitics Mode: SPEF/RCDB
# Signoff Settings: SI On
#################################################################################
AAE_INFO: 1 threads acquired from CTE.
Calculate delays in Single mode...
Start delay calculation (fullDC) (1 T). (MEM=2194.03)
Total number of fetched objects 636
AAE_INFO: Total number of nets for which stage creation was skipped for all views 0
AAE_INFO-618: Total number of nets in the design is 704,  90.3 percent of the nets selected for SI analysis
End delay calculation. (MEM=2200.81 CPU=0:00:00.1 REAL=0:00:00.0)
End delay calculation (fullDC). (MEM=2200.81 CPU=0:00:00.2 REAL=0:00:00.0)
Save waveform /home/student001/JSilicon2/work/pnr/innovus_temp_98246_c1a97ae3-8b0a-4970-8497-808eea003547_gjchamber_student001_MT0TKn/.AAE_g4txky/.AAE_98246_c1a97ae3-8b0a-4970-8497-808eea003547/waveform.data...
Loading CTE timing window with TwFlowType 0...(CPU = 0:00:00.0, REAL = 0:00:00.0, MEM = 2200.9M)
Add other clocks and setupCteToAAEClockMapping during iter 1
Loading CTE timing window is completed (CPU = 0:00:00.0, REAL = 0:00:00.0, MEM = 2200.9M)
Starting SI iteration 2
Calculate delays in Single mode...
Start delay calculation (fullDC) (1 T). (MEM=2193.78)
Total number of fetched objects 636
AAE_INFO: Total number of nets for which stage creation was skipped for all views 0
AAE_INFO-618: Total number of nets in the design is 704,  1.8 percent of the nets selected for SI analysis
End delay calculation. (MEM=2198.13 CPU=0:00:00.0 REAL=0:00:00.0)
End delay calculation (fullDC). (MEM=2198.13 CPU=0:00:00.0 REAL=0:00:00.0)
Start to collect the design information.
Build netlist information for Cell tt_um_Jsilicon.
Finished collecting the design information.
Generating standard cells used in the design report.
Analyze library ...
Analyze netlist ...
Generate no-driven nets information report.
Analyze timing ...
Analyze floorplan/placement ...
Analysis Routing ...
Report saved in file /home/student001/JSilicon2/reports/final/summary.rpt
GDS Streamout...
Parse flat map file 'streamOut.map'
Writing GDSII file ...
        ****** db unit per micron = 2000 ******
        ****** output gds2 file unit per micron = 2000 ******
        ****** unit scaling factor = 1 ******
Output for instance
Output for bump
Output for physical terminals
Output for logical terminals
Output for regular nets
Output for special nets and metal fills
Convert 0 swires and 0 svias from compressed groups
Output for via structure generation total number 14
Statistics for GDS generated (version 3)
----------------------------------------
Stream Out Layer Mapping Information:
GDS Layer Number          GDS Layer Name
----------------------------------------
    212                             COMP
    213                          DIEAREA
    206                          metal10
    196                             via9
    205                          metal10
    185                           metal9
    195                             via9
    175                             via8
    204                          metal10
    184                           metal9
    164                           metal8
    8                             metal1
    22                              via1
    2                            contact
    64                              via3
    44                              via2
    5                            contact
    43                              via2
    23                              via1
    1                            contact
    9                             metal1
    29                            metal2
    50                            metal3
    10                            metal1
    30                            metal2
    71                            metal4
    11                            metal1
    51                            metal3
    31                            metal2
    65                              via3
    26                              via1
    85                              via4
    52                            metal3
    32                            metal2
    72                            metal4
    92                            metal5
    47                              via2
    3                            contact
    86                              via4
    106                             via5
    200                          metal10
    161                           metal8
    78                            metal4
    38                            metal2
    58                            metal3
    97                            metal5
    117                           metal6
    53                            metal3
    14                            metal1
    73                            metal4
    93                            metal5
    113                           metal6
    198                          metal10
    178                           metal9
    158                           metal8
    75                            metal4
    36                            metal2
    16                            metal1
    55                            metal3
    119                           metal6
    68                              via3
    24                              via1
    4                            contact
    107                             via5
    127                             via6
    182                           metal9
    59                            metal3
    79                            metal4
    99                            metal5
    118                           metal6
    138                           metal7
    173                             via8
    70                              via3
    90                              via4
    109                             via5
    129                             via6
    202                          metal10
    183                           metal9
    163                           metal8
    143                           metal7
    190                             via9
    170                             via8
    67                              via3
    48                              via2
    28                              via1
    87                              via4
    131                             via6
    180                           metal9
    160                           metal8
    101                           metal5
    121                           metal6
    141                           metal7
    35                            metal2
    74                            metal4
    94                            metal5
    114                           metal6
    134                           metal7
    176                           metal9
    156                           metal8
    13                            metal1
    33                            metal2
    77                            metal4
    116                           metal6
    136                           metal7
    197                          metal10
    177                           metal9
    157                           metal8
    54                            metal3
    34                            metal2
    15                            metal1
    98                            metal5
    137                           metal7
    203                          metal10
    159                           metal8
    80                            metal4
    100                           metal5
    120                           metal6
    139                           metal7
    199                          metal10
    179                           metal9
    57                            metal3
    37                            metal2
    17                            metal1
    76                            metal4
    96                            metal5
    140                           metal7
    201                          metal10
    181                           metal9
    162                           metal8
    122                           metal6
    142                           metal7
    45                              via2
    6                            contact
    25                              via1
    89                              via4
    128                             via6
    148                             via7
    169                             via8
    66                              via3
    46                              via2
    7                            contact
    27                              via1
    110                             via5
    149                             via7
    194                             via9
    91                              via4
    111                             via5
    130                             via6
    150                             via7
    171                             via8
    112                             via5
    132                             via6
    151                             via7
    191                             via9
    69                              via3
    49                              via2
    88                              via4
    108                             via5
    152                             via7
    192                             via9
    172                             via8
    133                             via6
    153                             via7
    193                             via9
    174                             via8
    154                             via7
    56                            metal3
    12                            metal1
    95                            metal5
    115                           metal6
    135                           metal7
    155                           metal8
    18                            metal1
    19                            metal1
    39                            metal2
    60                            metal3
    20                            metal1
    40                            metal2
    81                            metal4
    21                            metal1
    61                            metal3
    41                            metal2
    62                            metal3
    42                            metal2
    82                            metal4
    102                           metal5
    210                          metal10
    63                            metal3
    83                            metal4
    103                           metal5
    123                           metal6
    208                          metal10
    188                           metal9
    168                           metal8
    84                            metal4
    104                           metal5
    124                           metal6
    144                           metal7
    186                           metal9
    166                           metal8
    126                           metal6
    146                           metal7
    207                          metal10
    187                           metal9
    167                           metal8
    147                           metal7
    209                          metal10
    189                           metal9
    105                           metal5
    125                           metal6
    145                           metal7
    165                           metal8


Stream Out Information Processed for GDS version 3:
Units: 2000 DBU

Object                             Count
----------------------------------------
Instances                            587

Ports/Pins                             0

Nets                                5684
    metal layer metal1               712
    metal layer metal2              3368
    metal layer metal3              1501
    metal layer metal4               103

    Via Instances                   3229

Special Nets                          28
    metal layer metal1                22
    metal layer metal8                 6

    Via Instances                    462

Metal Fills                            0

    Via Instances                      0

Metal FillOPCs                         0

    Via Instances                      0

Metal FillDRCs                         0

    Via Instances                      0

Text                                 647
    metal layer metal1                99
    metal layer metal2               473
    metal layer metal3                71
    metal layer metal4                 2
    metal layer metal8                 2


Blockages                              0


Custom Text                            0


Custom Box                             0

Trim Metal                             0

######Streamout is finished!
GDS size: 563 KB
GDS COMPLETE!

*** Memory Usage v#2 (Current mem = 2682.176M, initial mem = 831.172M) ***
*** Message Summary: 93 warning(s), 4 error(s)

--- Ending "Innovus" (totcpu=0:00:32.2, real=0:00:34.0, mem=2682.2M) ---


[OK] GDS complete


==============================================================================
                   RTL-TO-GDS FLOW COMPLETE!
==============================================================================

Runtime: 5m 18s

DELIVERABLES:
------------------------------------------------------------------------------
-rw-r--r-- 1 student001 student001 564K Nov 19 10:58 results/gds/tt_um_Jsilicon.gds
-rw-r--r-- 1 student001 student001 467K Nov 19 10:57 results/def/tt_um_Jsilicon.def
-rw-r--r-- 1 student001 student001 77K Nov 19 10:57 results/netlist/tt_um_Jsilicon_final.v
-rw-r--r-- 1 student001 student001 615K Nov 19 10:58 results/extraction/tt_um_Jsilicon.spef

REPORTS:
------------------------------------------------------------------------------
  Synthesis:  reports/synthesis/qor.rpt
  P&R:        reports/pnr/summary.rpt
  Final:      reports/final/summary.rpt
  Logs:       logs/

TIMING CHECK:
------------------------------------------------------------------------------
###############################################################
#  Generated by:      Cadence Innovus 23.13-s082_1
#  OS:                Linux x86_64(Host ID gjchamber)
#  Generated on:      Wed Nov 19 10:57:46 2025
#  Design:            tt_um_Jsilicon
#  Command:           report_timing -late > $report_dir/timing_summary.rpt
###############################################################
Path 1: VIOLATED Setup Check with Pin core_inst_uart_inst/data_reg_reg[1]/CLK
Endpoint:   core_inst_uart_inst/data_reg_reg[1]/D (^) checked with  leading
edge of 'clk'
Beginpoint: uio_in[4]                             (^) triggered by  leading
edge of 'clk'
Path Groups: {clk}
Analysis View: VIEW_TYPICAL
Other End Arrival Time          0.000
- Setup                         1.421
+ Phase Shift                   5.000
- Uncertainty                   0.500
= Required Time                 3.079
- Arrival Time                  3.090

==============================================================================
```

### innovus 확인

```
innovus

restoreDesign jsilicon_final_opt.enc.dat tt_um_Jsilicon
```
