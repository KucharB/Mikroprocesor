module pm
(
    input [4:0] adr,
    output reg [5:0] data
);

// Declare the ROM content using an initial block
initial begin
    // ROM memory contents 
    // Address: 0 => Data: 00000001
    // Address: 1 => Data: 00000010
    // Address: 2 => Data: 00000100
    // Address: 3 => Data: 00001000
    // Address: 4 => Data: 00010000
    // Address: 5 => Data: 00100000
    // Address: 6 => Data: 01000000
    // Address: 7 => Data: 10000000
    data[0] = 8'b00000001;
    data[1] = 8'b00000010;
    data[2] = 8'b00000100;
    data[3] = 8'b00001000;
    data[4] = 8'b00010000;
    data[5] = 8'b00100000;
    data[6] = 8'b01000000;
    data[7] = 8'b10000000;
end

    always @(*)
    begin
        data = (address == 3'b000) ? data[0] :
           (address == 3'b001) ? data[1] :
           (address == 3'b010) ? data[2] :
           (address == 3'b011) ? data[3] :
           (address == 3'b100) ? data[4] :
           (address == 3'b101) ? data[5] :
           (address == 3'b110) ? data[6] : data[7];
    end

endmodule