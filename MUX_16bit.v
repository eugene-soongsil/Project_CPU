module MUX_16bit (
    input  wire [15:0] in1, in2,
    input  wire        sel,
    output      [15:0] out
);

assign out = (sel) ? in1 : in2;

endmodule