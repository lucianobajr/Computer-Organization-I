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
        for (i=0; i<32; i=i+1) array[i] <= 63'b0;
      else if (writereg)
        array [rd] = writedata;
        
      readdata1 = array[rs1];
      readdata2 = array[rs2];
  end

endmodule 

// reg_file

// module reg_file (Read1, Read2, WriteReg, WriteData, RegWrite, Data1, Data2, clock, Reset);
//   input wire [4:0] Read1, Read2, WriteReg; // the register numbers to read or write
//   input wire [31:0] WriteData; // data to write
//   input wire RegWrite, clock, Reset;// the write control // the clock to trigger write
//   output reg [31:0] Data1, Data2; // the register values read
//   reg [31:0] RF [31:0]; // 32 registers each 32 bits long
//   always @ (posedge clock) begin // write the register with new value if Regwrite is high
//     if (Reset) begin
//       RF[0] <= 32'd0;
//       RF[1] <= 32'd1;
//       RF[2] <= 32'd2;
//       RF[3] <= 32'd3;
//       RF[4] <= 32'd4;
//       RF[5] <= 32'd5;
//       RF[6] <= 32'd6;
//       RF[7] <= 32'd7;
//       RF[8] <= 32'd8;
//       RF[9] <= 32'd9;
//       RF[10] <= 32'd10;
//       RF[11] <= 32'd11;
//       RF[12] <= 32'd12;
//       RF[13] <= 32'd13;
//       RF[14] <= 32'd14;
//       RF[15] <= 32'd15;
//       RF[16] <= 32'd16;
//       RF[17] <= 32'd17;
//       RF[18] <= 32'd18;
//       RF[19] <= 32'd19;
//       RF[20] <= 32'd20;
//       RF[21] <= 32'd21;
//       RF[22] <= 32'd22;
//       RF[23] <= 32'd16;
//       RF[24] <= 32'd24;
//       RF[25] <= 32'd25;
//       RF[26] <= 32'd26;
//       RF[27] <= 32'd27;
//       RF[28] <= 32'd28;
//       RF[29] <= 32'd29;
//       RF[30] <= 32'd30;
//       RF[31] <= 32'd31;
//     end
//     else begin
//       Data1 <= RF[Read1];
//       Data2 <= RF[Read2];
//       if (RegWrite) begin
//         RF[WriteReg] <= WriteData;
//       end
//     end
//   end
// endmodule

