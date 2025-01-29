module pm
(
    input [4:0] adr,
    output logic [15:0] data
);
reg [15:0] MEM [31:0];

initial 
begin
   MEM[0] = {8'b11000001, 8'hAA};
   MEM[1] = {6'b111000, 10'd0};
   MEM[2] = {8'b11000001, 8'hBB};
   MEM[3] = {8'b11000001, 8'hCC};
   MEM[4] = {6'b101000, 10'd0};
   MEM[5] = {8'b11000001, 8'hAA};
   MEM[6] = {4'b1100, 3'd0, 5'd0, 4'd0};
   MEM[7] = {8'b11000001, 8'h01};
   MEM[8] = {4'd0, 12'd0};
   MEM[9] = {4'd0, 12'd0};
   MEM[10] = {4'b0100, 12'd0};
   MEM[11] = {4'b0111, 12'd30};
   MEM[29] = {4'b0110, 12'd0};
   MEM[30] = {4'b0110, 12'd0};
   MEM[31] = {4'b0110, 12'd0};
end

always_comb
begin
    data = MEM[adr];
end

endmodule