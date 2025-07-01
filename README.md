# GateWiz

## Overview
This project was developed under the Electrical Engineers Association (EEA), IIT Kanpur.
This project contains a collection of fundamental digital design modules implemented in Verilog along with a digital alarm clock system. It covers basic combinational and sequential logic blocks, and a practical application in the form of a self-contained alarm clock design.

---

## Folder Structure
- `verilog_logic_blocks/`
Contains reusable digital logic building blocks such as adders, subtractors, multiplexers, demultiplexers, and a custom XOR-based flip-flop.
Each module includes a corresponding testbench and GTKWave waveform output for verification.

- `digital_alarm_clock/`
Verilog implementation of a digital alarm clock with features including timekeeping, alarm setting, and alarm control logic.
Includes the main module and testbench. Detailed usage and design information is in the main README.

---

## Modules Description

### Verilog Logic Blocks
- **Adder**: 1-bit full adder using basic gates.  
- **Subtractor**: 1-bit subtractor with borrow output.  
- **Mux64to1_8bit**: 64-to-1 multiplexer selecting one 8-bit input out of 64 inputs.  
- **Demux1to2_100bit**: 1-to-2 demultiplexer handling 100-bit input data.  
- **XOR-based Flip-Flop (xor_ff)**: A sequential module that toggles output based on XOR of input and current output, demonstrating conditional toggle behavior.

### Digital Alarm Clock
- Implements a timekeeping system counting hours, minutes, and seconds.  
- Supports setting current time and alarm time.  
- Alarm triggers when current time matches the alarm time.  
- Includes manual alarm stop and enable signals.

---

## How to Simulate

Each module is accompanied by a dedicated testbench (`*_tb.v`) which can be simulated using [Icarus Verilog](http://iverilog.icarus.com/) and waveform results can be viewed with [GTKWave](http://gtkwave.sourceforge.net/).

Example commands to simulate and view waveforms for a module:

```bash
iverilog -o <module_tb> <module_tb>.v
vvp <module_tb>
gtkwave <module_tb>.vcd
```

---

## Project Goals
- To provide clear, modular Verilog code for essential digital logic components for learning and reuse.
- To build a working digital alarm clock example illustrating sequential logic and real-world application.
- To develop good simulation and verification practices with testbenches and waveform analysis.

## Tools & Requirements
- Icarus Verilog (iverilog): Open-source Verilog simulator.
- GTKWave: Waveform viewer for visualizing simulation output.

## Author
Created by Yashwi Agarwal as part of GateWiz project under the Electrical Engineers Association (EEA), IIT Kanpur.
