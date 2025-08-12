`timescale 1ns / 1ps

module Dedicated_Processor (
    input logic clk,
    input logic rst,

    output logic [7:0] OutPort
);

    logic lt;
    logic RF_Src_Mux_Sel;
    logic [2:0] r_addr_1;
    logic [2:0] r_addr_2;
    logic [2:0] wr_addr;
    logic wr_en;
    logic [1:0] opcode;
    logic outport_en;

    ControlUnit U_CONTROL_LOGIC (
        .clk(clk),
        .rst(rst),
        .lt (lt),

        .RF_Src_Mux_Sel(RF_Src_Mux_Sel),
        .r_addr_1(r_addr_1),
        .r_addr_2(r_addr_2),
        .wr_addr(wr_addr),
        .wr_en(wr_en),
        .opcode(opcode),
        .outport_en(outport_en)
    );

    DataPath U_DATA_PATH (
        .clk(clk),
        .rst(rst),
        .RF_Src_Mux_Sel(RF_Src_Mux_Sel),

        .r_addr_1(r_addr_1),
        .r_addr_2(r_addr_2),
        .wr_addr(wr_addr),
        .wr_en(wr_en),
        .opcode(opcode),
        .outport_en(outport_en),

        .lt(lt),
        .OutPort(OutPort)
    );
endmodule
