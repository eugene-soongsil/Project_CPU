module HazardUnit(
    input               branch,
    input               flush,
    input               RegWriteE,
    input               MemToRegE,
    //input               MemWrite,
    input               immediateD,
    input               forwardD,
    input    [3:0]      srcAdd1, srcAdd2, destAddE,
    input    [15:0]     srcData1, srcData2,
    output              stallF, stallD,
    output              forwardA, forwardB, //to decode
    output              flushE, //to Excute
    output              InstBranch
);

wire   InstBranch;
wire   lwstall;

assign lwstall = (MemToRegE & ((srcAdd1 == destAddE)|(srcAdd2 == destAddE)));
assign forwardA = (forwardD & RegWriteE & (srcAdd1 == destAddE));
assign forwardB = (!immediateD & forwardD & RegWriteE & (srcAdd2 == destAddE));
assign InstBranch = (branch && (srcData1 == srcData2));
assign stallF = (lwstall | InstBranch);
assign stallD = (lwstall | InstBranch);
assign flushE = (lwstall | InstBranch | flush);

endmodule