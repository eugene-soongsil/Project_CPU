module excute(
    input i_clk,
    input i_reset,
    input [3:0] i_opcode,
    input [7:0] i_srcdata_1,
    input [7:0] i_srcdata_2,
    input [3:0] i_destadd,
    output o_write_en,//to reg
    output [3:0] o_write_add,//to reg
    output [7:0] o_write_data//to reg
);

//ALU logic parameter
parameter   ADD =   4'b0001,
            SUB =   4'b0010,
            LS  =   4'b0100,
            RS  =   4'b1000;

reg [7:0] r_write_data;
reg [3:0] r_write_add;
reg       r_write_en;

always@(posedge i_clk or negedge i_reset)begin
    if(~i_reset)
        r_write_en <= 1'b0;
    else if(r_write_data != 8'd0)
        r_write_en <= 1;
end

always@(posedge i_clk or negedge i_reset)begin
    if(~i_reset)
        r_write_add <= 4'h0;
    else
        r_write_add <= i_destadd;
end

//ALU logic
always@(posedge i_clk or negedge i_reset) begin
    if(~i_reset)
        r_write_data <= 8'h0;
    else begin
        case(i_opcode)
            ADD:
                r_write_data <= i_srcdata_1 + i_srcdata_2;
            SUB:
                r_write_data <= i_srcdata_1 - i_srcdata_2;
            LS:
                r_write_data <= i_srcdata_1 << 1;
            RS:
                r_write_data <= i_srcdata_1 >> 1;
            default:
                r_write_data <= 8'h0;
        endcase
    end
end

assign o_write_data = r_write_data;
assign o_write_add = r_write_add;
assign o_write_en = r_write_en;

endmodule