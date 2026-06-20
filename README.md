# Day-17-Vending-machine-Verilog-challenge
🚀 Day 17 of my 37-Day RTL Design Challenge: A Verilog HDL based Finite State Machine (FSM) Vending Machine that accepts ₹1 and ₹2 coins, dispenses products at ₹4 and ₹7, and automatically returns excess money when the inserted amount exceeds ₹7.



# Readme
# 🥤 Vending Machine Controller using FSM in Verilog HDL

🚀 **Day 17 of My 37-Day RTL Design Challenge**

A **Finite State Machine (FSM) based Vending Machine Controller** designed in **Verilog HDL** that accepts **₹1 and ₹2 coins**, dispenses products at **₹4 and ₹7**, and automatically returns excess money when the inserted amount exceeds the product price.

---

## 📖 Overview

This project demonstrates the implementation of a **Moore FSM-based Vending Machine** using **Verilog HDL**.

The controller tracks the accumulated amount through multiple states and performs the following operations:

✅ Accepts ₹1 and ₹2 coins  
✅ Dispenses **Product A** at ₹4  
✅ Dispenses **Product B** at ₹7  
✅ Returns change for overpayment  
✅ Automatically resets after dispensing  
✅ Fully verified through simulation and waveform analysis

---

## ✨ Unique Design Approach

Instead of using multiple coin inputs, this design uses **two simple control signals**:

| Signal | Function |
|----------|----------|
| `coin_inserted = 1` | Indicates a coin has been inserted |
| `coin = 1` | Represents a ₹1 coin |
| `coin = 0` | Represents a ₹2 coin |

### 💡 Why is this unique?

🔹 Reduces input complexity

🔹 Uses a compact FSM implementation

🔹 Easy to scale for future enhancements

🔹 Demonstrates efficient state transition design

🔹 Mimics real-world coin detection using a validity signal (`coin_inserted`)

---

## 🏗️ FSM State Representation

| State | Accumulated Amount |
|---------|------------------|
| S0 | ₹0 |
| S1 | ₹1 |
| S2 | ₹2 |
| S3 | ₹3 |
| S4 | ₹4 → Dispense Product A |
| S5 | ₹5 |
| S6 | ₹6 |
| S7 | ₹7 → Dispense Product B |
| S8 | ₹8 → Dispense Product B + Return ₹1 |
| S9 | ₹9 → Dispense Product B + Return ₹2 |

---

## 🪙 Product Pricing

| Product | Price |
|----------|---------|
| 🥤 Product A | ₹4 |
| 🍫 Product B | ₹7 |

---

## 💰 Change Return Logic

| Total Amount | Action |
|--------------|---------|
| ₹7 | 🍫 Dispense Product B |
| ₹8 | 🍫 Dispense Product B + 💰 Return ₹1 |
| ₹9 | 🍫 Dispense Product B + 💰 Return ₹2 |

After dispensing the product and returning change (if any), the FSM automatically transitions back to the **Idle State (S0)**.

---

## 📥 Inputs

| Signal | Description |
|----------|------------|
| `clk` | System Clock |
| `rst_n` | Active-Low Reset |
| `coin_inserted` | Coin Detection Signal |
| `coin` | Coin Value Selection |

---

## 📤 Outputs

| Signal | Description |
|----------|------------|
| `dispense_a` | Dispense Product A |
| `dispense_b` | Dispense Product B |
| `return_1rs` | Return ₹1 Change |
| `return_2rs` | Return ₹2 Change |

---

## 🔍 Verification Results

### ✔ Test Case 1

Coins Inserted:

```text
₹1 + ₹2 + ₹1 + ₹2 = ₹6
```

FSM correctly transitions through states and dispenses the product at the required amount.

### ✔ Test Case 2

Coins Inserted:

```text
₹2 + ₹2 + ₹2 + ₹2 = ₹8
```

Output:

```text
Dispense Product B
Return ₹1 Change
```

### ✔ Simulation Status

✅ Functional Verification Passed

✅ Correct State Transitions Observed

✅ Outputs Verified Through Waveform Analysis

✅ No Invalid States Detected

---

## 🛠️ Tools Used

- 🔹 Verilog HDL
- 🔹 Icarus Verilog
- 🔹 EPWave / GTKWave
- 🔹 EDA Playground

---

## 🎯 Learning Outcomes

- Finite State Machine (FSM) Design
- Moore Machine Architecture
- State Transition Logic
- Verilog RTL Coding
- Functional Verification
- Testbench Development
- Waveform Debugging
- Digital System Design

---

## 🚀 Future Improvements

- Support for additional coin denominations
- Multiple product selection
- LCD Display Interface
- Inventory Management
- FPGA Implementation
- UPI / Digital Payment Support

---

## 👨‍💻 Author

### **Arpit Shukla**

🚀 **37-Day RTL Design Challenge**

Passionate about **RTL Design, Verilog HDL, Digital Design, FPGA, and VLSI Systems.**

---

## ⭐ If you found this project useful, consider giving it a Star!

#Verilog #RTLDesign #FSM #VendingMachine #DigitalDesign #FPGA #VLSI #EDA #ElectronicsEngineering
