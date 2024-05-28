module OpcodeDecoder(
    input   [3:0] i_opcode,
    output  reg branch,      //HazardUnit
    output  reg flush,     //HazardUnit
    output  reg RegWrite,  //to WriteBackStage
    output  reg MemToReg,  //to MemStage
    output  reg MemWrite,
    output  reg immediate, //to DecodeStage
    output  [1:0] o_alufunc
); //to excute register

reg [5:0] flag;

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
    {branch, flush, RegWrite, MemWrite, MemToReg, immediate} = flag;
end

always @(*) begin
    case(i_opcode[3:2])
        LDA             : flag = 6'b001011;
        STA             : flag = 6'b000100;
        IMM             : flag = 6'b001001;
        BAF             : flag = 6'b110000;//src1-imm = 0 -> branch
        default         : flag = 6'b000000; 
    endcase
end

assign o_alufunc = i_opcode[1:0];

endmodule