module control(
    opcode,
    Branch, 
    MemRead, 
    MemtoReg, 
    MemWrite, 
    alusrc, 
    regwrite, 
    aluop,
    RegDst
);
    input wire [6:0] opcode;
    output reg Branch; 
    output reg MemRead; 
    output reg MemtoReg; 
    output reg MemWrite; 
    output reg alusrc; 
    output reg regwrite; 
    output reg [1:0] aluop;
    output reg RegDst;


    parameter R_Format = 7'b0110011;
    parameter LD = 7'b0000011;
    parameter SD = 7'b0100011;
    parameter BEQ = 7'b1100011;

    always @(*) 
    begin
        case (opcode)
            R_Format:
                begin
                    Branch = 1'b0;
                    MemRead = 1'b0;
                    MemtoReg = 1'b0;
                    MemWrite = 1'b0;
                    alusrc = 1'b0;
                    regwrite = 1'b1;
                    aluop = 2'b10;
                    RegDst = 1'b1;
                end
            LD:
                begin
                    Branch = 1'b0;
                    MemRead = 1'b1;
                    MemtoReg = 1'b1;
                    MemWrite = 1'b0;
                    alusrc = 1'b1;
                    regwrite = 1'b1;
                    aluop = 2'b00;
                    RegDst = 1'b0;
                end
            SD:
                begin
                    Branch = 1'b0;
                    MemRead = 1'b0;
                    MemtoReg = 1'bx;
                    MemWrite = 1'b1;
                    alusrc = 1'b1;
                    regwrite = 1'b0;
                    aluop = 2'b00;
                    RegDst = 1'bx;
                end
            BEQ:
                begin
                    Branch = 1'b1;
                    MemRead = 1'b0;
                    MemtoReg = 1'bx;
                    MemWrite = 1'b0;
                    alusrc = 1'b0;
                    regwrite = 1'b0;
                    aluop = 2'b01;
                    RegDst = 1'bx;
                end 
        endcase
    end
endmodule