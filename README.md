# 8-bit_ALU
Designed and implemented a fully functional 8-bit Arithmetic Logic Unit (ALU) using Verilog HDL for deployment on the Digilent Basys 3 FPGA board. The ALU supports 12 fundamental arithmetic and logical operations selected via a 4-bit control signal
# 🔢 8-bit ALU on Basys 3 FPGA (Extended Operations)

This project implements a 4-bit-select-based **8-bit Arithmetic Logic Unit (ALU)** using Verilog HDL and simulates it using a testbench. It is also synthesizable on the **Basys 3 FPGA** using Xilinx Vivado.

---

## 📌 Features

- Operands: 8-bit `A` and `B`
- Select line: 4-bit `sel` for up to 16 operations
- Outputs: `result` (8-bit), `carry` (1-bit), `zero` (1-bit)
- Designed for Basys 3 FPGA board
- Fully testbench verified

---

## ⚙️ Supported ALU Operations

| `sel`  | Operation       | Description                      |
|--------|------------------|----------------------------------|
| `0000` | `A + B`          | 8-bit Addition                   |
| `0001` | `A - B`          | 8-bit Subtraction                |
| `0010` | `A & B`          | Bitwise AND                      |
| `0011` | `A \| B`         | Bitwise OR                       |
| `0100` | `A ^ B`          | Bitwise XOR                      |
| `0101` | `~A`             | Bitwise NOT                      |
| `0110` | `A << 1`         | Logical Shift Left               |
| `0111` | `A >> 1`         | Logical Shift Right              |
| `1000` | `A * B`          | Multiplication (lower 8 bits)    |
| `1001` | `A / B`          | Division (ignore remainder)      |
| `1010` | `A % B`          | Modulo operation                 |
| `1011` | `A == B`         | Equality Check (1 if equal)      |

---

## 🧪 Simulation

Tested using the `alu_tb.v` testbench which:
- Initializes input values
- Iterates over all 12 operations
- Displays output for each

---

## 🔧 Hardware Implementation (Basys 3)

You can map the inputs and outputs as follows:

### 🔌 Inputs
- `A[7:0]` → 8 switches (SW0–SW7)
- `B[7:0]` → 8 switches (SW8–SW15)
- `sel[3:0]` → 4 switches (SW16–SW19)

### 💡 Outputs
- `result[7:0]` → 8 LEDs (LD0–LD7)
- `carry` → LED (LD8)
- `zero` → LED (LD9)

### 📎 Constraints File
Use the `alu.xdc` file to map switches and LEDs to proper FPGA pins.


