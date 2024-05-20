module ExcuteStage(
    input i_clk,
    input i_reset,
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

reg [7:0] r_write_data;
reg [3:0] r_write_add;


always@(posedge i_clk or negedge i_reset)begin
    if(~i_reset)
        r_write_add <= 4'h0;
    else
        r_write_add <= i_destadd;
end

assign o_write_add = r_write_add;

endmodule

//write_en, write_data 정의부 제거 이부분 ALU랑 연걸하기 !