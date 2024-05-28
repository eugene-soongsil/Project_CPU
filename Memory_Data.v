module MemoryData(
    input                  clk, reset, write_en,
    input      [3:0]       addrM,
    input      [15:0]      write_dataM,
    output     [15:0]      read_dataM
);

integer i;

reg [15:0] mem[15:0];

always@(negedge clk or negedge reset)begin //neg? pos?
    if(~reset)begin
        for(i = 0; i < 128; i = i+1)
            mem[i] <= 16'd0;
    end
    else if(write_en)
        mem[addrM] <= write_dataM;
end

assign read_dataM = mem[addrM];

endmodule