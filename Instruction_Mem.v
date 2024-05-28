module Instruction_Mem(
    input      [11:0] PCAdd_pc,
    output     [15:0] M_instruction
); //instruction memory(fetch)

    reg [15:0] instM[4095:0];

    //initial instruction set
    initial begin
        instM[0] = 16'b0000_0000_0000_0000; //LDA r0, [r0]
        instM[1] = 16'b1000_0000_0010_0001; //ADD r1, r0, #2 2
        instM[2] = 16'b1000_0001_0011_0010; //ADD r2, r1, #3 5
        instM[3] = 16'b1000_0010_0001_0011; //SUB r3, r2, #1 4
    end

    assign M_instruction = instM[PCAdd_pc];


endmodule   