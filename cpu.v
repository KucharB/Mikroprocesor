`include "pc.v"
`include "pm.v"
`include "instruction.decoder.v"
`include "operation_block.v"

module cpu
(
    input clk,
    input [7:0] swiches,
    output [7:0] leds
);

    wire [4:0] actual_program_counter;
    wire [5:0] actual_instruction;

    wire [2:0] alu_operation_code;
    wire r0_en;
    wire r1_en;
    wire r2_en;
    wire r3_en;
    wire aku_en;
    wire [1:0] reg_ad;
    wire [7:0] register_file_out;
    wire carry;

    pc program_counter(.clk(clk), .clr(1'b1), .data(actual_program_counter));
    pm program_memory(.adr(actual_program_counter), .data(.actual_instruction));
    instruction_decoder id_block(.instruction(actual_instruction), .operation_code(alu_operation_code), .r0_write_enable(r0_en), .r1_write_enable(r1_en), .r2_write_enable(r2_en), .r3_write_enable(r3_en), . aku_enable(aku_en), .register_addr(reg_ad));
    operation_block block_operation1(.operation_code(alu_operation_code), .aku_enable(aku_en), .clk(clk), .in_b(register_file_out), .out_result(led), .Carry_flag(carry));
    rf register_file(.data_in(led), .clk(clk), .ce0(r0_en), .ce1(r1_en), .ce2(r2_en), .ce3(r3_en), .addr(reg_ad), .data_out(register_file_out), .data_switch(swiches));

endmodule