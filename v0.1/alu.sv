`timescale 1ns/100ps

module alu
(
    input logic Ci,
    input logic [7:0] a,
    input logic [7:0] b,
    input logic [3:0] op,
    output logic [7:0] out,
    output logic CY
);


logic [8:0] sum;
logic [7:0] out1;
logic CY1;

    always_comb
    begin
      	sum = 8'd0;
      	CY1 = 1'b0;
        case(op)
        4'b0000 : begin
            sum = a + b + Ci;
            out1 = sum[7:0]; 
        end
        4'b0001 : out1 = a - b - Ci;
        4'b0010 : begin
            out1 = a & b;
        end
        4'b0011 : begin 
            out1 = a | b;
        end
        4'b0100 : begin
            out1 = a ^ b;
        end
        4'b0101 : begin
            out1 = ~a;
        end
        default : begin
          out1 = b;
        end
        endcase
    end

    assign out = out1;
  	assign CY = sum[8];

endmodule

module CY_reg
(
    input flag,
    input ce,
    input clk,
    output logic CY
);

always_ff @(posedge clk)
begin
    if(ce)
    CY <= flag;
end

endmodule
