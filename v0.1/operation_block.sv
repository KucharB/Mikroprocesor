`timescale  1ns/100ps

`include "alu.sv"
`include "aku.sv"


module operation_block(
    input [3:0] operation_code,
    input aku_enable,
    input clk,
    input [7:0] in_b,
    output [7:0] out_result
);

wire [7:0] operation_result;
wire flag_transport;
wire flag_alu_in;

wire aku_alu;

alu alu_unit(.a(out_result), .b(in_b), .op(operation_code), .CY(flag_transport), .out(operation_result), .Ci(flag_alu_in));
aku aku_unit(.ce(aku_enable), .clk(clk), .data_in(operation_result), .data_out(out_result));
CY_reg carry_reg(.flag(flag_transport), .ce(aku_enable), .clk(clk), .CY(flag_alu_in));

endmodule
