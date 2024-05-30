module Team4_CPU(
    input               clk, reset,
    output  [15:0]      DataOut
);

wire                branchC, flushC, RegWriteC, MemWriteC, MemToRegC,
                    immediateC, forwardC, MemToRegE, RegWriteE,
                    stallF, stallD,
                    forwardA, forwardB,
                    flushE, InstBranch;
wire    [1:0]       alufuncC;
wire    [3:0]       opcodeDP, srcAdd1, srcAdd2, destAddE;
wire    [15:0]      RegDataA, RegDataB;

DataPath        inst_DataPath(
    .clk(clk),
    .reset(reset),
    .branchC(branchC),
    .flushC(flushC),
    .RegWriteC(RegWriteC),
    .MemWriteC(MemWriteC),
    .MemToRegC(MemToRegC),
    .immediateC(immediateC),
    .alufuncC(alufuncC),
    .stallF(stallF),
    .stallD(stallD),
    .forwardA(forwardA),
    .forwardB(forwardB),
    .InstBranch(InstBranch),
    .opcodeDP(opcodeDP), //out
    .ResultW(DataOut),
    .RegWriteE(RegWriteE),
    .MemToRegE(MemToRegE),
    .srcAdd1(srcAdd1),
    .srcAdd2(srcAdd2),
    .destAddE(destAddE),
    .RegDataA(RegDataA),
    .RegDataB(RegDataB)
);

ControlUnit     inst_ControlUnit(
    .i_opcode(opcodeDP),
    .branchD(branchC), //out
    .flushD(flushC),
    .RegWriteD(RegWriteC),
    .MemWriteD(MemWriteC),
    .MemToRegD(MemToRegC),
    .immediateD(immediateC),
    .forwardD(forwardC),
    .alufuncD(alufuncC)
);

HazardUnit      inst_HazardUnit(
    .branch(branchC),
    .flush(flushC),
    .RegWriteE(RegWriteE),
    .MemToRegE(MemToRegE),
    .immediateD(immediateC),
    .forwardD(forwardC),
    .srcAdd1(srcAdd1),
    .srcAdd2(srcAdd2),
    .destAddE(destAddE),
    .srcData1(RegDataA),
    .srcData2(RegDataB),
    .stallF(stallF), //out
    .stallD(stallD),
    .forwardA(forwardA),
    .forwardB(forwardB),
    .flushE(flushE),
    .InstBranch(InstBranch)
);

endmodule