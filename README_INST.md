# Instruction Decoder — `inst`

> Module: `inst`  
> Timescale: `1ns/1ps`  
> Nettype: ``default_nettype none``

## 📘 Overview
Decodes an instruction word into control signals for the datapath (ALU op, register reads/writes, branch type, immediate extraction). Parameterized widths let you adapt to simple 8‑bit ISA or a compact RV‑like educational ISA.

## ⚙️ Typical Outputs
- `alu_op` (opcode for ALU)
- `rs1`, `rs2`, `rd` (register addresses)
- `imm` (sign/zero‑extended immediate)
- control: `reg_we`, `mem_we`, `branch`, `jump`, `use_imm`, `wb_sel`

## 🔌 I/O (suggested)
| Name      | Dir | Width  | Description              |
|-----------|-----|--------|--------------------------|
| `instr`   | In  | `INS_W`| Raw instruction          |
| `alu_op`  | Out | 3..4   | ALU operation            |
| `rs1`     | Out | 3..5   | Source register 1        |
| `rs2`     | Out | 3..5   | Source register 2        |
| `rd`      | Out | 3..5   | Destination register     |
| `imm`     | Out | 8..16  | Decoded immediate        |
| `reg_we`  | Out | 1      | Register write enable    |
| `mem_we`  | Out | 1      | Data memory write enable |
| `branch`  | Out | 1      | Branch flag              |
| `jump`    | Out | 1      | Jump flag                |
| `use_imm` | Out | 1      | Use imm instead of rs2   |
| `wb_sel`  | Out | 2      | WB: ALU/MEM/PC+4/etc     |

## 🧠 Notes
- Keep decoding purely combinational.
- Centralize immediate extraction (e.g., I‑type, B‑type formats).
- Provide `default` case to avoid X‑propagation.

## 🧪 Example Testbench Snippet
```verilog
initial begin
  instr = 16'b000_000_001_010_000; // example enc
  #1 $display("alu_op=%0d rs1=%0d rs2=%0d rd=%0d imm=%0d", alu_op, rs1, rs2, rd, imm);
end
```

**Last Updated**: 2025-11-12 22:21
