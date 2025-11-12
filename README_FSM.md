# FSM — Generic Finite State Machine Template

> Module: `fsm`  
> Timescale: `1ns/1ps`  
> Nettype: ``default_nettype none``

## 📘 Overview
Reusable FSM shell with parameterized state encoding. Separates **state register**, **next‑state logic**, and **output logic**. Suitable for control of pipelines, bus handshakes, UART control, etc.

## ⚙️ Pattern
- Enumerated `localparam` state encodings
- One always block for state register (`@(posedge clk or negedge rst_n)`)
- One combinational block for next‑state
- One combinational block for output decode

## 🧩 Example Structure
```verilog
typedef enum logic [1:0] {S_IDLE, S_REQ, S_WAIT, S_DONE} state_e;
state_e state, state_n;

always @(posedge clk or negedge rst_n) begin
  if(!rst_n) state <= S_IDLE;
  else       state <= state_n;
end

always @* begin
  state_n = state;
  unique case (state)
    S_IDLE: if(start) state_n = S_REQ;
    S_REQ :          state_n = S_WAIT;
    S_WAIT: if(ack)  state_n = S_DONE;
    S_DONE:          state_n = S_IDLE;
  endcase
end

always @* begin
  busy = (state!=S_IDLE);
  req  = (state==S_REQ);
end
```

## 🧪 Minimal Testbench
```verilog
`timescale 1ns/1ps
`default_nettype none
module tb_fsm;
  reg clk=0, rst_n=0, start=0, ack=0;
  wire busy, req;
  fsm dut(.clk(clk), .rst_n(rst_n), .start(start), .ack(ack), .busy(busy), .req(req));
  always #5 clk=~clk;
  initial begin
    #12 rst_n=1; start=1; @(posedge clk); start=0;
    repeat(2) @(posedge clk);
    ack=1; @(posedge clk); ack=0;
    repeat(2) @(posedge clk);
    $finish;
  end
endmodule
```

## 📝 Notes
- Use `unique case`/`priority if` for safer synthesis.
- Consider one‑hot or gray encoding for timing/area tradeoff.
- For Mealy outputs, guard against glitches with registering.

**Last Updated**: 2025-11-12 22:21
