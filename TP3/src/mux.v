module mux1 (data0,data1,select,out);
  input wire [4:0] data0, data1;
  input wire select; 
  output reg out;
  always @(data0, data1, select) begin
    case (select) 
      0: out <= data0;
      1: out <= data1;
    endcase
  end
endmodule

module mux2 (data0,data1,select,out);
  input wire [31:0] data0, data1; 
  input wire select; 
  output reg [31:0] out;
  always @(data0, data1, select) begin
    case (select) 
      0: out <= data0;
      1: out <= data1;
    endcase
  end
endmodule

module AND (A, B, Exit);
  input wire A, B;
  output reg Exit;
  always @ (*) begin
    Exit <= A & B;
  end
<<<<<<< HEAD
endmodule
=======
endmodule
>>>>>>> 02683fd9350eb76d9961f4fce0fbf8f65f9986ea
