module DecodeRegister(
    input                 clk, reset, enable,
    input        [11:0]   pcF,
    input        [15:0]   instF,
    output reg   [11:0]   pcD,
    output reg   [15:0]   instD
);

always@(posedge clk or negedge reset)begin
    if(~reset)begin
        pcD   <= 0;
        instD <= 0;
    end
    else if(~enable)begin
        pcD   <= pcF;
        instD <= instF;
    end
end

endmodule

/*module DecodeRegister(
    input           i_clk,
    input           i_reset,
    input           enable,
    input  [3:0]    destadd,
    input  [15:0]   srcdata1, srcdata2,
    output [3:0]    destaddD,
    output [15:0]   srcdataD1, stcdataD2
);

reg [3:0]           destaddD;
reg [15:0]          srcdataD1, stcdataD2;

always@(posedge i_clk or negedge i_reset)begin
    if(~i_reset)begin
        srcdataD1 <= 0;
        srcdataD2 <= 0;
        destaddD <= 0;
    end
    else if(~enable)begin
        srcdataD1 <= 0;
        srcdataD2 <= 0;
        destaddD <= 0;
    end
    else begin
        srcdataD1 <= srcdata1;
        srcdataD2 <= srcdata2;
        destaddD <= destadd;
    end
end

endmodule
