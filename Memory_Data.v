module MemoryData(
    input                  clk, reset, write_en,
    input      [15:0]      addrM,
    input      [15:0]      write_dataM,
    output     [15:0]      read_dataM
);

integer i;

reg [15:0] mem[255:0];

always@(posedge clk or negedge reset)begin //neg? pos?
    if(~reset)
        ;
    else if(write_en)
        mem[addrM] <= write_dataM;
end

initial begin
    mem[0]  <= 16'h1111;
    mem[1]  <= 16'h1122;
    mem[2]  <= 16'h2222;
    mem[3]  <= 16'h2233;
    mem[4]  <= 16'h3333;
    mem[5]  <= 16'h3344;
    mem[6]  <= 16'h4444;
    mem[7]  <= 16'h4455;
    mem[8]  <= 16'h5555;
    mem[9]  <= 16'h5566;
    mem[10] <= 16'h6666;
    mem[11] <= 16'h6677;
    mem[12] <= 16'h7777;
    mem[13] <= 16'h7788;
    mem[14] <= 16'h8888;
    mem[15] <= 16'h8899;
end

assign read_dataM = mem[addrM];

endmodule