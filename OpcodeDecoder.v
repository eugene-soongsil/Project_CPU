module OpcodeDecoder(
    input   [3:0] i_opcode,
    output  reg jump,
    output  reg flush,
    output  reg RegWrite,
    output  reg MemWrite,
    output  reg immediate,
    output  [1:0] o_alufunc
); //to excute register

reg [4:0] flag;

parameter LDAMemWrite   = 2'b00,
          STARegWrite   = 2'b01,
          immediateInst = 2'b10,
          jumpFlushLink = 2'b11;

always @(*) begin
    {jump, flush, RegWrite, MemWrite, immediate} = flag;
end

always @(*) begin
    case(i_opcode[3:2])
        LDAMemWrite     : flag = 5'b00100; // MemWrite = 1
        STARegWrite     : flag = 5'b00010; // RegWrite = 1
        immediateInst   : flag = 5'b00011; // RegWrite = 1, immediate = 1
        jumpFlushLink   : flag = 5'b11000; // jump = 1, flush = 1
        default         : flag = 5'b00000; 
    endcase
end

assign o_alufunc = i_opcode[1:0];

endmodule


/*
reg     [6:0]           flag;

parameter LDAMemWrite   = 4'b0000, //R
          STARegWrite   = 4'b0001,
          immediateInst = 4'b0010, //I
          jumpInst      = 4'b0100, //J
          jumpAndLink   = 4'b1000,
          jumpFlush     = 4'b1100;
          
always@(*)begin
    {jump, o_alufunc, flush, RegWrite, MemWrite, immediate} = flag;
end

always@(*)begin
    case(i_opcode)
        LDAMemWrite       : flag = 7'b000_0010;
        STARegWrite       : flag = 7'b000_0100;
        immediateInst     : flag = 7'b000_0101;
        jumpInst          : flag = 7'b100_0111;
        jumpAndLink       : flag = 7'b100_0100;
        jumpFlush         : flag = 7'b100_1000;
        default           : flag = 7'b000_0000;
    endcase
end
*/

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