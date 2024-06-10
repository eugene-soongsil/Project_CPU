module MemoryData(
    input                  clk, reset, write_en,
    input      [15:0]      addrM,
    input      [15:0]      write_dataM,
    output     [15:0]      read_dataM
);//128KB memory

integer i;

reg [15:0] mem[65536:0];

always@(negedge clk or negedge reset)begin
    if(~reset)
        for(i=0; i<65536; i=i+1)begin
            mem[i] <= i;
        end
    else if(write_en)
        mem[addrM] <= write_dataM;
end

assign read_dataM = mem[addrM];

endmodule