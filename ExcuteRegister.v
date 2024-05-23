module ExcuteRegister(
    input               clk, reset,
    input               RegWriteD, MemWriteD, //from opcode1
    input       [1:0]   alufuncD,              //from opcode2
    input       [15:0]  srcdataD1, srcdataD2, //from inst2,3
    input       [3:0]   destaddD,             //form inst4
    input       [11:0]  pcD,
    output reg          RegWriteE, MemWriteE, //none use, to MemReg
    output reg  [1:0]   alufuncE, //Excute use
    output reg  [15:0]  srcdataE1, srcdataE2,
    output reg  [3:0]   destaddE
);

always@(posedge clk or negedge reset)begin
    if(~reset)begin
        RegWriteE <= 0;
        MemWriteE <= 0;
        alufuncE  <= 0;
        srcdataE1 <= 0;
        srcdataE2 <= 0;
        destaddE  <= 0;
    end
    else begin
        RegWriteE <= RegWriteD;
        MemWriteE <= MemWriteD;
        alufuncE  <= alufuncD;
        srcdataE1 <= srcdataD1;
        srcdataE2 <= srcdataD2;
        destaddE  <= destaddD;
    end
end

endmodule