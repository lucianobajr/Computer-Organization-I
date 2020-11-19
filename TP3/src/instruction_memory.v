module InstructionMemory(endereco, instrucaoOut);
     
     input [31:0] endereco;
     
     output [31:0] instrucaoOut;
     
     reg [31:0] RAM [0:3];

     initial $readmemb("instrucoes.bin", (RAM));
     
     assign instrucaoOut = RAM[endereco/4];

endmodule
