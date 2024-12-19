module multi(
    input [7:0] a,
    input [7:0] b,
    input [7:0] c,
    input [7:0] d,
    input [7:0] e,
    input [7:0] f,
    input [7:0] g,
    input [7:0] h,
    input [2:0] addr,
    output logic [7:0] choice
);

always_comb
begin
    case(addr)
        3'd0 : choice = a;
        3'd1 : choice = b;
        3'd2 : choice = c;
        3'd3 : choice = d;
        3'd4 : choice = e;
        3'd5 : choice = f;
        3'd6 : choice = g;
        3'd7 : choice = h;
    endcase 
end

endmodule