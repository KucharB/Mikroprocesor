`include"register.sv"
`include "multi.sv"

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

struct {
byte register_line0;
byte register_line1;
byte register_line2;
byte register_line3;
byte register_line4;
byte register_line5;
byte register_line6;
byte register_line7;
} reg_struct;

reg_struct[i]

register register0(.data_in(data_in), .clk(clk), .ce(ce0), .data_out(register_line0));
register register1(.data_in(data_in), .clk(clk), .ce(ce1), .data_out(register_line1));
register register2(.data_in(data_in), .clk(clk), .ce(ce2), .data_out(register_line2));
register register3(.data_in(data_in), .clk(clk), .ce(ce3), .data_out(register_line3));
register register4(.data_in(data_in), .clk(clk), .ce(ce0), .data_out(register_line4));
register register5(.data_in(data_in), .clk(clk), .ce(ce1), .data_out(register_line5));
register register6(.data_in(data_in), .clk(clk), .ce(ce2), .data_out(register_line6));
register register7(.data_in(data_in), .clk(clk), .ce(ce3), .data_out(register_line7));

multi multiplex(.a(register_line0), .b(register_line1), .c(register_line2), .d(register_line3), .addr(addr), .choice(data_out));

endmodule