module Instruction_Mem(
    input      [11:0] PCAdd_pc,
    output     [15:0] M_instruction
); //instruction memory(fetch)

    reg [15:0] instM[4095:0];

    //initial instruction set
    initial begin 
        instM[0] = 16'b0110_0000_0001_0001; //mem[2] -> reg1
        instM[1] = 16'b0110_0010_0100_0010; //LDA -> 2cycle delay
        instM[2] = 16'b0110_0100_0100_0011; //r3 = r2 - r1 /0008
        instM[3] = 16'b1001_0010_0011_0010; //r4 = r2 + r1 /1119+1111
        instM[4] = 16'b0110_0010_0010_0101;
        instM[5] = 16'b0110_0000_0000_0000;
        instM[6] = 16'b0110_0000_0001_0000;
        instM[7] = 16'b0110_0000_0001_0000;
        //instM[2] = 16'b0010_0100_0001_0010; //ADD r2, r1, r3 /1111+0
        //instM[3] = 16'b1000_0010_0001_0011; //MUL r3, r2, #1 /1111x1
    end

    assign M_instruction = instM[PCAdd_pc];

endmodule