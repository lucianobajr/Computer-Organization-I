module ShiftLeft2(ValSignExtend, Result);
  input wire [31:0]ValSignExtend;
  output reg [31:0]Result;
  always @ (*) begin
    Result <= (ValSignExtend << 2);
  end
<<<<<<< HEAD
endmodule
=======
endmodule
>>>>>>> 02683fd9350eb76d9961f4fce0fbf8f65f9986ea
