module OpcodeDecoder(
    input   [3:0] i_opcode,
    output  reg branch,      //HazardUnit
    output  reg flush,     //HazardUnit
    output  reg RegWrite,  //to WriteBackStage
    output  reg MemToReg,  //to MemStage
    output  reg MemWrite,
    output  reg immediate, //to DecodeStage
    output  reg forward,
    output  [1:0] o_alufunc
); //to excute register

reg [6:0] flag;

parameter LDA            = 2'b00,
          STA            = 2'b01,
          IMM            = 2'b10,
          BAF            = 2'b11;

          /*LDA_immadd
          LDA_
          STA
          CAL_add
          CAL_sub
          CAL_mul
          CAL_SLT
          BAF_immsub
          BAF_reg*/

 
always @(*) begin
    {branch, flush, RegWrite, MemWrite, MemToReg, immediate, forward} = flag;
end

always @(*) begin
    flag = 7'b0000000;
    case(i_opcode[3:2])
        LDA             : flag = 7'b0010111;
        STA             : flag = 7'b0001000;
        IMM             : flag = 7'b0010011;
        BAF             : flag = 7'b1100000;//src1-imm = 0 -> branch
    endcase
end

assign o_alufunc = i_opcode[1:0];

endmodule