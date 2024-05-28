module ExcuteRegister(
    input               clk, reset, flushC,
    input               RegWriteC, MemWriteC, MemToRegC, //from opcode1
    input       [1:0]   alufuncC,              //from opcode2
    input       [15:0]  srcDataD1, srcDataD2, //from inst2,3
    input       [3:0]   destAddD,             //form inst4
    //input       [11:0]  pcD,
    output reg          RegWriteE, MemWriteE, MemToRegE, //none use, to MemReg
    output reg  [1:0]   alufuncE, //Excute use
    output reg  [15:0]  srcDataE1, srcDataE2,
    output reg  [3:0]   destAddE
);

always@(posedge clk or negedge reset)begin
    if(~reset | flushC)begin
        RegWriteE <= 1'b0;
        MemWriteE <= 1'b0;
        MemToRegE <= 1'b0;
        alufuncE  <= 2'b00;
        srcDataE1 <= 16'h0000;
        srcDataE2 <= 16'h0000;
        destAddE  <= 4'b0000;
    end
    else begin
        RegWriteE <= RegWriteC;
        MemWriteE <= MemWriteC;
        MemToRegE <= MemToRegC;
        alufuncE  <= alufuncC;
        srcDataE1 <= srcDataD1;
        srcDataE2 <= srcDataD2;
        destAddE  <= destAddD;
    end
end

endmodule