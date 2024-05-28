module WriteBackRegister(
    input                   clk, reset,
    input                   MemToRegM, RegWriteM,
    input       [3:0]       destAddM,
    input       [15:0]      MemReadDataM,
    input       [15:0]      alu_resultMin,
    output  reg             MemToRegW, RegWriteW,
    output  reg [3:0]       destAddW,
    output  reg [15:0]      MemReadDataW, alu_resultW
);

always@(posedge clk or negedge reset)begin
    if(~reset)begin
        MemToRegW    <= 0;
        RegWriteW    <= 0;
        MemReadDataW <= 0;
        alu_resultW  <= 0;
        destAddW     <= 0;
    end
    else begin
        MemToRegW    <= MemToRegM;
        RegWriteW    <= RegWriteM;
        MemReadDataW <= MemReadDataM;
        alu_resultW  <= alu_resultMin;
        destAddW     <= destAddM;
    end
end

endmodule