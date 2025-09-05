// alu.v - ALU module for pipelined RISC-V processor

module alu #(parameter WIDTH = 32) (
    input signed [WIDTH-1:0] a, b,       // signed operands
    input        [3:0] alu_ctrl,         // ALU control
    output reg   [WIDTH-1:0] alu_out,    // ALU output
    output       zero, overflow          // zero and overflow flag
);

wire unsigned [WIDTH-1:0] ua = a;         // unsigned operands
wire unsigned [WIDTH-1:0] ub = b;         // unsigned operands

always @(a, b, alu_ctrl) begin
    case (alu_ctrl)
        4'b0000:  alu_out <= a + b;          // ADD
        4'b0001:  alu_out <= a + ~b + 1;     // SUB
        4'b0010:  alu_out <= a & b;          // AND
        4'b0011:  alu_out <= a | b;          // OR
        4'b0100:  alu_out <= a ^ b;          // XOR
        4'b0101:  begin                      // SLT
                     if (a[31] != b[31]) alu_out <= a[31] ? 1 : 0;
                     else alu_out <= overflow;
                 end
        4'b0110:  alu_out <= overflow;       // SLTU
        4'b0111:  alu_out <= a << b[4:0];    // SLL
        4'b1000:  alu_out <= a >> b[4:0];    // SRL
        4'b1001:  alu_out <= a >>> b[4:0];   // SRA
        default:  alu_out = 0;
    endcase
end

assign overflow = (ua < ub) ? 1'b1 : 1'b0;
assign zero = (alu_out == 0) ? 1'b1 : 1'b0;

endmodule

