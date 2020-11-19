module program_counter (pc, reset, pc_next);
  input wire reset;
  output reg [31:0] pc;
  output reg [31:0] pc_next;
  always @ (*) begin
    if(reset) begin
      pc_next <= 32'd0;
    end
    else begin
      pc_next <= pc;
    end
  end
endmodule

module Sum4 (pc, sum);
  input wire [31:0]pc;
  output reg [31:0]sum;
  always @ (*) begin
    sum <= pc + 32'd4;
  end
endmodule

module result_pc (A, B, Sum, ANDBranch, clock);
  input wire [31:0] A, B;
  input wire ANDBranch, clock;
  output reg [31:0] Sum;
  always @ (posedge clock) begin
    if(ANDBranch) begin
      Sum <= A + B;
    end
    else if(~ANDBranch) begin
      Sum <= A;
    end
  end
endmodule
