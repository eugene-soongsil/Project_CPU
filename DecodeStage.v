module DecodeStage(
    input            clk,
    input            reset,
    input            write_en,
    input  [15:0]    i_write_data,
    input            immediateC,
    input  [15:0]    i_inst,

    input            branchD,
    input   [11:0]   pcD,
    output  [11:0]   PC_branch,

    output [3:0]     destadd;
    output [15:0]    srcdata1, srcdata2
);

BranchDetect    inst_BranchDetect(
    .srcdata1(srcdata1),
    .srcdata2(srcdata2),
    .branchD(branchD),
    .destadd(destadd),
    .pcD(pcD),
    .PC_branch(PC_branch)
);

Register_File    inst_ResisterFile(
    .clk(clk),
    .reset(reset),
    .writen_en(i_write_en),
    .immediateC(immediateC),
    .i_read_add1(i_inst[11:8]),
    .i_read_add2(i_inst[7:4]),
    .i_write_add(i_inst[3:0]),
    .i_write_data(i_write_data),
    .o_read_data1(srcdata1),
    .o_read_data2(srcdata2)
);

assign destadd = i_inst[3:0];

endmodule
    