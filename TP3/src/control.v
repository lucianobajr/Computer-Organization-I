module control(
    opcode,
    Branch, 
    MemRead, 
    MemtoReg, 
    MemWrite, 
    alusrc, 
    regwrite, 
<<<<<<< HEAD
    aluop,
    RegDst
=======
    aluop
>>>>>>> 02683fd9350eb76d9961f4fce0fbf8f65f9986ea
);
    input wire [6:0] opcode;
    output reg Branch; 
    output reg MemRead; 
    output reg MemtoReg; 
    output reg MemWrite; 
    output reg alusrc; 
    output reg regwrite; 
    output reg [1:0] aluop;
<<<<<<< HEAD
    output reg RegDst;
=======

    parameter R_Type = 7'b0110011;
    parameter LD = 7'b0000011;
    parameter SD = 7'b0100011;
    parameter BEQ = 7'b1100111;

    always @(*) begin
        case (opcode)
            R_Type:
                begin
                    Branch = 1'b0;
                    MemRead = 1'b0;
                    MemtoReg = 1'b0;
                    MemWrite = 1'b0;
                    alusrc = 1'b0;
                    regwrite = 1'b1;
                    aluop = 2'b10;
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
                end
            SD:
                begin
                    Branch = 1'b0;
                    MemRead = 1'b0;
                    MemtoReg = 1'b1;
                    MemWrite = 1'b1;
                    alusrc = 1'b1;
                    regwrite = 1'b0;
                    aluop = 2'b00;
                end
            BEQ:
                begin
                    Branch = 1'b1;
                    MemRead = 1'b0;
                    MemtoReg = 1'b1;
                    MemWrite = 1'b0;
                    alusrc = 1'b0;
                    regwrite = 1'b0;
                    aluop = 2'b01;
                end 
            
            default: $display("Opcode não identificado!!!");
        endcase
    end
>>>>>>> 02683fd9350eb76d9961f4fce0fbf8f65f9986ea


<<<<<<< HEAD
    parameter R_Type = 7'b0110011;
    parameter LD = 7'b0000011;
    parameter SD = 7'b0100011;
    parameter BEQ = 7'b1100011;

    always @(*) 
    begin
        case (opcode)
            R_Type:
                begin
                    Branch = 1'b0;
                    MemRead = 1'b0;
                    MemtoReg = 1'b0;
                    MemWrite = 1'b0;
                    alusrc = 1'b0;
                    regwrite = 1'b1;
                    aluop = 2'b10;
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
                end 

            default: $display("Opcode não identificado!!!");
        endcase
    end

endmodule
=======
// control
>>>>>>> 02683fd9350eb76d9961f4fce0fbf8f65f9986ea
