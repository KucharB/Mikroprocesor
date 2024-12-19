`include "cpu.sv"

module cpu_tb;

reg clk;
reg clr;
wire [7:0] o_data;

cpu dut(.*);

initial begin
clk = 1'b0;
clr = 1'b0;
@(posedge clk);
@(posedge clk)
clr = 1'b1;

#100 $finish;
end

initial
forever #5 clk = ~clk;


initial begin
	$dumpfile("cpu.vcd");
	$dumpvars(0, cpu_tb);
	$dumpon;
end


endmodule

/*module cpu(
    input clk,
    input clr,
    output logic [7:0] o_data
);*/