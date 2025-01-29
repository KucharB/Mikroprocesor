module md(
    input clk,
    input [7:0] in_data,
    input logic [9:0] addr,
    input wr,
    output logic [7:0] o_data
);

reg [7:0] MEM [0:1023];

initial for(int i = 0; i < 1024; i++) MEM[i] = 0;//'(default:0);

always_ff @(posedge clk) begin
    if(wr)  MEM[addr] = in_data;
    //else o_data = MEM[addr];
end

assign o_data = MEM[addr];
endmodule