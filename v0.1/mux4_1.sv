module mux4_1(
    input [7:0] a,
    input [7:0] b,
    input [7:0] c,
    input [7:0] d,
    input [1:0] sel,
    output logic [7:0] o_data
);

always_comb begin
    case(sel)
    2'b00: o_data = a;
    2'b01: o_data = b;
    2'b10: o_data = c;
    2'b11: o_data = d;
    endcase
end

endmodule