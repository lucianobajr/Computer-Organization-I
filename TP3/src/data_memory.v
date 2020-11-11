module data_Memory(clock, write_Enable, address, write_Data, read_Data);
   input clock, write_Enable;
   input[5:0] address;
   input[31:0] write_Data;
   output[31:0] read_Data;
   reg [31:0] RAM2[0:63];
   assign read_Data = RAM2[address[5:2]];
   always @(posedge clock)
   if (write_Enable) RAM2[address[5:2]] <= write_Data;
endmodule
