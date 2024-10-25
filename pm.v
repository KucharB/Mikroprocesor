module pm
(
    input [4:0] adr,
    output reg [5:0] data
);
reg [5:0] MEM [31:00];

initial 
begin
    MEM[0] = 6'd0;

end
always(adr) 
begin
    case(adr)
    data <= MEM[adr];
    default : data <= 6'b111100;
    endcase
end

endmodule