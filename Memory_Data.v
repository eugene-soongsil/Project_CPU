module MemoryData(
    input                  clk, reset, write_en,
    input      [15:0]      addrM,
    input      [15:0]      write_dataM,
    output     [15:0]      read_dataM
);//1KB memory

integer i;

reg [15:0] mem[511:0];

always@(negedge clk or negedge reset)begin
    if(~reset)
        for(i=0; i<512; i=i+1)begin
            mem[i] <= 0;
        end
    else if(write_en)
        mem[addrM] <= write_dataM;
end

assign read_dataM = mem[addrM];

endmodule

//CRC를 넣어서 데이터를 보내면 data랑 같이
//CRC가 포함된 UART, ALU에 CRC연산 추가?
//