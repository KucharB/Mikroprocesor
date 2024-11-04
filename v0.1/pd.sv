module pd(
    input clk;
    input [7:0] in_data;
    input logic [9:0] addr,
    input wr,
    output [7:0] o_data
);

reg [7:0] MEM [0:1024];

//MEM <= '(default:0);

always_ff @(posedge clk) begin
    if(wr)  MEM[addr] = in_data;
    else o_data = MEM[adr];
end

endmodule