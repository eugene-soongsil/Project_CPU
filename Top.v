module Top(
    input   i_clk,
    input   i_reset,
    input   i_stop,
    output  [3:0]o_write_add,
    output  [7:0]o_write_data
);

wire    [15:0]  w_instruction;
wire    [3:0]   w_write_add, w_opcode1, w_opcode2, w_destadd1, w_destadd2, w_srcadd_1, w_srcadd_2;
wire    [7:0]   w_write_data, w_srcdata_1, w_srcdata_2;
wire            w_write_en;
wire    [11:0]  w_pc;


fetch   fetcher(
    .i_clk(i_clk),
    .i_reset(i_reset),
    .i_stop(i_stop),
    .o_pc(w_pc)
);

decode  decoder(
    .i_instruction(w_instruction),
    .o_srcadd_1(w_srcadd_1),
    .o_srcadd_2(w_srcadd_2),
    .o_opcode(w_opcode1),
    .o_destadd(w_destadd1)
);

excute  excuter(
    .i_clk(i_clk),
    .i_reset(i_reset),
    .i_opcode(w_opcode2),
    .i_srcdata_1(w_srcdata_1),
    .i_srcdata_2(w_srcdata_2),
    .i_destadd(w_destadd2),
    .o_write_en(w_write_en),
    .o_write_add(w_write_add),
    .o_write_data(w_write_data)
);

InstMem     mem(
    .i_clk(i_clk),
    .i_reset(i_reset),
    .i_stop(i_stop),
    .i_pc(w_pc),
    .o_instruction(w_instruction)
);

resister    regi(
    .i_clk(i_clk),
    .i_reset(i_reset),
    .i_write_en(w_write_en),
    .i_opcode(w_opcode1),
    .i_destadd(w_destadd1),
    .i_read_reg1(w_srcadd_1),
    .i_read_reg2(w_srcadd_2),
    .i_write_reg(w_write_add),
    .i_write_data(w_write_data),
    .o_read_data1(w_srcdata_1),
    .o_read_data2(w_srcdata_2),
    .o_opcode(w_opcode2),
    .o_destadd(w_destadd2)
);


assign o_write_add = w_write_add;
assign o_write_data = w_write_data; 

endmodule