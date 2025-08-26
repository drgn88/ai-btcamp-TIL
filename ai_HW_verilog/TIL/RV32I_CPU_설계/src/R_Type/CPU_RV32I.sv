`timescale 1ns / 1ps

module CPU_RV32I(
    input logic clk,
    input logic rst,
    input logic [31:0] instr_code,

    output logic [31:0] instr_mem_addr
    );

    logic RF_wr_en;
    logic [3:0] alu_ctrl;

    Control_Unit U_CONTROL_UNIT(
    .instr_code(instr_code),

    .RF_wr_en(RF_wr_en),
    .alu_ctrl(alu_ctrl)
    );

    Data_Path U_DATA_PATH(
    .clk(clk),
    .rst(rst),
    .instr_code(instr_code),
    .RF_wr_en(RF_wr_en),
    .alu_ctrl(alu_ctrl),

    .instr_mem_addr(instr_mem_addr)  //Program Counter Out
    );
endmodule
