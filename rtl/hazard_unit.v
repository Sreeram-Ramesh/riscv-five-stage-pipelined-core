// hazard_unit.v check for pipelining hazards

module hazard_unit(
    input       [4:0] Rs1E, Rs2E, RdM, RdW,
    input       [4:0] Rs1D, Rs2D, RdE,
    input             RegWriteM, RegWriteW, ResultSrcE, PCSrcE,
    output reg  [1:0] ForwardAE, ForwardBE,
    output reg        StallF, StallD, FlushE, FlushD
);
reg lwStall;

initial begin
    ForwardAE = 2'b00;
    ForwardBE = 2'b00;
    StallF = 1'b0;
    StallD = 1'b0;
    FlushD = 1'b0;
    FlushE = 1'b0;
end

always @(*) begin
    // addressing RAW - using forwarding
    if (((Rs1E == RdM) & RegWriteM) & (Rs1E != 0)) begin
        ForwardAE = 2'b10;
    end
    else if (((Rs1E == RdW) & RegWriteW) & (Rs1E != 0)) begin
        ForwardAE = 2'b01;
    end
    else ForwardAE = 2'b00;

    if (((Rs2E == RdM) & RegWriteM) & (Rs2E != 0)) begin
        ForwardBE = 2'b10;
    end
    else if (((Rs2E == RdW) & RegWriteW) & (Rs2E != 0)) begin
        ForwardBE = 2'b01;
    end
    else ForwardBE = 2'b00;

    // addressing data hazards - using stalls
    lwStall = (ResultSrcE & ((Rs1D == RdE) | (Rs2D == RdE)));
    StallF = lwStall;
    StallD = lwStall;

    // addressing control hazards - by flushing
    FlushD = PCSrcE;
    FlushE = lwStall | PCSrcE;
end

endmodule

