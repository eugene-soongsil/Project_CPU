module decode(
    input [15:0] i_instruction,
    output [3:0] o_opcode,
    output [3:0] o_srcadd_1,
    output [3:0] o_srcadd_2,
    output [3:0] o_destadd
);//instruction set

reg [3:0] r_opcode, r_srcadd_1, r_srcadd_2, r_destadd;

always@(*)begin
    r_opcode = i_instruction[15:12];
    r_srcadd_1 = i_instruction[11:8];
    r_srcadd_2 = i_instruction[7:4];
    r_destadd = i_instruction[3:0];
end

assign o_opcode = r_opcode;
assign o_srcadd_1 = r_srcadd_1;
assign o_srcadd_2 = r_srcadd_2;
assign o_destadd = r_destadd; 

endmodule
    