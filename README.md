# RISC-V-RV32I-
Different methods of implementation of RISC-V ( Reduced Instruction Set Computing ) Integer Edition with all the instructions along with the Control Status Register with different methods of modelling and pipeline

## **Designing an ALU in GATE LEVEL MODELLING for R-Type Instructions in RISC-V**

The **Arithmetic Logic Unit (ALU)** is a crucial component of a processor, responsible for executing arithmetic, logical, and shift operations. This ALU is designed to support **R-Type Instructions** in **RISC-V**, handling **10 different operations**.

---

## **1. Operations Supported**
The ALU performs three categories of operations:

### **1.1 Arithmetic Operations**
| Instruction | Operation                          | Description                     |
|------------|----------------------------------|---------------------------------|
| ADD        | `A + B`                          | Addition                        |
| SUB        | `A - B`                          | Subtraction                     |
| SLT        | `(A < B) ? 1 : 0`                | Set Less Than (Signed)          |
| SLTU       | `(unsigned(A) < unsigned(B)) ? 1 : 0` | Set Less Than Unsigned |

### **1.2 Logical Operations**
| Instruction | Operation  | Description          |
|------------|-----------|----------------------|
| XOR        | `A ^ B`   | Bitwise XOR         |
| OR         | `A | B`   | Bitwise OR          |
| AND        | `A & B`   | Bitwise AND         |

### **1.3 Shift Operations**
| Instruction | Operation  | Description                     |
|------------|-----------|---------------------------------|
| SLL        | `A << B`  | Shift Left Logical              |
| SRL        | `A >> B`  | Shift Right Logical             |
| SRA        | `A >>> B` | Shift Right Arithmetic          |

---

## **2. Instruction Encoding and Funct3 Values**
Each **R-Type instruction** is uniquely identified by the **funct3** field in the instruction format.

| Instruction | Funct3 |
|------------|--------|
| ADD        | 000    |
| SUB        | 000    |
| SLL        | 001    |
| SLT        | 010    |
| SLTU       | 011    |
| XOR        | 100    |
| SRL        | 101    |
| SRA        | 101    |
| OR         | 110    |
| AND        | 111    |

---

## **3. Differentiation of Similar Funct3 Values**
Some instructions share the same **funct3** encoding. The difference is determined by **bit 5 of funct7**.

| Instruction Pair | Funct3 | funct7[5] | Operation |
|-----------------|--------|-----------|-----------|
| ADD vs SUB     | 000    | 0 → ADD   | 1 → SUB   |
| SRL vs SRA     | 101    | 0 → SRL   | 1 → SRA   |

- If **funct7[5] = 0**, the instruction is **ADD** or **SRL**.
- If **funct7[5] = 1**, the instruction is **SUB** or **SRA**.

---

## **4. Special Case: SUB in I-Type Instructions**
- **SUB does not exist in I-Type instructions.**
- In I-Type instructions, the `funct7[5]` bit is part of the **immediate field**, not `funct7`.
- This means `funct7[5] = 1` does **not** indicate a subtraction.

---

## **5. ALU Design Considerations**
To implement these operations, the ALU should have:

1. **Arithmetic Unit**: Handles **ADD, SUB, SLT, SLTU** operations.
2. **Logical Unit**: Performs **XOR, OR, AND**.
3. **Shifter Unit**: Executes **SLL, SRL, SRA**.
4. **Multiplexers**: Select between different results based on `funct3` and `funct7[5]`.

---

## **6. ALU Operation Selection Logic**
The ALU control logic is designed based on **funct3** and **funct7[5]**.

### **6.1 ALU Control Signal Mapping**
| Funct3 | Funct7[5] | ALU Operation |
|--------|----------|--------------|
| 000    | 0        | ADD          |
| 000    | 1        | SUB          |
| 001    | X        | SLL          |
| 010    | X        | SLT          |
| 011    | X        | SLTU         |
| 100    | X        | XOR          |
| 101    | 0        | SRL          |
| 101    | 1        | SRA          |
| 110    | X        | OR           |
| 111    | X        | AND          |

- `"X"` means the value of `funct7[5]` does not affect the instruction.

### **6.2 ALU Logic Implementation**
- **ADD/SUB**: `Result = A + (funct7[5] ? ~B + 1 : B);`
- **SLT/SLTU**: `Result = (signed(A) < signed(B)) ? 1 : 0;`
- **XOR, OR, AND**: Direct bitwise operations.
- **SLL/SRL/SRA**: Use the shift unit with different logic.

---

## **7. Implementation in Hardware**
### **7.1 ALU Block Diagram**
The ALU design consists of:
- **Multiplexers** to choose between operations.
- **Arithmetic Logic Circuits** for addition, subtraction, and comparisons.
- **Logical Circuits** for bitwise operations.
- **Shift Circuits** for shifting operations.

### **7.2 Hardware Modules**
Each operation is implemented using basic logic gates:
- **Addition/Subtraction**: Full adder circuits.
- **Bitwise Logic Operations**: AND, OR, XOR gates.
- **Shift Operations**: Barrel shifters for SLL, SRL, and SRA.

---

## **8. Verilog Implementation**
A sample Verilog implementation of the ALU based on the above logic would involve:
- **Case statements** to select operations.
- **Bitwise operations** for logical instructions.
- **Shift operations** using shift operators.
- **Multiplexers** for ADD/SUB and SRL/SRA differentiation.

---

## **9. Testing the ALU**
The ALU should be tested with:
1. **All possible funct3 values**.
2. **Different values of funct7[5]** to differentiate ADD/SUB and SRL/SRA.
3. **Signed and unsigned comparisons** for SLT and SLTU.
4. **Shifting edge cases** (e.g., shifting by 0 or 31 bits).
5. **Logical operations with all 1s and 0s to check correctness**.

A Verilog testbench can be created to verify each instruction using **assertions** and **test vectors**.

---

## **10. Conclusion**
- This ALU efficiently supports all **R-Type Instructions** in **RISC-V**.
- Uses **funct3** and **funct7[5]** to differentiate between similar instructions.
- Implements **arithmetic, logical, and shift operations** using minimal hardware.
- Can be integrated into a **RISC-V processor pipeline** to execute ALU operations efficiently.

---

## **RTL Schematic of RISC-V ALU (Gate Level Modelling) **
![Arithemetic Logic Unit](https://github.com/SaiManojGubbala/RISC-V-RV32I/blob/main/Screenshot%20from%202025-03-11%2019-19-53.png)

