module MemoryStage(
    input               clk, reset,
    input               MemWriteM,
    input       [15:0]  alu_resultM,
    output reg  [15:0]  MemReadDataM,
    output reg  [15:0]  alu_resultM
);

MemoryData  inst_MemoryData(
    .clk(clk),
    .reset(reset),
    .write_en(MemWriteM),
    .addrM(alu_resultM),
    .write_dataM(alu_resultM),
    .read_dataM(MemReadDataM)
);

endmodule