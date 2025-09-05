// pipeline registers -> execute | memory stage

module pl_reg_em (
    input             clk,
    input             RegWriteE,
    input       [1:0] ResultSrcE,
    input             MemWriteE,
    input      [31:0] ALUResultE, WriteDataE, PCE,
    input       [4:0] RdE,
    input      [31:0] PCPlus4E, lAuiPCE, InstrE,
    output reg        RegWriteM,
    output reg  [1:0] ResultSrcM,
    output reg        MemWriteM,
    output reg [31:0] ALUResultM, WriteDataM, PCM,
    output reg  [4:0] RdM,
    output reg [31:0] PCPlus4M, lAuiPCM, InstrM
);

initial begin
    RegWriteM = 0; ResultSrcM = 0; MemWriteM = 0;
    ALUResultM = 0; WriteDataM = 0; RdM = 0;
    PCPlus4M = 0; PCM = 0; lAuiPCM = 0; InstrM = 0;
end

always @(posedge clk) begin
    RegWriteM <= RegWriteE; ResultSrcM <= ResultSrcE; MemWriteM <= MemWriteE;
    ALUResultM <= ALUResultE; WriteDataM <= WriteDataE; RdM <= RdE;
    PCPlus4M <= PCPlus4E; PCM <= PCE; lAuiPCM <= lAuiPCE; InstrM <= InstrE;
end

endmodule
