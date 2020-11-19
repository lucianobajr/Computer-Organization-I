<<<<<<< HEAD
module InstructionMemory(endereco, instrucaoOut);
     
     input [31:0] endereco;
     
     output [31:0] instrucaoOut;
     
     reg [31:0] RAM [0:3];

     initial $readmemb("instrucoes.bin", (RAM));
     
     assign instrucaoOut = RAM[endereco/4];

endmodule
=======
module InstructionMemory (ReadAddress, Instruction);
  input wire [31:0]ReadAddress;
  output reg [31:0]Instruction;
  always @ (*) begin
    case (ReadAddress)
      32'b00000000000000000000000000000000: Instruction <= 32'b00000010011101000100100000100000;//Receber uma instrução;
      32'b00000000000000000000000000000100: Instruction <= 32'b00000010010101111001100000100010;//Receber uma instrução;
      32'b00000000000000000000000000001000: Instruction <= 32'b00010010000100110000000000001100;//Receber uma instrução;
      32'b00000000000000000000000000001100: Instruction <= 32'b00000001101100100111000000100100;//Receber uma instrução;
      32'b00000000000000000000000000010000: Instruction <= 32'b00000010001101010100000000100101;//Receber uma instrução;
      32'b00000000000000000000000000010100: Instruction <= 32'b00000001100101100101100000101010;//Receber uma instrução;
      32'b00000000000000000000000000011000: Instruction <= 32'b00010010000101110000000000100000;//Receber uma instrução;
      32'b00000000000000000000000000011100: Instruction <= 32'b00000001101011110111000000100111;//Receber uma instrução;
      32'b00000000000000000000000000100000: Instruction <= 32'b10001110110100100000000000001000;//Receber uma instrução;
      32'b00000000000000000000000000100110: Instruction <= 32'b10101110101100010000000000010000;
    endcase
  end
endmodule
>>>>>>> 02683fd9350eb76d9961f4fce0fbf8f65f9986ea
