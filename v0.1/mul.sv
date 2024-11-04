module mul(
    input [7:0] a,
    input [7:0] b;

    output logic [15:0] c
);

always_comb
    c = a * b;

endmodule