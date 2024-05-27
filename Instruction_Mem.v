module Instruction_Mem(
    input [11:0] PCAdd_pc,
    output [15:0] M_instruction
); //instruction memory(fetch)

    reg [15:0] r_instruction;
    reg [15:0] inst[4095:0];

    always @(posedge i_clk or negedge i_reset) begin
        if(~i_reset)
            r_instruction <= 16'h0;
        else if(~i_stop)
            r_instruction <= inst[i_pc];
    end
    
    //initial instruction set
    initial begin
        inst[0] = 16'b0001_0100_0011_1000; //ADD reg[4] + reg[3]; register[8]
        inst[1] = 16'b0010_1000_0010_1111; //SUB reg[8] - reg[2]; register[15]
        inst[2] = 16'b0001_0001_0010_0001; //1+2 to reg[1]
        inst[3] = 16'b0001_0010_0100_0010; //2+4 to reg[2]
    end

    assign M_instruction = r_instruction;


endmodule