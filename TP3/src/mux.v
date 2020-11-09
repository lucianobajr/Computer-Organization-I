module mux(data0,data1,select,out);
    input [31:0]data0,data1;
    input select;
    output [31:0] out;

    assign out = (select==1)?data1:data0;
endmodule

// mux --> LUCIANO