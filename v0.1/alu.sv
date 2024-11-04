`timescale 1ns/100ps

module alu
(
    input Ci,
    input [7:0] a,
    input [7:0] b,
    input [2:0] op,
    output [7:0] out,
    output CY
);


reg [8:0] sum;
reg [7:0] out1;
reg CY1;

    always_comb
    begin
        case(op)
        3'b000 : begin
            sum <= a + b + Ci;
            out1 <= sum[7:0]; 
            CY1 <= sum[8];
        end
        3'b001 : out1 <= a - b - Ci;
        3'b010 : begin
            out1 <= a & b;
            CY1 <= 1'b0;
        end
        3'b011 : begin 
            out1 <= a | b;
            CY1 <= 1'b0;
        end
        3'b100 : begin
            out1 <= a ^ b;
            CY1 <= 1'b0;
        end
        3'b101 : begin
            out1 <= ~a;
            CY1 <= 1'b0;
        end
        3'b110 : out1 <= b;
        default : out1 <= b;
        endcase
    end

    assign out = out1;
    assign CY = CY1;

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
/*
module alu_tb;

reg [7:0] a;
reg [7:0] b;
reg [2:0] op;
wire out;
wire cy;

alu alu_unit(.a(a), .b(b), .op(op), .CY(cy));

initial 
    begin
        a = 8'd10;
        b = 8'd2;
        op = 3'd0;
    #5  op = 3'd1;
    #5  op = 3'd2;
    #5  op = 3'd3;
    #5  op = 3'd4;
    #5  op = 3'd5;
    #5  op = 3'd6;
    #5  op = 3'd7;
    #5  op = 3'd0;
        a = 8'hff;
    #5  op = 3'd1;
    #5 $finish;
    end

    initial begin
	$dumpfile("alu_test.vcd");
	$dumpvars(0, alu_tb);
	$dumpon;
end

endmodule
*/