module instruction_decoder 
(
    input [5:0] instruction,
    output reg [2:0] operation_code,
    output reg r0_write_enable,
    output reg r1_write_enable,
    output reg r2_write_enable,
    output reg r3_write_enable,
    output reg aku_enable,
    output reg [1:0] register_addr
);

always @(instruction)
begin
    aku_enable <= 1'b0;
    operation_code <= instruction[4:2];
    {r3_write_enable,r2_write_enable,r1_write_enable,r0_write_enable} <= 4'b0000;
    if (instruction[5:2] >= 3'd0 && instruction[5:2] <= 3'd6)
    begin
        aku_enable <= 1'b1;
    end

    if(instruction[5:2] == 3'd6)
    begin
        register_addr <= instruction[1:0];
    end

    if(instruction[5:2] == 3'd7)
    begin
        case(instruction[1:0])
            2'b00: r0_write_enable <= 1'b1;
            2'b01: r1_write_enable <= 1'b1;
            2'b10: r2_write_enable <= 1'b1;
            2'b11: r3_write_enable <= 1'b1;
        endcase
    end
      
    endcase 
end 

endmodule