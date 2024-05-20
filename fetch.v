module fetch(
    input i_clk,
    input i_reset,
    input i_stop,
    output [11:0] o_pc
);//PC behavior

    wire [11:0] next_pc;
    reg [11:0] r_pc; //= 12'h000;
    reg [11:0] o_pc;

    always @(posedge i_clk or negedge i_reset) begin
        if (~i_reset)begin
            o_pc <= 12'h000;
            r_pc <= 12'h000;
        end
        else if(~i_stop)begin
            o_pc <= r_pc;
            r_pc <= next_pc;
        end
    end
    
    assign next_pc = r_pc + 12'h001;

endmodule