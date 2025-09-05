# Makefile for the RISC-V Core Vivado Project
# Defines simple commands to build and clean the project.

VIVADO       := vivado
PROJECT_NAME := riscv_five_stage_pipelined_core
BUILD_DIR    := ./build
SCRIPT_DIR   := ./scripts
PROJECT_TCL  := ${SCRIPT_DIR}/create_project.tcl

# Default target when you just type 'make'
all: project

# Target to create the Vivado project
project:
	@echo "INFO: Creating Vivado project in ${BUILD_DIR}..."
	@mkdir -p ${BUILD_DIR}
	@cd ${BUILD_DIR} && ${VIVADO} -mode batch -source ../${PROJECT_TCL}
	@echo "INFO: Project generation complete."

# Target to clean all generated files
clean:
	@echo "INFO: Removing build directory..."
	@rm -rf ${BUILD_DIR} ./.Xil/ ./vivado.jou ./vivado.log

# Target to open the generated project in the GUI
gui:
	@${VIVADO} ${BUILD_DIR}/${PROJECT_NAME}.xpr

# Prevents 'make' from getting confused if files named 'clean' or 'project' exist
.PHONY: all project clean gui
