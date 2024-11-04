`define OR 4'b0000
`define SUB 4'b0001
`define AND_L 4'b0010
`define OR_L 4'b0011
`define XOR_L 4'b0100
`define NOT_L 4'b0101
`define NOP 4'b0110
`define MUL 4'b0111
`define ST 3'b110
`define ST_M 3'b111
`define LD 3'b100  //najstrasze
`define LD_M 3'b101

module instruction_decoder 
(
    input [15:0] instruction,

    output logic [2:0] operation_code,
    output logic register_ce,
    output logic aku_enable,
    output logic aku_mux_enable;

    output logic [2:0] register_addr,
    output logic [9:0] mem_adr,
    output logic mem_wr;
    output logic mem_rd;
);

//instrukcja 16 bitów
//Na kod operacji zajmiemy 4 bity, więc zostaje 12, chcemy mieć możliwość sterowania pamięcią 1kB, co oznacza że potrzebujemy 10 bitów do adresowania tej pamięci, w przypadku danych, korzystamy z 8 bitów, więc w najgorszym
//możliwym przypadku zostają 2 nieużywane bity

//9 bit będzie decydował o tym czy mamy load z z pam prog czy nie


always_comb
begin
    operation_code = instruction[14:12];
    aku_enable = 1'b0;
    aku_mux_enable = 1'b0;
    reg_ce = 1'b0;
    register_addr = 3'd0;
    mem_wr = 1'b0;
    mem_rd = 1'b0;
    if(instruction[15]== 1'b0 && instruction[14:12]!= 4'b110) begin
        aku_enable = ~(&instruction_decoder[14:13]);
        aku_mux_enable = (&instruction_decoder[14:13]);
    end
    else begin
        if(instruction[15]==1'b1) begin
            casex (instruction[14:12])
                10? : begin
                    reg_ce = 1'b1;
                    register_addr = instruction[2:0];
                end 
                11? : begin
                    mem_adr = instruction[9:0];
                    mem_wr = 1'b1;
                end
                00? : begin
                    register_addr = instruction[2:0];
                end
                01? : begin
                    mem_adr = instruction[9:0];
                    mem_rd = 1'b1;
                end
                default: 
            endcase
        end
    end

end 

endmodule