module MUX_11bit (
    input  wire [11:0] in1, in2,
    input  wire        sel,
    output      [11:0] out
);

assign out = (sel) ? in1 : in2;
    
endmodule