// pipeline registers -> decode | execute stage

module pl_reg_de (
    input             clk, clr,
    input             RegWriteD,
    input       [1:0] ResultSrcD,
    input             MemWriteD, JumpD, BranchD,
    input             JalrD,
    input       [3:0] ALUControlD,
    input             ALUSrcD,
    input      [31:0] RD1D, RD2D, PCD,
    input       [4:0] Rs1D, Rs2D, RdD,
    input      [31:0] ImmExtD, PCPlus4D, InstrD,
    output reg        RegWriteE,
    output reg  [1:0] ResultSrcE,
    output reg        MemWriteE, JumpE, BranchE,
    output reg        JalrE,
    output reg  [3:0] ALUControlE,
    output reg        ALUSrcE,
    output reg [31:0] RD1E, RD2E, PCE,
    output reg  [4:0] Rs1E, Rs2E, RdE,
    output reg [31:0] ImmExtE, PCPlus4E, InstrE
);

initial begin
    RegWriteE = 0; ResultSrcE = 0; MemWriteE = 0;
    JumpE = 0; BranchE = 0; ALUControlE = 0;
    ALUSrcE = 0; RD1E = 0; RD2E = 0; PCE = 0;
    Rs1E = 0; Rs2E = 0; 
    RdE = 0; ImmExtE = 0; PCPlus4E = 0; InstrE = 0;
    JalrE = 0;
end

always @(posedge clk) begin
    if (clr) begin
        RegWriteE <= 0; ResultSrcE <= 0; MemWriteE <= 0;
        JumpE <= 0; BranchE <= 0; ALUControlE <= 0;
        ALUSrcE <= 0; RD1E <= 0; RD2E <= 0; PCE <= 0;
        Rs1E <= 0; Rs2E <= 0;
        RdE <= 0; ImmExtE <= 0; PCPlus4E <= 0; InstrE <= 0;
        JalrE <= 0;
    end else begin
        RegWriteE <= RegWriteD; ResultSrcE <= ResultSrcD; MemWriteE <= MemWriteD;
        JumpE <= JumpD; BranchE <= BranchD; ALUControlE <= ALUControlD;
        ALUSrcE <= ALUSrcD; RD1E <= RD1D; RD2E <= RD2D; PCE <= PCD;
        Rs1E <= Rs1D; Rs2E <= Rs2D;
        RdE <= RdD; ImmExtE <= ImmExtD; PCPlus4E <= PCPlus4D;
        InstrE <= InstrD; JalrE <= JalrD;
    end
end

endmodule


