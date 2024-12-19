module pc
( 
    input clk,
    input clr,
    output logic [4:0] data,
    input load,
    input [4:0] data_in
);

always_ff @(posedge clk)
    if (!clr)
    begin
        data <= 5'd0;
    end
    else if(load) data <= data_in;
    else
    begin
        data <= data + 1'd1;
    end

endmodule