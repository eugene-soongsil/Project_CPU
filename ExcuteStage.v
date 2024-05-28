module ExcuteStage(
    input   [1:0]           aluFuncE,
    input   [15:0]          srcDataE1, srcdataD2,
    input   [3:0]           destAddE,
    output  reg [15:0]      alu_resultE
);

ALU     instALU(
    .ALU_func(aluFuncE),
    .ALU_srcdata_1(srcDataE1),
    .ALU_srcdata_2(srcDataD2),
    .ALU_result(alu_resultE)
);

endmodule
