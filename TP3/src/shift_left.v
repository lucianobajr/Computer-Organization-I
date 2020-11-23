module shift_left(ValSignExtend, Result);
  input wire [31:0]ValSignExtend;
  output reg [31:0]Result;
  always @ (*) begin
    Result <= (ValSignExtend << 2);
  end
endmodule