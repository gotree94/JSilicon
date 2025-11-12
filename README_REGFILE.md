# Register File — Multi-Port 8×8 or 16×8 (parametric)

> Module: `regfile`  
> Timescale: `1ns/1ps`  
> Nettype: ``default_nettype none``

## 📘 Overview
A small synchronous register file with two read ports and one write port (2R1W). Data width and depth are parameterized for reuse (defaults shown below). Read is **combinational** (or registered per `READ_SYNC`), write occurs on the rising edge of `clk` when `we` is asserted.

## ⚙️ Features
- 2 read ports / 1 write port (2R1W)
- Parameterized `DATA_W` (default 8) and `DEPTH` (default 8)
- Optional synchronous read via `READ_SYNC`
- Reset to zero (optional `INIT_TO_ZERO`)

## 🔧 Parameters
| Name           | Default | Description                         |
|----------------|---------|-------------------------------------|
| `DATA_W`       | 8       | Data width                          |
| `DEPTH`        | 8       | Number of registers                 |
| `ADDR_W`       | $clog2(DEPTH)$ | Address width                |
| `READ_SYNC`    | 0       | 1: register read outputs            |
| `INIT_TO_ZERO` | 1       | 1: clear all regs on reset          |

## 🔌 I/O Ports
| Name     | Dir | Width           | Description                         |
|----------|-----|-----------------|-------------------------------------|
| `clk`    | In  | 1               | Clock                               |
| `rst_n`  | In  | 1               | Active‑low reset                    |
| `ra0`    | In  | `ADDR_W`        | Read address port 0                 |
| `ra1`    | In  | `ADDR_W`        | Read address port 1                 |
| `rd0`    | Out | `DATA_W`        | Read data 0                         |
| `rd1`    | Out | `DATA_W`        | Read data 1                         |
| `we`     | In  | 1               | Write enable                        |
| `wa`     | In  | `ADDR_W`        | Write address                       |
| `wd`     | In  | `DATA_W`        | Write data                          |

## 🧠 Operation
- On `clk` rising edge: if `we==1`, write `wd` to `regs[wa]`.
- `rd0`, `rd1` reflect `regs[ra0]`, `regs[ra1]`. If `READ_SYNC==1`, these are registered by `clk`.
- If `INIT_TO_ZERO==1`, all registers clear to 0 when `rst_n==0` (synchronous or async based on implementation).

## 🧪 Minimal Testbench
```verilog
`timescale 1ns/1ps
`default_nettype none
module tb_regfile;
  localparam DATA_W=8, DEPTH=8, ADDR_W=3;
  reg clk=0, rst_n=0, we;
  reg [ADDR_W-1:0] ra0, ra1, wa;
  reg [DATA_W-1:0] wd;
  wire[DATA_W-1:0] rd0, rd1;

  regfile #(.DATA_W(DATA_W), .DEPTH(DEPTH)) dut(
    .clk(clk), .rst_n(rst_n),
    .ra0(ra0), .ra1(ra1), .rd0(rd0), .rd1(rd1),
    .we(we), .wa(wa), .wd(wd)
  );

  always #5 clk=~clk;

  initial begin
    ra0=0; ra1=1; wa=0; wd=8'hAA; we=0;
    #12 rst_n=1;
    // write AA to r0, 55 to r1
    @(posedge clk); we=1; wa=0; wd=8'hAA;
    @(posedge clk); we=1; wa=1; wd=8'h55;
    @(posedge clk); we=0;
    // read back
    ra0=0; ra1=1; #1 $display("r0=%02h r1=%02h", rd0, rd1);
    $finish;
  end
endmodule
```

## 📦 Repo Layout
```
rtl/regfile.v
sim/tb_regfile.v
README.md
```

## 📝 Notes
- For write‑first vs read‑first behavior on same‑cycle read/write to same address, check device inference rules or add explicit mux logic.
- Consider hazard bypass when building a CPU datapath (forward `wd` to `rd*` if `we && wa==ra*`).

**Last Updated**: 2025-11-12 22:21
