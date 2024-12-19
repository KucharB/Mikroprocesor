module pc
( 
    input clk,
    input clr,
    output logic [4:0] data
);

always_ff @(posedge clk)
    if (!clr)
    begin
        data <= 5'd0;
    end
    else
    begin
        data <= data + 1'd1;
    end

endmodule