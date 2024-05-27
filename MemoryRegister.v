module MemoryRegister(
    input               clk, reset,
    input               MemWriteE, MemToRegE, RegWriteE,
    input       [15:0]  alu_resultE,
    output              MemWriteM, MemToRegM, RegWriteM,
    output reg  [15:0]  alu_resultM
);

always@(posedge clk or negedge reset)begin
    if(~reset)begin
        MemWriteM   <= 0;
        MemToRegM   <= 0;
        RegWriteM   <= 0;
        alu_resultM <= 0;
    end
    else begin
        MemWriteM   <= MemWriteE;
        MemToRegM   <= MemToRegE;
        RegWriteM   <= RegWriteE;
        alu_resultM <= alu_resultE;
    end
end

endmodule