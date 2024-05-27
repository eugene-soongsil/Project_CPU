module ALU(
    input        [1:0]    ALU_func,
    input        [15:0]   ALU_srcdata_1,
    input        [15:0]   ALU_srcdata_2,
    output  reg  [15:0]   ALU_result
);

parameter   ADD = 2'b00,
            SUB = 2'b01,
            MUL = 2'b10,
            SLT = 2'b11,

always@(*)begin
    case(ALU_func)
            ADD: ALU_result = A + B; 
            SUB: ALU_result = A - B;
            MUL: ALU_result = A * B;
            SLT: ALU_result = (A < B) ? {{(15){1'b0}}, 1'b1} :  {(16){1'b0}};  
        default:
            ALU_result = 16'h0000;
    endcase
end

endmodule