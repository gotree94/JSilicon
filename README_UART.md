# UART — 8N1 TX/RX (Parametric Baud)

> Module: `uart`  
> Timescale: `1ns/1ps`  
> Nettype: ``default_nettype none``

## 📘 Overview
Hardware UART with separate transmitter and receiver supporting 8 data bits, no parity, 1 stop bit (8N1). Baud rate is derived from `CLK_HZ` and `BAUD` parameters via an integer divider. Includes ready/valid handshakes.

## 🔧 Parameters
| Name     | Default     | Description                 |
|----------|-------------|-----------------------------|
| `CLK_HZ` | 50_000_000  | Input clock frequency       |
| `BAUD`   | 115_200     | UART baud rate              |

## 🔌 I/O
| Name      | Dir | Width | Description                           |
|-----------|-----|-------|---------------------------------------|
| `clk`     | In  | 1     | Clock                                 |
| `rst_n`   | In  | 1     | Reset                                 |
| `rx_i`    | In  | 1     | Serial RX line                        |
| `tx_o`    | Out | 1     | Serial TX line                        |
| `tx_data` | In  | 8     | Byte to send                          |
| `tx_valid`| In  | 1     | Assert to start TX when `tx_ready=1`  |
| `tx_ready`| Out | 1     | TX is idle and can accept a new byte  |
| `rx_data` | Out | 8     | Received byte                         |
| `rx_valid`| Out | 1     | Pulses high when a byte is received   |

## 🧪 Loopback Testbench
```verilog
`timescale 1ns/1ps
`default_nettype none
module tb_uart;
  localparam CLK_HZ=1_000_000, BAUD=115200;
  reg clk=0, rst_n=0;
  wire tx, rx;
  reg  [7:0] tx_data; reg tx_valid; wire tx_ready;
  wire [7:0] rx_data; wire rx_valid;

  // loopback
  assign rx = tx;

  uart #(.CLK_HZ(CLK_HZ), .BAUD(BAUD)) dut(
    .clk(clk), .rst_n(rst_n),
    .rx_i(rx), .tx_o(tx),
    .tx_data(tx_data), .tx_valid(tx_valid), .tx_ready(tx_ready),
    .rx_data(rx_data), .rx_valid(rx_valid)
  );

  always #5 clk=~clk;

  initial begin
    #20 rst_n=1;
    repeat(5) @(posedge clk);
    @(posedge clk);
    if(tx_ready) begin tx_data=8'h55; tx_valid=1; end
    @(posedge clk); tx_valid=0;
    wait(rx_valid); $display("RX=0x%02h", rx_data);
    $finish;
  end
endmodule
```

## 📝 Notes
- For exact baud matching, use fractional dividers or oversampling (x8/x16) on RX.
- Synchronize the asynchronous `rx_i` line before sampling.

**Last Updated**: 2025-11-12 22:21
