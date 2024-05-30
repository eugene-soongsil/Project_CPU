module MemoryStage(
    input               clk, reset,
    input               MemWriteM,
    input       [15:0]  alu_resultM,
    output      [15:0]  MemReadDataM,
    output      [15:0]  alu_resultMout
);

MemoryData  inst_MemoryData(
    .clk(clk),
    .reset(reset),
    .addrM(alu_resultM),
    .write_en(MemWriteM),
    .write_dataM(alu_resultM),
    .read_dataM(MemReadDataM) //out
);

assign alu_resultMout = alu_resultM;

endmodule