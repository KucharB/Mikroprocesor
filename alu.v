`timescale 1ns/100ps

module alu
(
    input [7:0] a,
    input [7:0] b,
    input [2:0] op,
    output reg [7:0] out,
    output reg CY
);


reg [8:0] sum;

    always @(*)
    begin
        case(op)
        3'b000 : begin
            sum <= a + b;
            out <= sum[7:0]; 
            CY <= sum[8];
        end
        3'b001 : out <= a - b;
        3'b010 : begin
            out <= a & b;
            CY <= 1'b0;
        end
        3'b011 : begin 
            out <= a | b;
            CY <= 1'b0;
        end
        3'b100 : begin
            out <= a ^ b;
            CY <= 1'b0;
        end
        3'b101 : begin
            out <= ~a;
            CY <= 1'b0;
        end
        3'b110 : out <= b;
        default : out <= b;
        endcase
    end

endmodule

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