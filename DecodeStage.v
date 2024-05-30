module DecodeStage(
    input            clk,
    input            reset,
    input            write_en,
    input  [3:0]     destAddW,
    input  [15:0]    i_write_data,
    input            immediateC,
    input  [15:0]    i_inst,
    input            branchD,
    input   [11:0]   pcD,
    input            forward,
    input   [3:0]    i_forward_add,
    output  [11:0]   PC_branch,
    output [3:0]     opcodeDP,
    output [3:0]     destaddD,
    output [15:0]    srcdataD1, srcdataD2
);

BranchDetect    inst_BranchDetect(
    .srcdata1(srcdataD1),
    .srcdata2(srcdataD2),
    .branchD(branchD),
    .destaddD(destaddD),
    .pcD(pcD), //out
    .PC_branch(PC_branch)
);

Register_File    inst_ResisterFile(
    .clk(clk),
    .reset(reset),
    .i_write_en(write_en),
    .forward(forward),
    .i_forward_add(i_forward_add),
    .immediateC(immediateC),
    .i_read_add1(i_inst[11:8]),
    .i_read_add2(i_inst[7:4]),
    .i_write_add(destAddW),
    .i_write_data(i_write_data),
    .o_read_data1(srcdataD1), //out
    .o_read_data2(srcdataD2)
);

assign destaddD = i_inst[3:0];
assign opcodeDP = i_inst[15:12];

endmodule
    