module pm
(
    input [4:0] adr,
    output reg [5:0] data
);

always(adr) 
begin
    case(adr)
    
    default : data <= 6'b000000;
    endcase
end

endmodule