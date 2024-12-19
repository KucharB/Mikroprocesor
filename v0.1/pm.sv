module pm
(
    input [4:0] adr,
    output logic [15:0] data
);
reg [15:0] MEM [31:0];

initial 
begin
   MEM[0] = {8'b11000001,8'hAA};
   MEM[1] = {8'b111000,10'd0};
   MEM[2] = {8'b11000001,8'hBB};
   MEM[3] = {8'b11000001,8'hCC};
   MEM[4] = {8'b101000,10'd0};
end

always_comb
begin
    data = MEM[adr];
end

endmodule