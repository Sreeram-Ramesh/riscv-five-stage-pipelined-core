# A 32-bit 5-Stage Pipelined RISC-V Processor Core

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Language](https://img.shields.io/badge/Language-Verilog-blue.svg)](./)
[![Tool](https://img.shields.io/badge/Tool-Vivado%202024.1-purple.svg)](./)

An implementation of a 32-bit, five-stage pipelined RISC-V processor with base integer extension. Designed in Verilog HDL the processor has pipeline registers and a hazard unit for data forwarding and control hazards.

### Key Features
* **ISA:** RV32I Base Integer Instruction Set
* **Architecture:** 5-Stage Pipelined Datapath with Hazard Detection
* **Hazard Handling:** A hazard unit supporting data forwarding, load-use stalling, and control hazard flushing
* **Modularity:** Designed separate modules for ALU, Control Unit, Hazard Unit, Register File, and Pipeline Registers for clean separation of concerns
* **Reproducible Workflow:** Used `Makefile` for automating build processes

Find more information about the datapath architecture in [here](/doc/architecture.md).

## Project Tree


```
├── doc/                    # Documentation (Architecture, Diagrams)
├── hex/                    # hex file acting as the instruction mem (*.hex)
├── rtl/                    # Verilog RTL source files (*.v)
├── scripts/                # Build and simulation scripts (*.tcl)
├── tb/                     # Verilog testbenches
├── LICENSE                 # MIT License
└── Makefile                # Makefile for automating the build process
```

## Workflow using Make

This project uses a `Makefile` to automate all common tasks. All commands must be run from the root directory of the repository.

### Prerequisites
* Xilinx Vivado Design Suite (e.g., 2024.1 or later)
* `make` build automation tool

### Instructions

1.  **Clone the Repository:**
    ```shell
    git clone [https://github.com/Sreeram-Ramesh/riscv-five-stage-pipelined-core.git](https://github.com/Sreeram-Ramesh/riscv-five-stage-pipelined-core.git)
    cd riscv-five-stage-pipelined-core
    ```

2.  **Build the Vivado Project:**
    This command generates a fresh Vivado project in the `build/` directory using the provided Tcl script.
    ```shell
    make
    ```

3.  **Clean the Project:**
    This command completely removes the generated `build/` directory and all log files, ensuring a clean state.
    ```shell
    make clean
    ```

4.  **Open the Project in the GUI:**
    This command opens the generated project in the Vivado GUI for analysis and simulation.
    ```shell
    make gui
    ```

## Future Works
- Working on a RISCV SoC that can be implemented on Zynq 7000 SoC.
- Cache hierarchy implementation with cache replacement policies.   

## Acknowledgements

 - [e-Yantra 2024 Competition](https://www.e-yantra.org/)
 - [IIT Hyderabad Next Gen Computer Architecture (ROCA 2025)](https://www.linkedin.com/posts/department-of-cse-iit-hyderabad_roca2025-iithyderabad-intelindia-activity-7353655624469037058-1N_4?utm_source=share&utm_medium=member_ios&rcm=ACoAADkvqGUB94WOdm3s7FTbFnSzMv0dUWeNtaY)
 - [RISCV Handbook - Patterson and Hennessy](https://www.cs.sfu.ca/~ashriram/Courses/CS295/assets/books/HandP_RISCV.pdf)
 - [Sarah Harris - YouTube](https://www.youtube.com/@sarahharris6912)

