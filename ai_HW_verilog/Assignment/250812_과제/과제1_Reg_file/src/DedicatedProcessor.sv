`timescale 1ns / 1ps

module DedicatedProcessor(
    input logic clk,
    input logic rst,

    output logic [7:0] OutPort
    );

    logic R1Le10;
    
    logic RFSrcMuxSel;
    logic [2:0] r_addr_1;
    logic [2:0] r_addr_2;
    logic [2:0] wr_addr;
    logic wr_en;
    logic OutPortEn;

    ControlUnit U_CONTROL_UNIT(
    .clk(clk),
    .rst(rst),
    .R1Le10(R1Le10),
    
    .RFSrcMuxSel(RFSrcMuxSel),
    .r_addr_1(r_addr_1),
    .r_addr_2(r_addr_2),
    .wr_addr(wr_addr),
    .wr_en(wr_en),
    .OutPortEn(OutPortEn)
    );

    DataPath U_DATA_PATH(
    .clk(clk),
    .rst(rst),
    .RFSrcMuxSel(RFSrcMuxSel),
    .r_addr_1(r_addr_1),
    .r_addr_2(r_addr_2),
    .wr_addr(wr_addr),
    .wr_en(wr_en),
    .OutPortEn(OutPortEn),

    .R1Le10(R1Le10),
    .OutPort(OutPort)
    );
endmodule
