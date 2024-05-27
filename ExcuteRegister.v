module ExcuteRegister(
    input               clk, reset,
    input               RegWriteD, MemWriteD, MemReadD, //from opcode1
    input       [1:0]   aluFuncD,              //from opcode2
    input       [15:0]  srcDataD1, srcDataD2, //from inst2,3
    input       [3:0]   destAddD,             //form inst4
    input       [11:0]  pcD,
    output reg          RegWriteE, MemWriteE, //none use, to MemReg
    output reg  [1:0]   aluFuncE, //Excute use
    output reg  [15:0]  srcDataE1, srcDataE2,
    output reg  [3:0]   destAddE
);

always@(posedge clk or negedge reset)begin
    if(~reset)begin
        RegWriteE <= 0;
        MemWriteE <= 0;
        MemReadE  <= 0;
        aluFuncE  <= 0;
        srcDataE1 <= 0;
        srcDataE2 <= 0;
        destAddE  <= 0;
    end
    else begin
        RegWriteE <= RegWriteD;
        MemWriteE <= MemWriteD;
        MemReadE  <= MemReadD;
        aluFuncE  <= aluFuncD;
        srcDataE1 <= srcDataD1;
        srcDataE2 <= srcDataD2;
        destAddE  <= destAddD;
    end
end

endmodule