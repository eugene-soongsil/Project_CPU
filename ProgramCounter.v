module ProgramCounter(
    input           i_clk,
    input           i_reset,
    input           i_enable,
    input  [11:0]   i_pcOld
    output [11:0]   o_pcNew,
);

reg     [11:0]      r_pcNew;

always@(posedge i_clk or negedge i_reset)begin
    if(~i_reset)
        r_pcNew <= 0;
    else if(~i_enable)
        r_pcNew <= i_pcOld + 12'd1;
end

assign o_pcNew = r_pcNew;

endmodule