module ControlUnit(
    input [3:0]     i_opcode,
    output          jumpD, flushD, RegWriteD, MemWriteD, immediateD,
    output [1:0]    alufuncD   
    /*
    //jump, flush -> Hazard unit? or directly datapath..??
    */
);

OpcodeDecoder   inst_OpcodeDecoder(
    .i_opcode(i_opcode),
    .jump(jumpD),
    .flush(flushD),
    .RegWrite(RegWriteD),
    .MemWrite(MemWriteD),
    .immediate(immediateD),
    .o_alufunc(alufuncD)
);

endmodule