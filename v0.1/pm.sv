module pm
(
    input [4:0] adr,
    output logic [5:0] data
);
reg [15:0] MEM [31:0];

initial 
begin
    MEM[0] = 6'b111100;
    MEM[1] = 6'b111100;    
    MEM[2] = 6'b111100;
    MEM[3] = 6'b111100;
    MEM[4] = 6'b011111;
    MEM[5] = 6'b011011;
end

always_comb @(adr) 
begin
    data = MEM[adr];
    if(adr > 5'd5) 
        data = 6'b111100;
end

endmodule