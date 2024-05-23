module ExcuteStage(
    input   [1:0]           alufuncE,
    input   [15:0]          srcdataE1, stcdataD2,
    input   [3:0]           destaddE,
    output  reg [15:0]      result
);

ALU     instALU(
    .ALU_control(i_opcode),
    .ALU_srcdata_1(i_srcdata_1),
    .ALU_srcdata_2(i_srcdata_2),
    .ALU_result(o_write_data)
);

assign o_write_add = i_destadd;

endmodule

//write_en, write_data 정의부 제거 이부분 ALU랑 연걸하기 !