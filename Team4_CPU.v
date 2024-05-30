module Team4_CPU(
    input               clk, reset, enable,
    output  [15:0]      DataOut
);

wire                branchC, flushC, RegWriteC, MemWriteC, MemToRegC,
                    immediateC, forwardC; 
wire    [1:0]       alufuncC;
wire    [3:0]       opcodeDP;

DataPath        inst_DataPath(
    .clk(clk),
    .reset(reset),
    .enable(enable),
    .branchC(branchC),
    .flushC(flushC),
    .RegWriteC(RegWriteC),
    .MemWriteC(MemWriteC),
    .MemToRegC(MemToRegC),
    .immediateC(immediateC),
    .forwardC(forwardC),
    .alufuncC(alufuncC),
    .opcodeDP(opcodeDP), //out
    .ResultW(DataOut)
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

endmodule