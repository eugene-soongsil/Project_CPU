`timescale 1ns/1ps
module  Team4_CPU_tb();




initial begin
    i_clk = 0; i_reset = 1;
    #10
    i_reset = 0;
    #10
    i_reset = 1;
   
    $finish;
end

always begin
    #50
    i_clk = ~i_clk;
end

endmodule