`timescale 1ns/1ps
module  FDE_tb();

reg             i_clk, i_reset, i_stop;
wire    [3:0]   o_write_add;
wire    [7:0]   o_write_data;


Top     FDE_cpu(
    .i_clk(i_clk),
    .i_reset(i_reset),
    .i_stop(i_stop),
    .o_write_add(o_write_add),
    .o_write_data(o_write_data)
);

initial begin
    i_clk = 0; i_reset = 1; i_stop = 1;
    #10
    i_reset = 0;
    #10
    i_reset = 1;
    #100
    i_stop = 0;
    #1000
    $finish;
end

always begin
    #50
    i_clk = ~i_clk;
end

endmodule