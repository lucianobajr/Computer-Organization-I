module extensao_sinal(
    input wire [15:0] in,
    output reg [31:0] extensor
);
    
always @(*) 
    begin
        extensor <= {{16{in[15]}},in};   
    end
endmodule

<<<<<<< HEAD
// extensao_sinal
=======
// extensao_sinal
>>>>>>> 02683fd9350eb76d9961f4fce0fbf8f65f9986ea
