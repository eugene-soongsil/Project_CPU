module ExcuteStage(
    input [3:0] i_opcode,
    input [7:0] i_srcdata_1,
    input [7:0] i_srcdata_2,
    input [3:0] i_destadd,
    output [3:0] o_write_add,//to reg
    output [7:0] o_write_data//to reg
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