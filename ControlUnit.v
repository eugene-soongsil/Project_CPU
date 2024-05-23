module ControlUnit(
    input [3:0]     i_opcode,
    output          jumpD, flushD, RegWriteD, MemWriteD, immediateD,
    output [1:0]    alufuncD   
    /*
    output      o_stallF,
    output      o_stallD,
    output      o_stallE,
    output      o_write_en,
    output      o_setPC,
    output      
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