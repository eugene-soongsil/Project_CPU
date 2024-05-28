module MemoryRegister(
    input               clk, reset,
    input               MemWriteE, MemToRegE, RegWriteE,
    input       [3:0]   destAddE,
    input       [15:0]  alu_resultE,
    output reg  [3:0]   destAddM,
    output reg          MemWriteM, MemToRegM, RegWriteM,
    output reg  [15:0]  alu_resultM
);

always@(posedge clk or negedge reset)begin
    if(~reset)begin
        MemWriteM   <= 0;
        MemToRegM   <= 0;
        RegWriteM   <= 0;
        alu_resultM <= 0;
        destAddM    <= 0;
    end
    else begin
        MemWriteM   <= MemWriteE;
        MemToRegM   <= MemToRegE;
        RegWriteM   <= RegWriteE;
        alu_resultM <= alu_resultE;
        destAddM    <= destAddE;
    end
end

endmodule