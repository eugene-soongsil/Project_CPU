module BranchDetect(
    input       [15:0]      srcdata1, srcdata2,
    input                   branchD,
    input       [3:0]       destaddD,
    input       [11:0]      pcD,
    output reg  [11:0]      PC_branch
);

always@(*)begin
    if((srcdata1 == srcdata2) && branchD)
        PC_branch = pcD + destaddD;
    else
        PC_branch = pcD;
end

endmodule