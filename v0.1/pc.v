module pc
( 
    input clk,
    input clr,
    output reg [4:0] data
);

always @(posedge clk)
    if (!clr)
    begin
        data <= 5'd0;
    end
    else
    begin
        data <= data + 1;
    end

endmodule