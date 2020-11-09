module alu(a,b,alu_control,alu_out,zero,lsb);
    input [31:0] a,b;
    input [3:0] alu_control;
    output [31:0] alu_out;
    output zero,lsb;
    
    assign zero = (alu_out == 0) ? 1 : 0;
    assign lsb = alu_out[0];

    always @(alu_control or a or b) 
    begin
        case (alu_control)
            0: alu_out <= a & b; // AND
            1: alu_out <= a | b; // OR
            2: alu_out <= OUT(a, b); // ADD
            6: alu_out <= a - b; // SUB
            7: alu_out <= a < b ? 1 : 0;
            10: alu_out <= ~( a | b ); // XOR
            default: alu_out <= 0; 
        endcase
    end

    function [31:0] OUT;
        input [31:0] a, b;
        begin
            // complemento de 2
            case(b[31])
                1'b1:   begin
                    b = ~b;
                    b = b + 1'b1;
                    OUT = a - b;
                end
                default: OUT = a + b;
            endcase
        end
    endfunction
endmodule

// alu --> LUCIANO

// lsb = last signed bit