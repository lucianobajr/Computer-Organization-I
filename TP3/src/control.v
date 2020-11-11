module controle(
    input wire [6:0] opcode;
    output reg [3:0] ex;
    output reg [2:0] mem;
    output reg [1:0] write_back
);

    parameter ADD = 7'b0110011;
    parameter SUB = 7'b0110011;
    parameter AND = 7'b0110011;
    parameter OR = 7'b0110011;
    parameter LD = 7'b0000011;
    parameter SD = 7'b0100011;
    parameter BEQ = 7'b1100111;

    initial begin
        ex <= 4'b0000;
        mem <= 3'b000;
        write_back <= 2'b00;
    end

    always @(*) begin
        case (opcode)
            ADD: 
            default: 
        endcase
    end

endmodule

// control
