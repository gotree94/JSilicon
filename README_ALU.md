# ALU — 8-bit Arithmetic Logic Unit (with 16-bit result)

> Module: `ALU`  
> Timescale: `1ns/1ps`  
> Nettype: ``default_nettype none`` (implicit nets disabled)

## 📘 Overview
This ALU operates on two 8-bit operands `a`, `b` selected by a 3-bit `opcode`.  
All results are returned on a 16-bit `result` to accommodate multiply and to keep a consistent data width.  
If `ena` is low, the result is **held** (implementation-dependent; see notes).

> **Division-by-zero** is safely handled: result becomes `16'h0000` for `/` and `%` when `b == 0`.

## ⚙️ Features
- 8-bit operands, 3-bit opcode
- 16-bit zero-extended results for add/sub/div/mod/compare
- 16-bit multiply support
- Graceful divide-by-zero behavior
- Synthesis-friendly Verilog-2001 with `default_nettype none`

## 🔧 I/O Ports

| Name     | Dir  | Width | Description                         |
|----------|------|-------|-------------------------------------|
| `a`      | In   | 8     | Operand A                           |
| `b`      | In   | 8     | Operand B                           |
| `opcode` | In   | 3     | Operation select                    |
| `ena`    | In   | 1     | Enable: update result when asserted |
| `result` | Out  | 16    | Computation result                  |

## 🧠 Opcode Map
Based on comments in `alu.v`, the ALU supports the following operations:

| `opcode` | Operation  | Semantics                                      | Result Width |
|----------|------------|------------------------------------------------|--------------|
| `3'b000` | ADD        | `result = {8'b0, a + b}`                       | 16-bit       |
| `3'b001` | SUB        | `result = {8'b0, a - b}`                       | 16-bit       |
| `3'b010` | MUL        | `result = a * b` (stored to 16-bit)            | 16-bit       |
| `3'b011` | DIV        | `result = (b==0) ? 16'h0000 : {8'b0, a / b}`   | 16-bit       |
| `3'b100` | MOD        | `result = (b==0) ? 16'h0000 : {8'b0, a % b}`   | 16-bit       |
| `3'b101` | EQ         | `result = (a == b) ? 16'h0001 : 16'h0000`      | 16-bit flag  |
| `3'b110` | GT         | `result = (a >  b) ? 16'h0001 : 16'h0000`      | 16-bit flag  |
| `3'b111` | LT         | `result = (a <  b) ? 16'h0001 : 16'h0000`      | 16-bit flag  |

> **Note**: The multiply path may use an internal `multiply_temp` signal per the source comments.

## 🧩 Design Notes
- `(* keep_hierarchy *)` is applied to keep the module boundary through synthesis.  
- With ``default_nettype none``, every net must be declared—this prevents accidental implicit wires.  
- `ena` gating: The provided source hints the ALU may latch/hold `result` when `ena == 0`. If you require purely combinational behavior, drive `ena` high or wrap this ALU with a register stage.

## 🛠 Example Instantiation
```verilog
ALU u_alu (
  .a       (a_i),
  .b       (b_i),
  .opcode  (opcode_i),
  .ena     (1'b1),       // always enabled
  .result  (result_o)
);
```

## 🧪 Minimal Testbench
Create `tb_alu.v`:
```verilog
`timescale 1ns/1ps
`default_nettype none

module tb_alu;
  reg  [7:0] a, b;
  reg  [2:0] opcode;
  reg        ena;
  wire [15:0] result;

  ALU dut(.a(a), .b(b), .opcode(opcode), .ena(ena), .result(result));

  task do_op(input [2:0] op, input [7:0] A, input [7:0] B);
    begin
      opcode = op; a = A; b = B; ena = 1'b1;
      #1; // delta cycle
      $display("op=%0d a=%0d b=%0d -> result=0x%04h", op, A, B, result);
    end
  endtask

  initial begin
    do_op(3'b000, 8'd12, 8'd34); // add
    do_op(3'b001, 8'd50, 8'd10); // sub
    do_op(3'b010, 8'd12, 8'd11); // mul
    do_op(3'b011, 8'd12, 8'd0 ); // div by zero -> 0
    do_op(3'b011, 8'd100,8'd5 ); // div
    do_op(3'b100, 8'd10, 8'd4 ); // mod
    do_op(3'b101, 8'd20, 8'd20); // eq
    do_op(3'b110, 8'd21, 8'd20); // gt
    do_op(3'b111, 8'd19, 8'd20); // lt
    $finish;
  end
endmodule
```

### Run (ModelSim/Questa)
```sh
vlog alu.v tb_alu.v
vsim -c tb_alu -do "run -all; quit"
```

### Run (Icarus Verilog)
```sh
iverilog -g2012 -o tb_alu.out alu.v tb_alu.v
vvp tb_alu.out
```

### Run (Verilator - SystemC/C++)
```sh
verilator -Wall --cc --exe tb_alu.cpp alu.v
make -C obj_dir -f Valu.mk Valu
./obj_dir/Valu
```

> For Verilator, replace with your preferred C++/SystemC harness.

## 📦 Suggested Repo Layout
```
├─ rtl/
│  └─ alu.v
├─ sim/
│  ├─ tb_alu.v
│  └─ run.do           # (optional) Questa/ModelSim script
├─ docs/
│  └─ README_ALU.md    # this file (or move to top-level)
└─ README.md
```

## ✅ Lint & Synthesis Tips
- Keep `opcode` fully specified; consider a `default` path returning `16'h0000`.
- If targeting Xilinx/Intel FPGAs, 8×8 multiply will infer a single DSP or LUT logic depending on device—check resource mapping.
- For strictly **combinational** ALU, ensure `result` is always driven for all `opcode` values and `ena` is tied high, or wrap with an explicit register stage.

## 📝 License
Add your project’s LICENSE (e.g., MIT).

---

**Author**: (your name)  
**Last Updated**: 2025-11-12 22:19
