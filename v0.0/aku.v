module aku(
    input ce,
    input clk,
    input [7:0] data_in,
    output reg [7:0] data_out
);

always @(posedge clk)
begin
    if(ce)
    begin
        data_out <= data_in;
    end
    
end

endmodule