`timescale  1ns/100ps

`include "alu.v"
`include "aku.v"


module operation_block(
    input [2:0] operation_code,
    input aku_enable,
    input clk,
    input [7:0] in_b,
    output [7:0] out_result,
    output Carry_flag
);

wire [7:0] operation_result;

alu alu_unit(.a(out_result), .b(in_b), .op(operation_code), .CY(Carry_flag), .out(operation_result));
aku aku_unit(.ce(aku_enable), .clk(clk), .data_in(operation_result), .data_out(out_result));


endmodule


module operation_block_tb;
reg [2:0] op_code;
reg aku_enable;
reg clk;
reg [7:0] b_input;
wire [7:0] result;
wire cy;

operation_block op_bo1(.operation_code(op_code), .aku_enable(aku_enable), .clk(clk), .in_b(b_input), .out_result(result), .Carry_flag(cy));

initial begin
    forever begin
        #5 clk = ~clk;
    end
end

initial begin
    clk = 1'b0;
    b_input = 8'd10;
    op_code = 3'd6;
    aku_enable = 1'b1;
    #10 aku_enable = 1'b0;
    #20 $finish;
    
end

    initial begin
	$dumpfile("op_bl.vcd");
	$dumpvars(0, operation_block_tb);
	$dumpon;
end


endmodule