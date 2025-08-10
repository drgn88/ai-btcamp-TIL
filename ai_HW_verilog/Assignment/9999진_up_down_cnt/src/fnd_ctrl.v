`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/08/06 10:47:38
// Design Name: 
// Module Name: fnd_ctrl
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module fnd_ctrl (
    input clk,
    input rstn,
    input [3:0] time_1,
    input [3:0] time_10,
    input [3:0] time_100,
    input [3:0] time_1000,

    output [7:0] fnd_data,
    output [3:0] fnd_com
);

    wire [3:0] w_bcd;
    wire [3:0] w_msec_1, w_msec_10, w_sec_1, w_sec_10;
    wire [1:0] w_fnd_sel;
    wire       w_oclk;
    
    

    mux_4to1 U_MUX0 (
        .sel(w_fnd_sel),
        .digit_1(time_1),
        .digit_10(time_10),
        .digit_100(time_100),
        .digit_1000(time_1000),
        .bcd(w_bcd)
    );

    bcd_ctrl U_BCD0 (
        .bcd(w_bcd),
        .fnd_data(fnd_data)
    );


    decoder_2x4 U_DEC0 (
        .fnd_sel(w_fnd_sel),
        .fnd_com(fnd_com)
    );


    clk_divider_1k U_CLKD0 (
        .clk(clk),
        .rstn(rstn),

        .oclk(w_oclk)
    );

    counter_2b U_CNT0 (
        .clk(w_oclk),
        .rstn(rstn),
        .fnd_sel(w_fnd_sel)
    );

    
endmodule

