module ResisterFile(
    input i_clk,
    input i_reset,
    input i_write_en,
    input [3:0] i_read_add1,
    input [3:0] i_read_add2,
    input [3:0] i_write_add,
    input [15:0] i_write_data,
    output [15:0] o_read_data1,
    output [15:0] o_read_data2,
);

//resister initialize and write-back(excute)
reg [15:0] registers [0:15];

integer i;
always @(negedge i_clk or negedge i_reset) begin //negedge clk for 1clock cycle
    if (~i_reset) begin
        for (i = 0; i < 16; i = i + 1) begin
            registers[i] <= i;
        end
    end
    else if (i_write_en) begin
        registers[i_write_add] <= i_write_data;
    end
end

assign o_read_data1 = registers[i_read_add1];
assign o_read_data2 = registers[i_read_add2];

endmodule