`include"register.sv"
`include "multi.sv"

module rf(
    input [7:0] data_in,
    input clk,
    input ce,
    input [2:0] reg_adr,
    output [7:0] data_out
);

wire [7:0] reg_ce;

assign reg_ce = (ce ? 8'd1 : 8'd0) << reg_adr;

logic [7:0] registers [7:0]; 

genvar i;
generate 
    for (i = 0; i < 8; i++) begin : gen_register
        register reg0(.data_in(data_in), .clk(clk), .ce(reg_ce[i]), .data_out(registers[i]));
    end
endgenerate

multi multiplex(
    .a(registers[0]), .b(registers[1]), .c(registers[2]), .d(registers[3]),
    .e(registers[4]), .f(registers[5]), .g(registers[6]), .h(registers[7]),
    .addr(reg_adr), .choice(data_out)
);
endmodule

