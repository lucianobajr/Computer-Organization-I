module reg_file(
    input writereg,
    input [63:0] writedata,
    input [4:0] rs1, 
    input [4:0] rs2,
    input [4:0] rd,

    output reg [63:0] readdata1,
    output reg [63:0] readdata2
);

reg [63:0] array [31:0];

integer i;

initial begin
    readdata1 <= 0;
    readdata2 <= 0;

    for (i = 0; i < 32; i = i + 1) begin
        array[i] <= 0;
    end
end

always @(*) begin
    readdata1 <= array[rs1];
    readdata2 <= array[rs2];

    if ((rd != 0) & (writereg == 1))
        array[rd] <= writedata;
end

endmodule 

// reg_file
