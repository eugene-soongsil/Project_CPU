module WritebackStage(
    input               MemToRegW,
    input       [15:0]  MemReadDataW, alu_resultW,
    output      [15:0]  ResultW
);

assign ResultW = MemToRegW ? (MemReadDataW : alu_resultW);

endmodule