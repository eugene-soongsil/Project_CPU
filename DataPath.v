module DataPath(
    input               clk, reset,
    input               stallF, stallD, forwardA, forwardB,
    input               InstBranch, /*flushF,*/ flushD,
    input               flushC, RegWriteC, MemWriteC, MemToRegC, immediateC,
    input   [1:0]       alufuncC,
    output              RegWriteE, MemToRegE,//to DH
    output  [3:0]       srcAdd1, srcAdd2, destAddE,
    output  [3:0]       opcodeDP,
    output  [15:0]      ResultW, RegDataA, RegDataB, alu_resultE
);

wire                    RegWriteM, RegWriteW, MemToRegM, MemToRegW,
                        MemWriteE, MemWriteM, forwardE;
wire    [1:0]           aluFuncE;
wire    [3:0]           forward_addE,
                        destAddD, 
                        destAddE, 
                        destAddM, 
                        destAddW;
wire    [11:0]          /*MUX_pc,*/w_pcNew, w_pcF, w_pcD, PC_branch;
wire    [15:0]          w_instF, w_instD, srcDataE1, srcDataE2,
                        alu_resultE, alu_resultM, alu_resultW, MemReadDataM, MemReadDataW,
                        alu_resultMout, srcDataD1, srcDataD2;

/*
MUX_12bit           inst_MUX_PC(
    .in1(PC_branch),
    .in2(w_pcF),
    .sel(InstBranch), //?
    .out(MUX_pc)
);*/

ProgramCounter      inst_ProgramCounter(
    .clk(clk),
    .reset(reset),
    .enable(stallF),
    .InstBranch(InstBranch),
    //.flushF(flushF),
    .PC_branch(PC_branch),
    .i_pcOld(w_pcF), //from decode
    .o_pcNew(w_pcNew) //out
);

FetchStage          inst_FetchStage(
    .i_pcF(w_pcNew),
    .o_pcF(w_pcF), //out
    .o_instF(w_instF)
);

DecodeRegister      inst_DecodeRegister(
    .clk(clk),
    .reset(reset),
    .enable(stallD),
    .flushD(flushD),
    .pcF(w_pcF),
    .instF(w_instF),
    .pcD(w_pcD), //out
    .instD(w_instD)
);

DecodeStage         inst_DecodeStage(
    .clk(clk),
    .reset(reset),
    .write_en(RegWriteW),
    .destAddW(destAddW),
    .i_write_data(ResultW),
    .immediateC(immediateC),
    .i_inst(w_instD),
    .InstBranch(InstBranch),
    .pcD(w_pcD),
    .PC_branch(PC_branch), //out
    .opcodeDP(opcodeDP),
    .destaddD(destAddD),
    .srcAdd1(srcAdd1),
    .srcAdd2(srcAdd2),
    .srcdataD1(srcDataD1),
    .srcdataD2(srcDataD2)
);

MUX_16bit           inst_MUX_RegDataA(
    .in1(alu_resultE),
    .in2(srcDataD1),
    .sel(forwardA),
    .out(RegDataA)
);

MUX_16bit           inst_MUX_RegDataB(
    .in1(alu_resultE),
    .in2(srcDataD2),
    .sel(forwardB),
    .out(RegDataB)
);

ExcuteRegister      inst_ExcuteRegister(
    .clk(clk),
    .reset(reset),
    .RegWriteC(RegWriteC),
    .MemWriteC(MemWriteC),
    .MemToRegC(MemToRegC),
    .alufuncC(alufuncC), //CU
    .srcDataD1(RegDataA),
    .srcDataD2(RegDataB),
    .destAddD(destAddD),
    .flushC(flushC),
    .RegWriteE(RegWriteE), //out
    .MemWriteE(MemWriteE),
    .MemToRegE(MemToRegE),
    .alufuncE(aluFuncE),
    .srcDataE1(srcDataE1),
    .srcDataE2(srcDataE2),
    .destAddE(destAddE)
);

ExcuteStage         inst_ExcuteStage(
    .aluFuncE(aluFuncE),
    .srcDataE1(srcDataE1),
    .srcDataE2(srcDataE2),
    .alu_resultE(alu_resultE) //out
);

MemoryRegister      inst_MemoryRegister(
    .clk(clk),
    .reset(reset),
    .destAddE(destAddE),
    .MemWriteE(MemWriteE),
    .MemToRegE(MemToRegE),
    .RegWriteE(RegWriteE),
    .alu_resultE(alu_resultE),
    .destAddM(destAddM),//out
    .MemWriteM(MemWriteM),
    .MemToRegM(MemToRegM),
    .RegWriteM(RegWriteM),
    .alu_resultM(alu_resultM)
);

MemoryStage         inst_MemoryStage(
    .clk(clk),
    .reset(reset),
    .MemWriteM(MemWriteM),
    .alu_resultM(alu_resultM),
    .MemReadDataM(MemReadDataM), //out
    .alu_resultMout(alu_resultMout)
);

WriteBackRegister   inst_WriteBackRegister(
    .clk(clk),
    .reset(reset),
    .destAddM(destAddM),
    .MemToRegM(MemToRegM),
    .RegWriteM(RegWriteM),
    .MemReadDataM(MemReadDataM),
    .alu_resultMin(alu_resultMout),
    .destAddW(destAddW),//out
    .MemToRegW(MemToRegW),
    .RegWriteW(RegWriteW),
    .MemReadDataW(MemReadDataW),
    .alu_resultW(alu_resultW)
);

WriteBackStage      inst_WritebackStage(
    .MemToRegW(MemToRegW),
    .MemReadDataW(MemReadDataW),
    .alu_resultW(alu_resultW),
    .ResultW(ResultW) //out
);

endmodule