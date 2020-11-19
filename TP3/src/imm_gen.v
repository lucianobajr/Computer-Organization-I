module extensao_sinal(
    input wire [15:0] in,
    output reg [31:0] extensor
);
    
always @(*) 
    begin
        extensor <= {{16{in[15]}},in};   
    end
endmodule

// extensao_sinal
