module WriteBackRegister(
    input                   clk, reset,
    input                   MemToRegM, RegWriteM,
    input       [15:0]      alu_resultM, alu_resultM,
    output                  MemToRegW, RegWriteW,
    output      [15:0]      MemReadDataW, alu_resultW
);

always@(posedge clk or negedge reset)begin
    if(~reset)begin
        MemToRegW    <= 0;
        RegWriteW    <= 0;
        MemReadDataW <= 0;
        alu_resultW  <= 0;
    end
    else begin
        MemToRegW    <= MemToRegM;
        RegWriteW    <= RegWriteM;
        MemReadDataW <= MemReadDataM;
        alu_resultW  <= alu_resultM;
    end
end

endmodule