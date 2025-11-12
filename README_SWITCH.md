# Switch/LED Glue — Board IO Map

> Module: `switch`  
> Timescale: `1ns/1ps`  
> Nettype: ``default_nettype none``

## 📘 Overview
Simple top‑level glue that maps board switches to internal control signals and drives LEDs with status. Debounce and sync logic are commonly included to safely bring asynchronous board IO into the clock domain.

## ⚙️ Features
- Optional 2‑FF synchronizers for async switch inputs
- Simple debounce (counter‑based) optional
- Parameterized number of switches/LEDs

## 🔌 I/O
| Name      | Dir | Width | Description                      |
|-----------|-----|-------|----------------------------------|
| `clk`     | In  | 1     | System clock                     |
| `rst_n`   | In  | 1     | Reset                            |
| `sw_in`   | In  | N     | Raw board switches               |
| `led_out` | Out | N     | LED outputs                      |
| `ctrl`    | Out | M     | Decoded/synchronized control bus |

## 🧪 Testbench Hint
- Toggle `sw_in` asynchronously to `clk` and verify that `ctrl` changes synchronously one or a few cycles later (due to debounce).

**Last Updated**: 2025-11-12 22:21
