module OpcodeDecoder(
    input   [3:0]       i_opcode,
    output              jump, flush, RegWrite, MemWrite,
    output  [1:0]       o_alufunc
);

reg     [3:0]           flag;

parameter load          = 4'b0000,
          store         = 4'b0001,
          


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