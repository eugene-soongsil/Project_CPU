module resister(
    input i_clk,
    input i_reset,
    input i_write_en,
    input [3:0] i_opcode,
    input [3:0] i_destadd,
    input [3:0] i_read_reg1,
    input [3:0] i_read_reg2,
    input [3:0] i_write_reg,
    input [7:0] i_write_data,
    output [7:0] o_read_data1,
    output [7:0] o_read_data2,
    output [3:0] o_opcode,
    output [3:0] o_destadd
);
//opcode, destadd 대입부
reg [3:0] r_opcode, r_destadd; 

always@(posedge i_clk or negedge i_reset)begin
    if(~i_reset)
        r_opcode <= 4'h0;
    else
        r_opcode <= i_opcode;
end

always@(posedge i_clk or negedge i_reset)begin
    if(~i_reset)
        r_destadd <= 4'h0;
    else
        r_destadd <= i_destadd;
end

reg [7:0] registers [0:15];
reg [3:0] r_read_data1, r_read_data2;

//resister initialize and write-back(excute)
integer i;
always @(posedge i_clk or negedge i_reset) begin
    if (~i_reset) begin
        for (i = 0; i < 16; i = i + 1) begin
            registers[i] <= i;
        end
    end
    else if (i_write_en && i_write_reg != 4'd0) begin
        registers[i_write_reg] <= i_write_data;
    end
end

//resister read(decode)
always@(posedge i_clk or negedge i_reset)begin
    if(~i_reset)
        r_read_data1 = 8'h0;
    else
        r_read_data1 = registers[i_read_reg1];
end

always@(posedge i_clk or negedge i_reset)begin
    if(~i_reset)
        r_read_data2 = 8'h0;
    else
        r_read_data2 = registers[i_read_reg2];
end

assign o_read_data1 = r_read_data1;
assign o_read_data2 = r_read_data2;
assign o_opcode = r_opcode;
assign o_destadd = r_destadd;

endmodule