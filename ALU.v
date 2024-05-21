module ALU(
    input  [3:0]   ALU_control,
    input  [7:0]   ALU_srcdata_1,
    input  [7:0]   ALU_srcdata_2,
    output [7:0]   ALU_result
);

parameter   ADD = 4'b0000,
            SUB = 4'b0001,
            AND = 4'b0010,
            OR  = 4'b0011,
            XOR = 4'b0100,
            NOT = 4'b0101,
            LSL = 4'b0110,
            LSR = 4'b0111,
            ASR = 4'b1000;

always@(*)begin
    case(ALU_control)
        ADD:
            ALU_result = ALU_srcdata_1 + ALU_srcdata_2;
        SUB:
            ALU_result = ALU_srcdata_1 - ALU_srcdata_2;
        AND:
            ALU_result = ALU_srcdata_1 & ALU_srcdata_2;
        OR:
            ALU_result = ALU_srcdata_1 | ALU_srcdata_2;
        XOR:
            ALU_result = ALU_srcdata_1 ^ ALU_srcdata_2;
        NOT:
            ALU_result = ~ALU_srcdata_1;
        LSL:
            ALU_result = ALU_srcdata_1 << ALU_srcdata_2;
        LSR:
            ALU_result = ALU_srcdata_1 >> ALU_srcdata_2;
        ASR:
            ALU_result = ALU_srcdata_1 >>> ALU_srcdata_2;
        default:
            ALU_result = 8'b0000_0000;
    endcase
end

endmodule