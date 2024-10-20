module multi(
    input [7:0] a,
    input [7:0] b,
    input [7:0] c,
    input [7:0] d,
    input [1:0] addr,
    output reg [7:0] choice
)

always @(addr)
begin
    case(addr)
        2'b00 : choice <= a;
        2'b01 : choice <= b;
        2'b10 : choice <= c;
        2'b11 : choice <= d;
    endcase 
end

endmodule