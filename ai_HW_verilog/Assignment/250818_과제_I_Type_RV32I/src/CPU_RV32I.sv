`timescale 1ns / 1ps

module CPU_RV32I (
    input logic clk,
    input logic reset,
    input logic [31:0] instrCode,
    output logic [31:0] instrMemAddr,
    output logic        busWe,
    output logic [31:0] busAddr,
    output logic [31:0] busWData,
    input  logic [31:0] busRData
);

    logic       regFileWe;
    logic [3:0] aluControl;
    logic        alu_src_mux_sel;

    ControlUnit U_ControlUnit(
    .instrCode(instrCode),
    .regFileWe(regFileWe),
    .aluControl(aluControl),
    .alu_src_mux_sel(alu_src_mux_sel),
    .busWe(busWe),
    .rf_wd_src_mux_sel(rf_wd_src_mux_sel)
);
    DataPath U_DataPath (
    .clk(clk),
    .reset(reset),
    .instrCode(instrCode),
    .instrMemAddr(instrMemAddr),
    .regFileWe(regFileWe),
    .aluControl(aluControl),
    .alu_src_mux_sel(alu_src_mux_sel),
    .rf_wd_src_mux_sel(rf_wd_src_mux_sel),
    .busAddr(busAddr),
    .busWData(busWData),
    .busRData(busRData)
);
endmodule
