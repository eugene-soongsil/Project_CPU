`timescale 1ns/1ps
module  Team4_CPU_tb();

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
    #10
    enable = 1;
    #1000   
    $finish;
end

always begin
    #50
    clk = ~clk;
end

endmodule