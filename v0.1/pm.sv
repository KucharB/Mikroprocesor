module pm
(
    input [4:0] adr,
    output logic [15:0] data
);
reg [15:0] MEM [31:0];

initial 
begin
   
end

always_comb
begin
    data = MEM[adr];
end

endmodule