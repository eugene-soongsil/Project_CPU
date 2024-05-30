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
    else if(!enable)begin
        pcD   <= pcF;
        instD <= instF;
    end
end

endmodule
