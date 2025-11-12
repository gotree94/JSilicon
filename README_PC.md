# Program Counter — Synchronous Up-Counter with Branch/Jump

> Module: `pc`  
> Timescale: `1ns/1ps`  
> Nettype: ``default_nettype none``

## 📘 Overview
A program counter (PC) that increments by a parameterized step (default `+1` or `+4`) on each cycle, with support for branch/jump via `pc_next` or `pc_offset`. Reset initializes the PC to `RESET_ADDR`.

## ⚙️ Features
- Parameterized width (`PC_W`) and increment step (`STEP`)
- Direct load (`pc_load`) for absolute jumps
- Relative branch via signed `pc_offset` when `branch_taken`
- Synchronous active‑low reset to `RESET_ADDR`

## 🔧 Parameters
| Name          | Default | Description                    |
|---------------|---------|--------------------------------|
| `PC_W`        | 16      | PC width                       |
| `STEP`        | 1       | Increment amount per cycle     |
| `RESET_ADDR`  | 0       | Reset value                    |

## 🔌 I/O Ports
| Name           | Dir | Width    | Description                                |
|----------------|-----|----------|--------------------------------------------|
| `clk`          | In  | 1        | Clock                                      |
| `rst_n`        | In  | 1        | Active‑low reset                           |
| `pc_load`      | In  | 1        | Load absolute `pc_next`                    |
| `pc_next`      | In  | `PC_W`   | Absolute next PC                           |
| `branch_taken` | In  | 1        | Apply relative branch                      |
| `pc_offset`    | In  | `PC_W`   | Signed offset (two's complement)           |
| `pc_curr`      | Out | `PC_W`   | Current PC                                 |

## 🧠 Operation
Priority each cycle (highest first):
1) `!rst_n` → `pc_curr := RESET_ADDR`  
2) `pc_load` → `pc_curr := pc_next`  
3) `branch_taken` → `pc_curr := pc_curr + pc_offset`  
4) otherwise → `pc_curr := pc_curr + STEP`

## 🧪 Minimal Testbench
```verilog
`timescale 1ns/1ps
`default_nettype none
module tb_pc;
  localparam PC_W=16, STEP=1, RESET_ADDR=16'h0000;
  reg clk=0, rst_n=0, pc_load=0, branch_taken=0;
  reg [PC_W-1:0] pc_next=0, pc_offset=0;
  wire[PC_W-1:0] pc_curr;
  pc #(.PC_W(PC_W), .STEP(STEP), .RESET_ADDR(RESET_ADDR)) dut(
    .clk(clk), .rst_n(rst_n), .pc_load(pc_load), .pc_next(pc_next),
    .branch_taken(branch_taken), .pc_offset(pc_offset),
    .pc_curr(pc_curr)
  );
  always #5 clk=~clk;
  initial begin
    #12 rst_n=1;
    repeat(3) @(posedge clk);
    // direct jump
    pc_load=1; pc_next=16'h0100; @(posedge clk); pc_load=0;
    // branch +2
    branch_taken=1; pc_offset=16'sd2; @(posedge clk); branch_taken=0;
    // branch -1
    branch_taken=1; pc_offset=-16'sd1; @(posedge clk); branch_taken=0;
    $finish;
  end
endmodule
```

**Last Updated**: 2025-11-12 22:21
