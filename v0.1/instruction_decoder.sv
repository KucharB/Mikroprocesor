module instruction_decoder 
(
    input [5:0] instruction,
    output logic [2:0] operation_code,
    output logic r0_write_enable,
    output logic r1_write_enable,
    output logic r2_write_enable,
    output logic r3_write_enable,
    output logic aku_enable,
    output logic [1:0] register_addr
);

always_comb @(instruction)
begin
    aku_enable = 1'b0;
    operation_code = instruction[4:2];
    {r3_write_enable,r2_write_enable,r1_write_enable,r0_write_enable} = 4'b0000;
    if (instruction[5:2] >= 3'd0 && instruction[5:2] <= 3'd6)
    begin
        aku_enable = 1'b1;
        register_addr = instruction[1:0];
    end

    if(instruction[5:2] == 3'd7)
    begin
        case(instruction[1:0])
            2'b00: r0_write_enable = 1'b1;
            2'b01: r1_write_enable = 1'b1;
            2'b10: r2_write_enable = 1'b1;
            2'b11: r3_write_enable = 1'b1;
        endcase
    end
      
end 

endmodule