`include "main.v"

module testbench ();
  reg Clock, Reset;
  wire [31:0] PC, ALUResult, Instruction;

  datapath Call (.clock(Clock), .Reset(Reset), .Prx_PC(PC), .ALUResult(ALUResult), .Instruction(Instruction));

  initial begin
    $dumpfile("datapath.vcd");
    $dumpvars(0, testbench);
    
    $display("Exibindo os resultados:");
    $monitor("Instruction: %b\nExit PC: %b\nExit ALU: %b\n",Instruction, PC, ALUResult);

  end
  initial begin
    #1; Clock = 0;
    #1; Clock = 1; Reset = 1;
    #1; Clock = 0;
    #1; Clock = 1; Reset = 0;
    #1; Clock = 0;
    #1; Clock = 1;
    #1; Clock = 0;
    #1; Clock = 1;
    #1; Clock = 0;
    #1; Clock = 1;
    #1; Clock = 0;
    #1; Clock = 1;
    #1; Clock = 0;
    #1; Clock = 1;
    #1; Clock = 0;
    #1; Clock = 1;
    #1; Clock = 0;
    #1; Clock = 1;
    #1; Clock = 0;
    #1; Clock = 1;
    #1; Clock = 0;
    #1; Clock = 1;
    #1; Clock = 0;
    #1; Clock = 1;
    #1; Clock = 0;
    #1; Clock = 1;
    #1; Clock = 0;
    #1; Clock = 1;
    #1; Clock = 0;
    #1; Clock = 1;
    #1; Clock = 0;
    #1; Clock = 1;
    #1; Clock = 0;
    #1; Clock = 1;
    #1; Clock = 0;
    #1; Clock = 1;
    #1; Clock = 0;
    #1; Clock = 1;
    #1; Clock = 0;
    #1; Clock = 1;
    #1; Clock = 0;
    #1; Clock = 1;
    #1; Clock = 0;
    #1; Clock = 1;
    #1; Clock = 0;
    #1; Clock = 1;
    #1; Clock = 0;
    #1; Clock = 1;
    #1; Clock = 0;
    #1; Clock = 1;
    #1; Clock = 0;
    #1; Clock = 1;
    #1; Clock = 0;
    #1; Clock = 1;
    #1; Clock = 0;
    #1; Clock = 1;
    #1; Clock = 0;
    #1; Clock = 1;
    #1; Clock = 0;
    #1; Clock = 1;
    #1; Clock = 0;
    #1; Clock = 1;
    #1; Clock = 0; Reset = 0;
    $finish;
  end
endmodule