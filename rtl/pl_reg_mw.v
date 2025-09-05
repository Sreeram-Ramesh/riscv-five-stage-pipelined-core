// pipeline registers -> memory | writeback stage

module pl_reg_mw (
    input             clk,
    input             RegWriteM,
    input       [1:0] ResultSrcM,
    input      [31:0] ALUResultM, ReadDataM, PCM,
    input       [4:0] RdM,
    input      [31:0] PCPlus4M, WriteDataM, lAuiPCM,
    output reg        RegWriteW,
    output reg  [1:0] ResultSrcW,
    output reg [31:0] ALUResultW, ReadDataW, PCW,
    output reg  [4:0] RdW,
    output reg [31:0] PCPlus4W, WriteDataW, lAuiPCW
);

initial begin
    RegWriteW = 0; ResultSrcW = 0; ALUResultW = 0;
    ReadDataW = 0; RdW = 0; PCPlus4W = 0; PCW = 0;
    WriteDataW = 0; lAuiPCW = 0;
end

always @(posedge clk) begin
    RegWriteW <= RegWriteM; ResultSrcW <= ResultSrcM;
    ReadDataW <= ReadDataM; PCPlus4W <= PCPlus4M; PCW <= PCM;
    WriteDataW <= WriteDataM;
    RdW <= RdM; ALUResultW <= ALUResultM;
    lAuiPCW <= lAuiPCM;
end

// always @(negedge clk) begin
//     RdW <= RdM; ALUResultW <= ALUResultM;
// end

endmodule

