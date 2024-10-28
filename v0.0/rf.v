`include"register.v"
`include "multi.v"

module rf(
    input [7:0] data_in,
    input clk,
    input ce0,
    input ce1,
    input ce2,
    input ce3,
    input [1:0] addr,
    output [7:0] data_out,

    input [7:0] data_switch
);

wire [7:0] register_line0;
wire [7:0] register_line1;
wire [7:0] register_line2;
wire [7:0] register_line3;

register register0(.data_in(data_in), .clk(clk), .ce(ce0), .data_out(register_line0));
register register1(.data_in(data_in), .clk(clk), .ce(ce1), .data_out(register_line1));
register register2(.data_in(data_in), .clk(clk), .ce(ce2), .data_out(register_line2));
register register3(.data_in(data_switch), .clk(clk), .ce(ce3), .data_out(register_line3));

multi multiplex(.a(register_line0), .b(register_line1), .c(register_line2), .d(register_line3), .addr(addr), .choice(data_out));

endmodule