`timescale 1ns/1ps
module  Team4_CPU_tb();

reg             clk, reset, enable;
wire    [15:0]  DataOut;

Team4_CPU   inst_CPU(
    .clk(clk),
    .reset(reset),
    .enable(enable),
    .DataOut(DataOut)
);

initial begin
    clk = 0; reset = 1;
    #10
    reset = 0;
    #10
    reset = 1;
    #30
    enable = 1;
    #1000   
    $finish;
end

always begin
    #20
    clk = ~clk;
end

endmodule