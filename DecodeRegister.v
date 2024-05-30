module DecodeRegister(
    input                 clk, reset, enable,
    input        [11:0]   pcF,
    input        [15:0]   instF,
    output reg   [11:0]   pcD,
    output reg   [15:0]   instD,
    output reg   [3:0]    forward_addD
);

always@(posedge clk or negedge reset)begin
    if(~reset)begin
        pcD   <= 0;
        instD <= 0;
        forward_addD <= 0;
    end
    else if(enable)begin
        pcD   <= pcF;
        instD <= instF;
        forward_addD <= instF[7:4];
    end
end

endmodule
