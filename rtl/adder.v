// adder.v - a simple 32-bit adder

module adder #(parameter WIDTH = 32) (
    input  [WIDTH-1:0] a, b,
    output [WIDTH-1:0] y
);

assign y = a + b;

endmodule