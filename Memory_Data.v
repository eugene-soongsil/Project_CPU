module MemoryData(
    input                  clk, reset, write_en,
    input      [15:0]      addrM,
    input      [15:0]      write_dataM,
    output reg [15:0]      read_dataM,
);

integer i;

reg [15:0] mem[127:0];

always@(negedge clk or negedge reset)begin //neg? pos?
    if(~reset)begin
        for(i = 0; i < 16; i = i+1)
            mem <= 16'd0;
    end
    else if(write_en)
        mem[addrM] <= write_dataM;
end

assign read_dataM = mem[addrM];

endmodule