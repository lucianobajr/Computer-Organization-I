module reg_file(
    writereg,
    writedata,
    rs1, 
    rs2,
    rd,
    readdata1,
    readdata2,
    clock, 
    reset
);
  input writereg,clock,reset;
  input [31:0] writedata;
  input [4:0] rs1; 
  input [4:0] rs2;
  input [4:0] rd;

  output reg [31:0] readdata1;
  output reg [31:0] readdata2;
  reg [63:0] array [31:0];

  integer i;

  always @ (posedge reset or posedge clock) begin
  
      if (reset)
<<<<<<< HEAD
          for (i=0; i<32; i=i+1) array[i] <= 64'b0;
=======
        for (i=0; i<32; i=i+1) array[i] <= 63'b0;
>>>>>>> 02683fd9350eb76d9961f4fce0fbf8f65f9986ea
      else if (writereg)
        array [rd] = writedata;
        
      readdata1 = array[rs1];
      readdata2 = array[rs2];
  end

endmodule 

// reg_file
