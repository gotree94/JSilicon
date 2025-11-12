# jsilicon — Top-Level SoC Stitch (Mini CPU + Peripherals)

> Module: `jsilicon`  
> Timescale: `1ns/1ps`  
> Nettype: ``default_nettype none``

## 📘 Overview
`jsilicon` integrates the CPU core (ALU, `pc`, `regfile`, `inst` decoder) with board IO (`switch`), and peripherals (`uart`, etc.). It wires the datapath and control, providing a synthesizable top for FPGA targets (e.g., Zybo Z7‑20 / Basys3).

## 🧩 Block Diagram (conceptual)
```
           +------------------+
 sw_in --> | switch/debounce  |-- ctrl ----+
           +------------------+            |
                                           v
        +-------+    +----------+     +--------+     +---------+
clk --->|  pc   |--->|  inst    |---->| control|---->|  ALU    |
        +-------+    +----------+     +--------+     +---------+
              ^               |             |              |
              |               v             |              v
           branch         regfile <---------+----------> result
              |                               ^
              v                               |
            (pc_next/offset)               uart/IO
```

## 🔌 Top-Level I/O (suggested)
| Name       | Dir | Width | Description                 |
|------------|-----|-------|-----------------------------|
| `clk`      | In  | 1     | System clock                |
| `rst_n`    | In  | 1     | Reset                       |
| `sw_in`    | In  | 4..8  | Board switches              |
| `led_out`  | Out | 4..8  | Board LEDs                  |
| `uart_rx`  | In  | 1     | UART RX                     |
| `uart_tx`  | Out | 1     | UART TX                     |

## 🧠 Integration Notes
- Ensure consistent reset polarity across submodules.
- Define a single package or header with common parameters (e.g., widths, opcodes).
- Constrain board pins in XDC/SDC; add clocking (MMCM) as needed.
- CDC: synchronize external inputs (`sw_in`, `uart_rx`).

## 🧪 Bring-Up Checklist
- Simulate CPU single‑step (fetch‑decode‑execute) with a small program ROM.
- GPIO: tie ALU flags to LEDs for quick heartbeat.
- UART: print boot banner at reset for liveness.

**Last Updated**: 2025-11-12 22:21
