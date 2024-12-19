`timescale 1ns/100ps

`include "rf.sv"

module rf_tb;
    reg [7:0] data;
    reg clk;
    reg ce;
    reg [2:0] adr;
    wire [7:0] odata;

    initial begin
        clk = 1'b0;
        data = 8'd6;
        adr = 3'd2;
        ce = 1'b1;
        #10 ce = 1'b0;
        data = 8'd7;
        #50 $finish;
    end

    initial begin
        forever #5 clk = ~clk;
    end

    initial begin
	$dumpfile("rf_tb.vcd");
	$dumpvars(0, rf_tb);
	$dumpon;
end

    rf reg_block(.data_in(data), .clk(clk), .ce(ce), .reg_adr(adr), .data_out(odata));
endmodule

