module DecodeStage(
    input            clk,
    input            reset,
    input            write_en,
    input  [15:0]    i_write_data,
    input  [15:0]    i_inst,
    //input            jumpD, flushD, RegWriteD, MemWriteD, immediateD,
    //output [1:0]     alufuncD,
    output [3:0]     destadd;
    output [15:0]    srcdata1, srcdata2
);
/*
OpcodeDecoder   inst_OpcodeDecoder(
    .i_opcode(i_inst[15:12]),
    .jump(jumpD),
    .flush(flushD),
    .RegWrite(RegWriteD),
    .MemWrite(MemWriteD),
    .immediate(immediateD),
    .o_alufunc(alufuncD)
);
*/

RegisterFile    inst_ResisterFile(
    .clk(clk),
    .reset(reset),
    .writen(i_write_en),
    .i_read_add1(i_inst[11:8]),
    .i_read_add2(i_inst[7:4]),
    .i_write_add(i_inst[3:0]),
    .i_write_data(i_write_data),
    .o_read_data1(srcdata1),
    .o_read_data2(srcdata2)
);

assign destadd = i_inst[3:0];

endmodule
    