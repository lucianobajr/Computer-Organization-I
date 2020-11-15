// module intruction_memory(address, read_data);
//     input [5:0] address;
//     output [31:0] read_data;
//     reg [31:0] RAM[0:63];

//     initial $readmemh("instructions.bin", RAM);
//     assign read_data = RAM[address];
// endmodule

// // intruction_memory --> LUCIANO

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
