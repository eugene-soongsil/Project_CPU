module DecodeStage(
    input            i_clk,
    input            i_reset,
    input            i_write_en,
    input  [15:0]    i_write_data,
    input  [15:0]    i_inst,
    //input            jumpD, flushD, RegWriteD, MemWriteD, immediateD,
    //output [1:0]     alufuncD,
    output [15:0]    srcdataD1, srcdataD2
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
    .i_clk(i_clk),
    .i_reset(i_reset),
    .i_write_en(i_write_en),
    .i_read_add1(i_inst[11:8]),
    .i_read_add2(i_inst[7:4]),
    .i_write_add(i_inst[3:0]),
    .i_write_data(i_write_data),
    .o_read_data1(srcdataD1),
    .o_read_data2(srcdataD2)
);

endmodule
    