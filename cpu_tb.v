`timescale 1ns/100ps

`include "cpu.v"

module cpu_tb();
reg [7:0] switch;
reg clk;
wire [7:0] led;
reg clr;


cpu cpu1(.clk(clk), .swiches(switch), .leds(led), .clr(clr));

initial begin
    clk = 1'b0;
    clr = 1'b0;
    switch = 8'h48;
    #10 clr = 1'b1;
    #100 $finish;
end

initial begin
    forever #5 clk = ~clk;
end 

initial begin
	$dumpfile("cpu.vcd");
	$dumpvars(0, cpu_tb);
	$dumpon;
end

endmodule