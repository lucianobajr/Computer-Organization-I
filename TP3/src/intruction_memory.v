module intruction_memory(address, read_data);
    input [5:0] address;
    output [31:0] read_data;
    reg [31:0] RAM[0:63];

    assign read_data = RAM[address];
endmodule

// intruction_memory --> LUCIANO