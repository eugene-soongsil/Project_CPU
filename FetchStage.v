module FetchStage(
    input   [11:0]      i_pcF,
    output  [11:0]      o_pcF,
    output  [15:0]       o_instruction
);//PC behavior

PC_Adder    inst_PCAdder(
    .i_pcOld()
)

InstMem     inst_InstMem(
    input
)


endmodule