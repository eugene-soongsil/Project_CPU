module ProgramCounter(
    input           clk,
    input           reset,
    input           enable,
    input           InstBranch,
    input  [11:0]   PC_branch,
    input  [11:0]   i_pcOld,
    output [11:0]   o_pcNew
);

reg     [11:0]      r_pcNew;

always@(posedge clk or negedge reset)begin
    if(~reset)
        r_pcNew <= 0;
    else if(!enable)
        r_pcNew <= i_pcOld;
    else if(InstBranch)
        r_pcNew <= PC_branch;
end

assign o_pcNew = r_pcNew;

endmodule