module Program_counter (in_count,end_count,clock);
  input clock;
  input [31:0] in_count;
  output reg[31:0] end_count;
  always @ (posedge clock) begin
    end_count = in_count;
  end
endmodule
//pc
