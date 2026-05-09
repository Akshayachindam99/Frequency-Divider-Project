 FREQUENCY DIVIDER BY 3 (50% DUTY CYCLE) USING VERILOG

### Chindam Akshaya  
Department of Electronics and Communication Engineering  
VLSI Project

---

# Table of Contents
- Introduction
- Theory of Frequency Divider
- Problem Statement
- Design Approach
- Working Principle
  -Steps Involved
- Verilog Implementation
  -Design Code
  -Testbench
- Simulation Results
- Conclusion
- References

---

## Introduction

A frequency divider is a digital circuit used to reduce the frequency of an input clock signal. It is widely used in timing, synchronization, and digital system design.

This project implements a divide-by-3 frequency divider using Verilog HDL. Since 3 is an odd number, generating an exact 50% duty cycle is not possible using only one clock edge. To solve this, both positive edge and negative edge triggering are used and combined to produce an output waveform with an approximately 50% duty cycle.

---

# Theory of Frequency Divider

A frequency divider produces an output frequency that is a fraction of the input frequency:
**f_out = f_in / N**
where N is the division factor.

Frequency dividers are commonly used in:
- Clock generation circuits
- Communication systems
- Digital signal processing
- Microprocessor timing systems

---

# Problem Statement

For even division factors, a 50% duty cycle is easily achieved.  
However, for odd division factors (like 3), equal high and low durations cannot be obtained using only one clock edge.

---

# Design Approach

To achieve a near 50% duty cycle:
- Two counters are used:
  - One for **posedge**
  - One for **negedge**
- Two intermediate signals are generated:
  - clk_pos
  - clk_neg
- Final output is obtained using XOR operation

---

# Working Principle

The project is based on dividing the frequency of an input clock signal using a digital design implemented in Verilog HDL. The input clock is applied to the circuit, and the system processes it using internal counters to generate a lower-frequency output signal.

Since the objective is to design a divide-by-3 frequency divider, the circuit ensures that one complete cycle of the output signal corresponds to three cycles of the input clock. This is achieved using counters that track the number of clock pulses.

However, generating a 50% duty cycle in a divide-by-3 circuit is difficult because it requires equal high and low durations, which correspond to 1.5 clock cycles each. This cannot be achieved using only the positive edge of the clock.

To solve this problem, the circuit utilizes both the positive edge (posedge) and negative edge (negedge) of the clock. Two separate counters operate on these edges, generating intermediate signals.

These signals are then combined using logical operations such as XOR to produce the final output waveform. This combined output results in a signal that has a frequency equal to one-third of the input clock and maintains an approximate 50% duty cycle.

The entire design is simulated using Vivado, where the input clock, enable signal, and output waveform are analyzed to verify correct frequency division and duty cycle.

# Steps Involved

- The input clock is applied to the system.
- A counter increments on each clock edge.
- When the counter reaches a specific value, the output toggles.
- Separate logic is implemented for:
  - Positive edge triggering
  - Negative edge triggering
- The outputs from both edges are combined:

```verilog
clk_out = clk_pos ^ clk_neg;
```

---  

# Verilog Implementation

## Design Code
- Counter-based design
- Dual-edge triggering (posedge & negedge)
- Enable-controlled operation

## Testbench
- Clock generation (10ns period)
- Reset and enable signals
- Output monitoring using $monitor

---

# Simulation Results

The design is simulated using Vivado.

Results observed:
- Output frequency is divided by 3
- Duty cycle is approximately 50%
- Stable waveform behavior
  
<img width="1094" height="471" alt="Screenshot 2026-05-09 155245" src="https://github.com/user-attachments/assets/8fef33f0-afbd-499b-95c9-e08319be3b34" />

---

# Conclusion

The frequency divider by 3 is successfully implemented using Verilog HDL.  
By utilizing both clock edges, the design achieves an approximate 50% duty cycle despite the limitations of odd frequency division.  
The simulation results verify the correctness and stability of the design.

---

# References

[1] M. Morris Mano, *Digital Design*, Pearson Education.  
[2] Samir Palnitkar, *Verilog HDL: A Guide to Digital Design and Synthesis*.  
[3] Xilinx Vivado Design Suite User Guide.  
[4]  Online resources and tutorials related to frequency divider implementation using Verilog HDL.  
[5] IEEE articles on digital clock division and duty cycle correction techniques.
