module FetchStage(
    input   [11:0]      i_pcF,
    output  [11:0]      o_pcF,
    output  [15:0]      o_instF
);//PC behavior

PC_Adder    inst_PCAdder(
    .i_pcOld(i_pcF),
    .o_pcNew(o_pcF),
);

InstMem     inst_InstMem(
    .PCAdd_pc(o_pcF),
    .M_instruction(o_instF)
);

endmodule