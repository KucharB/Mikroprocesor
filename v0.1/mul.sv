module mul(
    input [7:0] a,
    input logic nReset,
    input logic ce_aku,
    input logic clk,

    output logic [15:0] mul_out
);

logic [15:0] alu_mul_out;
logic [15:0] b_in;

always_comb begin
    alu_mul_out = a * mul_out;
end

aku aku_mul(.ce(ce_aku), .clk(clk), .nReset(nReset), .data_in(c), .data_out(mul_out));

endmodule

module aku(
    input logic ce,
    input logic clk,
    input logic nReset,
    input [15:0] data_in,
    output logic [15:0] data_out
);

always_ff @(posedge clk)
begin
    if(nReset)
        data_out <= {16{1'b1}};
    else if(ce)
    begin
        data_out <= data_in;
    end
    
end

endmodule