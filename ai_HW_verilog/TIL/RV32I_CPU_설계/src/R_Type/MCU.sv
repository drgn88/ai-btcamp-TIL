`timescale 1ns / 1ps

module MCU (
    input logic clk,
    input logic rst
);

    logic [31:0] instr_code;
    logic [31:0] instr_mem_addr;

    ROM U_ROM (
        .addr(instr_mem_addr),

        .data(instr_code)
    );

    CPU_RV32I U_CPU_RV32I (
        .clk(clk),
        .rst(rst),
        .instr_code(instr_code),

        .instr_mem_addr(instr_mem_addr)
    );
endmodule
