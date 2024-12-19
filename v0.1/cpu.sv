`include "pc.sv"
`include "md.sv"
`include "instruction_decoder.sv"
`include "operation_block.sv"
`include "rf.sv"
`include "pm.sv"
`include "mux4_1.sv"

module cpu(
    input clk,
    input clr,
    output logic [7:0] o_data
);

wire [4:0] actual_counter_o;
wire [15:0] actual_instruction;
wire [3:0] op_code;
wire write_to_reg_en;
wire write_to_normal_aku_en;
wire write_to_mul_aku_en;
wire [2:0] register_addr;
wire [9:0] memory_adr;
wire memory_wr;
wire memory_rd;
wire [7:0] memory_data;

wire [7:0] aku_out;
wire [7:0] aku_in;

wire [7:0] dir_data;
wire dir_load;

wire [7:0] op_block_in;
wire counter_load;
wire [4:0] adr_counter;
wire load_to_counter;

pc prog_counter0(.clk(clk), .clr(clr), .data(actual_counter_o), .load(load_to_counter), .data_in(adr_counter));
pm prog_mem0(.adr(actual_counter_o), .data(actual_instruction));
instruction_decoder inst_dec0(.instruction(actual_instruction), .operation_code(op_code), .reg_ce(write_to_reg_en),
                                .aku_enable(write_to_normal_aku_en), .counter_load(load_to_counter),
                                .register_addr(register_addr), .mem_adr(memory_adr), .mem_wr(memory_wr), .mem_rd(memory_rd), .direct_data(dir_data), .direct_load(dir_load),
                                .address_counter(adr_counter));
rf rf_bl(.data_in(aku_out), .clk(clk), .ce(write_to_reg_en), .reg_adr(register_addr), .data_out(aku_in));
mux4_1 mux_in_alu_data(.a(aku_in), .b(dir_data), .c(memory_data), .sel({memory_rd, dir_load}), .o_data(op_block_in));
operation_block op_bl(.operation_code(op_code), .aku_enable(write_to_normal_aku_en), .clk(clk), .in_b(op_block_in), .out_result(aku_out));
md data_mem(.clk(clk), .in_data(aku_out), .addr(memory_adr), .wr(memory_wr), .o_data(memory_data));

always_comb begin
o_data = aku_out;
end

endmodule


