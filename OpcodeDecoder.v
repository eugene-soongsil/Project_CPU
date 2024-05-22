module OpcodeDecoder(
    input   [3:0]       i_opcode,
    output              jump, flush, RegWrite, MemWrite, immediate,
    output  [1:0]       o_alufunc
);

reg     [6:0]           flag;

parameter load          = 4'b0000,
          store         = 4'b0001,
          immediateAdd  = 4'b0010,
          jump_inst     = 4'b0011,
          jumpAndLink   = 4'b0100,
          LWRegWrite    = 4'b0110,
          SWMemWrite    = 4'b0111,
          jumpFlush     = 4'b1000;

          
always@(*)begin
    {jump, o_alufunc, flush, RegWrite, MemWrite, immediate} = flah;
end


/*
parameter JumpAndLink       = 4'b1010,
          LWRegWrite        = 4'b0011,
          SWMemWrite        = 4'b0001,
          JumpFlush         = 4'b1100;

always@(*)begin
    case(i_opcode[3:2])
        2'b00:
            flag = JumpAndLink;
        2'b01:
            flag = LWRegWrite;
        2'b10:
            flag = SWMemWrite;
        2'b11:
            flag = JumpFlush;
        default:
            flag = 4'b0000; 
    endcase
end
*/
assign {jump, flush, RegWrite, MemWrite} = flag;
assign o_alufunc = i_opcode[1:0]

endmodule