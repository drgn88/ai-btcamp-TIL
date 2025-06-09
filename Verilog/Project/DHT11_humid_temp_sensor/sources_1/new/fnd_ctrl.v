`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/05/09 12:46:14
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
    input rst,
    input [7:0] rh_data,
    input [7:0] temp_data,

    output [7:0] fnd_data,
    output [3:0] fnd_com
);

    wire [3:0] w_bcd;
    wire [3:0] w_digit_1, w_digit_10, w_digit_100, w_digit_1000;
    wire [1:0] w_fnd_sel;
    wire       w_oclk;

    digit_splitter U_DGS0 (
        .rh_data(rh_data),
        .temp_data(temp_data),
        .digit_1(w_digit_1),
        .digit_10(w_digit_10),
        .digit_100(w_digit_100),
        .digit_1000(w_digit_1000)
    );

    mux_4to1 U_MUX0 (
        .sel(w_fnd_sel),
        .digit_1(w_digit_1),
        .digit_10(w_digit_10),
        .digit_100(w_digit_100),
        .digit_1000(w_digit_1000),
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


    /*clk_divider_2 U_CLKD0 (
        .clk(clk),
        .rst(rst),

        .oclk(w_oclk)
    );*/

    clk_divider_1k U_CLKD0 (
        .clk(clk),
        .rst(rst),

        .oclk(w_oclk)
    );

    counter_2b U_CNT0 (
        .clk(w_oclk),
        .rst(rst),
        .fnd_sel(w_fnd_sel)
    );
endmodule
