`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/04/2025 04:54:47 PM
// Design Name: 
// Module Name: riscv_cpu
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module riscv_cpu (
    input         clk, reset,
    output [31:0] PC,
    input  [31:0] Instr,
    output        MemWriteM,
    output [31:0] Mem_WrAddr, Mem_WrData,
    input  [31:0] ReadData,
    output [31:0] Result,
    output [31:0] PCW, ALUResultW, WriteDataW, InstrM
);

wire        ALUSrc, RegWrite, Branch, Jump, Jalr;
wire [1:0]  ResultSrc, ImmSrc;
wire [3:0]  ALUControl;
wire MemWriteD;
wire [31:0] InstrD;

controller  c   (InstrD[6:0], InstrD[14:12], InstrD[30],
                ResultSrc, MemWriteD, Branch, ALUSrc,
                RegWrite, Jump, Jalr, ImmSrc, ALUControl);

datapath    dp  (clk, reset, ResultSrc, MemWriteD,
                ALUSrc, RegWrite, ImmSrc, ALUControl, Branch, Jump, Jalr, MemWriteM,
                PC, Instr, InstrD, InstrM, Mem_WrAddr, Mem_WrData, ReadData, Result, PCW, ALUResultW, WriteDataW);

// Eventually will be removed while adding pipeline registers
// assign funct3 = Instr[14:12];

endmodule

